USE PersonalFinanceDB;

DELIMITER $$

CREATE PROCEDURE MonthlyClosureProc (
    IN p_UserID INT,
    IN p_Year INT,
    IN p_Month INT
)
BEGIN
    SELECT
        u.UserID,
        u.UserName,
        p_Year AS SummaryYear,
        p_Month AS SummaryMonth,
        IFNULL((
            SELECT SUM(i.Amount)
            FROM Income i
            WHERE i.UserID = p_UserID
              AND YEAR(i.IncomeDate) = p_Year
              AND MONTH(i.IncomeDate) = p_Month
        ), 0) AS TotalIncome,
        IFNULL((
            SELECT SUM(e.Amount)
            FROM Expenses e
            WHERE e.UserID = p_UserID
              AND YEAR(e.ExpenseDate) = p_Year
              AND MONTH(e.ExpenseDate) = p_Month
        ), 0) AS TotalExpense,
        IFNULL((
            SELECT SUM(i.Amount)
            FROM Income i
            WHERE i.UserID = p_UserID
              AND YEAR(i.IncomeDate) = p_Year
              AND MONTH(i.IncomeDate) = p_Month
        ), 0)
        -
        IFNULL((
            SELECT SUM(e.Amount)
            FROM Expenses e
            WHERE e.UserID = p_UserID
              AND YEAR(e.ExpenseDate) = p_Year
              AND MONTH(e.ExpenseDate) = p_Month
        ), 0) AS NetAmount
    FROM Users u
    WHERE u.UserID = p_UserID;
END $$

DELIMITER ;
CALL MonthlyClosureProc(2, 2026, 4);