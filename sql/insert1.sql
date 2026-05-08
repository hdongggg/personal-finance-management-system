-- Insert sample income using stored procedure
-- Trigger trg_after_income_insert will update account balance
-- and insert balance history automatically.
-- ------------------------------------------------------------

CALL AddIncomeProc(
    1,
    1,
    10000000.00,
    '2026-05-01',
    'Monthly salary'
);

CALL AddIncomeProc(
    1,
    2,
    2000000.00,
    '2026-05-03',
    'Freelance content writing'
);

CALL AddIncomeProc(
    2,
    3,
    8000000.00,
    '2026-05-01',
    'Monthly salary'
);

CALL AddIncomeProc(
    3,
    4,
    3000000.00,
    '2026-05-02',
    'Part-time income'
);
