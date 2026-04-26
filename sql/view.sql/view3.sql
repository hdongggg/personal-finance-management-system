
CREATE VIEW BalanceHistoryView AS
SELECT
    bh.HistoryID,
    bh.AccountID,
    u.UserName,
    b.BankName,
    bh.ChangeType,
    bh.AmountChanged,
    bh.BalanceBefore,
    bh.BalanceAfter,
    bh.ChangedAt,
    bh.ReferenceType,
    bh.ReferenceID,
    bh.Description
FROM BalanceHistory bh
JOIN BankAccounts b ON bh.AccountID = b.AccountID
JOIN Users u ON b.UserID = u.UserID;