IF EXISTS (SELECT * FROM sys.databases WHERE name = 'RetailDWH')
BEGIN
    ALTER DATABASE RetailDWH SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE RetailDWH;
END

CREATE DATABASE RetailDWH;
GO

USE RetailDWH;

IF EXISTS (SELECT * FROM sys.tables WHERE name = 'Customers' AND schema_id = SCHEMA_ID('dbo'))
DROP TABLE dbo.Customers;
GO
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100),
    Phone NVARCHAR(20) NULL
);
GO

IF EXISTS (SELECT * FROM sys.tables WHERE name = 'Products' AND schema_id = SCHEMA_ID('dbo'))
DROP TABLE dbo.Products;
GO
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    Category NVARCHAR(50),
    Price DECIMAL(10, 2) NULL,
    Stock INT NULL
);
GO

IF EXISTS (SELECT * FROM sys.tables WHERE name = 'Orders' AND schema_id = SCHEMA_ID('dbo'))
DROP TABLE dbo.Orders;
GO

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    OrderDate DATE,
    Quantity INT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
GO





