DROP DATABASE IF EXISTS PersonalFinanceDB;
CREATE DATABASE PersonalFinanceDB;
USE PersonalFinanceDB;

-- =========================
-- 1. USERS
-- =========================
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    UserName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    PhoneNumber VARCHAR(20)
);

-- =========================
-- 2. EXPENSE CATEGORIES
-- =========================
CREATE TABLE ExpenseCategories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL UNIQUE
);

-- =========================
-- 3. BANK ACCOUNTS
-- =========================
CREATE TABLE BankAccounts (
    AccountID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    BankName VARCHAR(100) NOT NULL,
    Balance DECIMAL(15,2) NOT NULL DEFAULT 0.00,
    CONSTRAINT fk_bankaccounts_user
        FOREIGN KEY (UserID) REFERENCES Users(UserID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =========================
-- 4. INCOME
-- =========================
CREATE TABLE Income (
    IncomeID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    AccountID INT NOT NULL,
    Amount DECIMAL(15,2) NOT NULL,
    IncomeDate DATE NOT NULL,
    Description VARCHAR(255),
    CONSTRAINT chk_income_amount CHECK (Amount > 0),
    CONSTRAINT fk_income_user
        FOREIGN KEY (UserID) REFERENCES Users(UserID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_income_account
        FOREIGN KEY (AccountID) REFERENCES BankAccounts(AccountID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =========================
-- 5. EXPENSES
-- =========================
CREATE TABLE Expenses (
    ExpenseID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    CategoryID INT NOT NULL,
    AccountID INT NOT NULL,
    Amount DECIMAL(15,2) NOT NULL,
    ExpenseDate DATE NOT NULL,
    Description VARCHAR(255),
    CONSTRAINT chk_expense_amount CHECK (Amount > 0),
    CONSTRAINT fk_expenses_user
        FOREIGN KEY (UserID) REFERENCES Users(UserID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_expenses_category
        FOREIGN KEY (CategoryID) REFERENCES ExpenseCategories(CategoryID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT fk_expenses_account
        FOREIGN KEY (AccountID) REFERENCES BankAccounts(AccountID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =========================
-- 6. BALANCE HISTORY
-- =========================
CREATE TABLE BalanceHistory (
    HistoryID INT AUTO_INCREMENT PRIMARY KEY,
    AccountID INT NOT NULL,
    ChangeType ENUM('OPENING','CREDIT','DEBIT') NOT NULL,
    AmountChanged DECIMAL(15,2) NOT NULL,
    BalanceBefore DECIMAL(15,2) NOT NULL,
    BalanceAfter DECIMAL(15,2) NOT NULL,
    ChangedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ReferenceType ENUM('ACCOUNT','INCOME','EXPENSE') NOT NULL,
    ReferenceID INT NULL,
    Description VARCHAR(255),
    CONSTRAINT fk_balancehistory_account
        FOREIGN KEY (AccountID) REFERENCES BankAccounts(AccountID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);