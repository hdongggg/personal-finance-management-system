# 💰 Personal Finance Management System

A comprehensive database-driven personal finance management system built with **MySQL** and **Python**. Track income, expenses, budgets, and generate financial reports with ease.

---

## ✨ Features

**User & Account Management**
- Manage user profiles and bank accounts
- Track account balances in real-time

**Transaction Management**
- Record income and expense transactions
- Categorize expenses for better organization
- View complete transaction history

**Financial Insights**
- Monthly income vs. expense summaries
- Category-wise spending analysis
- Budget status monitoring
- Interactive charts (bar charts, pie charts)

**Balance Tracking**
- Automatic balance history logging
- Track all balance changes with timestamps

---

## 🛠️ Tech Stack

| Component | Technology |
|---|---|
| **Database** | MySQL |
| **Backend** | Python 3.x |
| **Database Connector** | mysql-connector-python |
| **Visualization** | matplotlib |

---

## 📁 Project Structure

```
project DB/
├── python/              # Python application
│   ├── main.py         # Main CLI application
│   ├── db.py           # Database connection
│   ├── finance.py      # Finance functions
│   └── tempCodeRunnerFile.py
├── sql/                # Database scripts
│   ├── schema/         # Table definitions
│   ├── function/       # SQL functions
│   ├── procedure/      # Stored procedures
│   ├── trigger/        # Database triggers
│   ├── index/          # Index definitions
│   └── view.sql/       # Database views
├── sample_data.sql/    # Sample test data
├── report/             # Report templates
└── PersonalFinanceDB_backup.sql
```

---

## 🚀 Quick Start

