USE PersonalFinanceDB;

DROP FUNCTION IF EXISTS fn_current_balance;

DELIMITER $$

CREATE FUNCTION fn_current_balance (
    p_AccountID INT
)
RETURNS DECIMAL(15,2)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_CurrentBalance DECIMAL(15,2);

    SELECT IFNULL(Balance, 0)
    INTO v_CurrentBalance
    FROM BankAccounts
    WHERE AccountID = p_AccountID;

    RETURN v_CurrentBalance;
END $$

DELIMITER ;