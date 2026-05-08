USE PersonalFinanceDB;

-- ============================================================
-- 8. TEST QUERIES
-- ============================================================

SHOW TABLES;

SELECT *
FROM Users;

SELECT *
FROM ExpenseCategories;

SELECT *
FROM BankAccounts;

SELECT *
FROM Income;

SELECT *
FROM Expenses;

SELECT *
FROM BalanceHistory
ORDER BY ChangedAt, HistoryID;

SELECT *
FROM BalanceHistoryView
ORDER BY ChangedAt, HistoryID;

SELECT *
FROM MonthlySummaryView
ORDER BY UserID, SummaryYear, SummaryMonth;

SELECT *
FROM CategorySpendingView
ORDER BY UserID, CategoryName, ExpenseYear, ExpenseMonth;

-- ============================================================
-- TEST FUNCTIONS
-- Dữ liệu backup chủ yếu nằm ở tháng 4/2026
-- ============================================================

SELECT fn_total_income(1, 2026, 4) AS User1_TotalIncome;

SELECT fn_total_expense(1, 2026, 4) AS User1_TotalExpense;

SELECT fn_net_amount(1, 2026, 4) AS User1_NetAmount;

SELECT fn_budget_status(1, 2026, 4, 10000000.00) AS User1_BudgetStatus;

SELECT fn_current_balance(1) AS Account1_CurrentBalance;

-- ============================================================
-- TEST PROCEDURE
-- ============================================================

CALL MonthlyClosureProc(1, 2026, 4);

-- ============================================================
-- TEST INSUFFICIENT BALANCE CASE
-- Lưu ý AddExpenseProc có thứ tự:
-- UserID, CategoryID, AccountID, Amount, ExpenseDate, Description
-- ============================================================

-- CALL AddExpenseProc(
--     1,
--     1,
--     1,
--     999999999.00,
--     '2026-04-30',
--     'This should fail due to insufficient balance'
-- );