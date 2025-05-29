import tkinter as tk
from tkinter import ttk, messagebox
import subprocess
from PIL import Image, ImageTk, ImageEnhance, ImageDraw, ImageFont  
import pymysql
import mysql.connector
import os

def entry():
    def open_script(script_name):
        try:
            subprocess.Popen(["python", script_name])  # Run script in a new process
        except Exception as e:
            messagebox.showerror("Error", f"Failed to open {script_name}\n{e}")

    # Functions for each button
    def stock(): stock_entry()
    def p_table(): p_entry()
    def s_table(): s_entry()
    def exp(): exp_entry()
    def p_acc(): p_acc_entry()
    def s_acc(): s_acc_entry()
    def charges(): charges_entry()
    def sal(): sal_entry()
    def repair(): repair_entry()
    def parts(): parts_entry()

    # Create main window
    entry_window = tk.Toplevel()
    entry_window.title("Phone ENTRY Options")
    entry_window.geometry("1400x800")

    # Load and store background image
    entry_window.bg_image = Image.open("1.jpg")
    entry_window.bg_image = entry_window.bg_image.resize((1400, 800), Image.Resampling.LANCZOS) #1400,800
    entry_window.bg_photo = ImageTk.PhotoImage(entry_window.bg_image)

    # Create Canvas and place background image
    canvas = tk.Canvas(entry_window, width=1400, height=800)
    canvas.pack(fill="both", expand=True)
    canvas.create_image(0, 0, image=entry_window.bg_photo, anchor="nw")

    # Label
    label = tk.Label(entry_window, text="ENTRY OPTIONS", font=("Terminus", 28, "bold"), fg="white", bg="black")
    canvas.create_window(670, 100, window=label)

    # Button styling
    button_style = {
        "font": ("Terminus", 18, "bold"),
        "bg": "#999999",
        "fg": "black",
        "activebackground": "#393E46",
        "activeforeground": "white",
        "bd": 2,
        "relief": "ridge",
        "width": 25
    }

    # List to store buttons
    buttons = []
    button_functions = [stock, p_table, s_table, exp, p_acc, s_acc, charges, sal, repair, parts]
    button_positions = [200, 250, 300, 350, 400, 450, 500, 550, 600, 650]

    # Track selected button
    selected_index = [0]  # Use a list to modify inside functions

    def highlight_button():
        """Highlights the selected button and resets others."""
        for i, btn in enumerate(buttons):
            if i == selected_index[0]:
                btn.config(bg="#040404", fg="grey")  # Highlighted button
            else:
                btn.config(bg="#999999", fg="black")  # Normal button

    def move_selection(event):
        """Move selection up/down using arrow keys."""
        if event.keysym == "Up":
            selected_index[0] = (selected_index[0] - 1) % len(buttons)  # Move up
        elif event.keysym == "Down":
            selected_index[0] = (selected_index[0] + 1) % len(buttons)  # Move down
        highlight_button()

    def select_button(event):
        """Trigger the selected button when Enter is pressed."""
        button_functions[selected_index[0]]()  # Run the selected function
    def go_back(event):
        entry_window.destroy()
    # Create buttons and place them on canvas
    for text, command, y_pos in zip(
        ["1) STOCK", "2) PURCHASE PHONES", "3) SALES PHONES", "4) EXPENSES", "5) PURCHASE ACCESSORIES",
         "6) SALES ACCESSORIES", "7) BANK CHARGES", "8) SALARY", "9) REPAIR", "10) REPAIR PARTS"],
        button_functions, button_positions
    ):
        btn = tk.Button(entry_window, text=text, command=command, **button_style)
        canvas.create_window(670, y_pos, window=btn)
        buttons.append(btn)  # Store button in list
    
    # Highlight the first button initially
    highlight_button()

    # Bind keys
    entry_window.bind("<Up>", move_selection)
    entry_window.bind("<Down>", move_selection)
    entry_window.bind("<Return>", select_button)
    entry_window.bind("<Escape>", go_back)

    # Run GUI
    entry_window.mainloop()


