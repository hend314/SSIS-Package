IF EXISTS (SELECT * FROM sys.databases WHERE name = 'Online_RetailDW')
DROP DATABASE [Online_RetailDW];
GO

CREATE DATABASE Online_RetailDW;
GO
USE Online_RetailDW;

IF EXISTS (SELECT * FROM sys.tables WHERE name = 'DimCustomer' AND schema_id = SCHEMA_ID('dbo'))
DROP TABLE dbo.DimCustomer;
GO


CREATE TABLE DimCustomer (
    CustomerID INT PRIMARY KEY,
    Country NVARCHAR(100)
);

IF EXISTS (SELECT * FROM sys.tables WHERE name = 'DimProduct' AND schema_id = SCHEMA_ID('dbo'))
DROP TABLE dbo.DimProduct;
GO

CREATE TABLE DimProduct (
    StockCode NVARCHAR(50) PRIMARY KEY,
    Description NVARCHAR(255)
);

IF EXISTS (SELECT * FROM sys.tables WHERE name = 'FactOrders' AND schema_id = SCHEMA_ID('dbo'))
DROP TABLE dbo.FactOrders;
GO

CREATE TABLE FactOrders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    InvoiceNo NVARCHAR(50),
    InvoiceDate DATETIME,
    CustomerID INT,
    StockCode NVARCHAR(50),
    Quantity INT,
    UnitPrice FLOAT,
	TotalPrice DECIMAL(10,2) NULL
);

