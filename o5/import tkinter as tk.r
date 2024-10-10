import tkinter as tk
from tkinter import *
import mysql.connector

# Establishing connection to the MySQL server
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Mohan@123.",
    database="APPLICATION"
)

# Creating a cursor object to execute SQL queries
mycursor = mydb.cursor()

# Function to create the users table if it doesn't exist
def create_table():
    mycursor.execute("CREATE TABLE IF NOT EXISTS ACCOUNTS ("
                     "id INT AUTO_INCREMENT PRIMARY KEY, "
                     "name VARCHAR(255), "
                     "surname VARCHAR(255), "
                     "mobile_number VARCHAR(255), "
                     "email VARCHAR(255), "
                     "adhaar_number VARCHAR(255), "
                     "father_name VARCHAR(255), "
                     "account_number VARCHAR(255), "
                     "password VARCHAR(255))")

    # Committing the changes
    mydb.commit()

# Function to handle the login functionality
def login():
    def welcome():
        # Executing SQL query to retrieve user data
        mycursor.execute("SELECT * FROM ACCOUNTS WHERE name = %s AND account_number = %s AND password = %s",
                         (expression_feild.get(), expression_feildO.get(), expression_feild1.get()))
        user = mycursor.fetchone()
        if user:
            expression = "Welcome " + expression_feild.get()
            label1 = Label(epage, text=expression, height=2, width=28).place(relx=0.59, rely=0.67)
        else:
            expression = "Invalid credentials"
            label1 = Label(epage, text=expression, height=2, width=28).place(relx=0.59, rely=0.67)

    epage = tk.Tk()
    epage.geometry("1800x920")
    epage.configure(background="pink")
    epage.title("Login Page")
    
    # Labels and Entry fields for login page
    label=Label(epage,bg="white",fg="black",height=11,width=50,font="arial 24").place(relx=0.16,rely=0.2)
    label=Label(epage,text="Login Details:",bg="white",fg="black",height=2,width=50,font="arial 24").place(relx=0.16,rely=0.2)

    label=Label(epage,bg="gray",fg="black",height=3,width=53).place(relx=0.465,rely=0.305)
    expression_feild = Entry(epage,width=20,font="Arial 24")
    expression_feild.grid(columnspan=50,ipadx=70)
    expression_feild.place(relx=0.47,rely=0.3)

    label=Label(epage,text="Enter Your Name:",bg="yellow",fg="black",height=2,width=50).place(relx=0.23,rely=0.3)

    label=Label(epage,bg="gray",fg="black",height=3,width=53).place(relx=0.465,rely=0.405)
    expression_feildO = Entry(epage,width=20,font="Arial 24")
    expression_feildO.grid(columnspan=50,ipadx=70)
    expression_feildO.place(relx=0.47,rely=0.4)
    label=Label(epage,text="Enter Account Number:",bg="yellow",fg="black",height=2,width=50).place(relx=0.23,rely=0.4)

    label=Label(epage,bg="gray",fg="black",height=3,width=53).place(relx=0.465,rely=0.505)
    expression_feild1 = Entry(epage,width=20,font="Arial 24")
    expression_feild1.grid(columnspan=50,ipadx=70)
    expression_feild1.place(relx=0.47,rely=0.5)
    label=Label(epage,text="Enter Your Password:",bg="yellow",fg="black",height=2,width=50).place(relx=0.23,rely=0.5)

    submit_button=Button(epage,text="Submit",command = welcome,bg="white",height=1,width=7).place(relx=0.55,rely=0.59)

