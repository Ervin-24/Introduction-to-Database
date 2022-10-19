CREATE DATABASE WatchAN
GO

USE WatchAN

CREATE TABLE Customers (
CustomerID CHAR(5) NOT NULL PRIMARY KEY
CHECK(CustomerID like 'CU%' AND CustomerID like '%[0-9][0-9][0-9]'),
CustomerName VARCHAR(255)
CHECK(LEN(CustomerName) >= 6 AND LEN(CustomerName) <= 12),
CustomerGender VARCHAR(8)
CHECK(CustomerGender = 'Male' OR CustomerGender = 'Female'),
CustomerAddress VARCHAR(255),
CustomerPhone VARCHAR(255)
CHECK(CustomerPhone LIKE '0%')
)

CREATE TABLE Vendor (
VendorID CHAR(5) NOT NULL PRIMARY KEY
CHECK(VendorID like 'VN%' AND VendorID like '%[0-9][0-9][0-9]'),
VendorName VARCHAR(255)
CHECK(VendorName LIKE 'PT %'),
VendorAddress VARCHAR(255),
VendorPhone VARCHAR(255),
VendorEmail VARCHAR(255)
CHECK(VendorEmail LIKE '%@%')
)

CREATE TABLE Agent (
AgentID CHAR(5) NOT NULL PRIMARY KEY
CHECK(AgentID like 'AG%' AND AgentID like '%[0-9][0-9][0-9]'),
AgentName VARCHAR(255),
AgentGender VARCHAR(8)
CHECK(AgentGender = 'Male' OR AgentGender = 'Female'),
AgentAddress VARCHAR(255)
CHECK(AgentAddress LIKE '% Street'),
AgentEmail VARCHAR(255),
AgentPhone VARCHAR(255),
AgentSalary INT
)

CREATE TABLE Brand (
BrandID CHAR(5) NOT NULL PRIMARY KEY
CHECK(BrandID like 'BD%' AND BrandID like '%[0-9][0-9][0-9]'),
BrandName VARCHAR(25)
)

CREATE TABLE Watch (
WatchID CHAR(5) NOT NULL PRIMARY KEY
CHECK(WatchID like 'WA%' AND WatchID like '%[0-9][0-9][0-9]'),
BrandID CHAR(5) FOREIGN KEY REFERENCES Brand(BrandID),
WatchName VARCHAR(255),
WatchPrice INT CHECK(WatchPrice > 100000),
WatchStock INT
)

CREATE TABLE SalesTransaction (
SalesTransactionID CHAR(5) NOT NULL PRIMARY KEY
CHECK(SalesTransactionID like 'SA%' AND SalesTransactionID like '%[0-9][0-9][0-9]'),
CustomerID CHAR(5) FOREIGN KEY REFERENCES Customers(CustomerID),
AgentID CHAR(5) FOREIGN KEY REFERENCES Agent(AgentID),
SalesDate DATE
)

CREATE TABLE SalesTransactionDetail (
SalesTransactionID CHAR(5) FOREIGN KEY REFERENCES SalesTransaction(SalesTransactionID),
WatchID CHAR(5) FOREIGN KEY REFERENCES Watch(WatchID),
QuantityOfEachWatch INT
)

CREATE TABLE PurchaseTransaction (
PurchaseTransactionID CHAR(5) NOT NULL PRIMARY KEY
CHECK(PurchaseTransactionID like 'PC%' AND PurchaseTransactionID like '%[0-9][0-9][0-9]'),
VendorID CHAR(5) FOREIGN KEY REFERENCES Vendor(VendorID),
AgentID CHAR(5) FOREIGN KEY REFERENCES Agent(AgentID),
PurchaseDate DATE
)

CREATE TABLE PurchaseTransactionDetail (
PurchaseTransactionID CHAR(5) FOREIGN KEY REFERENCES PurchaseTransaction(PurchaseTransactionID),
WatchID CHAR(5) FOREIGN KEY REFERENCES Watch(WatchID),
QuantityOfEachWatch INT
)



