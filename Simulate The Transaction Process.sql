--D. Query to simulate the transactions processes

--Customer,Vendor, Agent, Brand, Watch Data
SELECT * FROM Customers
INSERT INTO Customers 
VALUES
('CU012', 'Rudi Wijaya', 'Male', 'Sukaramai ', '085375431'),
('CU013', 'Bryan Vale', 'Male', 'Merdeka Timur ', '082276894')

SELECT * FROM Vendor
INSERT INTO Vendor
VALUES
('VN012', 'PT Merdeka Utama', 'Darussalam', '0862799262', 'merdekautama@gmail.com'),
('VN013', 'PT Rizky Ardologi', 'Panglateh', '0893874321', 'riz_ardo@gmail.com')

SELECT * FROM Agent
INSERT INTO Agent
VALUES
('AG012', 'Doni Gabriel', 'Male', 'Air Bersih Street', 'donigabriel@gmail.com', '0883883993', 6250000),
('AG013', 'Dyah Utari', 'Female', 'Listrik  Street', 'dyahutari@gmail.com', '08638297626', 4950000)

SELECT * FROM Brand
INSERT INTO Brand
VALUES
('BD011', 'Garmin'),
('BD012', 'Radolph')

SELECT * FROM Watch
INSERT INTO Watch
VALUES
('WA012', 'BD011', 'GA9', 220000, 10),
('WA013', 'BD012', 'RD60', 350000, 15)


--Simulate Purchase & Sales Transaction Process
--1
--Pada tanggal 24 Desember 2020, Doni Gabriel membeli 5 jam tangan dengan brand 'Garmin' di PT. Merdeka Utama
SELECT * FROM PurchaseTransaction
INSERT INTO PurchaseTransaction 
VALUES
('PC016', 'VN012', 'AG012', '2020-12-24')

 
SELECT * FROM PurchaseTransactionDetail
INSERT INTO PurchaseTransactionDetail
VALUES
('PC016', 'WA012', 5)


--2
--Pada tanggal 24 Januari 2021 , Bryan Vale membeli 1 jam tangan dengan brand 'Saiko' yang dilayani oleh Dyah Utari
SELECT * FROM SalesTransaction
INSERT INTO SalesTransaction
VALUES
('SA016', 'CU013', 'AG013', '2021-01-24')

SELECT * FROM SalesTransactionDetail
INSERT INTO SalesTransactionDetail
VALUES 
('SA016', 'WA012', 1)


