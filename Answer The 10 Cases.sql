USE WatchAN
GO

--1
SELECT pt.PurchaseTransactionID,ag.AgentID, AgentGender,[Total Price ]=SUM (wa.WatchPrice * ptd.QuantityOfEachWatch)
FROM PurchaseTransaction pt JOIN Agent ag ON 
pt.AgentID = ag.AgentID JOIN PurchaseTransactionDetail ptd ON
ptd.PurchaseTransactionID = pt.PurchaseTransactionID JOIN Watch wa ON
wa.WatchID = wa.WatchID
WHERE VendorID LIKE '%4'
GROUP BY pt.PurchaseTransactionID, ag.AgentID, AgentGender
HAVING SUM(wa.WatchPrice*ptd.QuantityOfEachWatch)>500000

--2
SELECT [TotalSalesTransaction] =COUNT(DISTINCT st.SalesTransactionID), [Name]=UPPER (CustomerName)
FROM SalesTransaction st JOIN Customers cu ON
st.CustomerID = cu.CustomerID JOIN SalesTransactionDetail std ON
std.SalesTransactionID = st.SalesTransactionID
WHERE MONTH (SalesDate)>2
GROUP BY CustomerName
HAVING SUM(QuantityOfEachWatch)>4

--3
SELECT[BrandCode] = 'Brand '+ RIGHT (bd.BrandID,3), BrandName,[Max Stock] =CAST (MAX (WatchStock)AS VARCHAR)+' pcs',[Min Stock] = CAST (MIN(WatchStock)AS VARCHAR)+' pcs'
FROM Brand bd JOIN Watch wa ON
bd.BrandID = wa.BrandID JOIN SalesTransactionDetail std ON
std.WatchID = wa.WatchID JOIN SalesTransaction st ON
std.SalesTransactionID = st.SalesTransactionID
WHERE YEAR(SalesDate) = 2018 AND BrandName LIKE 'BVLGARIA'
GROUP BY bd.BrandID, BrandName

--4
SELECT CustomerName, [Customer Gender] = UPPER (CustomerGender), [Total Watch Purchased] =SUM(QuantityOfEachWatch), [Watch Owned]= COUNT(DISTINCT WatchStock)
FROM Customers cu JOIN SalesTransaction st ON
cu.CustomerID = st.CustomerID JOIN SalesTransactionDetail std ON
std.SalesTransactionID = st.SalesTransactionID JOIN Watch wa ON
std.WatchID = wa.WatchID
WHERE cu.CustomerID IN('CU002','CU003') AND MONTH(SalesDate) %2=1
GROUP BY CustomerName,CustomerGender

--5
SELECT AgentName, AgentAddress, [AgentPhone] = STUFF(AgentPhone, 1, 2, '+62'), [TotalPurchaseTransaction] = CAST(TotalPurchaseTransaction AS VARCHAR) +' Transaction(s)'
FROM Agent ag,
(SELECT AgentID, [TotalPurchaseTransaction] = COUNT(DISTINCT pt.PurchaseTransactionID)
 FROM PurchaseTransaction pt JOIN PurchaseTransactionDetail ptd ON
 pt.PurchaseTransactionID = ptd.PurchaseTransactionID JOIN Watch wa ON
 wa.WatchId = ptd.WatchID
 WHERE WatchPrice >1000000
 GROUP BY AgentID)
 AS stt
WHERE stt.AgentID = ag.AgentID AND stt.[TotalPurchaseTransaction]>1

--6
SELECT cu.CustomerID, [TotalTransaction] = CAST(TotalTransaction AS VARCHAR) + ' Transaction(s)'
FROM Customers cu,
(SELECT CustomerID,TotalTransaction = COUNT(DISTINCT st.SalesTransactionID)
FROM SalesTransaction st JOIN SalesTransactionDetail std ON
st.SalesTransactionID = std.SalesTransactionID JOIN Watch wa ON
std.WatchID = wa.WatchID
WHERE LEN(WatchName)>18 AND WatchName NOT LIKE '%a'
GROUP BY CustomerID
)AS tt
WHERE tt.CustomerID = cu.CustomerID

