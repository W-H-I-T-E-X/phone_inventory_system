from PIL import Image, ImageDraw, ImageFont
import subprocess
import os

# --- Run MariaDB query and return result ---
def run_query(query):
    cmd = f"sudo mariadb -N -e \"{query}\" -D cashphones"
    try:
        result = subprocess.check_output(cmd, shell=True, text=True).strip()
        return result
    except subprocess.CalledProcessError:
        print("Error running SQL command")
        return None

# --- Get next available invoice number from file name ---
def get_next_invoice_number():
    folder = "./"
    prefix = "bill"
    existing = [f for f in os.listdir(folder) if f.startswith(prefix) and f.endswith(".png")]
    numbers = [int(f[len(prefix):-4]) for f in existing if f[len(prefix):-4].isdigit()]
    next_number = max(numbers) + 1 if numbers else 1
    return next_number

# --- Inputs ---
num_products = int(input("HOW MANY PHONES? = "))
order_ids = []
for i in range(num_products):
    order_ids.append(input(f"ORDER ID {i+1} = "))

phone_number = input("PHONE NUMBER = ")
invoice_number = str(get_next_invoice_number())

# --- Get customer and date info from first order ---
header_query = f"SELECT C_NAME, DATE FROM s_table WHERE ORDER_ID = {order_ids[0]} LIMIT 1;"
header_result = run_query(header_query)
customer, date = header_result.split("\t")

# --- Load image and fonts ---
i = Image.open("/home/whitex/cashphones/b2.png").convert("RGB")
draw = ImageDraw.Draw(i)
font_big = ImageFont.truetype("c.ttf", size=60)
font = ImageFont.truetype("c.ttf", size=50)

# --- Header fields ---
draw.text((66, 603), customer, font=font_big, fill=(0, 0, 0))
draw.text((200, 730), phone_number, font=font, fill=(0, 0, 0))
draw.text((1830, 542), "A0000" + invoice_number, font=font, fill=(0, 0, 0))
draw.text((2210, 542), date, font=font, fill=(0, 0, 0))

# --- Render each product row ---
start_y = 994
row_h = 85
max_rows = 16

total_sell = 0
total_purch = 0
adjusted_row_totals = []

for idx, oid in enumerate(order_ids):
    if idx >= max_rows:
        break

    sale_query = f"SELECT NAME, IMEI, TOTAL FROM s_table WHERE ORDER_ID = {oid};"
    sale_result = run_query(sale_query)
    if not sale_result:
        continue

    name, imei, total = sale_result.split("\t")
    sell_price = int(float(total))

    purchase_query = f"SELECT NAME, TOTAL FROM p_table WHERE ORDER_ID = {oid} LIMIT 1;"
    purchase_result = run_query(purchase_query)
    if purchase_result:
        p_name, p_total = purchase_result.split("\t")
        print(f"PURCHASE: {p_name} -> ₹{p_total}")
    else:
        p_total = "0"

    purchase_price = int(float(p_total))
    profit = sell_price - purchase_price
    gst_per_item = round(profit * 0.09, 2)
    adjusted_total = round(sell_price - 2 * gst_per_item)
    adjusted_row_totals.append(adjusted_total)

    y = start_y + idx * row_h
    draw.text((15, y), f"{idx+1:02}", font=font, fill=(0, 0, 0))
    draw.text((184, y), "01", font=font, fill=(0, 0, 0))
    draw.text((354, y), oid, font=font, fill=(0, 0, 0))
    draw.text((498, y), name, font=font, fill=(0, 0, 0))
    draw.text((1132, y), imei, font=font, fill=(0, 0, 0))
    draw.text((1735, y), "0", font=font, fill=(0, 0, 0))
    draw.text((1900, y), str(adjusted_total), font=font, fill=(0, 0, 0))
    draw.text((2135, y), "0%", font=font, fill=(0, 0, 0))
    draw.text((2262, y), str(adjusted_total), font=font, fill=(0, 0, 0))

    total_sell += sell_price
    total_purch += purchase_price

# --- Summary calculations ---
final_profit = total_sell - total_purch
gst = round(final_profit * 0.09, 2)
subtotal = sum(adjusted_row_totals)

summary_positions = [(480, 2660), (1560, 2605), (2175, 2745), (2235, 2795), (2235, 2845), (2235, 2890), (2175, 2955)]
summary_values = [
    subtotal,            # Subtotal = sum of adjusted per-row totals
    int(total_sell),     # Original total
    subtotal,            # Repeat subtotal
    round(gst),          # CGST
    round(gst),          # SGST
    "0",                 # Discount
    int(total_sell)      # Grand Total = full sell total
]

for pos, val in zip(summary_positions, summary_values):
    draw.text(pos, str(val), font=font, fill=(0, 0, 0))

# --- Save ---
def get_next_bill_name():
    next_number = int(invoice_number)
    return os.path.join("./", f"bill{next_number}.png")

print("\n1) SAVE  2) PRINTOUT  3) SHOW\n")
c = input("===> ")
filename = get_next_bill_name()

if c == "1":
    i.save(filename)
    print(f"Saved as {filename}")
elif c == "2":
    i.save(filename)
    os.system(f'lp -o media=A4 -d wx {filename}')
elif c == "3":
    i.show()
else:
    print("INVALID OPTION")
