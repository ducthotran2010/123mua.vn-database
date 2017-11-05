USE [123mua.vn];
GO

-- 1. List all product
SELECT *
FROM PRODUCT

-- 2. Find products
DECLARE @name NVARCHAR(30)
SET @name = N'Dây trói 3m' -- Từ khóa người dùng nhập vào
SELECT *
FROM PRODUCT
WHERE Name = @name


-- 3. View all your favorite products (which you hit liked)
DECLARE @memberID CHAR(30)
SET @memberID = 'dokidoki' -- Your Member.ID
SELECT *
FROM PRODUCT
WHERE Code IN (
	SELECT ProductCode
	FROM [Like]
	WHERE MemberID = @memberID
)

-- 4. View all your comments
DECLARE @memberID_cmt CHAR(30)
SET @memberID_cmt = 'spamer01' -- Your Member.ID
SELECT SentTime as N'Gửi lúc', Content as N'Nội dung', Code as N'Mã Sản phẩm', Name as N'Sản phẩm'
FROM Comment JOIN PRODUCT ON Comment.ProductCode = PRODUCT.Code
WHERE @memberID_cmt = MemberID


-- 5. View all your orders
DECLARE @memberID_ord CHAR(30)
SET @memberID_ord = 'bbd.mid' -- Your Member.ID
SELECT *
FROM [Order]
WHERE MemberID = @memberID_ord;

-- 6. View all your message with a store
DECLARE @memberID_mes CHAR(30), @storeID_mes CHAR(30)
SET @memberID_mes = 'spamer01' -- Your Member.ID
SET @storeID_mes = 'Store01' -- Your Store.ID
SELECT SentTime as N'Gửi lúc', Content as N'Nội dung', Sender as N'Người gửi', StoreID as N'Cửa hàng'
FROM [Message]
WHERE  MemberID = @memberID_mes AND StoreID = @storeID_mes


-- 7. View store information
DECLARE @storeID_inf CHAR(30)
SET @storeID_inf = 'Store01' -- Your Store.ID
SELECT *
FROM STORE
WHERE ID = @storeID_inf

-- 8. View all your vote
DECLARE @memberID_vote CHAR(30)
SET @memberID_vote = 'phqb' -- Your Member.ID
SELECT *
FROM [Vote]
WHERE MemberID = @memberID_vote

-- 9. View all vote of a product
DECLARE @ProductCode_vote CHAR(30)
SET @ProductCode_vote = 'SFX3432' -- Your Product.Code
SELECT *
FROM [Vote]
WHERE ProductCode = @ProductCode_vote

-- 10. View all your reported
DECLARE @memberID_rp CHAR(30)
SET @memberID_rp = 'phqb' -- Your Member.ID
SELECT *
FROM [Report]
WHERE MemberID = @memberID_rp


-- 11. View amount of report of a product
DECLARE @ProductCode_rp CHAR(30)
SET @ProductCode_rp = 'SFX3432' -- Your Product.Code
SELECT Count(ProductCode) as 'Số lượt báo sai giá sản phẩm'
FROM [Report]
WHERE ProductCode = @ProductCode_rp

-- >> FOR EMPLOYEE <<
-- 1. View all comment which @employee has not checked
DECLARE @employeeID_cmt CHAR(30)
SET @employeeID_cmt = 'Employee01' -- Your Employee.ID
SELECT *
FROM [Comment]
WHERE CheckStatus = N'Chưa duyệt' AND @employeeID_cmt = EmployeeID

-- 2. View all report which @employee has not checked
DECLARE @employeeID_rp CHAR(30)
SET @employeeID_rp = 'Employee01' -- Your Employee.ID
SELECT *
FROM [Report]
WHERE CheckStatus = N'Chưa duyệt' AND @employeeID_rp = EmployeeID
