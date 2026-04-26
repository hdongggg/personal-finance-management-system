USE PersonalFinanceDB;


CREATE VIEW CategorySpendingView AS
SELECT
    u.UserID,
    u.UserName,
    c.CategoryID,
    c.CategoryName,
    YEAR(e.ExpenseDate) AS ExpenseYear,
    MONTH(e.ExpenseDate) AS ExpenseMonth,
    SUM(e.Amount) AS TotalCategoryExpense
FROM Expenses e
JOIN Users u ON e.UserID = u.UserID
JOIN ExpenseCategories c ON e.CategoryID = c.CategoryID
GROUP BY
    u.UserID,
    u.UserName,
    c.CategoryID,
    c.CategoryName,
    YEAR(e.ExpenseDate),
    MONTH(e.ExpenseDate)
ORDER BY c.CategoryID;