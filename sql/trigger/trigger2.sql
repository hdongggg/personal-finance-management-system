
DELIMITER $$

CREATE TRIGGER trg_after_income_insert
AFTER INSERT ON Income
FOR EACH ROW
BEGIN
    INSERT INTO BalanceHistory (
        AccountID, ChangeType, AmountChanged, BalanceBefore, BalanceAfter,
        ReferenceType, ReferenceID, Description
    )
    SELECT
        AccountID,
        'CREDIT',
        NEW.Amount,
        Balance,
        Balance + NEW.Amount,
        'INCOME',
        NEW.IncomeID,
        NEW.Description
    FROM BankAccounts
    WHERE AccountID = NEW.AccountID;

    UPDATE BankAccounts
    SET Balance = Balance + NEW.Amount
    WHERE AccountID = NEW.AccountID;
END $$

DELIMITER ;