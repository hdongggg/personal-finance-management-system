SELECT *
FROM CategorySpendingView
WHERE UserID = 1;
SELECT *
FROM CategorySpendingView
WHERE CategoryName = 'Food'
  AND ExpenseYear = 2026
  AND ExpenseMonth = 4;