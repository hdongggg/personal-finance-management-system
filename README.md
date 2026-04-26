# Personal Finance Management System

## 1. Project Overview

The **Personal Finance Management System** is a database-driven personal finance application designed to help users manage financial activities in a structured and practical way. The system allows users to record income, expenses, bank accounts, expense categories, and account balance history.

This project uses **MySQL** for database management and **Python** for the command-line application. The main goal is to provide a simple and structured system that helps users track spending habits, monitor account balances, generate financial summaries, and check budget status.

---

## 2. Project Objectives

The main objectives of this project are:

- Manage user information
- Manage bank accounts
- Record income transactions
- Record expense transactions
- Categorize expenses
- Generate monthly financial summaries
- Check budget status
- Track account balance history
- Demonstrate advanced SQL features such as:
  - indexes
  - views
  - functions
  - stored procedures
  - triggers
  - backup and recovery

---

## 3. Main Features

### 3.1 User Management
- Add new users
- View users

### 3.2 Bank Account Management
- Add new bank accounts
- View all bank accounts
- View accounts by user
- Track current account balance

### 3.3 Income Management
- Add income transactions
- View income history

### 3.4 Expense Management
- Add expense transactions
- View expense history
- Categorize expenses by category

### 3.5 Financial Summary
- View monthly financial summary
- View category-wise spending
- Check budget status

### 3.6 Balance History Tracking
- Record opening balance
- Record credits and debits
- View balance history

### 3.7 Reporting
- Income vs Expense chart
- Category Spending pie chart

---

## 4. Technology Stack

| Component | Technology |
|---|---|
| Database | MySQL |
| Database Tool | MySQL Workbench |
| Programming Language | Python |
| Database Connector | mysql-connector-python |
| Reporting Charts | matplotlib |
| Backup Tool | mysqldump |
| Recovery Tool | mysql |

---

## 5. Project Structure

```text
project DB/
│
├── python/
│   ├── db.py
│   └── main.py
│
├── schema.sql
├── sample_data.sql
├── indexes.sql
├── views.sql
├── procedures.sql
├── functions.sql
├── triggers.sql
│
├── PersonalFinanceDB_backup_final.sql
│
├── report/
│   ├── chapters/
│   ├── image/
│   ├── main.tex
│   └── neu.sty
│
└── README.md
---

## 6. File Description

### 6.1 Python Files

#### `python/db.py`
This file is responsible for creating the MySQL database connection.

Main function:
- `get_connection()`

It is used by `main.py` to connect the Python application to MySQL.

#### `python/main.py`
This is the main command-line application file.

It provides a menu-driven system that allows the user to:
- add income
- add expense
- view users
- view categories
- view accounts
- view income history
- view expense history
- view monthly summary
- check budget status
- view balance history
- view current balance
- display charts

### 6.2 SQL Files

#### `schema.sql`
Creates the database tables:
- Users
- ExpenseCategories
- BankAccounts
- Income
- Expenses
- BalanceHistory

This file defines:
- primary keys
- foreign keys
- unique constraints
- check constraints

#### `sample_data.sql`
Inserts representative sample data into the tables for testing and demonstration.

#### `indexes.sql`
Creates indexes to improve performance for frequently queried columns such as:
- UserID
- AccountID
- CategoryID
- IncomeDate
- ExpenseDate
- ChangedAt

#### `views.sql`
Creates SQL views such as:
- `MonthlySummaryView`
- `CategorySpendingView`
- `BalanceHistoryView`

These views simplify reporting and data retrieval.

#### `procedures.sql`
Creates stored procedures such as:
- `AddIncomeProc`
- `AddExpenseProc`
- `MonthlyClosureProc`

These procedures organize business logic inside the database.

#### `functions.sql`
Creates SQL functions such as:
- `fn_total_income`
- `fn_total_expense`
- `fn_net_amount`
- `fn_budget_status`
- `fn_current_balance`

These functions support summaries, budget checking, and balance queries.

#### `triggers.sql`
Creates triggers for:
- recording opening balance history
- automatically increasing account balance after income insertion
- automatically decreasing account balance after expense insertion
- preventing expense insertion when balance is insufficient

---

## 7. Database Design Summary

The database contains the following main tables:

- Users
- ExpenseCategories
- BankAccounts
- Income
- Expenses
- BalanceHistory

### Main Relationships
- Users 1 - N BankAccounts
- Users 1 - N Income
- Users 1 - N Expenses
- ExpenseCategories 1 - N Expenses
- BankAccounts 1 - N Income
- BankAccounts 1 - N Expenses
- BankAccounts 1 - N BalanceHistory

### Design Notes
- Each income transaction is linked to exactly one bank account
- Each expense transaction is linked to one user, one category, and one bank account
- Account balances are updated automatically through triggers
- Each balance change is recorded in `BalanceHistory` for tracking and auditing

---

## 8. Advanced SQL Features

This project demonstrates the following advanced SQL features:

### Indexes
Used to improve performance for:
- transaction lookup
- monthly summaries
- category-based reports
- balance history queries

### Views
Used to simplify complex reporting queries.

Main views:
- monthly summary view
- category spending view
- balance history view

### Functions
Used to calculate:
- total income
- total expense
- net amount
- budget status
- current balance

### Stored Procedures
Used to:
- add income
- add expense
- generate monthly closure summary

### Triggers
Used to:
- record opening balance history
- update account balance after income
- update account balance after expense
- block invalid expense if balance is insufficient

---

## 9. How to Run the Project

### Step 1: Open the project folder
Open the project folder in VS Code or another code editor.

### Step 2: Install required Python libraries

```bash
pip install mysql-connector-python
pip install matplotlib

