
DELIMITER $$

CREATE TRIGGER trg_before_expense_insert_check_balance
BEFORE INSERT ON Expenses
FOR EACH ROW
BEGIN
    DECLARE v_CurrentBalance DECIMAL(15,2);

    SELECT Balance
    INTO v_CurrentBalance
    FROM BankAccounts
    WHERE AccountID = NEW.AccountID;

    IF v_CurrentBalance < NEW.Amount THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insufficient balance in bank account';
    END IF;
END $$

DELIMITER ;