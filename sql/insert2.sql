-- ------------------------------------------------------------
-- Insert sample expenses using stored procedure
-- Trigger trg_before_expense_insert_check_balance will check balance.
-- Trigger trg_after_expense_insert will update balance and history.
-- ------------------------------------------------------------

CALL AddExpenseProc(
    1,
    1,
    1,
    500000.00,
    '2026-05-04',
    'Groceries and lunch'
);

CALL AddExpenseProc(
    1,
    1,
    2,
    200000.00,
    '2026-05-05',
    'Taxi and parking'
);

CALL AddExpenseProc(
    1,
    2,
    4,
    150000.00,
    '2026-05-06',
    'Movie ticket'
);

CALL AddExpenseProc(
    2,
    3,
    1,
    700000.00,
    '2026-05-04',
    'Family dinner'
);

CALL AddExpenseProc(
    3,
    4,
    5,
    350000.00,
    '2026-05-05',
    'Online course'
);
