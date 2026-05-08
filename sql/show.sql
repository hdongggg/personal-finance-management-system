-- ============================================================
-- 9. USEFUL ADMIN COMMANDS
-- ============================================================

-- ------------------------------------------------------------
-- Show indexes
-- ------------------------------------------------------------

SHOW INDEX FROM Users;
SHOW INDEX FROM ExpenseCategories;
SHOW INDEX FROM BankAccounts;
SHOW INDEX FROM Income;
SHOW INDEX FROM Expenses;
SHOW INDEX FROM BalanceHistory;


-- ------------------------------------------------------------
-- Show triggers
-- ------------------------------------------------------------

SHOW TRIGGERS;


-- ------------------------------------------------------------
-- Show procedures
-- ------------------------------------------------------------

SHOW PROCEDURE STATUS
WHERE Db = 'PersonalFinanceDB';


-- ------------------------------------------------------------
-- Show functions
-- ------------------------------------------------------------

SHOW FUNCTION STATUS
WHERE Db = 'PersonalFinanceDB';