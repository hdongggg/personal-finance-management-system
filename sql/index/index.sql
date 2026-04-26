
-- INDEXES FOR PersonalFinanceDB

USE PersonalFinanceDB;

-- 1. Index for looking up bank accounts by user
CREATE INDEX idx_bankaccounts_userid
ON BankAccounts(UserID);

-- 2. Index for searching income by user and date
CREATE INDEX idx_income_user_date
ON Income(UserID, IncomeDate);

-- 3. Index for searching expenses by user and date
CREATE INDEX idx_expenses_user_date
ON Expenses(UserID, ExpenseDate);

-- 4. Index for searching expenses by category
CREATE INDEX idx_expenses_categoryid
ON Expenses(CategoryID);

-- 5. Index for searching expenses by account
CREATE INDEX idx_expenses_accountid
ON Expenses(AccountID);

-- 6. Index for searching income by account
CREATE INDEX idx_income_accountid
ON Income(AccountID);

-- 7. Index for searching balance history
CREATE INDEX idx_balancehistory_account_time
ON BalanceHistory(AccountID, ChangedAt);

CREATE INDEX idx_balancehistory_reference
ON BalanceHistory(ReferenceType, ReferenceID);