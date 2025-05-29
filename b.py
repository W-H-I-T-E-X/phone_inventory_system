from PIL import Image, ImageDraw, ImageFont
import os

# Load template image
i = Image.open("/home/whitex/cashphones/b2.png")
i = i.convert("RGB")
draw = ImageDraw.Draw(i)

# Load fonts
font = ImageFont.truetype("c.ttf", size=60)
f = ImageFont.truetype("c.ttf", size=50)

# Inputs
print("\n")
text = input("CUSTOMER NAME = ")
draw.text((66, 603), text, font=font, fill=(0, 0, 0))

num = input("PHONE NUMBER = ")
draw.text((200, 730), num, font=f, fill=(0, 0, 0))

inv = input("INVOICE NUM = ")
draw.text((1830, 542), "A0000" + inv, font=f, fill=(0, 0, 0))

date = input("DATE = ")
draw.text((2210, 542), date, font=f, fill=(0, 0, 0))

sno = input("SNO = ")
draw.text((15, 994), sno, font=f, fill=(0, 0, 0))

qty = input("QNTY = ")
draw.text((184, 994), qty, font=f, fill=(0, 0, 0))

idd = input("ORDER ID = ")
draw.text((354, 994), idd, font=f, fill=(0, 0, 0))

# Show p_table info (optional, not used)
os.system(f'sudo mariadb -D cashphones -e "select ORDER_ID,NAME,IMEI,TOTAL from p_table where ORDER_ID={idd};"')

name = input("PRODUCT NAME = ")
draw.text((498, 994), name, font=f, fill=(0, 0, 0))

imei = input("IMEI NO = ")
draw.text((1132, 994), imei, font=f, fill=(0, 0, 0))

# HSN is optional
hsn = "0"
draw.text((1735, 994), hsn, font=f, fill=(0, 0, 0))

# Financial Inputs
rate = int(input("RATE (Selling Price) = "))
pur = int(input("PURCHASING PRICE = "))

profit = rate - pur
gst = round(profit * 0.09, 2)  # SGST and CGST

# Adjusted rate shown (Rate - SGST - CGST)
adjusted_rate = rate - gst - gst

draw.text((1900, 994), str(adjusted_rate), font=f, fill=(0, 0, 0))  # Displayed RATE

dis = int(input("DISCOUNT % = "))
draw.text((2135, 994), f"{dis}%", font=f, fill=(0, 0, 0))

# Final total shown on product line
draw.text((2262, 994), str(adjusted_rate), font=f, fill=(0, 0, 0))  # TOTAL (shown after gst removal)

# Summary Section — use full original rate
draw.text((480, 2660), str(rate), font=f, fill=(0, 0, 0))           # Cash
draw.text((1560, 2605), str(rate), font=f, fill=(0, 0, 0))          # Received
draw.text((2175, 2745), str(adjusted_rate), font=f, fill=(0, 0, 0)) # Subtotal (reduced rate)
draw.text((2235, 2795), str(gst), font=f, fill=(0, 0, 0))           # SGST
draw.text((2235, 2845), str(gst), font=f, fill=(0, 0, 0))           # CGST
draw.text((2235, 2890), "0.00", font=f, fill=(0, 0, 0))             # Roundoff
draw.text((2175, 2955), str(rate), font=f, fill=(0, 0, 0))          # Grand Total

# Output
print("\n1) SAVE  2) PRINTOUT  3) SHOW\n")
c = input("===> ")
if c == "1":
    i.save("bill.png")
elif c == "2":
    i.save("bill.png")
    os.system('lp -o media=A4 -d wx bill.png')
elif c == "3":
    i.show()
else:
    print("INVALID OPTION")
