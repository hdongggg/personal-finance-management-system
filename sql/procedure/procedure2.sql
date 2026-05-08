USE PersonalFinanceDB;

DELIMITER $$

CREATE PROCEDURE AddExpenseProc (
    IN p_UserID INT,
    IN p_CategoryID INT,
    IN p_AccountID INT,
    IN p_Amount DECIMAL(15,2),
    IN p_ExpenseDate DATE,
    IN p_Description VARCHAR(255)
)
BEGIN
    INSERT INTO Expenses (UserID, CategoryID, AccountID, Amount, ExpenseDate, Description)
    VALUES (p_UserID, p_CategoryID, p_AccountID, p_Amount, p_ExpenseDate, p_Description);
END $$

DELIMITER ;