--7
SELECT [Customer First Name], [Total Quantity]
FROM
(SELECT CustomerID, [Customer First Name] = LEFT (CustomerName, CHARINDEX (' ', CustomerName))
FROM Customers 
WHERE CHARINDEX (' ', CustomerName) > 0
UNION
SELECT CustomerID, [Customer First Name] = CustomerName
FROM Customers
WHERE CHARINDEX (' ', CustomerName)= 0
)AS fn,
(SELECT CustomerID, [Total Quantity] = SUM(QuantityOfEachWatch)
FROM SalesTransactionDetail std JOIN SalesTransaction st ON
st.SalesTransactionID = std.SalesTransactionID
GROUP BY CustomerID
)AS tq,
(SELECT [Average] = SUM(QuantityOfEachWatch) / COUNT(DISTINCT std.SalesTransactionID)
FROM SalesTransactionDetail std JOIN SalesTransaction st ON
st.SalesTransactionID = std.SalesTransactionID
WHERE YEAR (SalesDate) = 2018
)AS avr
WHERE fn.CustomerID = tq.CustomerID AND tq.[Total Quantity] > avr.Average

--8
SELECT DISTINCT LOWER (BrandName) AS [BrandName],[Total Watch] = CAST(COUNT(DISTINCT WatchStock) AS VARCHAR) + ' watch(es)'
FROM Brand bd JOIN Watch wa ON bd.BrandID = wa.BrandIDJOIN SalesTransactionDetail std ONstd.WatchID = wa.WatchID JOIN SalesTransaction st ON st.SalesTransactionID = std.SalesTransactionID,(SELECT SalesDate, [Total Transaction] = COUNT (SalesTransactionID) FROM SalesTransaction WHERE MONTH (SalesDate) = 9 GROUP BY SalesDate)AS tt,(SELECT [Max Date] = MAX ([Total Transaction]) FROM  (SELECT SalesDate, [Total Transaction] = COUNT (SalesTransactionID)  FROM SalesTransaction  WHERE MONTH (SalesDate) = 9  GROUP BY SalesDate)AS tt)AS mts,(SELECT DISTINCT st.SalesDate FROM SalesTransaction st,(SELECT [Max Date] = MAX ([Total Transaction]) FROM ( SELECT SalesDate, [Total Transaction] = COUNT (SalesTransactionID) FROM SalesTransaction WHERE MONTH (SalesDate) = 9 GROUP BY SalesDate)AS tt)AS mts,(SELECT SalesDate, [Total Transaction] = COUNT (SalesTransactionID)
 FROM SalesTransaction
 WHERE MONTH (SalesDate) = 9
GROUP BY SalesDate
)AS tt
 WHERE tt.[Total Transaction] = mts.[Max Date] AND tt.SalesDate = st.SalesDate
)sd
WHERE DATEDIFF (DAY, tt.SalesDate, sd.SalesDate) = 1 AND tt.SalesDate = st.SalesDate
GROUP BY BrandName


--9
GO
CREATE VIEW CustomCustomerViewer
AS 
SELECT cu.CustomerID, CustomerName, [Maximum Quantity] = MAX(QuantityOfEachWatch), [Minimum Quantity] = MIN(QuantityOfEachWatch)
FROM Customers cu JOIN SalesTransaction st ON
cu.CustomerID = st.CustomerID JOIN SalesTransactionDetail std ON
std.SalesTransactionID = st.SalesTransactionID
WHERE YEAR (SalesDate) = 2018 AND CustomerName LIKE '%o%'
GROUP BY cu.CustomerID, CustomerName

SELECT * FROM CustomCustomerViewer

--10

GO
CREATE VIEW CustomVendorViewer
AS
SELECT VendorName, WatchName, PurchaseDate,[Total Purchase] =SUM (QuantityOfEachWatch), [Minimum Purchase] = MIN (QuantityOfEachWatch)
FROM Vendor vd JOIN PurchaseTransaction pt ON
pt.VendorID = vd.VendorID JOIN PurchaseTransactionDetail ptd ON
ptd.PurchaseTransactionID = pt.PurchaseTransactionID JOIN Watch wa ON
wa.WatchID = ptd.WatchID
WHERE MONTH(PurchaseDate)= 6
GROUP BY VendorName, PurchaseDate,WatchName
HAVING MIN(QuantityOfEachWatch)>4

SELECT * FROM CustomVendorViewer
