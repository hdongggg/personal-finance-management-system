USE PersonalFinanceDB;
DELIMITER $$

CREATE FUNCTION fn_budget_status (
    p_UserID INT,
    p_Year INT,
    p_Month INT,
    p_BudgetLimit DECIMAL(15,2)
)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE v_TotalExpense DECIMAL(15,2);

    SET v_TotalExpense = fn_total_expense(p_UserID, p_Year, p_Month);

    IF v_TotalExpense <= p_BudgetLimit THEN
        RETURN 'Within Budget';
    ELSE
        RETURN 'Over Budget';
    END IF;
END $$

DELIMITER ;
SELECT fn_budget_status(1, 2026, 4, 10000000.00) AS BudgetStatus;