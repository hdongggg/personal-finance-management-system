
DELIMITER $$

CREATE TRIGGER trg_after_expense_insert
AFTER INSERT ON Expenses
FOR EACH ROW
BEGIN
    INSERT INTO BalanceHistory (
        AccountID, ChangeType, AmountChanged, BalanceBefore, BalanceAfter,
        ReferenceType, ReferenceID, Description
    )
    SELECT
        AccountID,
        'DEBIT',
        NEW.Amount,
        Balance,
        Balance - NEW.Amount,
        'EXPENSE',
        NEW.ExpenseID,
        NEW.Description
    FROM BankAccounts
    WHERE AccountID = NEW.AccountID;

    UPDATE BankAccounts
    SET Balance = Balance - NEW.Amount
    WHERE AccountID = NEW.AccountID;
END $$

DELIMITER ;