# Function to handle account creation
def create():
    def store_all():
        # SQL query to insert user data into the users table
        sql = "INSERT INTO ACCOUNTS (name, surname, mobile_number, email, adhaar_number, father_name, account_number, password) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"
        val = (names.get(), surnames.get(), numbers.get(), emails.get(), ADHAARs.get(), FATHERs.get(), Account_numbers.get(), Account_PASSWORDs.get())
        mycursor.execute(sql, val)
        mydb.commit()

        # GUI components for account creation success page
        new2 = tk.Tk()
        new2.geometry("1920x1080")
        new2.title("Account Details")
        
        welcomelabel = Label(new2, text="Welcome " + names.get(), bg="pink", fg="orange", height=2, width=50, font="arial 32").place(relx=0.091,rely=0.091)

        new_account = Label(new2, text="Account created successfully", bg="pink", fg="white", height=2, width=25, font="arial 32").place(relx=0.4,rely=0.4)
        end_board = Label(new2, text="Thank you......", bg="pink", fg="green", height=2, width=25, font="arial 32").place(relx=0.7,rely=0.7)
        back_button = Button(new2, text="Go to Login Page", command=login, bg="white", fg="pink", height=2, width=25, font="arial 12").place(relx=0.43,rely=0.7)

    new = tk.Tk()
    new.geometry("1920x1080")
    new.title("Creating Account...")

    # Labels and Entry fields for account creation page
    label=Label(new,bg="pink",height=100,width=300).place(relx=0,rely=0)
    
    label=Label(new,bg="white",fg="black",height=19,width=72,font="arial 24").place(relx=0.05,rely=0.06)
    name_labels=Label(new,text="NAME:",fg="black",height=2,width=25,font="arial 12").place(relx=0.1,rely=0.1)
    names= Entry(new,width=18,font="Arial 24")
    names.grid(columnspan=50,ipadx=70)
    names.place(relx=0.25,rely=0.1)

    label=Label(new,text="Surname:",fg="black",height=2,width=25,font="arial 12").place(relx=0.5,rely=0.1)
    surnames=Entry(new,width=18,font="Arial 24")
    surnames.grid(columnspan=50,ipadx=70)
    surnames.place(relx=0.65,rely=0.1)

    no=Label(new,text="Enter Mobile Number:",fg="black",height=2,width=25,font="arial 12").place(relx=0.1,rely=0.2)
    numbers=Entry(new,width=18,font="Arial 24")
    numbers.grid(columnspan=50,ipadx=70)
    numbers.place(relx=0.25,rely=0.2)

    email_label=Label(new,text="EMAIL",fg="black",height=2,width=25,font="arial 12").place(relx=0.5,rely=0.2)
    emails=Entry(new,width=18,font="Arial 24")
    emails.grid(columnspan=50,ipadx=70)
    emails.place(relx=0.65,rely=0.2)

    ADHAAR_label=Label(new,text="ADHAAR NUMBER",fg="black",height=2,width=25,font="arial 12").place(relx=0.1,rely=0.3)
    ADHAARs=Entry(new,width=18,font="Arial 24")
    ADHAARs.grid(columnspan=50,ipadx=70)
    ADHAARs.place(relx=0.25,rely=0.3)

    FATHER_label=Label(new,text="FATHER NAME",fg="black",height=2,width=25,font="arial 12").place(relx=0.5,rely=0.3)
    FATHERs=Entry(new,width=18,font="Arial 24")
    FATHERs.grid(columnspan=50,ipadx=70)
    FATHERs.place(relx=0.65,rely=0.3)

    blank_label=Label(new,bg="pink",fg="white",height=50,width=165).place(relx=0.1,rely=0.4)
    blank_detail=Label(new,text="Bank Details",bg="pink",fg="white",height=2,width=25,font="arial 25").place(relx=0.1,rely=0.4)
    blank_label2=Label(new,bg="white",fg="white",height=20,width=120).place(relx=0.2,rely=0.5)

    blank_label3=Label(new,text="Account Number",bg="pink",fg="white",height=1,width=15,font="arial 24").place(relx=0.23,rely=0.55)
    Account_numbers=Entry(new,width=18,font="Arial 24")
    Account_numbers.grid(columnspan=50,ipadx=70)
    Account_numbers.place(relx=0.45,rely=0.55)

    blank_label4=Label(new,text="Password",bg="pink",fg="white",height=1,width=15,font="arial 24").place(relx=0.23,rely=0.65)
    Account_PASSWORDs=Entry(new,width=18,font="Arial 24")
    Account_PASSWORDs.grid(columnspan=50,ipadx=70)
    Account_PASSWORDs.place(relx=0.45,rely=0.65)

    crete_account=Button(new,text="Create Account",command=store_all,bg="white",fg="black",height=1,width=15,font="arial 12").place(relx=0.5,rely=0.75)

# Ensure the users table is created when the program starts
create_table()

# GUI components for the main login page
root = tk.Tk()
root.geometry("1920x1080")
root.configure(background="black")
root.title("Login Page")

button = tk.Button(root, text="Login", command=login, height=2, width=40)
button.place(relx=0.4, rely=0.5)

button2 = tk.Button(root, text="Create New Account", command=create, height=2, width=40)
button2.place(relx=0.4, rely=0.57)

label = tk.Label(root, text="SELECT YOUR LOGIN", bg="yellow", height=3, width="54")
label.place(relx=0.37, rely=0.4)

root.mainloop()
