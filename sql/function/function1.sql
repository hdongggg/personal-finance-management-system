USE PersonalFinanceDB;

DROP FUNCTION IF EXISTS fn_total_income;

DELIMITER $$

CREATE FUNCTION fn_total_income (
    p_UserID INT,
    p_Year INT,
    p_Month INT
)
RETURNS DECIMAL(15,2)
DETERMINISTIC
BEGIN
    DECLARE v_TotalIncome DECIMAL(15,2);

    SELECT IFNULL(SUM(Amount), 0)
    INTO v_TotalIncome
    FROM Income
    WHERE UserID = p_UserID
      AND YEAR(IncomeDate) = p_Year
      AND MONTH(IncomeDate) = p_Month;

    RETURN v_TotalIncome;
END $$

DELIMITER ;
SELECT fn_total_income(1, 2026, 4) AS TotalIncome;