### Prerequisites
- Python 3.x
- MySQL Server

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/hdongggg/personal-finance-management-system.git
   cd personal-finance-management-system
   ```

2. **Install dependencies**
   ```bash
   pip install -r requirements.txt
   ```

3. **Setup Database**
   ```bash
   # Create database
   mysql -u root -p -e "CREATE DATABASE personal_finance;"
   
   # Import schema
   mysql -u root -p personal_finance < sql/schema/schema.sql
   
   # Import other SQL files (functions, procedures, triggers, views)
   mysql -u root -p personal_finance < sql/function/function1.sql
   mysql -u root -p personal_finance < sql/procedure/procedure1.sql
   # ... continue with other files
   ```

4. **Configure Database Connection**
   Edit `python/db.py`:
   ```python
   host = "localhost"
   user = "your_username"
   password = "your_password"
   database = "personal_finance"
   ```

5. **Run the Application**
   ```bash
   cd python
   python main.py
   ```

---

## 📖 Main Menu Options

```
1. Add Income
2. Add Expense
3. View Monthly Summary
4. View Category-wise Spending
5. Check Budget Status
6. View Users
7. View Categories
8. View Bank Accounts
9. View Income History
10. View Expense History
11. Report: Income vs Expense Chart
12. Report: Category Spending Pie Chart
13. Add User
14. Add Bank Account
15. View Accounts by User
16. View Balance History
17. View Current Balance
```

---

## 🗄️ Database Design

**Core Tables:**
- Users, BankAccounts, ExpenseCategories
- Income, Expenses, BalanceHistory

**Advanced Features:**
- Stored Procedures for transaction processing
- Triggers for automatic balance updates
- Views for easy data retrieval
- Functions for calculations
- Indexes for optimization

---

## 💾 Backup & Restore

**Backup:**
```bash
mysqldump -u root -p personal_finance > backup.sql
```

**Restore:**
```bash
mysql -u root -p personal_finance < backup.sql
```

---

## 📝 License

Created for educational purposes at **National Economics University (NEU)**.

---

## 👤 Author

**Mai Huy Đông** - National Economics University

---

**Last Updated:** April 2026

procedures.sql

Creates stored procedures such as:

AddIncomeProc
AddExpenseProc
MonthlyClosureProc

These procedures organize business logic inside the database.

functions.sql

Creates SQL functions such as:

fn_total_income
fn_total_expense
fn_net_amount
fn_budget_status
fn_current_balance

These functions support summaries, budget checking, and balance queries.

triggers.sql

Creates triggers for:

recording opening balance history
automatically increasing account balance after income insertion
automatically decreasing account balance after expense insertion
preventing expense insertion when balance is insufficient
7. Database Design Summary

The database contains the following main tables:

Users
ExpenseCategories
BankAccounts
Income
Expenses
BalanceHistory
Main relationships
Users 1 - N BankAccounts
Users 1 - N Income
Users 1 - N Expenses
ExpenseCategories 1 - N Expenses
BankAccounts 1 - N Income
BankAccounts 1 - N Expenses
BankAccounts 1 - N BalanceHistory
Design Notes
Each income transaction is linked to exactly one bank account
Each expense transaction is linked to one user, one category, and one bank account
Account balances are updated automatically through triggers
Each balance change is recorded in BalanceHistory for tracking and auditing
8. Advanced SQL Features

This project demonstrates the following advanced SQL features:

Indexes

Used to improve performance for:

transaction lookup
monthly summaries
category-based reports
balance history queries
Views

Used to simplify complex reporting queries.

Main views:

monthly summary view
category spending view
balance history view
Functions

Used to calculate:

total income
total expense
net amount
budget status
current balance
Stored Procedures

Used to:

add income
add expense
generate monthly closure summary
Triggers

Used to:

record opening balance history
update account balance after income
update account balance after expense
block invalid expense if balance is insufficient
9. How to Run the Project
Step 1: Open the project folder

Open the project folder in VS Code or another code editor.

Step 2: Install required Python libraries
pip install mysql-connector-python
pip install matplotlib
Step 3: Configure database connection

Open python/db.py and update the MySQL connection settings:

connection = mysql.connector.connect(
    host="localhost",
    user="finance_app",
    password="YOUR_PASSWORD",
    database="PersonalFinanceDB"
)
Step 4: Create and initialize the database

Run the SQL files in this order inside MySQL Workbench:

schema.sql
sample_data.sql
indexes.sql
views.sql
procedures.sql
functions.sql
triggers.sql

If you are using the final version with BalanceHistory, make sure the SQL files match that schema.

Step 5: Run the Python application

Open terminal in the python/ folder and run:

python main.py
10. Main CLI Features

The Python CLI application currently supports:

Add User
Add Bank Account
Add Income
Add Expense
View Users
View Categories
View Bank Accounts
View Accounts by User
View Income History
View Expense History
View Monthly Summary
View Category-wise Spending
Check Budget Status
View Balance History
View Current Balance
Report: Income vs Expense Chart
Report: Category Spending Pie Chart
11. Validation and Data Integrity

The system includes validation in both Python and MySQL:

Python-side validation
checks whether UserID exists
checks whether AccountID exists
checks whether CategoryID exists
checks whether an account belongs to the selected user
checks that transaction amount is positive
Database-side validation
foreign key constraints
unique email constraint
trigger-based balance update
trigger-based insufficient balance prevention
12. Backup and Recovery
Backup
"C:\Program Files\MySQL\MySQL Server 8.4\bin\mysqldump.exe" -u root -p --routines --triggers PersonalFinanceDB > PersonalFinanceDB_backup_final.sql
Recovery
"C:\Program Files\MySQL\MySQL Server 8.4\bin\mysql.exe" -u root -p PersonalFinanceDB < PersonalFinanceDB_backup_final.sql
Notes
mysqldump is used for database backup
mysql.exe is used to restore the backup
--routines --triggers ensures procedures, functions, and triggers are included in the backup
13. Current Project Status
Completed
ERD and relational schema
Table creation
Sample data insertion
Indexes
Views
Functions
Stored procedures
Triggers
Backup and recovery commands
Python database connection
Python CLI menu
Financial reporting queries
Chart generation
Balance history tracking
In Progress
Final testing
Screenshot collection for report
GitHub repository preparation
Final report writing
Demo video recording
Planned Improvements
Better CLI formatting
Export reports to file
Stronger date validation
Account-specific chart filters
Optional GUI or web version in the future
14. Future Work

Possible future improvements include:

Flask or web-based interface
Mobile application version
Real banking API integration
Multi-currency support
Predictive spending analysis
Email budget alerts
Export to PDF or Excel
15. Conclusion

This project demonstrates how MySQL and Python can be combined to build a practical personal finance management system. The database supports structured storage, automatic balance tracking, budget checking, and financial reporting. The Python application provides a simple interface for interacting with the system and testing its core features.
