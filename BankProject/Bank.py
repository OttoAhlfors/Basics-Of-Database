from re import search
import sqlite3

db = sqlite3.connect('BankProject.db')
cursor = db.cursor()

def initializeDB():
    try:
        f = open("sqlcommands.sql", "r")
        commandstring = ""
        for line in f.readlines():
            commandstring+=line
        cursor.executescript(commandstring)
        print("Database initialized")
    except sqlite3.OperationalError:
        print("Database exists, skip initialization")
    except:
        print("No SQL file to be used for initialization") 

def main():
    initializeDB()
    userInput = -1
    while (userInput != '0'):
        print("\nMenu:")
        print("1: Print all available banks")
        print("2: Search for an available bank")
        print("3: Add a new account")
        print("4: Delete an account")
        print("5: Modify user infomation")
        print("0: Quit")
        userInput = input("Your choice: ")
        print("")
        if userInput == '1':
            printBank()
        if userInput == '2':
            searchBank()
        if userInput == '3':
            newAccount()
        if userInput == '4':
            deleteAccount()
        if userInput == '5':
            modifyAccount()
        if userInput == '0':
            print("Closing...")
    db.close()
    return

def printBank():
    print("Printing all bank information")
    for row in cursor.execute("SELECT * FROM Bank;"):
        print(row)
    return

def searchBank():
    bankInput = input("Select the city you want to find a bank in")
    cursor.execute("SELECT * FROM Bank WHERE bankLocation = (?)", (bankInput,))
    results = cursor.fetchall()
    for row in results:
        print(row)
    return

def newAccount():
    iban = input("Give IBAN for the new account: ")
    type = input("Give a type for the new account: ")
    password = input("Give a password for the new account: ")
    balance = input("Give a balance for the new account: ")
    cursor.execute("INSERT INTO Account VALUES ((SELECT accountId FROM Account ORDER BY accountId DESC LIMIT 1) + 1,(?),(?),(?),(?));", (iban, type, password, balance))
    
    for row in cursor.execute("SELECT * FROM Account;"):
        print(row)
    return

def deleteAccount():
    delAcc = input("Give the IBAN of the account you wish to delete: ")
    cursor.execute("DELETE FROM Account WHERE iban = (?);", (delAcc,))

    for row in cursor.execute("SELECT * FROM Account;"):
        print(row)
    return

def modifyAccount():
    modCol = -1
    modAcc = input("Give the IBAN of the account you wish to modify: ")
    while(modCol != "0"):
        print("1: Change IBAN")
        print("2: Change account type")
        print("3: Change password")
        print("4: Change balance")
        print("0: Quit")
        modCol = input("What do you wish to change? ")
        if modCol == '1':
            newIban = input("Give a new IBAN for the account: ")
            cursor.execute("UPDATE Account SET iban = (?) WHERE iban = (?);", (newIban, modAcc))
        if modCol == '2':
            newTyp = input("Give a new type for the account: ")
            cursor.execute("UPDATE Account SET type = (?) WHERE iban = (?);", (newTyp, modAcc))
        if modCol == '3':
            newPass = input("Give a new password for the account: ")
            cursor.execute("UPDATE Account SET password = (?) WHERE iban = (?);", (newPass, modAcc))
        if modCol == '4':
            newBal = input("Give a new balance for the account: ")
            cursor.execute("UPDATE Account SET balance = (?) WHERE iban = (?);", (newBal, modAcc))
        if modCol == '0':
            print("Ending account modification.")
    return

main()