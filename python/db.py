import mysql.connector

def get_connection():
    connection = mysql.connector.connect(
        host="localhost",
        user="finance_app",
        password="Finance@123",
        database="PersonalFinanceDB"
    )
    return connection

if __name__ == "__main__":
    try:
        conn = get_connection()
        print("Connected to MySQL successfully!")
        conn.close()
    except mysql.connector.Error as err:
        print(f"Error: {err}")