### Step 3: Configure database connection
Open `python/db.py` and update the MySQL connection settings:

```python
connection = mysql.connector.connect(
    host="localhost",
    user="finance_app",
    password="YOUR_PASSWORD",
    database="PersonalFinanceDB"
)

### Step 4: Create and initialize the database

Run the SQL files in this order inside MySQL Workbench:

schema.sql
sample_data.sql
indexes.sql
views.sql
procedures.sql
functions.sql
triggers.sql

If you are using the final version with BalanceHistory, make sure the SQL files match that schema.

### Step 5: Run the Python application

Open terminal in the python/ folder and run:

python main.py
## 10. Main CLI Features

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
## 11. Validation and Data Integrity

The system includes validation in both Python and MySQL.

Python-side Validation
checks whether UserID exists
checks whether AccountID exists
checks whether CategoryID exists
checks whether an account belongs to the selected user
checks that transaction amount is positive
Database-side Validation
foreign key constraints
unique email constraint
trigger-based balance update
trigger-based insufficient balance prevention
## 12. Backup and Recovery
Backup
"C:\Program Files\MySQL\MySQL Server 8.4\bin\mysqldump.exe" -u root -p --routines --triggers PersonalFinanceDB > PersonalFinanceDB_backup_final.sql
Recovery
"C:\Program Files\MySQL\MySQL Server 8.4\bin\mysql.exe" -u root -p PersonalFinanceDB < PersonalFinanceDB_backup_final.sql
Notes
mysqldump is used for database backup
mysql.exe is used to restore the backup
--routines --triggers ensures procedures, functions, and triggers are included in the backup
## 13. Current Project Status
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
## 14. Future Work

Possible future improvements include:

Flask or web-based interface
Mobile application version
Real banking API integration
Multi-currency support
Predictive spending analysis
Email budget alerts
Export to PDF or Excel
## 15. Conclusion

This project demonstrates how MySQL and Python can be combined to build a practical personal finance management system. The database supports structured storage, automatic balance tracking, budget checking, and financial reporting. The Python application provides a simple interface for interacting with the system and testing its core features.
