USE PersonalFinanceDB;
-- 1. INSERT INTO Users

INSERT INTO Users (UserID, UserName, Email, PhoneNumber) VALUES
(1, 'Mai Huy Dong', 'hdongm1607@gmail.com', '0901234567'),
(2, 'Ta Thanh Dat', 'thanhdat636@gmail.com', '0912345678'),
(3, 'Dang Nhat Minh', 'dnminh17@gmail.com', '0923456789'),
(4, 'Bui Dang Cuong', 'dangcuong21@gmail.com', '0934567890'),
(5, 'Bui Duy Anh', 'danhbui29@gmail.com', '0945678901');

-- 2. INSERT INTO ExpenseCategories

INSERT INTO ExpenseCategories (CategoryID, CategoryName) VALUES
(1, 'Food'),
(2, 'Transport'),
(3, 'Education'),
(4, 'Shopping'),
(5, 'Health'),
(6, 'Entertainment');

-- 3. INSERT INTO BankAccounts
-- =========================
INSERT INTO BankAccounts (AccountID, UserID, BankName, Balance) VALUES
(1, 1, 'Vietcombank', 5000000.00),
(2, 1, 'Techcombank', 2500000.00),
(3, 2, 'SHB', 4200000.00),
(4, 3, 'MB Bank', 3000000.00),
(5, 4, 'BIDV', 2800000.00),
(6, 5, 'Sacombank', 3500000.00);

-- 4. INSERT INTO Income

INSERT INTO Income (IncomeID, UserID, AccountID, Amount, IncomeDate, Description) VALUES
(1, 1, 1, 10000000.00, '2026-04-01', 'Monthly salary'),
(2, 1, 2, 2000000.00, '2026-04-05', 'Freelance income'),
(3, 2, 3, 8000000.00, '2026-04-02', 'Monthly salary'),
(4, 3, 4, 6500000.00, '2026-04-03', 'Part-time teaching'),
(5, 4, 5, 9000000.00, '2026-04-01', 'Monthly salary'),
(6, 5, 6, 7000000.00, '2026-04-04', 'Business income'),
(7, 2, 3, 1500000.00, '2026-04-12', 'Bonus'),
(8, 3, 4, 1000000.00, '2026-04-18', 'Project allowance');

-- 5. INSERT INTO Expenses

INSERT INTO Expenses (ExpenseID, UserID, CategoryID, AccountID, Amount, ExpenseDate, Description) VALUES
(1, 1, 1, 1, 30000.00, '2026-04-02', 'Breakfast'),
(2, 1, 2, 1, 100000.00, '2026-04-03', 'Taxi fare'),
(3, 1, 3, 2, 1200000.00, '2026-04-06', 'Online course'),
(4, 2, 1, 3, 80000.00, '2026-04-04', 'Lunch'),
(5, 2, 4, 3, 600000.00, '2026-04-08', 'New shoes'),
(6, 3, 5, 4, 300000.00, '2026-04-09', 'Medicine'),
(7, 3, 6, 4, 200000.00, '2026-04-10', 'Movie ticket'),
(8, 4, 1, 5, 150000.00, '2026-04-05', 'Dinner'),
(9, 5, 2, 6, 120000.00, '2026-04-07', 'Bus card'),
(10, 5, 4, 6, 450000.00, '2026-04-15', 'Clothes shopping');