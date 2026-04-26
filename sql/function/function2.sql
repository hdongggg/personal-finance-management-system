USE PersonalFinanceDB;

DELIMITER $$

CREATE FUNCTION fn_total_expense (
    p_UserID INT,
    p_Year INT,
    p_Month INT
)
RETURNS DECIMAL(15,2)
DETERMINISTIC
BEGIN
    DECLARE v_TotalExpense DECIMAL(15,2);

    SELECT IFNULL(SUM(Amount), 0)
    INTO v_TotalExpense
    FROM Expenses
    WHERE UserID = p_UserID
      AND YEAR(ExpenseDate) = p_Year
      AND MONTH(ExpenseDate) = p_Month;

    RETURN v_TotalExpense;
END $$

DELIMITER ;
SELECT fn_total_expense(1, 2026, 4) AS TotalExpense; 