def stock_entry():
    
    # Database Configuration
    DB_CONFIG = {
        "host": "localhost",
        "user": "root",
        "password": "?",  # Change this to your MySQL password
        "database": "cmp"
    }
    
    def insert_data(event=None):
        """Insert data into stock table and show the inserted row."""
        order_id = ORDER_ID.get().strip()
        name = NAME.get().strip()
        storage = STORAGE.get().strip()
        price = P_PRICE.get().strip()
        imei = IMEI.get().strip()
        month = MONTH.get().strip()
    
        if not (order_id and name and price and imei):
            messagebox.showwarning("Warning", "All fields are required!")
            return
    
        try:
            conn = pymysql.connect(**DB_CONFIG)
            cursor = conn.cursor()
    
            # Insert data
            query = "INSERT INTO stock (ORDER_ID, NAME, STORAGE, QNTY, P_PRICE, IMEI, MONTH) VALUES (%s, %s, %s, 0, %s, %s, %s)"
            cursor.execute(query, (order_id, name, storage, price, imei, month))
            conn.commit()
    
            # Fetch only the inserted row
            cursor.execute("SELECT * FROM stock WHERE ORDER_ID = %s", (order_id,))
            row = cursor.fetchone()
            columns = [desc[0] for desc in cursor.description]
    
            # Clear previous data
            tree.delete(*tree.get_children())
            tree["columns"] = columns
    
            # Set up column headers
            for col in columns:
                tree.heading(col, text=col, anchor="center")
                tree.column(col, anchor="center", stretch=True, width=150)
    
            # Insert only the new row
            if row:
                tree.insert("", tk.END, values=row)
    
            #messagebox.showinfo("Success", "Data Inserted Successfully!")
    
            # Clear input fields
            ORDER_ID.delete(0, tk.END)
            NAME.delete(0, tk.END)
            STORAGE.delete(0, tk.END)
            P_PRICE.delete(0, tk.END)
            IMEI.delete(0, tk.END)
            MONTH.delete(0, tk.END)
            ORDER_ID.focus()
    
            # Close connection
            cursor.close()
            conn.close()
    
        except pymysql.Error as e:
            messagebox.showerror("Database Error", f"Failed to insert data:\n{e}")
    
    def exit_program(event=None):
        """Exit the program using Esc key."""
        root.destroy()
        #root.quit()
    
    # GUI Setup
    root = tk.Tk()
    root.title("Stock Entry System")
    root.geometry("800x500")
    root.configure(bg="#2C2F33")
    
    # Centering Frame
    main_frame = tk.Frame(root, bg="#2C2F33")
    main_frame.pack(expand=True)
    
    # Labels & Entry Fields
    tk.Label(main_frame, text="ORDER ID:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=0, column=0, padx=10, pady=5, sticky="e")
    ORDER_ID = tk.Entry(main_frame, font=("Arial", 14), width=25)
    ORDER_ID.grid(row=0, column=1, padx=10, pady=5)
    
    tk.Label(main_frame, text="NAME:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=1, column=0, padx=10, pady=5, sticky="e")
    NAME = tk.Entry(main_frame, font=("Arial", 14), width=25)
    NAME.grid(row=1, column=1, padx=10, pady=5)
    
    tk.Label(main_frame, text="STORAGE:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=2, column=0, padx=10, pady=5, sticky="e")
    STORAGE = tk.Entry(main_frame, font=("Arial", 14), width=25)
    STORAGE.grid(row=2, column=1, padx=10, pady=5)

        
    tk.Label(main_frame, text="P_PRICE:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=4, column=0, padx=10, pady=5, sticky="e")
    P_PRICE = tk.Entry(main_frame, font=("Arial", 14), width=25)
    P_PRICE.grid(row=4, column=1, padx=10, pady=5)
    
    tk.Label(main_frame, text="IMEI:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=5, column=0, padx=10, pady=5, sticky="e")
    IMEI = tk.Entry(main_frame, font=("Arial", 14), width=25)
    IMEI.grid(row=5, column=1, padx=10, pady=5)
    
    tk.Label(main_frame, text="MONTH:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=6, column=0, padx=10, pady=5, sticky="e")
    MONTH = tk.Entry(main_frame, font=("Arial", 14), width=25)
    MONTH.grid(row=6, column=1, padx=10, pady=5)
    # Insert Button
    btn_insert = tk.Button(main_frame, text="Insert Data", command=insert_data, font=("Arial", 14), bg="#7289DA", fg="white", width=20)
    btn_insert.grid(row=8, column=0, columnspan=20, pady=30)
    
    # Table Frame (Full Width)
    frame = tk.Frame(root)
    frame.pack(expand=True, fill="both", padx=10, pady=5)
    
    tree = ttk.Treeview(frame, show="headings", style="Custom.Treeview")
    tree.pack(expand=True, fill="both", side="left")
    
    scroll_y = ttk.Scrollbar(frame, orient="vertical", command=tree.yview)
    scroll_y.pack(side="right", fill="y")
    tree.configure(yscrollcommand=scroll_y.set)
    
    # Styling
    style = ttk.Style()
    style.configure("Custom.Treeview", font=("Courier", 13), rowheight=27)
    style.configure("Treeview.Heading", font=("Courier", 12, "bold"), background="red", foreground="black")
    
    # Keyboard Bindings
    root.bind("<Return>", insert_data)  # Enter key to insert
    root.bind("<Escape>", exit_program)  # Esc key to exit
    ORDER_ID.focus()  # Set initial focus
    
    # Run Application
    root.mainloop()


def p_entry():
    
    # Database Configuration
    DB_CONFIG = {
        "host": "localhost",
        "user": "root",
        "password": "?",  # Change this to your MySQL password
        "database": "cmp"
    }
    
    def insert_data(event=None):
        """Insert data into stock table and show the inserted row."""
        order_id = ORDER_ID.get().strip()
        name = NAME.get().strip()
        storage = STORAGE.get().strip()
        cname = C_NAME.get().strip()
        imei = IMEI.get().strip()
        date = DATE.get().strip()
        axis = AXIS.get().strip()
        icici = ICICI.get().strip()
        delhi = CASHIFY_DEL.get().strip()
        luk = CASHIFY_LUK.get().strip()
        cash = CASH.get().strip()
        
        if not (order_id and name and date and axis):
            messagebox.showwarning("Warning", "All fields are required!")
            return
    
        try:
            # Convert numeric fields
            axis = float(axis) if axis else 0
            icici = float(icici) if icici else 0
            cash = float(cash) if cash else 0
            total = axis + icici + cash

            conn = pymysql.connect(**DB_CONFIG)
            cursor = conn.cursor()
    
            # Insert data
            query = "INSERT INTO p_table (ORDER_ID, NAME, STORAGE, QNTY, C_NAME, IMEI, DATE, AXIS, ICICI, HDFC, CASHIFY_DEL, CASHIFY_LUK, CASH, TOTAL) VALUES (%s, %s, %s, 1, %s, %s, %s, %s, %s, 0, %s, %s, %s, %s)"
            cursor.execute(query, (order_id, name, storage, cname, imei, date, axis, icici, delhi, luk, cash, total))
            conn.commit()
    
            # Fetch only the inserted row
            cursor.execute("SELECT * FROM p_table WHERE ORDER_ID = %s", (order_id,))
            row = cursor.fetchone()
            columns = [desc[0] for desc in cursor.description]

                
            # Clear previous data
            tree.delete(*tree.get_children())
            tree["columns"] = columns
    
            # Set up column headers
            for col in columns:
                tree.heading(col, text=col, anchor="center")
                tree.column(col, anchor="center", stretch=True, width=150)
    
            # Insert only the new row
            if row:
                tree.insert("", tk.END, values=row)
    
           # messagebox.showinfo("Success", "Data Inserted Successfully!")
    
            # Clear input fields
            ORDER_ID.delete(0, tk.END)
            NAME.delete(0, tk.END)
            STORAGE.delete(0, tk.END)
            C_NAME.delete(0, tk.END)
            IMEI.delete(0, tk.END)
            DATE.delete(0, tk.END)
            AXIS.delete(0, tk.END)
            ICICI.delete(0, tk.END)
            CASHIFY_DEL.delete(0, tk.END)
            CASHIFY_LUK.delete(0, tk.END)
            CASH.delete(0, tk.END)
            ORDER_ID.focus()
    
            # Close connection
            cursor.close()
            conn.close()
    
        except pymysql.Error as e:
            messagebox.showerror("Database Error", f"Failed to insert data:\n{e}")
    
    def exit_program(event=None):
        """Exit the program using Esc key."""
        root.destroy()
        #root.quit()

    def fetch_data():
            """Fetch data based on ORDER_ID and display it in the table."""
            order_id = ORDER_ID.get().strip()
        
            if not order_id:
                messagebox.showwarning("Warning", "Please enter an ORDER ID to fetch data!")
                return
        
            try:
                conn = pymysql.connect(**DB_CONFIG)
                cursor = conn.cursor()
        
                # Fetch data
                cursor.execute("SELECT * FROM stock WHERE ORDER_ID = %s", (order_id,))
                rows = cursor.fetchall()
                columns = [desc[0] for desc in cursor.description]
        
                # Clear previous data
                tree.delete(*tree.get_children())
                tree["columns"] = columns
        
                # Set up column headers
                for col in columns:
                    tree.heading(col, text=col, anchor="center")
                    tree.column(col, anchor="center", stretch=True, width=150)
        
                # Insert fetched data
                for row in rows:
                    tree.insert("", tk.END, values=row)
        
                cursor.close()
                conn.close()
        
            except pymysql.Error as e:
                messagebox.showerror("Database Error", f"Failed to fetch data:\n{e}")
        
            
    # GUI Setup
    root = tk.Tk()
    root.title("PURCHASE Entry System")
    root.geometry("800x500")
    root.configure(bg="#2C2F33")
    
    # Centering Frame
    main_frame = tk.Frame(root, bg="#2C2F33")
    main_frame.pack(expand=True)
    
    # Labels & Entry Fields
    tk.Label(main_frame, text="ORDER ID:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=0, column=0, padx=10, pady=5, sticky="e")
    ORDER_ID = tk.Entry(main_frame, font=("Arial", 14), width=25)
    ORDER_ID.grid(row=0, column=1, padx=10, pady=5)

    btn_fetch = tk.Button(main_frame, text="Fetch Data", command=fetch_data, font=("Arial", 14), bg="#4CAF50", fg="white", width=20)
    btn_fetch.grid(row=16, column=1, columnspan=30, pady=5)
            
    tk.Label(main_frame, text="NAME:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=1, column=0, padx=10, pady=5, sticky="e")
    NAME = tk.Entry(main_frame, font=("Arial", 14), width=25)
    NAME.grid(row=1, column=1, padx=10, pady=5)
    
    tk.Label(main_frame, text="STORAGE:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=2, column=0, padx=10, pady=5, sticky="e")
    STORAGE = tk.Entry(main_frame, font=("Arial", 14), width=25)
    STORAGE.grid(row=2, column=1, padx=10, pady=5)

        
    tk.Label(main_frame, text="C_NAME:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=4, column=0, padx=10, pady=5, sticky="e")
    C_NAME = tk.Entry(main_frame, font=("Arial", 14), width=25)
    C_NAME.grid(row=4, column=1, padx=10, pady=5)
    
    tk.Label(main_frame, text="IMEI:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=5, column=0, padx=10, pady=5, sticky="e")
    IMEI = tk.Entry(main_frame, font=("Arial", 14), width=25)
    IMEI.grid(row=5, column=1, padx=10, pady=5)
    
    tk.Label(main_frame, text="DATE:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=6, column=0, padx=10, pady=5, sticky="e")
    DATE = tk.Entry(main_frame, font=("Arial", 14), width=25)
    DATE.grid(row=6, column=1, padx=10, pady=5)

    tk.Label(main_frame, text="AXIS:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=7, column=0, padx=10, pady=5, sticky="e")
    AXIS = tk.Entry(main_frame, font=("Arial", 14), width=25)
    AXIS.grid(row=7, column=1, padx=10, pady=5)

    tk.Label(main_frame, text="ICICI:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=8, column=0, padx=10, pady=5, sticky="e")
    ICICI = tk.Entry(main_frame, font=("Arial", 14), width=25)
    ICICI.grid(row=8, column=1, padx=10, pady=5)
        
    tk.Label(main_frame, text="CASHIFY_DEL:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=10, column=0, padx=10, pady=5, sticky="e")
    CASHIFY_DEL = tk.Entry(main_frame, font=("Arial", 14), width=25)
    CASHIFY_DEL.grid(row=10, column=1, padx=10, pady=5)

    tk.Label(main_frame, text="CASHIFY_LUK:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=11, column=0, padx=10, pady=5, sticky="e")
    CASHIFY_LUK = tk.Entry(main_frame, font=("Arial", 14), width=25)
    CASHIFY_LUK.grid(row=11, column=1, padx=10, pady=5)

    tk.Label(main_frame, text="CASH:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=12, column=0, padx=10, pady=5, sticky="e")
    CASH = tk.Entry(main_frame, font=("Arial", 14), width=25)
    CASH.grid(row=12, column=1, padx=10, pady=5)

    # Insert Button
    btn_insert = tk.Button(main_frame, text="Insert Data", command=insert_data, font=("Arial", 14), bg="#7289DA", fg="white", width=20)
    btn_insert.grid(row=15, column=1, columnspan=20, pady=5)

    
    # Table Frame (Full Width)
    frame = tk.Frame(root)
    frame.pack(expand=True, fill="both", padx=10, pady=5)
    
    tree = ttk.Treeview(frame, show="headings", style="Custom.Treeview")
    tree.pack(expand=True, fill="both", side="left")
    
    scroll_y = ttk.Scrollbar(frame, orient="vertical", command=tree.yview)
    scroll_y.pack(side="right", fill="y")
    tree.configure(yscrollcommand=scroll_y.set)
    
    # Styling
    style = ttk.Style()
    style.configure("Custom.Treeview", font=("Courier", 13), rowheight=27)
    style.configure("Treeview.Heading", font=("Courier", 12, "bold"), background="red", foreground="black")
    
    # Keyboard Bindings
    root.bind("<Return>", insert_data)  # Enter key to insert
    root.bind("<Escape>", exit_program)  # Esc key to exit
    ORDER_ID.focus()  # Set initial focus
    
    # Run Application
    root.mainloop()

def s_entry():
        
        # Database Configuration
        DB_CONFIG = {
            "host": "localhost",
            "user": "root",
            "password": "?",  # Change this to your MySQL password
            "database": "cmp"
        }
        
        def insert_data(event=None):
            """Insert data into stock table and show the inserted row."""
            order_id = ORDER_ID.get().strip()
            name = NAME.get().strip()
            storage = STORAGE.get().strip()
            cname = C_NAME.get().strip()
            imei = IMEI.get().strip()
            date = DATE.get().strip()
            axis = AXIS.get().strip()
            icici = ICICI.get().strip()
            delhi = CASHIFY_DEL.get().strip()
            luk = CASHIFY_LUK.get().strip()
            cash = CASH.get().strip()
         
            
            if not (order_id and name and date and axis):
                messagebox.showwarning("Warning", "All fields are required!")
                return
        
            try:
                # Convert numeric fields
                axis = float(axis) if axis else 0
                icici = float(icici) if icici else 0
                cash = float(cash) if cash else 0
                total = axis + icici + cash
    
                conn = pymysql.connect(**DB_CONFIG)
                cursor = conn.cursor()
        
                # Insert data
                query = "INSERT INTO s_table (ORDER_ID, NAME, STORAGE, QNTY, C_NAME, IMEI, DATE, AXIS, ICICI, HDFC, CASHIFY_DEL, CASHIFY_LUK, CASH, TOTAL) VALUES (%s, %s, %s, 1, %s, %s, %s, %s, %s, 0, %s, %s, %s, %s)"
                cursor.execute(query, (order_id, name, storage, cname, imei, date, axis, icici, delhi, luk, cash, total))
                conn.commit()
        
                # Fetch only the inserted row
                cursor.execute("SELECT * FROM s_table WHERE ORDER_ID = %s", (order_id,))
                row = cursor.fetchone()
                columns = [desc[0] for desc in cursor.description]
    
                    
                # Clear previous data
                tree.delete(*tree.get_children())
                tree["columns"] = columns
        
                # Set up column headers
                for col in columns:
                    tree.heading(col, text=col, anchor="center")
                    tree.column(col, anchor="center", stretch=True, width=150)
        
                # Insert only the new row
                if row:
                    tree.insert("", tk.END, values=row)
        
               # messagebox.showinfo("Success", "Data Inserted Successfully!")
        
                # Clear input fields
                ORDER_ID.delete(0, tk.END)
                NAME.delete(0, tk.END)
                STORAGE.delete(0, tk.END)
                C_NAME.delete(0, tk.END)
                IMEI.delete(0, tk.END)
                DATE.delete(0, tk.END)
                AXIS.delete(0, tk.END)
                ICICI.delete(0, tk.END)
                CASHIFY_DEL.delete(0, tk.END)
                CASHIFY_LUK.delete(0, tk.END)
                CASH.delete(0, tk.END)
                TOTAL.delete(0, tk.END)
                ORDER_ID.focus()
        
                # Close connection
                cursor.close()
                conn.close()
        
            except pymysql.Error as e:
                messagebox.showerror("Database Error", f"Failed to insert data:\n{e}")
        
        def exit_program(event=None):
            """Exit the program using Esc key."""
            root.destroy()
            #root.quit()
    
        def fetch_data():
                """Fetch data based on ORDER_ID and display it in the table."""
                order_id = ORDER_ID.get().strip()
            
                if not order_id:
                    messagebox.showwarning("Warning", "Please enter an ORDER ID to fetch data!")
                    return
            
                try:
                    conn = pymysql.connect(**DB_CONFIG)
                    cursor = conn.cursor()
            
                    # Fetch data
                    cursor.execute("SELECT * FROM p_table WHERE ORDER_ID = %s", (order_id,))
                    rows = cursor.fetchall()
                    columns = [desc[0] for desc in cursor.description]
            
                    # Clear previous data
                    tree.delete(*tree.get_children())
                    tree["columns"] = columns
            
                    # Set up column headers
                    for col in columns:
                        tree.heading(col, text=col, anchor="center")
                        tree.column(col, anchor="center", stretch=True, width=150)
            
                    # Insert fetched data
                    for row in rows:
                        tree.insert("", tk.END, values=row)
            
                    cursor.close()
                    conn.close()
            
                except pymysql.Error as e:
                    messagebox.showerror("Database Error", f"Failed to fetch data:\n{e}")
            
                
        # GUI Setup
        root = tk.Tk()
        root.title("PURCHASE Entry System")
        root.geometry("800x500")
        root.configure(bg="#2C2F33")
        
        # Centering Frame
        main_frame = tk.Frame(root, bg="#2C2F33")
        main_frame.pack(expand=True)
        
        # Labels & Entry Fields
        tk.Label(main_frame, text="ORDER ID:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=0, column=0, padx=10, pady=5, sticky="e")
        ORDER_ID = tk.Entry(main_frame, font=("Arial", 14), width=25)
        ORDER_ID.grid(row=0, column=1, padx=10, pady=5)
    
        btn_fetch = tk.Button(main_frame, text="Fetch Data", command=fetch_data, font=("Arial", 14), bg="#4CAF50", fg="white", width=20)
        btn_fetch.grid(row=16, column=1, columnspan=30, pady=5)
                
        tk.Label(main_frame, text="NAME:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=1, column=0, padx=10, pady=5, sticky="e")
        NAME = tk.Entry(main_frame, font=("Arial", 14), width=25)
        NAME.grid(row=1, column=1, padx=10, pady=5)
        
        tk.Label(main_frame, text="STORAGE:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=2, column=0, padx=10, pady=5, sticky="e")
        STORAGE = tk.Entry(main_frame, font=("Arial", 14), width=25)
        STORAGE.grid(row=2, column=1, padx=10, pady=5)
    
            
        tk.Label(main_frame, text="C_NAME:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=4, column=0, padx=10, pady=5, sticky="e")
        C_NAME = tk.Entry(main_frame, font=("Arial", 14), width=25)
        C_NAME.grid(row=4, column=1, padx=10, pady=5)
        
        tk.Label(main_frame, text="IMEI:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=5, column=0, padx=10, pady=5, sticky="e")
        IMEI = tk.Entry(main_frame, font=("Arial", 14), width=25)
        IMEI.grid(row=5, column=1, padx=10, pady=5)
        
        tk.Label(main_frame, text="DATE:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=6, column=0, padx=10, pady=5, sticky="e")
        DATE = tk.Entry(main_frame, font=("Arial", 14), width=25)
        DATE.grid(row=6, column=1, padx=10, pady=5)
    
        tk.Label(main_frame, text="AXIS:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=7, column=0, padx=10, pady=5, sticky="e")
        AXIS = tk.Entry(main_frame, font=("Arial", 14), width=25)
        AXIS.grid(row=7, column=1, padx=10, pady=5)
    
        tk.Label(main_frame, text="ICICI:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=8, column=0, padx=10, pady=5, sticky="e")
        ICICI = tk.Entry(main_frame, font=("Arial", 14), width=25)
        ICICI.grid(row=8, column=1, padx=10, pady=5)
            
        tk.Label(main_frame, text="CASHIFY_DEL:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=10, column=0, padx=10, pady=5, sticky="e")
        CASHIFY_DEL = tk.Entry(main_frame, font=("Arial", 14), width=25)
        CASHIFY_DEL.grid(row=10, column=1, padx=10, pady=5)
    
        tk.Label(main_frame, text="CASHIFY_LUK:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=11, column=0, padx=10, pady=5, sticky="e")
        CASHIFY_LUK = tk.Entry(main_frame, font=("Arial", 14), width=25)
        CASHIFY_LUK.grid(row=11, column=1, padx=10, pady=5)
    
        tk.Label(main_frame, text="CASH:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=12, column=0, padx=10, pady=5, sticky="e")
        CASH = tk.Entry(main_frame, font=("Arial", 14), width=25)
        CASH.grid(row=12, column=1, padx=10, pady=5)
    
        # Insert Button
        btn_insert = tk.Button(main_frame, text="Insert Data", command=insert_data, font=("Arial", 14), bg="#7289DA", fg="white", width=20)
        btn_insert.grid(row=15, column=1, columnspan=20, pady=5)
    
        
        # Table Frame (Full Width)
        frame = tk.Frame(root)
        frame.pack(expand=True, fill="both", padx=10, pady=5)
        
        tree = ttk.Treeview(frame, show="headings", style="Custom.Treeview")
        tree.pack(expand=True, fill="both", side="left")
        
        scroll_y = ttk.Scrollbar(frame, orient="vertical", command=tree.yview)
        scroll_y.pack(side="right", fill="y")
        tree.configure(yscrollcommand=scroll_y.set)
        
        # Styling
        style = ttk.Style()
        style.configure("Custom.Treeview", font=("Courier", 13), rowheight=27)
        style.configure("Treeview.Heading", font=("Courier", 12, "bold"), background="red", foreground="black")
        
        # Keyboard Bindings
        root.bind("<Return>", insert_data)  # Enter key to insert
        root.bind("<Escape>", exit_program)  # Esc key to exit
        ORDER_ID.focus()  # Set initial focus
        
        # Run Application
        root.mainloop()

def exp_entry():
        
        # Database Configuration
        DB_CONFIG = {
            "host": "localhost",
            "user": "root",
            "password": "?",  # Change this to your MySQL password
            "database": "cmp"
        }
        
        def insert_data(event=None):
            """Insert data into stock table and show the inserted row."""
            name = NAME.get().strip()
            date = DATE.get().strip()
            axis = AXIS.get().strip()
            icici = ICICI.get().strip()
            cash = CASH.get().strip()
            
            if not (date and name and cash and axis):
                messagebox.showwarning("Warning", "All fields are required!")
                return
        
            try:
                # Convert numeric fields
                axis = float(axis) if axis else 0
                icici = float(icici) if icici else 0
                cash = float(cash) if cash else 0
                total = axis + icici + cash
    
                conn = pymysql.connect(**DB_CONFIG)
                cursor = conn.cursor()
        
                # Insert data
                query = "INSERT INTO exp (DATE, NAME, AXIS, ICICI, HDFC, CASH, TOTAL) VALUES (%s, %s, %s, %s, 0, %s, %s)"
                cursor.execute(query, (date, name, axis, icici, cash, total))
                conn.commit()
        
                # Fetch only the inserted row
                cursor.execute("SELECT * FROM exp WHERE DATE=%s", (date,))
                rows = cursor.fetchall()
                columns = [desc[0] for desc in cursor.description]
    
                    
                # Clear previous data
                tree.delete(*tree.get_children())
                tree["columns"] = columns
        
                # Set up column headers
                for col in columns:
                    tree.heading(col, text=col, anchor="center")
                    tree.column(col, anchor="center", stretch=True, width=150)
        
                # Insert only the new row
                for row in rows:
                        tree.insert("", tk.END, values=row)
        
               # messagebox.showinfo("Success", "Data Inserted Successfully!")
        
                # Clear input fields
                NAME.delete(0, tk.END)
                DATE.delete(0, tk.END)
                AXIS.delete(0, tk.END)
                ICICI.delete(0, tk.END)
                CASH.delete(0, tk.END)
                DATE.focus()
        
                # Close connection
                cursor.close()
                conn.close()
        
            except pymysql.Error as e:
                messagebox.showerror("Database Error", f"Failed to insert data:\n{e}")
        
        def exit_program(event=None):
            """Exit the program using Esc key."""
            root.destroy()
            #root.quit()
    
                
        # GUI Setup
        root = tk.Tk()
        root.title("PURCHASE Entry System")
        root.geometry("800x500")
        root.configure(bg="#2C2F33")
        
        # Centering Frame
        main_frame = tk.Frame(root, bg="#2C2F33")
        main_frame.pack(expand=True)
        
        # Labels & Entry Fields

        tk.Label(main_frame, text="DATE:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=1, column=0, padx=10, pady=5, sticky="e")
        DATE = tk.Entry(main_frame, font=("Arial", 14), width=25)
        DATE.grid(row=1, column=1, padx=10, pady=5)
                                
        tk.Label(main_frame, text="NAME:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=2, column=0, padx=10, pady=5, sticky="e")
        NAME = tk.Entry(main_frame, font=("Arial", 14), width=25)
        NAME.grid(row=2, column=1, padx=10, pady=5)
        
    
        tk.Label(main_frame, text="AXIS:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=3, column=0, padx=10, pady=5, sticky="e")
        AXIS = tk.Entry(main_frame, font=("Arial", 14), width=25)
        AXIS.grid(row=3, column=1, padx=10, pady=5)
    
        tk.Label(main_frame, text="ICICI:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=4, column=0, padx=10, pady=5, sticky="e")
        ICICI = tk.Entry(main_frame, font=("Arial", 14), width=25)
        ICICI.grid(row=4, column=1, padx=10, pady=5)
    
        tk.Label(main_frame, text="CASH:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=5, column=0, padx=10, pady=5, sticky="e")
        CASH = tk.Entry(main_frame, font=("Arial", 14), width=25)
        CASH.grid(row=5, column=1, padx=10, pady=5)
    
        btn_insert = tk.Button(main_frame, text="Insert Data", command=insert_data, font=("Arial", 14), bg="#7289DA", fg="white", width=20)
        btn_insert.grid(row=7, column=1, columnspan=20, pady=5)
    
        
        # Table Frame (Full Width)
        frame = tk.Frame(root)
        frame.pack(expand=True, fill="both", padx=10, pady=5)
        
        tree = ttk.Treeview(frame, show="headings", style="Custom.Treeview")
        tree.pack(expand=True, fill="both", side="left")
        
        scroll_y = ttk.Scrollbar(frame, orient="vertical", command=tree.yview)
        scroll_y.pack(side="right", fill="y")
        tree.configure(yscrollcommand=scroll_y.set)
        
        # Styling
        style = ttk.Style()
        style.configure("Custom.Treeview", font=("Courier", 13), rowheight=27)
        style.configure("Treeview.Heading", font=("Courier", 12, "bold"), background="red", foreground="black")
        
        # Keyboard Bindings
        root.bind("<Return>", insert_data)  # Enter key to insert
        root.bind("<Escape>", exit_program)  # Esc key to exit
        DATE.focus()  # Set initial focus
        
        # Run Application
        root.mainloop()


def p_acc_entry():
        
        # Database Configuration
        DB_CONFIG = {
            "host": "localhost",
            "user": "root",
            "password": "?",  # Change this to your MySQL password
            "database": "cmp"
        }
        
        def insert_data(event=None):
            """Insert data into stock table and show the inserted row."""
            name = NAME.get().strip()
            date = DATE.get().strip()
            axis = AXIS.get().strip()
            icici = ICICI.get().strip()
            cash = CASH.get().strip()
            
            if not (date and name and cash and axis):
                messagebox.showwarning("Warning", "All fields are required!")
                return
        
            try:
                # Convert numeric fields
                axis = float(axis) if axis else 0
                icici = float(icici) if icici else 0
                cash = float(cash) if cash else 0
                total = axis + icici + cash
    
                conn = pymysql.connect(**DB_CONFIG)
                cursor = conn.cursor()
        
                # Insert data
                query = "INSERT INTO p_acc (DATE, NAME, AXIS, ICICI, HDFC, CASH, TOTAL) VALUES (%s, %s, %s, %s, 0, %s, %s)"
                cursor.execute(query, (date, name, axis, icici, cash, total))
                conn.commit()
        
                # Fetch only the inserted row
                cursor.execute("SELECT * FROM p_acc WHERE DATE=%s", (date,))
                rows = cursor.fetchall()
                columns = [desc[0] for desc in cursor.description]
    
                    
                # Clear previous data
                tree.delete(*tree.get_children())
                tree["columns"] = columns
        
                # Set up column headers
                for col in columns:
                    tree.heading(col, text=col, anchor="center")
                    tree.column(col, anchor="center", stretch=True, width=150)
        
                # Insert only the new row
                for row in rows:
                        tree.insert("", tk.END, values=row)
        
               # messagebox.showinfo("Success", "Data Inserted Successfully!")
        
                # Clear input fields
                NAME.delete(0, tk.END)
                DATE.delete(0, tk.END)
                AXIS.delete(0, tk.END)
                ICICI.delete(0, tk.END)
                CASH.delete(0, tk.END)
                DATE.focus()
        
                # Close connection
                cursor.close()
                conn.close()
        
            except pymysql.Error as e:
                messagebox.showerror("Database Error", f"Failed to insert data:\n{e}")
        
        def exit_program(event=None):
            """Exit the program using Esc key."""
            root.destroy()
            #root.quit()
    
                
        # GUI Setup
        root = tk.Tk()
        root.title("PURCHASE Entry System")
        root.geometry("800x500")
        root.configure(bg="#2C2F33")
        
        # Centering Frame
        main_frame = tk.Frame(root, bg="#2C2F33")
        main_frame.pack(expand=True)
        
        # Labels & Entry Fields

        tk.Label(main_frame, text="DATE:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=1, column=0, padx=10, pady=5, sticky="e")
        DATE = tk.Entry(main_frame, font=("Arial", 14), width=25)
        DATE.grid(row=1, column=1, padx=10, pady=5)
                                
        tk.Label(main_frame, text="NAME:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=2, column=0, padx=10, pady=5, sticky="e")
        NAME = tk.Entry(main_frame, font=("Arial", 14), width=25)
        NAME.grid(row=2, column=1, padx=10, pady=5)
        
    
        tk.Label(main_frame, text="AXIS:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=3, column=0, padx=10, pady=5, sticky="e")
        AXIS = tk.Entry(main_frame, font=("Arial", 14), width=25)
        AXIS.grid(row=3, column=1, padx=10, pady=5)
    
        tk.Label(main_frame, text="ICICI:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=4, column=0, padx=10, pady=5, sticky="e")
        ICICI = tk.Entry(main_frame, font=("Arial", 14), width=25)
        ICICI.grid(row=4, column=1, padx=10, pady=5)
    
        tk.Label(main_frame, text="CASH:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=5, column=0, padx=10, pady=5, sticky="e")
        CASH = tk.Entry(main_frame, font=("Arial", 14), width=25)
        CASH.grid(row=5, column=1, padx=10, pady=5)
    
        btn_insert = tk.Button(main_frame, text="Insert Data", command=insert_data, font=("Arial", 14), bg="#7289DA", fg="white", width=20)
        btn_insert.grid(row=7, column=1, columnspan=20, pady=5)
    
        
        # Table Frame (Full Width)
        frame = tk.Frame(root)
        frame.pack(expand=True, fill="both", padx=10, pady=5)
        
        tree = ttk.Treeview(frame, show="headings", style="Custom.Treeview")
        tree.pack(expand=True, fill="both", side="left")
        
        scroll_y = ttk.Scrollbar(frame, orient="vertical", command=tree.yview)
        scroll_y.pack(side="right", fill="y")
        tree.configure(yscrollcommand=scroll_y.set)
        
        # Styling
        style = ttk.Style()
        style.configure("Custom.Treeview", font=("Courier", 13), rowheight=27)
        style.configure("Treeview.Heading", font=("Courier", 12, "bold"), background="red", foreground="black")
        
        # Keyboard Bindings
        root.bind("<Return>", insert_data)  # Enter key to insert
        root.bind("<Escape>", exit_program)  # Esc key to exit
        DATE.focus()  # Set initial focus
        
        # Run Application
        root.mainloop()

def s_acc_entry():
        
        # Database Configuration
        DB_CONFIG = {
            "host": "localhost",
            "user": "root",
            "password": "?",  # Change this to your MySQL password
            "database": "cmp"
        }
        
        def insert_data(event=None):
            """Insert data into stock table and show the inserted row."""
            name = NAME.get().strip()
            date = DATE.get().strip()
            axis = AXIS.get().strip()
            icici = ICICI.get().strip()
            cash = CASH.get().strip()
            p_price= P_PRICE.get().strip()
            
            if not (date and name and cash and axis):
                messagebox.showwarning("Warning", "All fields are required!")
                return
        
            try:
                # Convert numeric fields
                axis = int(axis) if axis else 0
                icici = int(icici) if icici else 0
                cash = int(cash) if cash else 0
                #total = axis + icici + cash
                profit = float(axis) + float(icici) + float(cash) - float(p_price)
                
    
                conn = pymysql.connect(**DB_CONFIG)
                cursor = conn.cursor()
        
                # Insert data
                query = "INSERT INTO s_acc (DATE, NAME, AXIS, ICICI, HDFC, CASH, P_PRICE, TOTAL_PROFIT) VALUES (%s, %s, %s, %s, 0, %s, %s, %s)"
                cursor.execute(query, (date, name, axis, icici, cash, p_price, profit))
                conn.commit()
        
                # Fetch only the inserted row
                cursor.execute("SELECT * FROM s_acc WHERE DATE=%s", (date,))
                rows = cursor.fetchall()
                columns = [desc[0] for desc in cursor.description]
    
                    
                # Clear previous data
                tree.delete(*tree.get_children())
                tree["columns"] = columns
        
                # Set up column headers
                for col in columns:
                    tree.heading(col, text=col, anchor="center")
                    tree.column(col, anchor="center", stretch=True, width=150)
        
                # Insert only the new row
                for row in rows:
                        tree.insert("", tk.END, values=row)
        
               # messagebox.showinfo("Success", "Data Inserted Successfully!")
        
                # Clear input fields
                NAME.delete(0, tk.END)
                DATE.delete(0, tk.END)
                AXIS.delete(0, tk.END)
                ICICI.delete(0, tk.END)
                CASH.delete(0, tk.END)
                P_PRICE.delete(0, tk.END)
                DATE.focus()
        
                # Close connection
                cursor.close()
                conn.close()
        
            except pymysql.Error as e:
                messagebox.showerror("Database Error", f"Failed to insert data:\n{e}")
        
        def exit_program(event=None):
            """Exit the program using Esc key."""
            root.destroy()
            #root.quit()
    
                
        # GUI Setup
        root = tk.Tk()
        root.title("PURCHASE Entry System")
        root.geometry("800x500")
        root.configure(bg="#2C2F33")
        
        # Centering Frame
        main_frame = tk.Frame(root, bg="#2C2F33")
        main_frame.pack(expand=True)
        
        # Labels & Entry Fields

        tk.Label(main_frame, text="DATE:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=1, column=0, padx=10, pady=5, sticky="e")
        DATE = tk.Entry(main_frame, font=("Arial", 14), width=25)
        DATE.grid(row=1, column=1, padx=10, pady=5)
                                
        tk.Label(main_frame, text="NAME:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=2, column=0, padx=10, pady=5, sticky="e")
        NAME = tk.Entry(main_frame, font=("Arial", 14), width=25)
        NAME.grid(row=2, column=1, padx=10, pady=5)
        
    
        tk.Label(main_frame, text="AXIS:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=3, column=0, padx=10, pady=5, sticky="e")
        AXIS = tk.Entry(main_frame, font=("Arial", 14), width=25)
        AXIS.grid(row=3, column=1, padx=10, pady=5)
    
        tk.Label(main_frame, text="ICICI:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=4, column=0, padx=10, pady=5, sticky="e")
        ICICI = tk.Entry(main_frame, font=("Arial", 14), width=25)
        ICICI.grid(row=4, column=1, padx=10, pady=5)
    
        tk.Label(main_frame, text="CASH:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=5, column=0, padx=10, pady=5, sticky="e")
        CASH = tk.Entry(main_frame, font=("Arial", 14), width=25)
        CASH.grid(row=5, column=1, padx=10, pady=5)

        tk.Label(main_frame, text="P_PRICE:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=6, column=0, padx=10, pady=5, sticky="e")
        P_PRICE = tk.Entry(main_frame, font=("Arial", 14), width=25)
        P_PRICE.grid(row=6, column=1, padx=10, pady=5)
    
        btn_insert = tk.Button(main_frame, text="Insert Data", command=insert_data, font=("Arial", 14), bg="#7289DA", fg="white", width=20)
        btn_insert.grid(row=7, column=1, columnspan=20, pady=5)
    
        
        # Table Frame (Full Width)
        frame = tk.Frame(root)
        frame.pack(expand=True, fill="both", padx=10, pady=5)
        
        tree = ttk.Treeview(frame, show="headings", style="Custom.Treeview")
        tree.pack(expand=True, fill="both", side="left")
        
        scroll_y = ttk.Scrollbar(frame, orient="vertical", command=tree.yview)
        scroll_y.pack(side="right", fill="y")
        tree.configure(yscrollcommand=scroll_y.set)
        
        # Styling
        style = ttk.Style()
        style.configure("Custom.Treeview", font=("Courier", 13), rowheight=27)
        style.configure("Treeview.Heading", font=("Courier", 12, "bold"), background="red", foreground="black")
        
        # Keyboard Bindings
        root.bind("<Return>", insert_data)  # Enter key to insert
        root.bind("<Escape>", exit_program)  # Esc key to exit
        DATE.focus()  # Set initial focus
        
        # Run Application
        root.mainloop()


def charges_entry():
        
        # Database Configuration
        DB_CONFIG = {
            "host": "localhost",
            "user": "root",
            "password": "?",  # Change this to your MySQL password
            "database": "cmp"
        }
        
        def insert_data(event=None):
            """Insert data into stock table and show the inserted row."""
            name = NAME.get().strip()
            date = DATE.get().strip()
            axis = AXIS.get().strip()
            icici = ICICI.get().strip()
            cash = CASH.get().strip()
            
            if not (date and name and cash and axis):
                messagebox.showwarning("Warning", "All fields are required!")
                return
        
            try:
                # Convert numeric fields
                axis = float(axis) if axis else 0
                icici = float(icici) if icici else 0
                cash = float(cash) if cash else 0
                total = axis + icici + cash
    
                conn = pymysql.connect(**DB_CONFIG)
                cursor = conn.cursor()
        
                # Insert data
                query = "INSERT INTO charges (DATE, NAME, AXIS, ICICI, CASH, TOTAL) VALUES (%s, %s, %s, %s, %s, %s)"
                cursor.execute(query, (date, name, axis, icici, cash, total))
                conn.commit()
        
                # Fetch only the inserted row
                cursor.execute("SELECT * FROM charges WHERE DATE=%s", (date,))
                rows = cursor.fetchall()
                columns = [desc[0] for desc in cursor.description]
    
                    
                # Clear previous data
                tree.delete(*tree.get_children())
                tree["columns"] = columns
        
                # Set up column headers
                for col in columns:
                    tree.heading(col, text=col, anchor="center")
                    tree.column(col, anchor="center", stretch=True, width=150)
        
                # Insert only the new row
                for row in rows:
                        tree.insert("", tk.END, values=row)
        
               # messagebox.showinfo("Success", "Data Inserted Successfully!")
        
                # Clear input fields
                NAME.delete(0, tk.END)
                DATE.delete(0, tk.END)
                AXIS.delete(0, tk.END)
                ICICI.delete(0, tk.END)
             #   HDFC.delete(0, tk.END)
                CASH.delete(0, tk.END)
                #TOTAL.delete(0, tk.END)
                DATE.focus()
        
                # Close connection
                cursor.close()
                conn.close()
        
            except pymysql.Error as e:
                messagebox.showerror("Database Error", f"Failed to insert data:\n{e}")
        
        def exit_program(event=None):
            """Exit the program using Esc key."""
            root.destroy()
            #root.quit()
    
                
        # GUI Setup
        root = tk.Tk()
        root.title("PURCHASE Entry System")
        root.geometry("800x500")
        root.configure(bg="#2C2F33")
        
        # Centering Frame
        main_frame = tk.Frame(root, bg="#2C2F33")
        main_frame.pack(expand=True)
        
        # Labels & Entry Fields

        tk.Label(main_frame, text="DATE:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=1, column=0, padx=10, pady=5, sticky="e")
        DATE = tk.Entry(main_frame, font=("Arial", 14), width=25)
        DATE.grid(row=1, column=1, padx=10, pady=5)
                                
        tk.Label(main_frame, text="NAME:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=2, column=0, padx=10, pady=5, sticky="e")
        NAME = tk.Entry(main_frame, font=("Arial", 14), width=25)
        NAME.grid(row=2, column=1, padx=10, pady=5)
        
    
        tk.Label(main_frame, text="AXIS:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=3, column=0, padx=10, pady=5, sticky="e")
        AXIS = tk.Entry(main_frame, font=("Arial", 14), width=25)
        AXIS.grid(row=3, column=1, padx=10, pady=5)
    
        tk.Label(main_frame, text="ICICI:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=4, column=0, padx=10, pady=5, sticky="e")
        ICICI = tk.Entry(main_frame, font=("Arial", 14), width=25)
        ICICI.grid(row=4, column=1, padx=10, pady=5)
    
        tk.Label(main_frame, text="CASH:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=5, column=0, padx=10, pady=5, sticky="e")
        CASH = tk.Entry(main_frame, font=("Arial", 14), width=25)
        CASH.grid(row=5, column=1, padx=10, pady=5)
    
        btn_insert = tk.Button(main_frame, text="Insert Data", command=insert_data, font=("Arial", 14), bg="#7289DA", fg="white", width=20)
        btn_insert.grid(row=7, column=1, columnspan=20, pady=5)
    
        
        # Table Frame (Full Width)
        frame = tk.Frame(root)
        frame.pack(expand=True, fill="both", padx=10, pady=5)
        
        tree = ttk.Treeview(frame, show="headings", style="Custom.Treeview")
        tree.pack(expand=True, fill="both", side="left")
        
        scroll_y = ttk.Scrollbar(frame, orient="vertical", command=tree.yview)
        scroll_y.pack(side="right", fill="y")
        tree.configure(yscrollcommand=scroll_y.set)
        
        # Styling
        style = ttk.Style()
        style.configure("Custom.Treeview", font=("Courier", 13), rowheight=27)
        style.configure("Treeview.Heading", font=("Courier", 12, "bold"), background="red", foreground="black")
        
        # Keyboard Bindings
        root.bind("<Return>", insert_data)  # Enter key to insert
        root.bind("<Escape>", exit_program)  # Esc key to exit
        DATE.focus()  # Set initial focus
        
        # Run Application
        root.mainloop()


def sal_entry():
        
        # Database Configuration
        DB_CONFIG = {
            "host": "localhost",
            "user": "root",
            "password": "?",  # Change this to your MySQL password
            "database": "cmp"
        }
        
        def insert_data(event=None):
            """Insert data into stock table and show the inserted row."""
            name = NAME.get().strip()
            date = DATE.get().strip()
            axis = AXIS.get().strip()
            icici = ICICI.get().strip()
            cash = CASH.get().strip()
            
            if not (date and name and cash and axis):
                messagebox.showwarning("Warning", "All fields are required!")
                return
        
            try:
                # Convert numeric fields
                axis = float(axis) if axis else 0
                icici = float(icici) if icici else 0
                cash = float(cash) if cash else 0
                total = axis + icici + cash
    
                conn = pymysql.connect(**DB_CONFIG)
                cursor = conn.cursor()
        
                # Insert data
                query = "INSERT INTO sal (DATE, NAME, AXIS, ICICI, CASH, TOTAL) VALUES (%s, %s, %s, %s, %s, %s)"
                cursor.execute(query, (date, name, axis, icici, cash, total))
                conn.commit()
        
                # Fetch only the inserted row
                cursor.execute("SELECT * FROM sal WHERE DATE=%s", (date,))
                rows = cursor.fetchall()
                columns = [desc[0] for desc in cursor.description]
    
                    
                # Clear previous data
                tree.delete(*tree.get_children())
                tree["columns"] = columns
        
                # Set up column headers
                for col in columns:
                    tree.heading(col, text=col, anchor="center")
                    tree.column(col, anchor="center", stretch=True, width=150)
        
                # Insert only the new row
                for row in rows:
                        tree.insert("", tk.END, values=row)
        
               # messagebox.showinfo("Success", "Data Inserted Successfully!")
        
                # Clear input fields
                NAME.delete(0, tk.END)
                DATE.delete(0, tk.END)
                AXIS.delete(0, tk.END)
                ICICI.delete(0, tk.END)
             #   HDFC.delete(0, tk.END)
                CASH.delete(0, tk.END)
                #TOTAL.delete(0, tk.END)
                DATE.focus()
        
                # Close connection
                cursor.close()
                conn.close()
        
            except pymysql.Error as e:
                messagebox.showerror("Database Error", f"Failed to insert data:\n{e}")
        
        def exit_program(event=None):
            """Exit the program using Esc key."""
            root.destroy()
            #root.quit()
    
                
        # GUI Setup
        root = tk.Tk()
        root.title("PURCHASE Entry System")
        root.geometry("800x500")
        root.configure(bg="#2C2F33")
        
        # Centering Frame
        main_frame = tk.Frame(root, bg="#2C2F33")
        main_frame.pack(expand=True)
        
        # Labels & Entry Fields

        tk.Label(main_frame, text="DATE:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=1, column=0, padx=10, pady=5, sticky="e")
        DATE = tk.Entry(main_frame, font=("Arial", 14), width=25)
        DATE.grid(row=1, column=1, padx=10, pady=5)
                                
        tk.Label(main_frame, text="NAME:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=2, column=0, padx=10, pady=5, sticky="e")
        NAME = tk.Entry(main_frame, font=("Arial", 14), width=25)
        NAME.grid(row=2, column=1, padx=10, pady=5)
        
    
        tk.Label(main_frame, text="AXIS:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=3, column=0, padx=10, pady=5, sticky="e")
        AXIS = tk.Entry(main_frame, font=("Arial", 14), width=25)
        AXIS.grid(row=3, column=1, padx=10, pady=5)
    
        tk.Label(main_frame, text="ICICI:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=4, column=0, padx=10, pady=5, sticky="e")
        ICICI = tk.Entry(main_frame, font=("Arial", 14), width=25)
        ICICI.grid(row=4, column=1, padx=10, pady=5)
    
        tk.Label(main_frame, text="CASH:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=5, column=0, padx=10, pady=5, sticky="e")
        CASH = tk.Entry(main_frame, font=("Arial", 14), width=25)
        CASH.grid(row=5, column=1, padx=10, pady=5)
    
        btn_insert = tk.Button(main_frame, text="Insert Data", command=insert_data, font=("Arial", 14), bg="#7289DA", fg="white", width=20)
        btn_insert.grid(row=7, column=1, columnspan=20, pady=5)
    
        
        # Table Frame (Full Width)
        frame = tk.Frame(root)
        frame.pack(expand=True, fill="both", padx=10, pady=5)
        
        tree = ttk.Treeview(frame, show="headings", style="Custom.Treeview")
        tree.pack(expand=True, fill="both", side="left")
        
        scroll_y = ttk.Scrollbar(frame, orient="vertical", command=tree.yview)
        scroll_y.pack(side="right", fill="y")
        tree.configure(yscrollcommand=scroll_y.set)
        
        # Styling
        style = ttk.Style()
        style.configure("Custom.Treeview", font=("Courier", 13), rowheight=27)
        style.configure("Treeview.Heading", font=("Courier", 12, "bold"), background="red", foreground="black")
        
        # Keyboard Bindings
        root.bind("<Return>", insert_data)  # Enter key to insert
        root.bind("<Escape>", exit_program)  # Esc key to exit
        DATE.focus()  # Set initial focus
        
        # Run Application
        root.mainloop()


def parts_entry():
        
        # Database Configuration
        DB_CONFIG = {
            "host": "localhost",
            "user": "root",
            "password": "?",  # Change this to your MySQL password
            "database": "cmp"
        }
        
        def insert_data(event=None):
            """Insert data into stock table and show the inserted row."""
            name = NAME.get().strip()
            date = DATE.get().strip()
            axis = AXIS.get().strip()
            icici = ICICI.get().strip()
            cash = CASH.get().strip()
            
            if not (date and name and cash and axis):
                messagebox.showwarning("Warning", "All fields are required!")
                return
        
            try:
                # Convert numeric fields
                axis = float(axis) if axis else 0
                icici = float(icici) if icici else 0
                cash = float(cash) if cash else 0
                total = axis + icici + cash
    
                conn = pymysql.connect(**DB_CONFIG)
                cursor = conn.cursor()
        
                # Insert data
                query = "INSERT INTO parts (DATE, NAME, AXIS, ICICI, CASH, TOTAL) VALUES (%s, %s, %s, %s, %s, %s)"
                cursor.execute(query, (date, name, axis, icici, cash, total))
                conn.commit()
        
                # Fetch only the inserted row
                cursor.execute("SELECT * FROM parts WHERE DATE=%s", (date,))
                rows = cursor.fetchall()
                columns = [desc[0] for desc in cursor.description]
    
                    
                # Clear previous data
                tree.delete(*tree.get_children())
                tree["columns"] = columns
        
                # Set up column headers
                for col in columns:
                    tree.heading(col, text=col, anchor="center")
                    tree.column(col, anchor="center", stretch=True, width=150)
        
                # Insert only the new row
                for row in rows:
                        tree.insert("", tk.END, values=row)
        
               # messagebox.showinfo("Success", "Data Inserted Successfully!")
        
                # Clear input fields
                NAME.delete(0, tk.END)
                DATE.delete(0, tk.END)
                AXIS.delete(0, tk.END)
                ICICI.delete(0, tk.END)
                CASH.delete(0, tk.END)
                DATE.focus()
        
                # Close connection
                cursor.close()
                conn.close()
        
            except pymysql.Error as e:
                messagebox.showerror("Database Error", f"Failed to insert data:\n{e}")
        
        def exit_program(event=None):
            """Exit the program using Esc key."""
            root.destroy()
            #root.quit()
    
                
        # GUI Setup
        root = tk.Tk()
        root.title("PURCHASE Entry System")
        root.geometry("800x500")
        root.configure(bg="#2C2F33")
        
        # Centering Frame
        main_frame = tk.Frame(root, bg="#2C2F33")
        main_frame.pack(expand=True)
        
        # Labels & Entry Fields

        tk.Label(main_frame, text="DATE:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=1, column=0, padx=10, pady=5, sticky="e")
        DATE = tk.Entry(main_frame, font=("Arial", 14), width=25)
        DATE.grid(row=1, column=1, padx=10, pady=5)
                                
        tk.Label(main_frame, text="NAME:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=2, column=0, padx=10, pady=5, sticky="e")
        NAME = tk.Entry(main_frame, font=("Arial", 14), width=25)
        NAME.grid(row=2, column=1, padx=10, pady=5)
        
    
        tk.Label(main_frame, text="AXIS:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=3, column=0, padx=10, pady=5, sticky="e")
        AXIS = tk.Entry(main_frame, font=("Arial", 14), width=25)
        AXIS.grid(row=3, column=1, padx=10, pady=5)
    
        tk.Label(main_frame, text="ICICI:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=4, column=0, padx=10, pady=5, sticky="e")
        ICICI = tk.Entry(main_frame, font=("Arial", 14), width=25)
        ICICI.grid(row=4, column=1, padx=10, pady=5)
    
        tk.Label(main_frame, text="CASH:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=5, column=0, padx=10, pady=5, sticky="e")
        CASH = tk.Entry(main_frame, font=("Arial", 14), width=25)
        CASH.grid(row=5, column=1, padx=10, pady=5)
    
        btn_insert = tk.Button(main_frame, text="Insert Data", command=insert_data, font=("Arial", 14), bg="#7289DA", fg="white", width=20)
        btn_insert.grid(row=7, column=1, columnspan=20, pady=5)
    
        
        # Table Frame (Full Width)
        frame = tk.Frame(root)
        frame.pack(expand=True, fill="both", padx=10, pady=5)
        
        tree = ttk.Treeview(frame, show="headings", style="Custom.Treeview")
        tree.pack(expand=True, fill="both", side="left")
        
        scroll_y = ttk.Scrollbar(frame, orient="vertical", command=tree.yview)
        scroll_y.pack(side="right", fill="y")
        tree.configure(yscrollcommand=scroll_y.set)
        
        # Styling
        style = ttk.Style()
        style.configure("Custom.Treeview", font=("Courier", 13), rowheight=27)
        style.configure("Treeview.Heading", font=("Courier", 12, "bold"), background="red", foreground="black")
        
        # Keyboard Bindings
        root.bind("<Return>", insert_data)  # Enter key to insert
        root.bind("<Escape>", exit_program)  # Esc key to exit
        DATE.focus()  # Set initial focus
        
        # Run Application
        root.mainloop()


def repair_entry():
        
        # Database Configuration
        DB_CONFIG = {
            "host": "localhost",
            "user": "root",
            "password": "?",  # Change this to your MySQL password
            "database": "cmp"
        }
        
        def insert_data(event=None):
            """Insert data into stock table and show the inserted row."""
            name = NAME.get().strip()
            date = DATE.get().strip()
            axis = AXIS.get().strip()
            icici = ICICI.get().strip()
            cash = CASH.get().strip()
            cost= COST.get().strip()
            
            if not (date and name and cash and axis):
                messagebox.showwarning("Warning", "All fields are required!")
                return
        
            try:
                # Convert numeric fields
                axis = int(axis) if axis else 0
                icici = int(icici) if icici else 0
                cash = int(cash) if cash else 0
                #total = axis + icici + cash
                profit = float(axis) + float(icici) + float(cash) - float(cost)
                
    
                conn = pymysql.connect(**DB_CONFIG)
                cursor = conn.cursor()
        
                # Insert data
                query = "INSERT INTO repair (DATE, NAME, AXIS, ICICI, HDFC, CASH, COST, TOTAL_PROFIT) VALUES (%s, %s, %s, %s, 0, %s, %s, %s)"
                cursor.execute(query, (date, name, axis, icici, cash, cost, profit))
                conn.commit()
        
                # Fetch only the inserted row
                cursor.execute("SELECT * FROM repair WHERE DATE=%s", (date,))
                rows = cursor.fetchall()
                columns = [desc[0] for desc in cursor.description]
    
                    
                # Clear previous data
                tree.delete(*tree.get_children())
                tree["columns"] = columns
        
                # Set up column headers
                for col in columns:
                    tree.heading(col, text=col, anchor="center")
                    tree.column(col, anchor="center", stretch=True, width=150)
        
                # Insert only the new row
                for row in rows:
                        tree.insert("", tk.END, values=row)
        
               # messagebox.showinfo("Success", "Data Inserted Successfully!")
        
                # Clear input fields
                NAME.delete(0, tk.END)
                DATE.delete(0, tk.END)
                AXIS.delete(0, tk.END)
                ICICI.delete(0, tk.END)
                CASH.delete(0, tk.END)
                COST.delete(0, tk.END)
                DATE.focus()
        
                # Close connection
                cursor.close()
                conn.close()
        
            except pymysql.Error as e:
                messagebox.showerror("Database Error", f"Failed to insert data:\n{e}")
        
        def exit_program(event=None):
            """Exit the program using Esc key."""
            root.destroy()
            #root.quit()
    
                
        # GUI Setup
        root = tk.Tk()
        root.title("PURCHASE Entry System")
        root.geometry("800x500")
        root.configure(bg="#2C2F33")
        
        # Centering Frame
        main_frame = tk.Frame(root, bg="#2C2F33")
        main_frame.pack(expand=True)
        
        # Labels & Entry Fields

        tk.Label(main_frame, text="DATE:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=1, column=0, padx=10, pady=5, sticky="e")
        DATE = tk.Entry(main_frame, font=("Arial", 14), width=25)
        DATE.grid(row=1, column=1, padx=10, pady=5)
                                
        tk.Label(main_frame, text="NAME:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=2, column=0, padx=10, pady=5, sticky="e")
        NAME = tk.Entry(main_frame, font=("Arial", 14), width=25)
        NAME.grid(row=2, column=1, padx=10, pady=5)
        
    
        tk.Label(main_frame, text="AXIS:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=3, column=0, padx=10, pady=5, sticky="e")
        AXIS = tk.Entry(main_frame, font=("Arial", 14), width=25)
        AXIS.grid(row=3, column=1, padx=10, pady=5)
    
        tk.Label(main_frame, text="ICICI:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=4, column=0, padx=10, pady=5, sticky="e")
        ICICI = tk.Entry(main_frame, font=("Arial", 14), width=25)
        ICICI.grid(row=4, column=1, padx=10, pady=5)
    
        tk.Label(main_frame, text="CASH:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=5, column=0, padx=10, pady=5, sticky="e")
        CASH = tk.Entry(main_frame, font=("Arial", 14), width=25)
        CASH.grid(row=5, column=1, padx=10, pady=5)

        tk.Label(main_frame, text="COST:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=6, column=0, padx=10, pady=5, sticky="e")
        COST = tk.Entry(main_frame, font=("Arial", 14), width=25)
        COST.grid(row=6, column=1, padx=10, pady=5)
    
        btn_insert = tk.Button(main_frame, text="Insert Data", command=insert_data, font=("Arial", 14), bg="#7289DA", fg="white", width=20)
        btn_insert.grid(row=7, column=1, columnspan=20, pady=5)
    
        
        # Table Frame (Full Width)
        frame = tk.Frame(root)
        frame.pack(expand=True, fill="both", padx=10, pady=5)
        
        tree = ttk.Treeview(frame, show="headings", style="Custom.Treeview")
        tree.pack(expand=True, fill="both", side="left")
        
        scroll_y = ttk.Scrollbar(frame, orient="vertical", command=tree.yview)
        scroll_y.pack(side="right", fill="y")
        tree.configure(yscrollcommand=scroll_y.set)
        
        # Styling
        style = ttk.Style()
        style.configure("Custom.Treeview", font=("Courier", 13), rowheight=27)
        style.configure("Treeview.Heading", font=("Courier", 12, "bold"), background="red", foreground="black")
        
        # Keyboard Bindings
        root.bind("<Return>", insert_data)  # Enter key to insert
        root.bind("<Escape>", exit_program)  # Esc key to exit
        DATE.focus()  # Set initial focus
        
        # Run Application
        root.mainloop()




def sch():
    def open_script(script_name):
        try:
            subprocess.Popen(["python", script_name])  # Run script in a new process
        except Exception as e:
            messagebox.showerror("Error", f"Failed to open {script_name}\n{e}")

    # Functions for each button
    def ORDERID(): oid()
    def DATE(): dat()
    def STOCKS(): stocksch()
    def PURCHASES(): psch()
    def SALES(): ssch()
    def CUSTOMERS(): csh()
    def PACCS(): pasch()
    def SACCS(): sasch()
    def EXPS(): expsch()
    def REPAIRS(): repairsch()
    def SALS(): salsch()
    def PARTS(): partsch()
    def LUCKNOW(): lucksch()
    # Create main window
    entry_window = tk.Toplevel()
    entry_window.title("SEARCHING Options")
    entry_window.geometry("1400x800")

    # Load and store background image
    entry_window.bg_image = Image.open("2.jpg")
    entry_window.bg_image = entry_window.bg_image.resize((1400, 800), Image.Resampling.LANCZOS) #1400,800
    entry_window.bg_photo = ImageTk.PhotoImage(entry_window.bg_image)

    # Create Canvas and place background image
    canvas = tk.Canvas(entry_window, width=1400, height=800)
    canvas.pack(fill="both", expand=True)
    canvas.create_image(0, 0, image=entry_window.bg_photo, anchor="nw")

    # Label
    label = tk.Label(entry_window, text="SEARCHING OPTIONS", font=("Terminus", 28, "bold"), fg="white", bg="black")
    canvas.create_window(670, 50, window=label)

    # Button styling
    button_style = {
        "font": ("Terminus", 18, "bold"),
        "bg": "#999999",
        "fg": "black",
        "activebackground": "#393E46",
        "activeforeground": "white",
        "bd": 2,
        "relief": "ridge",
        "width": 25
    }

    # List to store buttons
    buttons = []
    button_functions = [ORDERID, DATE, STOCKS, PURCHASES, SALES, CUSTOMERS, PACCS, SACCS,EXPS , REPAIRS, SALS, PARTS,LUCKNOW]
    button_positions = [100, 150, 200, 250, 300, 350, 400, 450, 500, 550, 600, 650, 700]

    # Track selected button
    selected_index = [0]  # Use a list to modify inside functions

    def highlight_button():
        """Highlights the selected button and resets others."""
        for i, btn in enumerate(buttons):
            if i == selected_index[0]:
                btn.config(bg="#040404", fg="grey")  # Highlighted button
            else:
                btn.config(bg="#999999", fg="black")  # Normal button

    def move_selection(event):
        """Move selection up/down using arrow keys."""
        if event.keysym == "Up":
            selected_index[0] = (selected_index[0] - 1) % len(buttons)  # Move up
        elif event.keysym == "Down":
            selected_index[0] = (selected_index[0] + 1) % len(buttons)  # Move down
        highlight_button()

    def select_button(event):
        """Trigger the selected button when Enter is pressed."""
        button_functions[selected_index[0]]()  # Run the selected function
    def go_back(event):
        entry_window.destroy()
    # Create buttons and place them on canvas
    for text, command, y_pos in zip(
        ["1) ORDER_ID", "2) DATE", "3) STOCK", "4) PURCHASE PHONE", "5) SALE PHONE",
         "6) CUSTOMERS", "7) P_ACC", "8) S_ACC", "9) EXPANSES", "10) REPAIR", "11) SALARYES", "12) PARTS", "13) LUCKNOW"],
        button_functions, button_positions
    ):
        btn = tk.Button(entry_window, text=text, command=command, **button_style)
        canvas.create_window(670, y_pos, window=btn)
        buttons.append(btn)  # Store button in list
    
    # Highlight the first button initially
    highlight_button()

    # Bind keys
    entry_window.bind("<Up>", move_selection)
    entry_window.bind("<Down>", move_selection)
    entry_window.bind("<Return>", select_button)
    entry_window.bind("<Escape>", go_back)

    # Run GUI
    entry_window.mainloop()


def oid():
        
        # Database Connection Configuration
        DB_CONFIG = {
            "host": "localhost",
            "user": "root",
            "password": "?",
            "database": "cmp"
        }
        def fetch_and_display_tables(table_names, order_id=None):
            try:
                conn = pymysql.connect(**DB_CONFIG)
                cursor = conn.cursor()
        
                output = []
        
                for table_name in table_names:
                    query = f"SELECT * FROM `{table_name}`"
                    if order_id:
                        query += f" WHERE ORDER_ID = %s"
                        cursor.execute(query, (order_id,))
                    else:
                        cursor.execute(query)
        
                    rows = cursor.fetchall()
                    columns = [desc[0] for desc in cursor.description]
        
                    output.append(f"\nTABLE: {table_name.upper()}\n")
        
                    if not rows:
                        output.append("No data found.\n")
                        continue
        
                    # Calculate column widths
                    col_widths = [max(len(str(col)), max(len(str(row[i])) for row in rows)) for i, col in enumerate(columns)]
                    line_sep = "+-" + "-+-".join("-" * width for width in col_widths) + "-+"
        
                    output.append(line_sep)
                    output.append("| " + " | ".join(f"{col.ljust(col_widths[i])}" for i, col in enumerate(columns)) + " |")
                    output.append(line_sep)
        
                    for row in rows:
                        output.append("| " + " | ".join(f"{str(row[i]).ljust(col_widths[i])}" for i in range(len(row))) + " |")
        
                    output.append(line_sep)
        
                # Show in GUI
                text_area.config(state=tk.NORMAL)
                text_area.delete(1.0, tk.END)
                text_area.insert(tk.END, "\n".join(output))
                text_area.config(state=tk.DISABLED)
        
                cursor.close()
                conn.close()
        
            except pymysql.Error as e:
                messagebox.showerror("Database Error", f"Failed to fetch data:\n{e}")
        
        # GUI Setup
        root = tk.Tk()
        root.title("SQL Multi-Table Viewer (CLI Style)")
        root.geometry("1000x650")
        
        # Entry field for ORDER_ID
        entry_frame = tk.Frame(root)
        entry_frame.pack(pady=10)
        
        tk.Label(entry_frame, text="Enter ORDER_ID:").pack(side="left", padx=(10, 5))
        order_id_entry = tk.Entry(entry_frame)
        order_id_entry.pack(side="left", padx=5)

        def go_back(event):
            root.destroy()
        
        def on_fetch_click():
            order_id = order_id_entry.get().strip()
            if order_id:
                fetch_and_display_tables(tables_to_show, order_id)
            else:
                fetch_and_display_tables(tables_to_show)
        
        fetch_button = tk.Button(entry_frame, text="Fetch", command=on_fetch_click)
        fetch_button.pack(side="left", padx=10)
        
        # Frame for scrollbars
        frame = tk.Frame(root)
        frame.pack(fill="both", expand=True)
        
        # Text area with both scrollbars
        text_area = tk.Text(frame, font=("Courier", 12), wrap="none")
        text_area.pack(side="left", fill="both", expand=True)
        
        # Vertical scrollbar
        scroll_y = tk.Scrollbar(frame, orient="vertical", command=text_area.yview)
        scroll_y.pack(side="right", fill="y")
        
        # Horizontal scrollbar
        scroll_x = tk.Scrollbar(root, orient="horizontal", command=text_area.xview)
        scroll_x.pack(fill="x")
        
        text_area.config(yscrollcommand=scroll_y.set, xscrollcommand=scroll_x.set)
        
        # Table names to display
        tables_to_show = ["stock", "p_table", "s_table"]  # Add more as needed
        
        # Initial fetch with no filter
        fetch_and_display_tables(tables_to_show)
        
        root.bind("<Escape>", go_back)
        
        root.mainloop()


def dat():  
        # Database Connection Configuration
        DB_CONFIG = {
            "host": "localhost",
            "user": "root",
            "password": "?",
            "database": "cmp"
        }
    
        def fetch_and_display_tables(table_names, date_filter="2025"):
            try:
                conn = pymysql.connect(**DB_CONFIG)
                cursor = conn.cursor()
    
                output = []
    
                for table_name in table_names:
                    # Query based on format of date input
                    if len(date_filter) == 10:  # Format YYYY-MM-DD
                        query = f"SELECT * FROM `{table_name}` WHERE DATE = %s"
                        cursor.execute(query, (date_filter,))
                    else:
                        query = f"SELECT * FROM `{table_name}` WHERE DATE LIKE %s"
                        cursor.execute(query, (f"{date_filter}%",))
    
                    rows = cursor.fetchall()
                    columns = [desc[0] for desc in cursor.description]
    
                    output.append(f"\nTABLE: {table_name.upper()}\n")
    
                    if not rows:
                        output.append("No data found.\n")
                        continue
    
                    # Calculate column widths
                    col_widths = [max(len(str(col)), max(len(str(row[i])) for row in rows)) for i, col in enumerate(columns)]
                    line_sep = "+-" + "-+-".join("-" * width for width in col_widths) + "-+"
    
                    output.append(line_sep)
                    output.append("| " + " | ".join(f"{col.ljust(col_widths[i])}" for i, col in enumerate(columns)) + " |")
                    output.append(line_sep)
    
                    for row in rows:
                        output.append("| " + " | ".join(f"{str(row[i]).ljust(col_widths[i])}" for i in range(len(row))) + " |")
    
                    output.append(line_sep)
    
                # Show in GUI
                text_area.config(state=tk.NORMAL)
                text_area.delete(1.0, tk.END)
                text_area.insert(tk.END, "\n".join(output))
                text_area.config(state=tk.DISABLED)
    
                cursor.close()
                conn.close()
    
            except pymysql.Error as e:
                messagebox.showerror("Database Error", f"Failed to fetch data:\n{e}")
    
        # GUI Setup
        root = tk.Tk()
        root.title("SQL Multi-Table Viewer (Filter by Date)")
        root.geometry("1200x700")
    
        # Entry field for date filter
        entry_frame = tk.Frame(root)
        entry_frame.pack(pady=10)
    
        tk.Label(entry_frame, text="Enter Date (YYYY or YYYY-MM or YYYY-MM-DD):").pack(side="left", padx=(10, 5))
        date_entry = tk.Entry(entry_frame)
        date_entry.insert(0, "2025")
        date_entry.pack(side="left", padx=5)

        def go_back(event):
                root.destroy()
                
        
        def on_fetch_click():
            date_filter = date_entry.get().strip()
            if not date_filter:
                date_filter = "2025"
            fetch_and_display_tables(tables_to_show, date_filter)
    
        fetch_button = tk.Button(entry_frame, text="Fetch", command=on_fetch_click)
        fetch_button.pack(side="left", padx=10)
    
        # Frame for scrollbars
        frame = tk.Frame(root)
        frame.pack(fill="both", expand=True)
    
        # Text area with scrollbars
        text_area = tk.Text(frame, font=("Courier", 12), wrap="none")
        text_area.pack(side="left", fill="both", expand=True)
    
        # Scrollbars
        scroll_y = tk.Scrollbar(frame, orient="vertical", command=text_area.yview)
        scroll_y.pack(side="right", fill="y")
    
        scroll_x = tk.Scrollbar(root, orient="horizontal", command=text_area.xview)
        scroll_x.pack(fill="x")
    
        text_area.config(yscrollcommand=scroll_y.set, xscrollcommand=scroll_x.set)
    
        # Tables to fetch
        tables_to_show = ["p_table", "s_table", "p_acc", "s_acc", "exp", "repair", "sal", "parts"]
    
        # Initial fetch
        fetch_and_display_tables(tables_to_show)

        root.bind("<Escape>", go_back)
        
        root.mainloop()
    


def stocksch():
   
        # Database Connection Configuration
        DB_CONFIG = {
            "host": "localhost",
            "user": "root",
            "password": "?",
            "database": "cmp"
        }
    
        def fetch_and_display_tables(table_names, name_filter=None):
            try:
                conn = pymysql.connect(**DB_CONFIG)
                cursor = conn.cursor()
    
                output = []
    
                for table_name in table_names:
                    query = f"SELECT * FROM `{table_name}`"
                    if name_filter:
                        query += f" WHERE NAME LIKE %s"
                        cursor.execute(query, (f"%{name_filter}%",))
                    else:
                        cursor.execute(query)
    
                    rows = cursor.fetchall()
                    columns = [desc[0] for desc in cursor.description]
    
                    output.append(f"\nTABLE: {table_name.upper()}\n")
    
                    if not rows:
                        output.append("No data found.\n")
                        continue
    
                    # Calculate column widths
                    col_widths = [max(len(str(col)), max(len(str(row[i])) for row in rows)) for i, col in enumerate(columns)]
                    line_sep = "+-" + "-+-".join("-" * width for width in col_widths) + "-+"
    
                    output.append(line_sep)
                    output.append("| " + " | ".join(f"{col.ljust(col_widths[i])}" for i, col in enumerate(columns)) + " |")
                    output.append(line_sep)
    
                    for row in rows:
                        output.append("| " + " | ".join(f"{str(row[i]).ljust(col_widths[i])}" for i in range(len(row))) + " |")
    
                    output.append(line_sep)
    
                # Show in GUI
                text_area.config(state=tk.NORMAL)
                text_area.delete(1.0, tk.END)
                text_area.insert(tk.END, "\n".join(output))
                text_area.config(state=tk.DISABLED)
    
                cursor.close()
                conn.close()
    
            except pymysql.Error as e:
                messagebox.showerror("Database Error", f"Failed to fetch data:\n{e}")
    
        # GUI Setup
        root = tk.Tk()
        root.title("SQL Multi-Table Viewer (Search by NAME)")
        root.geometry("1000x650")
    
        # Entry field for NAME
        entry_frame = tk.Frame(root)
        entry_frame.pack(pady=10)
    
        tk.Label(entry_frame, text="Enter NAME:").pack(side="left", padx=(10, 5))
        name_entry = tk.Entry(entry_frame)
        name_entry.pack(side="left", padx=5)
    
        def go_back(event):
            root.destroy()
    
        def on_fetch_click():
            name = name_entry.get().strip()
            if name:
                fetch_and_display_tables(tables_to_show, name)
            else:
                fetch_and_display_tables(tables_to_show)
    
        fetch_button = tk.Button(entry_frame, text="Fetch", command=on_fetch_click)
        fetch_button.pack(side="left", padx=10)
    
        # Frame for scrollbars
        frame = tk.Frame(root)
        frame.pack(fill="both", expand=True)
    
        # Text area with both scrollbars
        text_area = tk.Text(frame, font=("Courier", 12), wrap="none")
        text_area.pack(side="left", fill="both", expand=True)
    
        # Scrollbars
        scroll_y = tk.Scrollbar(frame, orient="vertical", command=text_area.yview)
        scroll_y.pack(side="right", fill="y")
    
        scroll_x = tk.Scrollbar(root, orient="horizontal", command=text_area.xview)
        scroll_x.pack(fill="x")
    
        text_area.config(yscrollcommand=scroll_y.set, xscrollcommand=scroll_x.set)
    
        # Tables to display
        tables_to_show = ["stock"]  # You can add more if needed
    
        # Initial fetch
        fetch_and_display_tables(tables_to_show)
    
        root.bind("<Escape>", go_back)
        root.mainloop()
    
def psch():

   
        # Database Connection Configuration
        DB_CONFIG = {
            "host": "localhost",
            "user": "root",
            "password": "?",
            "database": "cmp"
        }
    
        def fetch_and_display_tables(table_names, name_filter=None):
            try:
                conn = pymysql.connect(**DB_CONFIG)
                cursor = conn.cursor()
    
                output = []
    
                for table_name in table_names:
                    query = f"SELECT * FROM `{table_name}`"
                    if name_filter:
                        query += f" WHERE NAME LIKE %s"
                        cursor.execute(query, (f"%{name_filter}%",))
                    else:
                        cursor.execute(query)
    
                    rows = cursor.fetchall()
                    columns = [desc[0] for desc in cursor.description]
    
                    output.append(f"\nTABLE: {table_name.upper()}\n")
    
                    if not rows:
                        output.append("No data found.\n")
                        continue
    
                    # Calculate column widths
                    col_widths = [max(len(str(col)), max(len(str(row[i])) for row in rows)) for i, col in enumerate(columns)]
                    line_sep = "+-" + "-+-".join("-" * width for width in col_widths) + "-+"
    
                    output.append(line_sep)
                    output.append("| " + " | ".join(f"{col.ljust(col_widths[i])}" for i, col in enumerate(columns)) + " |")
                    output.append(line_sep)
    
                    for row in rows:
                        output.append("| " + " | ".join(f"{str(row[i]).ljust(col_widths[i])}" for i in range(len(row))) + " |")
    
                    output.append(line_sep)
    
                # Show in GUI
                text_area.config(state=tk.NORMAL)
                text_area.delete(1.0, tk.END)
                text_area.insert(tk.END, "\n".join(output))
                text_area.config(state=tk.DISABLED)
    
                cursor.close()
                conn.close()
    
            except pymysql.Error as e:
                messagebox.showerror("Database Error", f"Failed to fetch data:\n{e}")
    
        # GUI Setup
        root = tk.Tk()
        root.title("SQL Multi-Table Viewer (Search by NAME)")
        root.geometry("1000x650")
    
        # Entry field for NAME
        entry_frame = tk.Frame(root)
        entry_frame.pack(pady=10)
    
        tk.Label(entry_frame, text="Enter NAME:").pack(side="left", padx=(10, 5))
        name_entry = tk.Entry(entry_frame)
        name_entry.pack(side="left", padx=5)
    
        def go_back(event):
            root.destroy()
    
        def on_fetch_click():
            name = name_entry.get().strip()
            if name:
                fetch_and_display_tables(tables_to_show, name)
            else:
                fetch_and_display_tables(tables_to_show)
    
        fetch_button = tk.Button(entry_frame, text="Fetch", command=on_fetch_click)
        fetch_button.pack(side="left", padx=10)
    
        # Frame for scrollbars
        frame = tk.Frame(root)
        frame.pack(fill="both", expand=True)
    
        # Text area with both scrollbars
        text_area = tk.Text(frame, font=("Courier", 12), wrap="none")
        text_area.pack(side="left", fill="both", expand=True)
    
        # Scrollbars
        scroll_y = tk.Scrollbar(frame, orient="vertical", command=text_area.yview)
        scroll_y.pack(side="right", fill="y")
    
        scroll_x = tk.Scrollbar(root, orient="horizontal", command=text_area.xview)
        scroll_x.pack(fill="x")
    
        text_area.config(yscrollcommand=scroll_y.set, xscrollcommand=scroll_x.set)
    
        # Tables to display
        tables_to_show = ["p_table"]  # You can add more if needed
    
        # Initial fetch
        fetch_and_display_tables(tables_to_show)
    
        root.bind("<Escape>", go_back)
        root.mainloop()

def ssch():
   
        # Database Connection Configuration
        DB_CONFIG = {
            "host": "localhost",
            "user": "root",
            "password": "?",
            "database": "cmp"
        }
    
        def fetch_and_display_tables(table_names, name_filter=None):
            try:
                conn = pymysql.connect(**DB_CONFIG)
                cursor = conn.cursor()
    
                output = []
    
                for table_name in table_names:
                    query = f"SELECT * FROM `{table_name}`"
                    if name_filter:
                        query += f" WHERE NAME LIKE %s"
                        cursor.execute(query, (f"%{name_filter}%",))
                    else:
                        cursor.execute(query)
    
                    rows = cursor.fetchall()
                    columns = [desc[0] for desc in cursor.description]
    
                    output.append(f"\nTABLE: {table_name.upper()}\n")
    
                    if not rows:
                        output.append("No data found.\n")
                        continue
    
                    # Calculate column widths
                    col_widths = [max(len(str(col)), max(len(str(row[i])) for row in rows)) for i, col in enumerate(columns)]
                    line_sep = "+-" + "-+-".join("-" * width for width in col_widths) + "-+"
    
                    output.append(line_sep)
                    output.append("| " + " | ".join(f"{col.ljust(col_widths[i])}" for i, col in enumerate(columns)) + " |")
                    output.append(line_sep)
    
                    for row in rows:
                        output.append("| " + " | ".join(f"{str(row[i]).ljust(col_widths[i])}" for i in range(len(row))) + " |")
    
                    output.append(line_sep)
    
                # Show in GUI
                text_area.config(state=tk.NORMAL)
                text_area.delete(1.0, tk.END)
                text_area.insert(tk.END, "\n".join(output))
                text_area.config(state=tk.DISABLED)
    
                cursor.close()
                conn.close()
    
            except pymysql.Error as e:
                messagebox.showerror("Database Error", f"Failed to fetch data:\n{e}")
    
        # GUI Setup
        root = tk.Tk()
        root.title("SQL Multi-Table Viewer (Search by NAME)")
        root.geometry("1000x650")
    
        # Entry field for NAME
        entry_frame = tk.Frame(root)
        entry_frame.pack(pady=10)
    
        tk.Label(entry_frame, text="Enter NAME:").pack(side="left", padx=(10, 5))
        name_entry = tk.Entry(entry_frame)
        name_entry.pack(side="left", padx=5)

        
        def go_back(event):
            root.destroy()
    
        def on_fetch_click():
            name = name_entry.get().strip()
            if name:
                fetch_and_display_tables(tables_to_show, name)
            else:
                fetch_and_display_tables(tables_to_show)
        
        fetch_button = tk.Button(entry_frame, text="Fetch", command=on_fetch_click)
        fetch_button.pack(side="left", padx=10)
    
        # Frame for scrollbars
        frame = tk.Frame(root)
        frame.pack(fill="both", expand=True)
    
        # Text area with both scrollbars
        text_area = tk.Text(frame, font=("Courier", 12), wrap="none")
        text_area.pack(side="left", fill="both", expand=True)
    
        # Scrollbars
        scroll_y = tk.Scrollbar(frame, orient="vertical", command=text_area.yview)
        scroll_y.pack(side="right", fill="y")
    
        scroll_x = tk.Scrollbar(root, orient="horizontal", command=text_area.xview)
        scroll_x.pack(fill="x")
    
        text_area.config(yscrollcommand=scroll_y.set, xscrollcommand=scroll_x.set)
    
        # Tables to display
        tables_to_show = ["s_table"]  # You can add more if needed
    
        # Initial fetch
        fetch_and_display_tables(tables_to_show)

        root.bind("<Escape>", go_back)
        root.mainloop()


def csh():

        # Database Connection Configuration
        DB_CONFIG = {
            "host": "localhost",
            "user": "root",
            "password": "?",
            "database": "cmp"
        }
        def fetch_and_display_tables(table_names, order_id=None):
            try:
                conn = pymysql.connect(**DB_CONFIG)
                cursor = conn.cursor()
        
                output = []
        
                for table_name in table_names:
                    query = f"SELECT * FROM `{table_name}`"
                    if order_id:
                        query += f" WHERE ORDER_ID = %s"
                        cursor.execute(query, (order_id,))
                    else:
                        cursor.execute(query)
        
                    rows = cursor.fetchall()
                    columns = [desc[0] for desc in cursor.description]
        
                    output.append(f"\nTABLE: {table_name.upper()}\n")
        
                    if not rows:
                        output.append("No data found.\n")
                        continue
        
                    # Calculate column widths
                    col_widths = [max(len(str(col)), max(len(str(row[i])) for row in rows)) for i, col in enumerate(columns)]
                    line_sep = "+-" + "-+-".join("-" * width for width in col_widths) + "-+"
        
                    output.append(line_sep)
                    output.append("| " + " | ".join(f"{col.ljust(col_widths[i])}" for i, col in enumerate(columns)) + " |")
                    output.append(line_sep)
        
                    for row in rows:
                        output.append("| " + " | ".join(f"{str(row[i]).ljust(col_widths[i])}" for i in range(len(row))) + " |")
        
                    output.append(line_sep)
        
                # Show in GUI
                text_area.config(state=tk.NORMAL)
                text_area.delete(1.0, tk.END)
                text_area.insert(tk.END, "\n".join(output))
                text_area.config(state=tk.DISABLED)
        
                cursor.close()
                conn.close()
        
            except pymysql.Error as e:
                messagebox.showerror("Database Error", f"Failed to fetch data:\n{e}")
        
        # GUI Setup
        root = tk.Tk()
        root.title("SQL Multi-Table Viewer (CLI Style)")
        root.geometry("1000x650")
        
        # Entry field for ORDER_ID
        entry_frame = tk.Frame(root)
        entry_frame.pack(pady=10)
        
        tk.Label(entry_frame, text="Enter ORDER_ID:").pack(side="left", padx=(10, 5))
        order_id_entry = tk.Entry(entry_frame)
        order_id_entry.pack(side="left", padx=5)

        def go_back(event):
            root.destroy()
        
        def on_fetch_click():
            order_id = order_id_entry.get().strip()
            if order_id:
                fetch_and_display_tables(tables_to_show, order_id)
            else:
                fetch_and_display_tables(tables_to_show)
        
        fetch_button = tk.Button(entry_frame, text="Fetch", command=on_fetch_click)
        fetch_button.pack(side="left", padx=10)
        
        # Frame for scrollbars
        frame = tk.Frame(root)
        frame.pack(fill="both", expand=True)
        
        # Text area with both scrollbars
        text_area = tk.Text(frame, font=("Courier", 12), wrap="none")
        text_area.pack(side="left", fill="both", expand=True)
        
        # Vertical scrollbar
        scroll_y = tk.Scrollbar(frame, orient="vertical", command=text_area.yview)
        scroll_y.pack(side="right", fill="y")
        
        # Horizontal scrollbar
        scroll_x = tk.Scrollbar(root, orient="horizontal", command=text_area.xview)
        scroll_x.pack(fill="x")
        
        text_area.config(yscrollcommand=scroll_y.set, xscrollcommand=scroll_x.set)
        
        # Table names to display
        tables_to_show = ["cp"]  # Add more as needed
        
        # Initial fetch with no filter
        fetch_and_display_tables(tables_to_show)
        
        root.bind("<Escape>", go_back)
        
        root.mainloop()


    
def pasch():

   
        # Database Connection Configuration
        DB_CONFIG = {
            "host": "localhost",
            "user": "root",
            "password": "?",
            "database": "cmp"
        }
    
        def fetch_and_display_tables(table_names, name_filter=None):
            try:
                conn = pymysql.connect(**DB_CONFIG)
                cursor = conn.cursor()
    
                output = []
    
                for table_name in table_names:
                    query = f"SELECT * FROM `{table_name}`"
                    if name_filter:
                        query += f" WHERE NAME LIKE %s"
                        cursor.execute(query, (f"%{name_filter}%",))
                    else:
                        cursor.execute(query)
    
                    rows = cursor.fetchall()
                    columns = [desc[0] for desc in cursor.description]
    
                    output.append(f"\nTABLE: {table_name.upper()}\n")
    
                    if not rows:
                        output.append("No data found.\n")
                        continue
    
                    # Calculate column widths
                    col_widths = [max(len(str(col)), max(len(str(row[i])) for row in rows)) for i, col in enumerate(columns)]
                    line_sep = "+-" + "-+-".join("-" * width for width in col_widths) + "-+"
    
                    output.append(line_sep)
                    output.append("| " + " | ".join(f"{col.ljust(col_widths[i])}" for i, col in enumerate(columns)) + " |")
                    output.append(line_sep)
    
                    for row in rows:
                        output.append("| " + " | ".join(f"{str(row[i]).ljust(col_widths[i])}" for i in range(len(row))) + " |")
    
                    output.append(line_sep)
    
                # Show in GUI
                text_area.config(state=tk.NORMAL)
                text_area.delete(1.0, tk.END)
                text_area.insert(tk.END, "\n".join(output))
                text_area.config(state=tk.DISABLED)
    
                cursor.close()
                conn.close()
    
            except pymysql.Error as e:
                messagebox.showerror("Database Error", f"Failed to fetch data:\n{e}")
    
        # GUI Setup
        root = tk.Tk()
        root.title("SQL Multi-Table Viewer (Search by NAME)")
        root.geometry("1000x650")
    
        # Entry field for NAME
        entry_frame = tk.Frame(root)
        entry_frame.pack(pady=10)
    
        tk.Label(entry_frame, text="Enter NAME:").pack(side="left", padx=(10, 5))
        name_entry = tk.Entry(entry_frame)
        name_entry.pack(side="left", padx=5)

        
        def go_back(event):
            root.destroy()
    
        def on_fetch_click():
            name = name_entry.get().strip()
            if name:
                fetch_and_display_tables(tables_to_show, name)
            else:
                fetch_and_display_tables(tables_to_show)
        
        fetch_button = tk.Button(entry_frame, text="Fetch", command=on_fetch_click)
        fetch_button.pack(side="left", padx=10)
    
        # Frame for scrollbars
        frame = tk.Frame(root)
        frame.pack(fill="both", expand=True)
    
        # Text area with both scrollbars
        text_area = tk.Text(frame, font=("Courier", 12), wrap="none")
        text_area.pack(side="left", fill="both", expand=True)
    
        # Scrollbars
        scroll_y = tk.Scrollbar(frame, orient="vertical", command=text_area.yview)
        scroll_y.pack(side="right", fill="y")
    
        scroll_x = tk.Scrollbar(root, orient="horizontal", command=text_area.xview)
        scroll_x.pack(fill="x")
    
        text_area.config(yscrollcommand=scroll_y.set, xscrollcommand=scroll_x.set)
    
        # Tables to display
        tables_to_show = ["p_acc"]  # You can add more if needed
    
        # Initial fetch
        fetch_and_display_tables(tables_to_show)

        root.bind("<Escape>", go_back)
        root.mainloop()


def sasch():
        # Database Connection Configuration
        DB_CONFIG = {
            "host": "localhost",
            "user": "root",
            "password": "?",
            "database": "cmp"
        }
    
        def fetch_and_display_tables(table_names, name_filter=None):
            try:
                conn = pymysql.connect(**DB_CONFIG)
                cursor = conn.cursor()
    
                output = []
    
                for table_name in table_names:
                    query = f"SELECT * FROM `{table_name}`"
                    if name_filter:
                        query += f" WHERE NAME LIKE %s"
                        cursor.execute(query, (f"%{name_filter}%",))
                    else:
                        cursor.execute(query)
    
                    rows = cursor.fetchall()
                    columns = [desc[0] for desc in cursor.description]
    
                    output.append(f"\nTABLE: {table_name.upper()}\n")
    
                    if not rows:
                        output.append("No data found.\n")
                        continue
    
                    # Calculate column widths
                    col_widths = [max(len(str(col)), max(len(str(row[i])) for row in rows)) for i, col in enumerate(columns)]
                    line_sep = "+-" + "-+-".join("-" * width for width in col_widths) + "-+"
    
                    output.append(line_sep)
                    output.append("| " + " | ".join(f"{col.ljust(col_widths[i])}" for i, col in enumerate(columns)) + " |")
                    output.append(line_sep)
    
                    for row in rows:
                        output.append("| " + " | ".join(f"{str(row[i]).ljust(col_widths[i])}" for i in range(len(row))) + " |")
    
                    output.append(line_sep)
    
                # Show in GUI
                text_area.config(state=tk.NORMAL)
                text_area.delete(1.0, tk.END)
                text_area.insert(tk.END, "\n".join(output))
                text_area.config(state=tk.DISABLED)
    
                cursor.close()
                conn.close()
    
            except pymysql.Error as e:
                messagebox.showerror("Database Error", f"Failed to fetch data:\n{e}")
    
        # GUI Setup
        root = tk.Tk()
        root.title("SQL Multi-Table Viewer (Search by NAME)")
        root.geometry("1000x650")
    
        # Entry field for NAME
        entry_frame = tk.Frame(root)
        entry_frame.pack(pady=10)
    
        tk.Label(entry_frame, text="Enter NAME:").pack(side="left", padx=(10, 5))
        name_entry = tk.Entry(entry_frame)
        name_entry.pack(side="left", padx=5)

        
        def go_back(event):
            root.destroy()
    
        def on_fetch_click():
            name = name_entry.get().strip()
            if name:
                fetch_and_display_tables(tables_to_show, name)
            else:
                fetch_and_display_tables(tables_to_show)
        
        fetch_button = tk.Button(entry_frame, text="Fetch", command=on_fetch_click)
        fetch_button.pack(side="left", padx=10)
    
        # Frame for scrollbars
        frame = tk.Frame(root)
        frame.pack(fill="both", expand=True)
    
        # Text area with both scrollbars
        text_area = tk.Text(frame, font=("Courier", 12), wrap="none")
        text_area.pack(side="left", fill="both", expand=True)
    
        # Scrollbars
        scroll_y = tk.Scrollbar(frame, orient="vertical", command=text_area.yview)
        scroll_y.pack(side="right", fill="y")
    
        scroll_x = tk.Scrollbar(root, orient="horizontal", command=text_area.xview)
        scroll_x.pack(fill="x")
    
        text_area.config(yscrollcommand=scroll_y.set, xscrollcommand=scroll_x.set)
    
        # Tables to display
        tables_to_show = ["s_acc"]  # You can add more if needed
    
        # Initial fetch
        fetch_and_display_tables(tables_to_show)

        root.bind("<Escape>", go_back)
        root.mainloop()



def expsch():
   
        # Database Connection Configuration
        DB_CONFIG = {
            "host": "localhost",
            "user": "root",
            "password": "?",
            "database": "cmp"
        }
    
        def fetch_and_display_tables(table_names, name_filter=None):
            try:
                conn = pymysql.connect(**DB_CONFIG)
                cursor = conn.cursor()
    
                output = []
    
                for table_name in table_names:
                    query = f"SELECT * FROM `{table_name}`"
                    if name_filter:
                        query += f" WHERE NAME LIKE %s"
                        cursor.execute(query, (f"%{name_filter}%",))
                    else:
                        cursor.execute(query)
    
                    rows = cursor.fetchall()
                    columns = [desc[0] for desc in cursor.description]
    
                    output.append(f"\nTABLE: {table_name.upper()}\n")
    
                    if not rows:
                        output.append("No data found.\n")
                        continue
    
                    # Calculate column widths
                    col_widths = [max(len(str(col)), max(len(str(row[i])) for row in rows)) for i, col in enumerate(columns)]
                    line_sep = "+-" + "-+-".join("-" * width for width in col_widths) + "-+"
    
                    output.append(line_sep)
                    output.append("| " + " | ".join(f"{col.ljust(col_widths[i])}" for i, col in enumerate(columns)) + " |")
                    output.append(line_sep)
    
                    for row in rows:
                        output.append("| " + " | ".join(f"{str(row[i]).ljust(col_widths[i])}" for i in range(len(row))) + " |")
    
                    output.append(line_sep)
    
                # Show in GUI
                text_area.config(state=tk.NORMAL)
                text_area.delete(1.0, tk.END)
                text_area.insert(tk.END, "\n".join(output))
                text_area.config(state=tk.DISABLED)
    
                cursor.close()
                conn.close()
    
            except pymysql.Error as e:
                messagebox.showerror("Database Error", f"Failed to fetch data:\n{e}")
    
        # GUI Setup
        root = tk.Tk()
        root.title("SQL Multi-Table Viewer (Search by NAME)")
        root.geometry("1000x650")
    
        # Entry field for NAME
        entry_frame = tk.Frame(root)
        entry_frame.pack(pady=10)
    
        tk.Label(entry_frame, text="Enter NAME:").pack(side="left", padx=(10, 5))
        name_entry = tk.Entry(entry_frame)
        name_entry.pack(side="left", padx=5)

        
        def go_back(event):
            root.destroy()
    
        def on_fetch_click():
            name = name_entry.get().strip()
            if name:
                fetch_and_display_tables(tables_to_show, name)
            else:
                fetch_and_display_tables(tables_to_show)
        
        fetch_button = tk.Button(entry_frame, text="Fetch", command=on_fetch_click)
        fetch_button.pack(side="left", padx=10)
    
        # Frame for scrollbars
        frame = tk.Frame(root)
        frame.pack(fill="both", expand=True)
    
        # Text area with both scrollbars
        text_area = tk.Text(frame, font=("Courier", 12), wrap="none")
        text_area.pack(side="left", fill="both", expand=True)
    
        # Scrollbars
        scroll_y = tk.Scrollbar(frame, orient="vertical", command=text_area.yview)
        scroll_y.pack(side="right", fill="y")
    
        scroll_x = tk.Scrollbar(root, orient="horizontal", command=text_area.xview)
        scroll_x.pack(fill="x")
    
        text_area.config(yscrollcommand=scroll_y.set, xscrollcommand=scroll_x.set)
    
        # Tables to display
        tables_to_show = ["exp"]  # You can add more if needed
    
        # Initial fetch
        fetch_and_display_tables(tables_to_show)

        root.bind("<Escape>", go_back)
        root.mainloop()


def repairsch():
   
        # Database Connection Configuration
        DB_CONFIG = {
            "host": "localhost",
            "user": "root",
            "password": "?",
            "database": "cmp"
        }
    
        def fetch_and_display_tables(table_names, name_filter=None):
            try:
                conn = pymysql.connect(**DB_CONFIG)
                cursor = conn.cursor()
    
                output = []
    
                for table_name in table_names:
                    query = f"SELECT * FROM `{table_name}`"
                    if name_filter:
                        query += f" WHERE NAME LIKE %s"
                        cursor.execute(query, (f"%{name_filter}%",))
                    else:
                        cursor.execute(query)
    
                    rows = cursor.fetchall()
                    columns = [desc[0] for desc in cursor.description]
    
                    output.append(f"\nTABLE: {table_name.upper()}\n")
    
                    if not rows:
                        output.append("No data found.\n")
                        continue
    
                    # Calculate column widths
                    col_widths = [max(len(str(col)), max(len(str(row[i])) for row in rows)) for i, col in enumerate(columns)]
                    line_sep = "+-" + "-+-".join("-" * width for width in col_widths) + "-+"
    
                    output.append(line_sep)
                    output.append("| " + " | ".join(f"{col.ljust(col_widths[i])}" for i, col in enumerate(columns)) + " |")
                    output.append(line_sep)
    
                    for row in rows:
                        output.append("| " + " | ".join(f"{str(row[i]).ljust(col_widths[i])}" for i in range(len(row))) + " |")
    
                    output.append(line_sep)
    
                # Show in GUI
                text_area.config(state=tk.NORMAL)
                text_area.delete(1.0, tk.END)
                text_area.insert(tk.END, "\n".join(output))
                text_area.config(state=tk.DISABLED)
    
                cursor.close()
                conn.close()
    
            except pymysql.Error as e:
                messagebox.showerror("Database Error", f"Failed to fetch data:\n{e}")
    
        # GUI Setup
        root = tk.Tk()
        root.title("SQL Multi-Table Viewer (Search by NAME)")
        root.geometry("1000x650")
    
        # Entry field for NAME
        entry_frame = tk.Frame(root)
        entry_frame.pack(pady=10)
    
        tk.Label(entry_frame, text="Enter NAME:").pack(side="left", padx=(10, 5))
        name_entry = tk.Entry(entry_frame)
        name_entry.pack(side="left", padx=5)

        
        def go_back(event):
            root.destroy()
    
        def on_fetch_click():
            name = name_entry.get().strip()
            if name:
                fetch_and_display_tables(tables_to_show, name)
            else:
                fetch_and_display_tables(tables_to_show)
        
        fetch_button = tk.Button(entry_frame, text="Fetch", command=on_fetch_click)
        fetch_button.pack(side="left", padx=10)
    
        # Frame for scrollbars
        frame = tk.Frame(root)
        frame.pack(fill="both", expand=True)
    
        # Text area with both scrollbars
        text_area = tk.Text(frame, font=("Courier", 12), wrap="none")
        text_area.pack(side="left", fill="both", expand=True)
    
        # Scrollbars
        scroll_y = tk.Scrollbar(frame, orient="vertical", command=text_area.yview)
        scroll_y.pack(side="right", fill="y")
    
        scroll_x = tk.Scrollbar(root, orient="horizontal", command=text_area.xview)
        scroll_x.pack(fill="x")
    
        text_area.config(yscrollcommand=scroll_y.set, xscrollcommand=scroll_x.set)
    
        # Tables to display
        tables_to_show = ["repair"]  # You can add more if needed
    
        # Initial fetch
        fetch_and_display_tables(tables_to_show)

        root.bind("<Escape>", go_back)
        root.mainloop()

def salsch():
   
        # Database Connection Configuration
        DB_CONFIG = {
            "host": "localhost",
            "user": "root",
            "password": "?",
            "database": "cmp"
        }
    
        def fetch_and_display_tables(table_names, name_filter=None):
            try:
                conn = pymysql.connect(**DB_CONFIG)
                cursor = conn.cursor()
    
                output = []
    
                for table_name in table_names:
                    query = f"SELECT * FROM `{table_name}`"
                    if name_filter:
                        query += f" WHERE NAME LIKE %s"
                        cursor.execute(query, (f"%{name_filter}%",))
                    else:
                        cursor.execute(query)
    
                    rows = cursor.fetchall()
                    columns = [desc[0] for desc in cursor.description]
    
                    output.append(f"\nTABLE: {table_name.upper()}\n")
    
                    if not rows:
                        output.append("No data found.\n")
                        continue
    
                    # Calculate column widths
                    col_widths = [max(len(str(col)), max(len(str(row[i])) for row in rows)) for i, col in enumerate(columns)]
                    line_sep = "+-" + "-+-".join("-" * width for width in col_widths) + "-+"
    
                    output.append(line_sep)
                    output.append("| " + " | ".join(f"{col.ljust(col_widths[i])}" for i, col in enumerate(columns)) + " |")
                    output.append(line_sep)
    
                    for row in rows:
                        output.append("| " + " | ".join(f"{str(row[i]).ljust(col_widths[i])}" for i in range(len(row))) + " |")
    
                    output.append(line_sep)
    
                # Show in GUI
                text_area.config(state=tk.NORMAL)
                text_area.delete(1.0, tk.END)
                text_area.insert(tk.END, "\n".join(output))
                text_area.config(state=tk.DISABLED)
    
                cursor.close()
                conn.close()
    
            except pymysql.Error as e:
                messagebox.showerror("Database Error", f"Failed to fetch data:\n{e}")
    
        # GUI Setup
        root = tk.Tk()
        root.title("SQL Multi-Table Viewer (Search by NAME)")
        root.geometry("1000x650")
    
        # Entry field for NAME
        entry_frame = tk.Frame(root)
        entry_frame.pack(pady=10)
    
        tk.Label(entry_frame, text="Enter NAME:").pack(side="left", padx=(10, 5))
        name_entry = tk.Entry(entry_frame)
        name_entry.pack(side="left", padx=5)

        
        def go_back(event):
            root.destroy()
    
        def on_fetch_click():
            name = name_entry.get().strip()
            if name:
                fetch_and_display_tables(tables_to_show, name)
            else:
                fetch_and_display_tables(tables_to_show)
        
        fetch_button = tk.Button(entry_frame, text="Fetch", command=on_fetch_click)
        fetch_button.pack(side="left", padx=10)
    
        # Frame for scrollbars
        frame = tk.Frame(root)
        frame.pack(fill="both", expand=True)
    
        # Text area with both scrollbars
        text_area = tk.Text(frame, font=("Courier", 12), wrap="none")
        text_area.pack(side="left", fill="both", expand=True)
    
        # Scrollbars
        scroll_y = tk.Scrollbar(frame, orient="vertical", command=text_area.yview)
        scroll_y.pack(side="right", fill="y")
    
        scroll_x = tk.Scrollbar(root, orient="horizontal", command=text_area.xview)
        scroll_x.pack(fill="x")
    
        text_area.config(yscrollcommand=scroll_y.set, xscrollcommand=scroll_x.set)
    
        # Tables to display
        tables_to_show = ["sal"]  # You can add more if needed
    
        # Initial fetch
        fetch_and_display_tables(tables_to_show)

        root.bind("<Escape>", go_back)
        root.mainloop()


def partsch():
   
        # Database Connection Configuration
        DB_CONFIG = {
            "host": "localhost",
            "user": "root",
            "password": "?",
            "database": "cmp"
        }
    
        def fetch_and_display_tables(table_names, name_filter=None):
            try:
                conn = pymysql.connect(**DB_CONFIG)
                cursor = conn.cursor()
    
                output = []
    
                for table_name in table_names:
                    query = f"SELECT * FROM `{table_name}`"
                    if name_filter:
                        query += f" WHERE NAME LIKE %s"
                        cursor.execute(query, (f"%{name_filter}%",))
                    else:
                        cursor.execute(query)
    
                    rows = cursor.fetchall()
                    columns = [desc[0] for desc in cursor.description]
    
                    output.append(f"\nTABLE: {table_name.upper()}\n")
    
                    if not rows:
                        output.append("No data found.\n")
                        continue
    
                    # Calculate column widths
                    col_widths = [max(len(str(col)), max(len(str(row[i])) for row in rows)) for i, col in enumerate(columns)]
                    line_sep = "+-" + "-+-".join("-" * width for width in col_widths) + "-+"
    
                    output.append(line_sep)
                    output.append("| " + " | ".join(f"{col.ljust(col_widths[i])}" for i, col in enumerate(columns)) + " |")
                    output.append(line_sep)
    
                    for row in rows:
                        output.append("| " + " | ".join(f"{str(row[i]).ljust(col_widths[i])}" for i in range(len(row))) + " |")
    
                    output.append(line_sep)
    
                # Show in GUI
                text_area.config(state=tk.NORMAL)
                text_area.delete(1.0, tk.END)
                text_area.insert(tk.END, "\n".join(output))
                text_area.config(state=tk.DISABLED)
    
                cursor.close()
                conn.close()
    
            except pymysql.Error as e:
                messagebox.showerror("Database Error", f"Failed to fetch data:\n{e}")
    
        # GUI Setup
        root = tk.Tk()
        root.title("SQL Multi-Table Viewer (Search by NAME)")
        root.geometry("1000x650")
    
        # Entry field for NAME
        entry_frame = tk.Frame(root)
        entry_frame.pack(pady=10)
    
        tk.Label(entry_frame, text="Enter NAME:").pack(side="left", padx=(10, 5))
        name_entry = tk.Entry(entry_frame)
        name_entry.pack(side="left", padx=5)

        
        def go_back(event):
            root.destroy()
    
        def on_fetch_click():
            name = name_entry.get().strip()
            if name:
                fetch_and_display_tables(tables_to_show, name)
            else:
                fetch_and_display_tables(tables_to_show)
        
        fetch_button = tk.Button(entry_frame, text="Fetch", command=on_fetch_click)
        fetch_button.pack(side="left", padx=10)
    
        # Frame for scrollbars
        frame = tk.Frame(root)
        frame.pack(fill="both", expand=True)
    
        # Text area with both scrollbars
        text_area = tk.Text(frame, font=("Courier", 12), wrap="none")
        text_area.pack(side="left", fill="both", expand=True)
    
        # Scrollbars
        scroll_y = tk.Scrollbar(frame, orient="vertical", command=text_area.yview)
        scroll_y.pack(side="right", fill="y")
    
        scroll_x = tk.Scrollbar(root, orient="horizontal", command=text_area.xview)
        scroll_x.pack(fill="x")
    
        text_area.config(yscrollcommand=scroll_y.set, xscrollcommand=scroll_x.set)
    
        # Tables to display
        tables_to_show = ["parts"]  # You can add more if needed
    
        # Initial fetch
        fetch_and_display_tables(tables_to_show)

        root.bind("<Escape>", go_back)
        root.mainloop()

def lucksch():
   
        # Database Connection Configuration
        DB_CONFIG = {
            "host": "localhost",
            "user": "root",
            "password": "?",
            "database": "cmp"
        }
    
        def fetch_and_display_tables(table_names, name_filter=None):
            try:
                conn = pymysql.connect(**DB_CONFIG)
                cursor = conn.cursor()
    
                output = []
    
                for table_name in table_names:
                    query = f"SELECT * FROM `{table_name}` WHERE NAME LIKE '%LUCKNOW%'"
                    cursor.execute(query)
    
                    rows = cursor.fetchall()
                    columns = [desc[0] for desc in cursor.description]
    
                    output.append(f"\nTABLE: {table_name.upper()}\n")
    
                    if not rows:
                        output.append("No data found.\n")
                        continue
    
                    # Calculate column widths
                    col_widths = [max(len(str(col)), max(len(str(row[i])) for row in rows)) for i, col in enumerate(columns)]
                    line_sep = "+-" + "-+-".join("-" * width for width in col_widths) + "-+"
    
                    output.append(line_sep)
                    output.append("| " + " | ".join(f"{col.ljust(col_widths[i])}" for i, col in enumerate(columns)) + " |")
                    output.append(line_sep)
    
                    for row in rows:
                        output.append("| " + " | ".join(f"{str(row[i]).ljust(col_widths[i])}" for i in range(len(row))) + " |")
    
                    output.append(line_sep)
    
                # Show in GUI
                text_area.config(state=tk.NORMAL)
                text_area.delete(1.0, tk.END)
                text_area.insert(tk.END, "\n".join(output))
                text_area.config(state=tk.DISABLED)
    
                cursor.close()
                conn.close()
    
            except pymysql.Error as e:
                messagebox.showerror("Database Error", f"Failed to fetch data:\n{e}")
    
        # GUI Setup
        root = tk.Tk()
        root.title("SQL Multi-Table Viewer (Search by NAME)")
        root.geometry("1000x650")
    
        # Entry field for NAME
        entry_frame = tk.Frame(root)
        entry_frame.pack(pady=10)

        
        def go_back(event):
            root.destroy()
    
        # Frame for scrollbars
        frame = tk.Frame(root)
        frame.pack(fill="both", expand=True)
    
        # Text area with both scrollbars
        text_area = tk.Text(frame, font=("Courier", 12), wrap="none")
        text_area.pack(side="left", fill="both", expand=True)
    
        # Scrollbars
        scroll_y = tk.Scrollbar(frame, orient="vertical", command=text_area.yview)
        scroll_y.pack(side="right", fill="y")
    
        scroll_x = tk.Scrollbar(root, orient="horizontal", command=text_area.xview)
        scroll_x.pack(fill="x")
    
        text_area.config(yscrollcommand=scroll_y.set, xscrollcommand=scroll_x.set)
    
        # Tables to display
        tables_to_show = ["p_table"]  # You can add more if needed
    
        # Initial fetch
        fetch_and_display_tables(tables_to_show)

        root.bind("<Escape>", go_back)
        root.mainloop()


def upd():
    DB_CONFIG = {
        "host": "localhost",
        "user": "root",
        "password": "?",  # your MySQL password here
        "database": "cmp"
    }

    def update_data(event=None):
        table = TABLE.get().strip()
        column = COLUMN.get().strip()
        value = VALUE.get().strip()
        order_id = ORDER_ID.get().strip()

        if not (table and column and value and order_id):
            messagebox.showwarning("Missing Info", "Please fill all fields!")
            return

        try:
            conn = pymysql.connect(**DB_CONFIG)
            cursor = conn.cursor()

            # Run update query
            query = f"UPDATE `{table}` SET `{column}` = %s WHERE ORDER_ID = %s"
            cursor.execute(query, (value, order_id))
            conn.commit()

            fetch_data()

            cursor.close()
            conn.close()

        except pymysql.Error as e:
            messagebox.showerror("Database Error", f"Failed to update data:\n{e}")

    def fetch_data():
        table = TABLE.get().strip()
        order_id = ORDER_ID.get().strip()

        if not (table and order_id):
            messagebox.showwarning("Missing Info", "Enter Table and ORDER_ID to fetch data.")
            return

        try:
            conn = pymysql.connect(**DB_CONFIG)
            cursor = conn.cursor()

            # Fetch data
            cursor.execute(f"SELECT * FROM `{table}` WHERE ORDER_ID = %s", (order_id,))
            rows = cursor.fetchall()
            columns = [desc[0] for desc in cursor.description]

            tree.delete(*tree.get_children())
            tree["columns"] = columns

            for col in columns:
                tree.heading(col, text=col, anchor="center")
                tree.column(col, anchor="center", width=150)

            for row in rows:
                tree.insert("", tk.END, values=row)

            cursor.close()
            conn.close()

        except pymysql.Error as e:
            messagebox.showerror("Database Error", f"Failed to fetch data:\n{e}")

    def exit_program(event=None):
        root.destroy()

    # GUI Setup
    root = tk.Tk()
    root.title("Update Table Entry")
    root.geometry("900x500")
    root.configure(bg="#2C2F33")

    main_frame = tk.Frame(root, bg="#2C2F33")
    main_frame.pack(pady=10)

    # Fields
    fields = [("ORDER_ID", "ORDER_ID"), ("Table Name", "TABLE"), ("Column Name", "COLUMN"), ("New Value", "VALUE")]
    widgets = {}

    for idx, (label_text, var_name) in enumerate(fields):
        tk.Label(main_frame, text=f"{label_text}:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=idx, column=0, padx=10, pady=5, sticky="e")
        entry = tk.Entry(main_frame, font=("Arial", 14), width=30)
        entry.grid(row=idx, column=1, padx=10, pady=5)
        widgets[var_name] = entry

    ORDER_ID = widgets["ORDER_ID"]
    TABLE = widgets["TABLE"]
    COLUMN = widgets["COLUMN"]
    VALUE = widgets["VALUE"]
    

    # Buttons
    btn_update = tk.Button(main_frame, text="Update Data", command=update_data, font=("Arial", 13), bg="#7289DA", fg="white", width=20)
    btn_update.grid(row=5, column=0, columnspan=2, pady=5)

    btn_fetch = tk.Button(main_frame, text="Fetch Data", command=fetch_data, font=("Arial", 13), bg="#4CAF50", fg="white", width=20)
    btn_fetch.grid(row=6, column=0, columnspan=2, pady=5)

    # Treeview
    frame = tk.Frame(root)
    frame.pack(expand=True, fill="both", padx=10, pady=5)

    tree = ttk.Treeview(frame, show="headings")
    tree.pack(expand=True, fill="both", side="left")

    scroll_y = ttk.Scrollbar(frame, orient="vertical", command=tree.yview)
    scroll_y.pack(side="right", fill="y")
    tree.configure(yscrollcommand=scroll_y.set)

    # Styling
    style = ttk.Style()
    style.configure("Treeview", font=("Courier", 13), rowheight=27)
    style.configure("Treeview.Heading", font=("Courier", 12, "bold"), background="red", foreground="black")

    # Bindings
    root.bind("<Return>", update_data)
    root.bind("<Escape>", exit_program)
    TABLE.focus()

    root.mainloop()


def dele():
    DB_CONFIG = {
        "host": "localhost",
        "user": "root",
        "password": "?",  # change as needed
        "database": "cmp"
    }

    def del_data(event=None):
        table = TABLE.get().strip()
        order_id = ORDER_ID.get().strip()

        if not (table  and order_id):
            messagebox.showwarning("Missing Info", "Please fill all fields!")
            return

        try:
            conn = pymysql.connect(**DB_CONFIG)
            cursor = conn.cursor()

            # Safe dynamic query using placeholders (column/table names can't be parameterized)
            query = f"DELETE FROM `{table}`  WHERE ORDER_ID = %s"
            cursor.execute(query, (order_id))
            conn.commit()

            fetch_data()

            cursor.close()
            conn.close()

        except pymysql.Error as e:
            messagebox.showerror("Database Error", f"Failed to update data:\n{e}")

    def fetch_data():
        order_id = ORDER_ID.get().strip()
        table = TABLE.get().strip()

        if not (table and order_id):
            messagebox.showwarning("Missing Info", "Enter Table and ORDER_ID to fetch data.")
            return

        try:
            conn = pymysql.connect(**DB_CONFIG)
            cursor = conn.cursor()

            cursor.execute(f"SELECT * FROM `{table}` WHERE ORDER_ID = %s", (order_id,))
            rows = cursor.fetchall()
            columns = [desc[0] for desc in cursor.description]

            tree.delete(*tree.get_children())
            tree["columns"] = columns

            for col in columns:
                tree.heading(col, text=col, anchor="center")
                tree.column(col, anchor="center", width=150)

            for row in rows:
                tree.insert("", tk.END, values=row)

            cursor.close()
            conn.close()

        except pymysql.Error as e:
            messagebox.showerror("Database Error", f"Failed to fetch data:\n{e}")

    def exit_program(event=None):
        root.destroy()

    # GUI Setup
    root = tk.Tk()
    root.title("Update Table Entry")
    root.geometry("850x500")
    root.configure(bg="#2C2F33")

    main_frame = tk.Frame(root, bg="#2C2F33")
    main_frame.pack(pady=10)

    # Fields
    fields = [("Table Name", "TABLE"), ("ORDER_ID", "ORDER_ID")]
    widgets = {}

    for idx, (label_text, var_name) in enumerate(fields):
        tk.Label(main_frame, text=f"{label_text}:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=idx, column=0, padx=10, pady=5, sticky="e")
        entry = tk.Entry(main_frame, font=("Arial", 14), width=30)
        entry.grid(row=idx, column=1, padx=10, pady=5)
        widgets[var_name] = entry

    TABLE = widgets["TABLE"]
    ORDER_ID = widgets["ORDER_ID"]

    btn_update = tk.Button(main_frame, text="DELETE Data", command=del_data, font=("Arial", 14), bg="#7289DA", fg="white", width=20)
    btn_update.grid(row=5, column=1, pady=10)

    # Treeview to show result
    frame = tk.Frame(root)
    frame.pack(expand=True, fill="both", padx=10, pady=5)

    tree = ttk.Treeview(frame, show="headings")
    tree.pack(expand=True, fill="both", side="left")

    scroll_y = ttk.Scrollbar(frame, orient="vertical", command=tree.yview)
    scroll_y.pack(side="right", fill="y")
    tree.configure(yscrollcommand=scroll_y.set)

    # Bindings
    root.bind("<Return>", del_data)
    root.bind("<Escape>", exit_program)
    TABLE.focus()

    root.mainloop()



def pending():
    def open_script(script_name):
        try:
            subprocess.Popen(["python", script_name])  # Run script in a new process
        except Exception as e:
            messagebox.showerror("Error", f"Failed to open {script_name}\n{e}")

    # Functions for each button
    def show(): pen_show()
    def pentry(): pen_entry()

    # Create main window
    entry_window = tk.Toplevel()
    entry_window.title("Phone Pending Options")
    entry_window.geometry("1400x800")

    # Load and store background image
    entry_window.bg_image = Image.open("3.jpg")
    entry_window.bg_image = entry_window.bg_image.resize((1400, 800), Image.Resampling.LANCZOS) #1400,800
    entry_window.bg_photo = ImageTk.PhotoImage(entry_window.bg_image)

    # Create Canvas and place background image
    canvas = tk.Canvas(entry_window, width=1400, height=800)
    canvas.pack(fill="both", expand=True)
    canvas.create_image(0, 0, image=entry_window.bg_photo, anchor="nw")

    # Label
    label = tk.Label(entry_window, text="PENDING OPTIONS", font=("Terminus", 28, "bold"), fg="white", bg="black")
    canvas.create_window(670, 100, window=label)

    # Button styling
    button_style = {
        "font": ("Terminus", 18, "bold"),
        "bg": "#999999",
        "fg": "black",
        "activebackground": "#393E46",
        "activeforeground": "white",
        "bd": 2,
        "relief": "ridge",
        "width": 25
    }

    # List to store buttons
    buttons = []
    button_functions = [show, pentry]
    button_positions = [200, 250]

    # Track selected button
    selected_index = [0]  # Use a list to modify inside functions

    def highlight_button():
        """Highlights the selected button and resets others."""
        for i, btn in enumerate(buttons):
            if i == selected_index[0]:
                btn.config(bg="#040404", fg="grey")  # Highlighted button
            else:
                btn.config(bg="#999999", fg="black")  # Normal button

    def move_selection(event):
        """Move selection up/down using arrow keys."""
        if event.keysym == "Up":
            selected_index[0] = (selected_index[0] - 1) % len(buttons)  # Move up
        elif event.keysym == "Down":
            selected_index[0] = (selected_index[0] + 1) % len(buttons)  # Move down
        highlight_button()

    def select_button(event):
        """Trigger the selected button when Enter is pressed."""
        button_functions[selected_index[0]]()  # Run the selected function
    def go_back(event):
        entry_window.destroy()
    # Create buttons and place them on canvas
    for text, command, y_pos in zip(
        ["1) SHOW", "2) ENTRY"],
        button_functions, button_positions
    ):
        btn = tk.Button(entry_window, text=text, command=command, **button_style)
        canvas.create_window(670, y_pos, window=btn)
        buttons.append(btn)  # Store button in list
    
    # Highlight the first button initially
    highlight_button()

    # Bind keys
    entry_window.bind("<Up>", move_selection)
    entry_window.bind("<Down>", move_selection)
    entry_window.bind("<Return>", select_button)
    entry_window.bind("<Escape>", go_back)

    # Run GUI
    entry_window.mainloop()


def pen_show():
# Database Connection Configuration
        DB_CONFIG = {
            "host": "localhost",
            "user": "root",
            "password": "?",
            "database": "cmp"
        }
        def fetch_and_display_tables(table_names, order_id=None):
            try:
                conn = pymysql.connect(**DB_CONFIG)
                cursor = conn.cursor()
        
                output = []
        
                for table_name in table_names:
                    query = f"SELECT * FROM `{table_name}`"
                    if order_id:
                        query += f" WHERE ORDER_ID = %s"
                        cursor.execute(query, (order_id,))
                    else:
                        cursor.execute(query)
        
                    rows = cursor.fetchall()
                    columns = [desc[0] for desc in cursor.description]
        
                    output.append(f"\nTABLE: {table_name.upper()}\n")
        
                    if not rows:
                        output.append("No data found.\n")
                        continue
        
                    # Calculate column widths
                    col_widths = [max(len(str(col)), max(len(str(row[i])) for row in rows)) for i, col in enumerate(columns)]
                    line_sep = "+-" + "-+-".join("-" * width for width in col_widths) + "-+"
        
                    output.append(line_sep)
                    output.append("| " + " | ".join(f"{col.ljust(col_widths[i])}" for i, col in enumerate(columns)) + " |")
                    output.append(line_sep)
        
                    for row in rows:
                        output.append("| " + " | ".join(f"{str(row[i]).ljust(col_widths[i])}" for i in range(len(row))) + " |")
        
                    output.append(line_sep)
        
                # Show in GUI
                text_area.config(state=tk.NORMAL)
                text_area.delete(1.0, tk.END)
                text_area.insert(tk.END, "\n".join(output))
                text_area.config(state=tk.DISABLED)
        
                cursor.close()
                conn.close()
        
            except pymysql.Error as e:
                messagebox.showerror("Database Error", f"Failed to fetch data:\n{e}")
        
        # GUI Setup
        root = tk.Tk()
        root.title("SQL Multi-Table Viewer (CLI Style)")
        root.geometry("1000x650")
        
        # Entry field for ORDER_ID
        entry_frame = tk.Frame(root)
        entry_frame.pack(pady=10)
        
        tk.Label(entry_frame, text="Enter ORDER_ID:").pack(side="left", padx=(10, 5))
        order_id_entry = tk.Entry(entry_frame)
        order_id_entry.pack(side="left", padx=5)

        def go_back(event):
            root.destroy()
        
        def on_fetch_click():
            order_id = order_id_entry.get().strip()
            if order_id:
                fetch_and_display_tables(tables_to_show, order_id)
            else:
                fetch_and_display_tables(tables_to_show)
        
        fetch_button = tk.Button(entry_frame, text="Fetch", command=on_fetch_click)
        fetch_button.pack(side="left", padx=10)
        
        # Frame for scrollbars
        frame = tk.Frame(root)
        frame.pack(fill="both", expand=True)
        
        # Text area with both scrollbars
        text_area = tk.Text(frame, font=("Courier", 12), wrap="none")
        text_area.pack(side="left", fill="both", expand=True)
        
        # Vertical scrollbar
        scroll_y = tk.Scrollbar(frame, orient="vertical", command=text_area.yview)
        scroll_y.pack(side="right", fill="y")
        
        # Horizontal scrollbar
        scroll_x = tk.Scrollbar(root, orient="horizontal", command=text_area.xview)
        scroll_x.pack(fill="x")
        
        text_area.config(yscrollcommand=scroll_y.set, xscrollcommand=scroll_x.set)
        
        # Table names to display
        tables_to_show = ["pending",  "s_table"]  # Add more as needed
        
        # Initial fetch with no filter
        fetch_and_display_tables(tables_to_show)
        
        root.bind("<Escape>", go_back)
        
        root.mainloop()


def pen_entry():
    
    # Database Configuration
    DB_CONFIG = {
        "host": "localhost",
        "user": "root",
        "password": "?",  # Change this to your MySQL password
        "database": "cmp"
    }
    
    def insert_data(event=None):
        """Insert data into stock table and show the inserted row."""
        order_id = ORDER_ID.get().strip()
        name = NAME.get().strip()
        pending = PEN.get().strip()
        
        if not (order_id and name and pending):
            messagebox.showwarning("Warning", "All fields are required!")
            return
    
        try:

            conn = pymysql.connect(**DB_CONFIG)
            cursor = conn.cursor()
    
            # Insert data
            query = "INSERT INTO pending (ORDER_ID, NAME, PENDING) VALUES (%s, %s, %s)"
            cursor.execute(query, (order_id, name, pending))
            conn.commit()
    
            # Fetch only the inserted row
            cursor.execute("SELECT * FROM pending WHERE ORDER_ID = %s", (order_id,))
            row = cursor.fetchone()
            columns = [desc[0] for desc in cursor.description]

                
            # Clear previous data
            tree.delete(*tree.get_children())
            tree["columns"] = columns
    
            # Set up column headers
            for col in columns:
                tree.heading(col, text=col, anchor="center")
                tree.column(col, anchor="center", stretch=True, width=150)
    
            # Insert only the new row
            if row:
                tree.insert("", tk.END, values=row)
    
            # Clear input fields
            ORDER_ID.delete(0, tk.END)
            NAME.delete(0, tk.END)
            PEN.delete(0, tk.END)
            ORDER_ID.focus()
    
            # Close connection
            cursor.close()
            conn.close()
    
        except pymysql.Error as e:
            messagebox.showerror("Database Error", f"Failed to insert data:\n{e}")
    
    def exit_program(event=None):
        """Exit the program using Esc key."""
        root.destroy()
        #root.quit()

    def fetch_data():
            """Fetch data based on ORDER_ID and display it in the table."""
            order_id = ORDER_ID.get().strip()
        
            if not order_id:
                messagebox.showwarning("Warning", "Please enter an ORDER ID to fetch data!")
                return
        
            try:
                conn = pymysql.connect(**DB_CONFIG)
                cursor = conn.cursor()
        
                # Fetch data
                cursor.execute("SELECT * FROM s_table WHERE ORDER_ID = %s", (order_id,))
                rows = cursor.fetchall()
                columns = [desc[0] for desc in cursor.description]
        
                # Clear previous data
                tree.delete(*tree.get_children())
                tree["columns"] = columns
        
                # Set up column headers
                for col in columns:
                    tree.heading(col, text=col, anchor="center")
                    tree.column(col, anchor="center", stretch=True, width=150)
        
                # Insert fetched data
                for row in rows:
                    tree.insert("", tk.END, values=row)
        
                cursor.close()
                conn.close()
        
            except pymysql.Error as e:
                messagebox.showerror("Database Error", f"Failed to fetch data:\n{e}")
        
            
    # GUI Setup
    root = tk.Tk()
    root.title("PURCHASE Entry System")
    root.geometry("800x500")
    root.configure(bg="#2C2F33")
    
    # Centering Frame
    main_frame = tk.Frame(root, bg="#2C2F33")
    main_frame.pack(expand=True)
    
    # Labels & Entry Fields
    tk.Label(main_frame, text="ORDER ID:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=0, column=0, padx=10, pady=5, sticky="e")
    ORDER_ID = tk.Entry(main_frame, font=("Arial", 14), width=25)
    ORDER_ID.grid(row=0, column=1, padx=10, pady=5)

    btn_fetch = tk.Button(main_frame, text="Fetch Data", command=fetch_data, font=("Arial", 14), bg="#4CAF50", fg="white", width=20)
    btn_fetch.grid(row=16, column=1, columnspan=30, pady=5)
            
    tk.Label(main_frame, text="NAME:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=1, column=0, padx=10, pady=5, sticky="e")
    NAME = tk.Entry(main_frame, font=("Arial", 14), width=25)
    NAME.grid(row=1, column=1, padx=10, pady=5)
    
    tk.Label(main_frame, text="PENDING:", font=("Arial", 14), fg="white", bg="#2C2F33").grid(row=2, column=0, padx=10, pady=5, sticky="e")
    PEN = tk.Entry(main_frame, font=("Arial", 14), width=25)
    PEN.grid(row=2, column=1, padx=10, pady=5)

    btn_insert = tk.Button(main_frame, text="Insert Data", command=insert_data, font=("Arial", 14), bg="#7289DA", fg="white", width=20)
    btn_insert.grid(row=15, column=1, columnspan=20, pady=5)

    
    # Table Frame (Full Width)
    frame = tk.Frame(root)
    frame.pack(expand=True, fill="both", padx=10, pady=5)
    
    tree = ttk.Treeview(frame, show="headings", style="Custom.Treeview")
    tree.pack(expand=True, fill="both", side="left")
    
    scroll_y = ttk.Scrollbar(frame, orient="vertical", command=tree.yview)
    scroll_y.pack(side="right", fill="y")
    tree.configure(yscrollcommand=scroll_y.set)
    
    # Styling
    style = ttk.Style()
    style.configure("Custom.Treeview", font=("Courier", 13), rowheight=27)
    style.configure("Treeview.Heading", font=("Courier", 12, "bold"), background="red", foreground="black")
    
    # Keyboard Bindings
    root.bind("<Return>", insert_data)  # Enter key to insert
    root.bind("<Escape>", exit_program)  # Esc key to exit
    ORDER_ID.focus()  # Set initial focus
    
    # Run Application
    root.mainloop()



def total():
    def open_script(script_name):
        try:
            subprocess.Popen(["python", script_name])  # Run script in a new process
        except Exception as e:
            messagebox.showerror("Error", f"Failed to open {script_name}\n{e}")

    # Functions for each button
    def full(): full_total()
    def stock(): stock_total()
    def ps(): ps_total()
    
    # Create main window
    entry_window = tk.Toplevel()
    entry_window.title("Total Amount Options")
    entry_window.geometry("1400x800")

    # Load and store background image
    entry_window.bg_image = Image.open("4.jpg")
    entry_window.bg_image = entry_window.bg_image.resize((1400, 800), Image.Resampling.LANCZOS) #1400,800
    entry_window.bg_photo = ImageTk.PhotoImage(entry_window.bg_image)

    # Create Canvas and place background image
    canvas = tk.Canvas(entry_window, width=1400, height=800)
    canvas.pack(fill="both", expand=True)
    canvas.create_image(0, 0, image=entry_window.bg_photo, anchor="nw")

    # Label
    label = tk.Label(entry_window, text="TOTAL AMOUNT OPTIONS", font=("Terminus", 28, "bold"), fg="white", bg="black")
    canvas.create_window(670, 100, window=label)

    # Button styling
    button_style = {
        "font": ("Terminus", 18, "bold"),
        "bg": "#999999",
        "fg": "black",
        "activebackground": "#393E46",
        "activeforeground": "white",
        "bd": 2,
        "relief": "ridge",
        "width": 25
    }

    # List to store buttons
    buttons = []
    button_functions = [full, stock, ps]
    button_positions = [200, 250, 300]

    # Track selected button
    selected_index = [0]  # Use a list to modify inside functions

    def highlight_button():
        """Highlights the selected button and resets others."""
        for i, btn in enumerate(buttons):
            if i == selected_index[0]:
                btn.config(bg="#040404", fg="grey")  # Highlighted button
            else:
                btn.config(bg="#999999", fg="black")  # Normal button

    def move_selection(event):
        """Move selection up/down using arrow keys."""
        if event.keysym == "Up":
            selected_index[0] = (selected_index[0] - 1) % len(buttons)  # Move up
        elif event.keysym == "Down":
            selected_index[0] = (selected_index[0] + 1) % len(buttons)  # Move down
        highlight_button()

    def select_button(event):
        """Trigger the selected button when Enter is pressed."""
        button_functions[selected_index[0]]()  # Run the selected function
    def go_back(event):
        entry_window.destroy()
    # Create buttons and place them on canvas
    for text, command, y_pos in zip(
        ["1) FULL TOTAL", "2) STOCK TOTAL", "3) PURCHASE AND SALE TOTAL"],
        button_functions, button_positions
    ):
        btn = tk.Button(entry_window, text=text, command=command, **button_style)
        canvas.create_window(670, y_pos, window=btn)
        buttons.append(btn)  # Store button in list
    
    # Highlight the first button initially
    highlight_button()

    # Bind keys
    entry_window.bind("<Up>", move_selection)
    entry_window.bind("<Down>", move_selection)
    entry_window.bind("<Return>", select_button)
    entry_window.bind("<Escape>", go_back)

    # Run GUI
    entry_window.mainloop()


def full_total():
    
    import tkinter as tk
    from tkinter import messagebox, scrolledtext
    import pymysql
    
    DB_CONFIG = {
        "host": "localhost",
        "user": "root",
        "password": "?",  # Replace with your password
        "database": "cmp"
    }
    
    def run_query(query):
        try:
            conn = pymysql.connect(**DB_CONFIG)
            cursor = conn.cursor()
            cursor.execute(query)
            result = cursor.fetchall()
            columns = [desc[0] for desc in cursor.description]
            conn.close()
            return columns, result
        except pymysql.MySQLError as e:
            return None, str(e)
    
    def format_output(columns, rows):
        if not rows:
            return "No data found."
    
        col_widths = [max(len(str(col)), max(len(str(row[i])) for row in rows)) for i, col in enumerate(columns)]
        line_sep = "+-" + "-+-".join("-" * width for width in col_widths) + "-+"
        output = [line_sep]
        output.append("| " + " | ".join(f"{col.ljust(col_widths[i])}" for i, col in enumerate(columns)) + " |")
        output.append(line_sep)
        for row in rows:
            output.append("| " + " | ".join(f"{str(row[i]).ljust(col_widths[i])}" for i in range(len(row))) + " |")
        output.append(line_sep)
        return "\n".join(output)
        
    def go_back(event):
            root.destroy()
            
    def fetch_summary():
        month = month_var.get()
        if not month:
            messagebox.showwarning("Warning", "Please select a month")
            return
    
        queries = [
            f"""SELECT s.TOTAL_PHONE_SALE, sq.TOTAL_S_QNTY, p.TOTAL_PHONE_PURCHASE, pq.TOTAL_P_QNTY
                FROM 
                    (SELECT SUM(TOTAL) AS TOTAL_PHONE_SALE FROM s_table WHERE DATE LIKE '2025-{month}-%') s,
                    (SELECT SUM(QNTY) AS TOTAL_S_QNTY FROM s_table WHERE DATE LIKE '2025-{month}-%') sq,
                    (SELECT SUM(TOTAL) AS TOTAL_PHONE_PURCHASE FROM p_table WHERE DATE LIKE '2025-{month}-%') p,
                    (SELECT SUM(QNTY) AS TOTAL_P_QNTY FROM p_table WHERE DATE LIKE '2025-{month}-%') pq;""",
            
            f"""SELECT s.TOTAL_SALE_ACC, p.TOTAL_PURCHASE_ACC
                FROM 
                    (SELECT SUM(TOTAL) AS TOTAL_SALE_ACC FROM s_acc WHERE DATE LIKE '2025-{month}-%') s,
                    (SELECT SUM(TOTAL) AS TOTAL_PURCHASE_ACC FROM p_acc WHERE DATE LIKE '2025-{month}-%') p;""",
            
            f"""SELECT s.TOTAL_REPAIR, p.TOTAL_PARTS
                FROM 
                    (SELECT SUM(TOTAL) AS TOTAL_REPAIR FROM repair WHERE DATE LIKE '2025-{month}-%') s,
                    (SELECT SUM(TOTAL) AS TOTAL_PARTS FROM parts WHERE DATE LIKE '2025-{month}-%') p;""",
            
            f"""SELECT t.TOTAL_TEA, s.TOTAL_SALARY, r.TOTAL_RENT, p.TOTAL_PETROL, c.TOTAL_CONVENCE, b.TOTAL_BILL, o.OTHER_EXP
                FROM 
                    (SELECT SUM(TOTAL) AS TOTAL_TEA FROM exp WHERE DATE LIKE '2025-{month}-%' AND (NAME LIKE '%TEA%' OR NAME LIKE '%COFF%')) t,
                    (SELECT SUM(TOTAL) AS TOTAL_SALARY FROM sal WHERE DATE LIKE '2025-{month}-%') s,
                    (SELECT SUM(TOTAL) AS TOTAL_RENT FROM exp WHERE DATE LIKE '2025-{month}-%' AND NAME LIKE '%RENT%') r,
                    (SELECT SUM(TOTAL) AS TOTAL_PETROL FROM exp WHERE DATE LIKE '2025-{month}-%' AND NAME LIKE '%PETROL%') p,
                    (SELECT SUM(TOTAL) AS TOTAL_CONVENCE FROM exp WHERE DATE LIKE '2025-{month}-%' AND (NAME LIKE '%POT%' OR NAME LIKE '%CONVEN%')) c,
                    (SELECT SUM(TOTAL) AS TOTAL_BILL FROM exp WHERE DATE LIKE '2025-{month}-%' AND NAME LIKE '%BILL%') b,
                    (SELECT SUM(TOTAL) AS OTHER_EXP FROM exp WHERE DATE LIKE '2025-{month}-%' AND LOWER(NAME) NOT LIKE '%tea%' AND LOWER(NAME) NOT LIKE '%cof%' AND LOWER(NAME) NOT LIKE '%rent%' AND LOWER(NAME) NOT LIKE '%petrol%' AND LOWER(NAME) NOT LIKE '%pot%' AND LOWER(NAME) NOT LIKE '%conv%' AND LOWER(NAME) NOT LIKE '%bill%') o;""",
            
            f"""SELECT 
                    (SELECT SUM(TOTAL) FROM sal WHERE DATE LIKE '2025-{month}-%') 
                    + (SELECT SUM(TOTAL) FROM exp WHERE DATE LIKE '2025-{month}-%') AS EXP_GRAND_TOTAL;"""
        ]
    
        text_area.config(state=tk.NORMAL)
        text_area.delete(1.0, tk.END)
    
        for i, q in enumerate(queries):
            columns, result = run_query(q)
            if columns is None:
                text_area.insert(tk.END, f"Query {i+1} failed:\n{result}\n\n")
            else:
                text_area.insert(tk.END, format_output(columns, result) + "\n\n")
    
        text_area.config(state=tk.DISABLED)
    
    # GUI Setup
    root = tk.Tk()
    root.title("Monthly Cashphones Summary Viewer")
    root.geometry("900x600")
    
    tk.Label(root, text="Select Month (01 - 12):", font=("Arial", 12)).pack(pady=5)
    month_var = tk.StringVar()
    month_menu = tk.OptionMenu(root, month_var, *["{:02d}".format(i) for i in range(1, 13)])
    month_menu.config(font=("Arial", 12))
    month_menu.pack(pady=5)
    
    tk.Button(root, text="Fetch Summary", command=fetch_summary, font=("Arial", 12), bg="lightgreen").pack(pady=5)
    
    text_area = scrolledtext.ScrolledText(root, font=("Courier", 11), wrap=tk.WORD, height=25, width=110)
    text_area.pack(padx=10, pady=10, fill="both", expand=True)

    root.bind("<Escape>", go_back)
    
    root.mainloop()
    

def ps_total():
        
    import tkinter as tk
    from tkinter import messagebox, scrolledtext
    import pymysql

    DB_CONFIG = {
        "host": "localhost",
        "user": "root",
        "password": "?",  # Replace with your actual password
        "database": "cmp"
    }

    def run_query(query):
        try:
            conn = pymysql.connect(**DB_CONFIG)
            cursor = conn.cursor()
            cursor.execute(query)
            result = cursor.fetchall()
            columns = [desc[0] for desc in cursor.description]
            conn.close()
            return columns, result
        except pymysql.MySQLError as e:
            return None, str(e)

    def format_output(columns, rows):
        if not rows:
            return "No data found."

        col_widths = [max(len(str(col)), max(len(str(row[i])) for row in rows)) for i, col in enumerate(columns)]
        line_sep = "+-" + "-+-".join("-" * width for width in col_widths) + "-+"
        output = [line_sep]
        output.append("| " + " | ".join(f"{col.ljust(col_widths[i])}" for i, col in enumerate(columns)) + " |")
        output.append(line_sep)
        for row in rows:
           
            output.append("| " + " | ".join(f"{(row[i].decode() if isinstance(row[i], bytes) else str(row[i])).ljust(col_widths[i])}" for i in range(len(row))) + " |")
            
        output.append(line_sep)
        return "\n".join(output)

    def go_back(event=None):
        root.destroy()

    def fetch_summary():
        month = month_var.get()
        if not month:
            messagebox.showwarning("Warning", "Please select a month")
            return

        queries = [
            f"""
            SELECT ROW_NUMBER() OVER (ORDER BY NAME) AS S_NO, DATE, ORDER_ID, NAME, TOTAL, QNTY
            FROM s_table WHERE DATE LIKE '2025-{month}-%'
            UNION
            SELECT '=======','===========','======','============================','========','====='
            FROM s_table
            UNION ALL
            SELECT '---->','SALES','TABLE','<---------> TOTAL <--------->',SUM(TOTAL),SUM(QNTY)
            FROM s_table WHERE DATE LIKE '2025-{month}-%';
            """,

            f"""
            SELECT ROW_NUMBER() OVER (ORDER BY NAME) AS S_NO, DATE, ORDER_ID, NAME, TOTAL, QNTY
            FROM p_table WHERE DATE LIKE '2025-{month}-%'
            UNION
            SELECT '=======','===========','=======','===================================','========','===='
            FROM p_table
            UNION ALL
            SELECT '---->','PURCHASE','TABLE','<------------> TOTAL <------------>',SUM(TOTAL),SUM(QNTY)
            FROM p_table WHERE DATE LIKE '2025-{month}-%';
            """
        ]

        text_area.config(state=tk.NORMAL)
        text_area.delete(1.0, tk.END)

        for i, query in enumerate(queries):
            columns, result = run_query(query)
            if columns is None:
                text_area.insert(tk.END, f"Query {i+1} failed:\n{result}\n\n")
            else:
                text_area.insert(tk.END, format_output(columns, result) + "\n\n")

        text_area.config(state=tk.DISABLED)

    # GUI Setup
    root = tk.Tk()
    root.title("Monthly Summary Viewer - SALES & PURCHASE")
    root.geometry("1000x650")

    tk.Label(root, text="Select Month (01 - 12):", font=("Arial", 12)).pack(pady=5)
    month_var = tk.StringVar()
    month_menu = tk.OptionMenu(root, month_var, *["{:02d}".format(i) for i in range(1, 13)])
    month_menu.config(font=("Arial", 12))
    month_menu.pack(pady=5)

    tk.Button(root, text="Fetch Summary", command=fetch_summary, font=("Arial", 12), bg="lightgreen").pack(pady=5)

    text_area = scrolledtext.ScrolledText(root, font=("Courier", 11), wrap=tk.WORD, height=28, width=120)
    text_area.pack(padx=10, pady=10, fill="both", expand=True)

    root.bind("<Escape>", go_back)
    root.mainloop()
    

def stock_total():
       
            # Database Connection Configuration
            DB_CONFIG = {
                "host": "localhost",
                "user": "root",
                "password": "?",
                "database": "cmp"
            }
        
            def fetch_and_display_tables(table_names, name_filter=None):
                try:
                    conn = pymysql.connect(**DB_CONFIG)
                    cursor = conn.cursor()
        
                    output = []
        
                    for table_name in table_names:
                        query = f"select ROW_NUMBER() OVER (ORDER BY NAME) AS S_NO,ORDER_ID,NAME,P_PRICE,QNTY from `{table_name}` union SELECT '=======','=======','======================================','==========','=====' FROM `{table_name}` union all select 'STOCK','TABLE','<--------------> TOTAL <-------------->',SUM(P_PRICE),SUM(QNTY) FROM `{table_name}`"
                        cursor.execute(query)
        
                        rows = cursor.fetchall()
                        columns = [desc[0] for desc in cursor.description]
        
                        output.append(f"\nTABLE: {table_name.upper()}\n")
        
                        if not rows:
                            output.append("No data found.\n")
                            continue
        
                        # Calculate column widths
                        col_widths = [max(len(str(col)), max(len(str(row[i])) for row in rows)) for i, col in enumerate(columns)]
                        line_sep = "+-" + "-+-".join("-" * width for width in col_widths) + "-+"
        
                        output.append(line_sep)
                        output.append("| " + " | ".join(f"{col.ljust(col_widths[i])}" for i, col in enumerate(columns)) + " |")
                        output.append(line_sep)
        
                        for row in rows:
                            
                            output.append("| " + " | ".join(f"{(row[i].decode() if isinstance(row[i], bytes) else str(row[i])).ljust(col_widths[i])}" for i in range(len(row))) + " |")
                            
                        output.append(line_sep)
        
                    # Show in GUI
                    text_area.config(state=tk.NORMAL)
                    text_area.delete(1.0, tk.END)
                    text_area.insert(tk.END, "\n".join(output))
                    text_area.config(state=tk.DISABLED)
        
                    cursor.close()
                    conn.close()
        
                except pymysql.Error as e:
                    messagebox.showerror("Database Error", f"Failed to fetch data:\n{e}")
        
            # GUI Setup
            root = tk.Tk()
            root.title("SQL Multi-Table Viewer (Search by NAME)")
            root.geometry("1000x650")
        
            # Entry field for NAME
            entry_frame = tk.Frame(root)
            entry_frame.pack(pady=10)
    
            
            def go_back(event):
                root.destroy()
        
        
            # Frame for scrollbars
            frame = tk.Frame(root)
            frame.pack(fill="both", expand=True)
        
            # Text area with both scrollbars
            text_area = tk.Text(frame, font=("Courier", 12), wrap="none")
            text_area.pack(side="left", fill="both", expand=True)
        
            # Scrollbars
            scroll_y = tk.Scrollbar(frame, orient="vertical", command=text_area.yview)
            scroll_y.pack(side="right", fill="y")
        
            scroll_x = tk.Scrollbar(root, orient="horizontal", command=text_area.xview)
            scroll_x.pack(fill="x")
        
            text_area.config(yscrollcommand=scroll_y.set, xscrollcommand=scroll_x.set)
        
            # Tables to display
            tables_to_show = ["stock"]  # You can add more if needed
        
            # Initial fetch
            fetch_and_display_tables(tables_to_show)
    
            root.bind("<Escape>", go_back)
            root.mainloop()


def profit():

        import tkinter as tk
        from tkinter import messagebox, scrolledtext
        import pymysql
    
        DB_CONFIG = {
            "host": "localhost",
            "user": "root",
            "password": "?",  # Replace with your actual password
            "database": "cmp"
        }
    
        def run_query(query):
            try:
                conn = pymysql.connect(**DB_CONFIG)
                cursor = conn.cursor()
                cursor.execute(query)
                result = cursor.fetchall()
                columns = [desc[0] for desc in cursor.description]
                conn.close()
                return columns, result
            except pymysql.MySQLError as e:
                return None, str(e)
    
        def format_output(columns, rows):
            if not rows:
                return "No data found."
    
            col_widths = [max(len(str(col)), max(len(str(row[i])) for row in rows)) for i, col in enumerate(columns)]
            line_sep = "+-" + "-+-".join("-" * width for width in col_widths) + "-+"
            output = [line_sep]
            output.append("| " + " | ".join(f"{col.ljust(col_widths[i])}" for i, col in enumerate(columns)) + " |")
            output.append(line_sep)
            for row in rows:
                #output.append("| " + " | ".join(f"{str(row[i]).ljust(col_widths[i])}" for i in range(len(row))) + " |")
                output.append("| " + " | ".join(f"{(row[i].decode() if isinstance(row[i], bytes) else str(row[i])).ljust(col_widths[i])}" for i in range(len(row))) + " |")
                
            output.append(line_sep)
            return "\n".join(output)
    
        def go_back(event=None):
            root.destroy()
    
        def fetch_summary():
            month = month_var.get()
            if not month:
                messagebox.showwarning("Warning", "Please select a month")
                return
    
            text_area.config(state=tk.NORMAL)
            text_area.delete(1.0, tk.END)
    
            m = month
    
            queries = [
                f"""
                SELECT ROW_NUMBER() OVER (ORDER BY s.NAME) AS S_NO,
                       s.ORDER_ID,
                       s.NAME,
                       s.TOTAL AS SALE_AMOUNT,
                       p.TOTAL AS PURCHASE_AMOUNT,
                       (s.TOTAL - p.TOTAL) AS PROFIT_AMOUNT
                FROM s_table s
                JOIN p_table p ON s.ORDER_ID = p.ORDER_ID
                WHERE s.DATE LIKE '2025-{m}%';
                """,
    
                f"""
                SELECT SUM(s.TOTAL) AS TOTAL_SALE,
                       SUM(p.TOTAL) AS TOTAL_PUR,
                       SUM(s.TOTAL - p.TOTAL) AS PROFIT
                FROM s_table s
                JOIN p_table p ON s.ORDER_ID = p.ORDER_ID
                WHERE s.DATE LIKE '2025-{m}%';
                """,
    
                f"""
                SELECT 'TABLE' AS Category, 'PROFIT' AS Value UNION SELECT ' ', ' ' UNION SELECT 'PHONES', SUM(s.TOTAL - p.TOTAL) FROM s_table s JOIN p_table p ON s.ORDER_ID = p.ORDER_ID WHERE s.DATE LIKE '2025-{m}%' UNION SELECT '  ', '  ' UNION SELECT 'S_ACC', SUM(TOTAL_PROFIT) FROM s_acc WHERE DATE LIKE '2025-{m}%' UNION SELECT '   ', '   ' UNION SELECT 'REPAIR',         (SELECT SUM(TOTAL) FROM repair WHERE DATE LIKE '2025-{m}%') -        (SELECT SUM(TOTAL) FROM parts WHERE DATE LIKE '2025-{m}%') UNION SELECT '    ', '    ' UNION SELECT 'EXPANSE', SUM(TOTAL) FROM exp WHERE DATE LIKE '2025-{m}%' UNION SELECT '           ', '           ' UNION SELECT 'SALARY', SUM(TOTAL) FROM sal WHERE DATE LIKE '2025-{m}%' UNION SELECT '         ', '         ' UNION SELECT 'PENDING', SUM(PENDING) FROM pen_h WHERE DATE LIKE '2025-{m}%' UNION SELECT '--------------------', '-----------' UNION SELECT 'GRAND PROFIT/LOSS',        (SELECT SUM(s.TOTAL - p.TOTAL)         FROM s_table s         JOIN p_table p ON s.ORDER_ID = p.ORDER_ID         WHERE s.DATE LIKE '2025-{m}%')        +        (SELECT SUM(TOTAL_PROFIT) FROM s_acc WHERE DATE LIKE '2025-{m}%')        +        (SELECT SUM(TOTAL) FROM repair WHERE DATE LIKE '2025-{m}%') -        (SELECT SUM(TOTAL) FROM parts WHERE DATE LIKE '2025-{m}%')        -        (SELECT SUM(TOTAL) FROM exp WHERE DATE LIKE '2025-{m}%')        -        (SELECT SUM(TOTAL) FROM sal WHERE DATE LIKE '2025-{m}%')  -  (SELECT SUM(PENDING) FROM pen_h WHERE DATE LIKE '2025-{m}%');
                """
            ]
    
            for i, query in enumerate(queries):
                columns, result = run_query(query)
                if columns is None:
                    text_area.insert(tk.END, f"Query {i+1} failed:\n{result}\n\n")
                else:
                    text_area.insert(tk.END, format_output(columns, result) + "\n\n")
    
            text_area.config(state=tk.DISABLED)
    
        # GUI Setup
        root = tk.Tk()
        root.title("Monthly Summary Viewer - PROFIT/LOSS")
        root.geometry("1100x700")
    
        tk.Label(root, text="Select Month (01 - 12):", font=("Arial", 12)).pack(pady=5)
        month_var = tk.StringVar()
        month_menu = tk.OptionMenu(root, month_var, *["{:02d}".format(i) for i in range(1, 13)])
        month_menu.config(font=("Arial", 12))
        month_menu.pack(pady=5)
    
        tk.Button(root, text="Fetch Summary", command=fetch_summary, font=("Arial", 12), bg="lightgreen").pack(pady=5)
    
        text_area = scrolledtext.ScrolledText(root, font=("Courier", 11), wrap=tk.WORD, height=30, width=130)
        text_area.pack(padx=10, pady=10, fill="both", expand=True)
    
        root.bind("<Escape>", go_back)
        root.mainloop()
        



def refresh():
    try:
        conn = mysql.connector.connect(
            host="localhost",
            user="root",       # Replace with your DB username
            password="?",   # Replace with your DB password
            database="cmp"
        )
        cursor = conn.cursor()
        cursor.execute("SET foreign_key_checks=0;")
        cursor.execute("DELETE FROM stock WHERE QNTY=0;")
        conn.commit()
        cursor.close()
        conn.close()
        messagebox.showinfo("Refresh", "Refresh Successful ✅")
    except mysql.connector.Error as err:
        messagebox.showerror("Database Error", f"Error: {err}")



def b():
    def go_back(event=None):
                root.destroy()
        
    def bill():
        try:
            img = Image.open("/home/whitex/cashphones/b2.png").convert("RGB")
            draw = ImageDraw.Draw(img)
    
            font_large = ImageFont.truetype("/home/whitex/cashphones/c.ttf", size=60)
            font_small = ImageFont.truetype("/home/whitex/cashphones/c.ttf", size=50)
    
            # Collecting data
            data = {
                'CUSTOMER NAME': (name_entry.get(), (66, 603), font_large),
                'PHONE NUMBER': (phone_entry.get(), (200, 730), font_small),
                'INVOICE NUM': ("A0000" + invoice_entry.get(), (1830, 542), font_small),
                'DATE': (date_entry.get() + ".2025", (2210, 542), font_small),
                'SNO': (sno_entry.get(), (15, 994), font_small),
                'QNTY': (qty_entry.get(), (184, 994), font_small),
                'ORDER ID': (order_id_entry.get(), (354, 994), font_small),
                'PRODUCT NAME': (product_name_entry.get(), (498, 994), font_small),
                'IMEI NO': (imei_entry.get(), (1132, 994), font_small),
                'HSN': (hsn_entry.get(), (1735, 994), font_small)
            }
    
            for key, (value, pos, fnt) in data.items():
                draw.text(pos, value, font=fnt, fill=(0, 0, 0))
    
            rate = int(rate_entry.get())
            dis = int(discount_entry.get())
            pur = int(purchase_price_entry.get())
    
            total = rate - (rate * dis / 100)
            gst = (total - pur) * 0.09
            grand_total = total + gst * 2
    
            draw.text((1900, 994), str(rate), font=font_small, fill=(0, 0, 0))
            draw.text((2135, 994), str(dis) + "%", font=font_small, fill=(0, 0, 0))
            draw.text((2262, 994), str(total), font=font_small, fill=(0, 0, 0))
    
            draw.text((480, 2660), str(grand_total), font=font_small, fill=(0, 0, 0))
            draw.text((1560, 2605), str(grand_total), font=font_small, fill=(0, 0, 0))
            draw.text((2175, 2745), str(total), font=font_small, fill=(0, 0, 0))
            draw.text((2235, 2795), str(gst), font=font_small, fill=(0, 0, 0))
            draw.text((2235, 2845), str(gst), font=font_small, fill=(0, 0, 0))
            draw.text((2235, 2890), "0.00", font=font_small, fill=(0, 0, 0))
            draw.text((2175, 2955), str(grand_total), font=font_small, fill=(0, 0, 0))
    
            option = option_var.get()
            if option == "SAVE":
                img.save("bill.png")
                messagebox.showinfo("Success", "Bill saved successfully!")
            elif option == "PRINTOUT":
                img.save("bill.png")
                os.system('lp -o media=A4 -d wx bill.png')
            elif option == "SHOW":
                img.show()
    
        except Exception as e:
            messagebox.showerror("Error", str(e))
    
    root = tk.Tk()
    root.title("Phone Accounting System")
    root.geometry("800x800")
    
    labels = ["CUSTOMER NAME", "PHONE NUMBER", "INVOICE NUM", "DATE", "SNO", "QNTY", "ORDER ID", "PRODUCT NAME", "IMEI NO", "HSN", "RATE", "DISCOUNT", "PURCHASING PRICE"]
    entries = []
    
    for idx, label in enumerate(labels):
        tk.Label(root, text=label).grid(row=idx, column=0, padx=10, pady=5, sticky='e')
        entry = tk.Entry(root, width=30)
        entry.grid(row=idx, column=1, pady=5)
        entries.append(entry)
    
    name_entry, phone_entry, invoice_entry, date_entry, sno_entry, qty_entry, order_id_entry, product_name_entry, imei_entry, hsn_entry, rate_entry, discount_entry, purchase_price_entry = entries
    
    # Option Menu
    tk.Label(root, text="Choose Option").grid(row=len(labels), column=0, padx=10, pady=10)
    option_var = tk.StringVar(value="SAVE")
    option_menu = tk.OptionMenu(root, option_var, "SAVE", "PRINTOUT", "SHOW")
    option_menu.grid(row=len(labels), column=1, pady=10)
    
    tk.Button(root, text="Generate Bill", command=bill, bg="red", fg="white").grid(row=len(labels)+1, column=0, columnspan=2, pady=20)

    root.bind("<Escape>", go_back)
    root.mainloop()
    



# --- Main Program Function ---
def main_program():
    root = tk.Tk()
    root.title("Phone Billing Options")
    root.geometry("1400x800")

    # Load background image
    bg_image = Image.open("5.jpg")  # Change to your image file
    bg_image = bg_image.resize((1400, 800), Image.Resampling.LANCZOS)
    bg_photo = ImageTk.PhotoImage(bg_image)

    # Create Canvas and place background image
    canvas = tk.Canvas(root, width=1400, height=800)
    canvas.pack(fill="both", expand=True)
    canvas.create_image(0, 0, image=bg_photo, anchor="nw")

    # Label
    label = tk.Label(root, text="CASH MY PHONE", font=("Terminus", 28, "bold"), fg="white", bg="black")
    canvas.create_window(670, 100, window=label)

    # Button styling
    button_style = {
        "font": ("Terminus", 18, "bold"),
        "bg": "#d4d5d3",
        "fg": "white",
        "activebackground": "#393E46",
        "activeforeground": "#040404",
        "bd": 2,
        "relief": "ridge",
        "width": 20
    }
    def open_script(script_name):
        try:
            subprocess.Popen(["python", script_name])  # Run script in a new process
        except Exception as e:
            messagebox.showerror("Error", f"Failed to open {script_name}\n{e}")
    # Button functions
    btn_stock = tk.Button(root, text="1) ENTRY", command=entry, **button_style)
    btn_stock = tk.Button(root, text="2) SEARCH", command=sch, **button_style)
    btn_stock = tk.Button(root, text="3) UPDATE", command=upd, **button_style)
    btn_stock = tk.Button(root, text="4) DELETE", command=dele, **button_style)
    btn_stock = tk.Button(root, text="5) PENDING", command=pending, **button_style)
    btn_stock = tk.Button(root, text="6) TOTAL", command=total, **button_style)
    btn_stock = tk.Button(root, text="7) BILLING", command=b, **button_style)
    btn_stock = tk.Button(root, text="8) PROFIT", command=profit, **button_style)
    btn_stock = tk.Button(root, text="9) REFRESH", command=refresh, **button_style)

    button_functions = [entry, sch, upd, dele, pending, total, b, profit, refresh]

    # Track selected button
    selected_index = 0
    buttons = []

    def highlight_button(index):
        """Highlights the selected button and resets others."""
        for i, btn in enumerate(buttons):
            if i == index:
                btn.config(bg="#040404", fg="grey")  # Highlighted button
            else:
                btn.config(bg="#999999", fg="black")  # Normal button

    def move_selection(event):
        """Move selection up/down using arrow keys."""
        nonlocal selected_index
        if event.keysym == "Up":
            selected_index = (selected_index - 1) % len(buttons)
        elif event.keysym == "Down":
            selected_index = (selected_index + 1) % len(buttons)
        highlight_button(selected_index)

    def select_button(event):
        """Trigger the selected button when Enter is pressed."""
        button_functions[selected_index]()

    def go_back(event):
        root.destroy()
    # Button positions
    button_positions = [200, 250, 300, 350, 400, 450, 500, 550, 600]

    # Create buttons and place them on canvas
    for i, (text, command, y_pos) in enumerate(zip(
        ["1) ENTRY", "2) SEARCH", "3) UPDATE", "4) DELETE",
         "5) PENDING", "6) TOTAL", "7) BILLING", "8) PROFIT", "9) REFRESH"],
        button_functions, button_positions
    )):
        btn = tk.Button(root, text=text, command=command, **button_style)
        canvas.create_window(670, y_pos, window=btn)
        buttons.append(btn)

    # Highlight the first button initially
    highlight_button(selected_index)

    # Bind keys
    root.bind("<Up>", move_selection)
    root.bind("<Down>", move_selection)
    root.bind("<Return>", select_button)
    root.bind("<Escape>", go_back)

    root.mainloop()
    

# --- Splash Screen with Rising and Shine Effect ---
def splash_screen():
    splash = tk.Tk()
    splash.title("Loading...")

    splash.geometry("500x500")  # Set the window size
    splash.configure(bg="black")

    # Load and process the logo
    logo = Image.open("a.png")  # Change to your logo file
    logo = logo.resize((500, 500), Image.Resampling.LANCZOS)
    
    enhancer = ImageEnhance.Brightness(logo)
    logo_brightness = 0.2  # Initial brightness (dark)
    logo_img = ImageTk.PhotoImage(enhancer.enhance(logo_brightness))

    canvas = tk.Canvas(splash, width=500, height=500, bg="black", highlightthickness=0)
    canvas.pack(fill="both", expand=True)

    canvas_width = splash.winfo_reqwidth()  # Get canvas width dynamically

    # Start logo position (bottom)
    logo_y = 500
    logo_id = canvas.create_image(canvas_width // 2, logo_y, image=logo_img, anchor="center")

    def animate_logo():
        nonlocal logo_y, logo_brightness, logo_img
        if logo_y > 250:  # Move up to center
            logo_y -= 5
            logo_brightness += 0.02
            logo_img = ImageTk.PhotoImage(enhancer.enhance(logo_brightness))
            canvas.itemconfig(logo_id, image=logo_img)
            canvas.coords(logo_id, canvas.winfo_width() // 2, logo_y)  # Keep it centered
            splash.after(10, animate_logo)
        else:
            splash.after(1000, lambda: (splash.destroy(), main_program()))
            
    splash.after(10, animate_logo)  # Small delay to avoid startup lag
    splash.mainloop()


# Run the splash screen first
splash_screen()

