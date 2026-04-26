USE PersonalFinanceDB;

CREATE VIEW MonthlySummaryView AS
SELECT 
    u.UserID,
    u.UserName,
    SummaryYear,
    SummaryMonth,
    SUM(TotalIncome) AS TotalIncome,
    SUM(TotalExpense) AS TotalExpense,
    SUM(TotalIncome) - SUM(TotalExpense) AS NetAmount
FROM Users u
JOIN (
    SELECT 
        UserID,
        YEAR(IncomeDate) AS SummaryYear,
        MONTH(IncomeDate) AS SummaryMonth,
        SUM(Amount) AS TotalIncome,
        0 AS TotalExpense
    FROM Income
    GROUP BY UserID, YEAR(IncomeDate), MONTH(IncomeDate)

    UNION ALL

    SELECT 
        UserID,
        YEAR(ExpenseDate) AS SummaryYear,
        MONTH(ExpenseDate) AS SummaryMonth,
        0 AS TotalIncome,
        SUM(Amount) AS TotalExpense
    FROM Expenses
    GROUP BY UserID, YEAR(ExpenseDate), MONTH(ExpenseDate)
) AS CombinedData
ON u.UserID = CombinedData.UserID
GROUP BY u.UserID, u.UserName, SummaryYear, SummaryMonth;