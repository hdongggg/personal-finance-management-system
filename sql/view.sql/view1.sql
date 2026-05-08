USE PersonalFinanceDB;
DROP view if exists monthlysummaryview;
CREATE VIEW MonthlySummaryView AS
SELECT 
    u.UserID,
    u.UserName,
	CONCAT(CombinedData.SummaryYear, '-', LPAD(CombinedData.SummaryMonth, 2, '0')) AS YearMonth,
    CombinedData.SummaryYear,
    CombinedData.SummaryMonth,
    SUM(CombinedData.TotalIncome) AS TotalIncome,
    SUM(CombinedData.TotalExpense) AS TotalExpense,
    SUM(CombinedData.TotalIncome) - SUM(CombinedData.TotalExpense) AS NetAmount
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