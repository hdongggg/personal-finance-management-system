USE PersonalFinanceDB;
SELECT e.ExpenseID, u.UserName, c.CategoryName, b.BankName, e.Amount, e.ExpenseDate, e.Description
FROM Expenses e
JOIN Users u ON e.UserID = u.UserID
JOIN ExpenseCategories c ON e.CategoryID = c.CategoryID
JOIN BankAccounts b ON e.AccountID = b.AccountID;