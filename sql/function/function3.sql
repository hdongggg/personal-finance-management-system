USE PersonalFinanceDB;

DELIMITER $$

CREATE FUNCTION fn_net_amount (
    p_UserID INT,
    p_Year INT,
    p_Month INT
)
RETURNS DECIMAL(15,2)
DETERMINISTIC
BEGIN
    DECLARE v_NetAmount DECIMAL(15,2);

    SET v_NetAmount = fn_total_income(p_UserID, p_Year, p_Month)
                    - fn_total_expense(p_UserID, p_Year, p_Month);

    RETURN v_NetAmount;
END $$

DELIMITER ;
SELECT fn_net_amount(1, 2026, 4) AS NetAmount;