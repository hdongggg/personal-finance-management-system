
DELIMITER $$

CREATE TRIGGER trg_after_account_insert
AFTER INSERT ON BankAccounts
FOR EACH ROW
BEGIN
    IF NEW.Balance > 0 THEN
        INSERT INTO BalanceHistory (
            AccountID, ChangeType, AmountChanged, BalanceBefore, BalanceAfter,
            ReferenceType, ReferenceID, Description
        )
        VALUES (
            NEW.AccountID, 'OPENING', NEW.Balance, 0.00, NEW.Balance,
            'ACCOUNT', NEW.AccountID, 'Opening balance'
        );
    END IF;
END $$

DELIMITER ;