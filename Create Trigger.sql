USE [123mua.vn]
GO

-- 1. Phone# check
CREATE TRIGGER PhoneNumberEMPLOYEETrigger ON [EMPLOYEE]
AFTER
  INSERT, UPDATE
AS
    DECLARE @PhoneNumber VARCHAR(11)
    SELECT @PhoneNumber = [Phone#]
    FROM inserted
    IF (@PhoneNumber LIKE '%[^0-9]%' OR LEN(@PhoneNumber) < 10 OR LEN(@PhoneNumber) > 11)
        BEGIN
            RAISERROR ('Invalid Phone Number', 16, 1)
            ROLLBACK TRANSACTION
        END
GO

CREATE TRIGGER PhoneNumberSTORETrigger ON [STORE]
AFTER
  INSERT, UPDATE
AS
    DECLARE @PhoneNumber VARCHAR(11)
    SELECT @PhoneNumber = [Phone#]
    FROM inserted
    IF (@PhoneNumber LIKE '%[^0-9]%' OR LEN(@PhoneNumber) < 10 OR LEN(@PhoneNumber) > 11)
        BEGIN
            RAISERROR ('Invalid Phone Number', 16, 1)
            ROLLBACK TRANSACTION
        END
GO

CREATE TRIGGER PhoneNumberMEMBERTrigger ON [MEMBER]
AFTER
  INSERT, UPDATE
AS
    DECLARE @PhoneNumber VARCHAR(11)
    SELECT @PhoneNumber = [Phone#]
    FROM inserted
    IF (@PhoneNumber LIKE '%[^0-9]%' OR LEN(@PhoneNumber) < 10 OR LEN(@PhoneNumber) > 11)
        BEGIN
            RAISERROR ('Invalid Phone Number', 16, 1)
            ROLLBACK TRANSACTION
        END
GO

-- 2. Email
CREATE TRIGGER EmailEMPLOYEETrigger ON [EMPLOYEE]
AFTER
  INSERT, UPDATE
AS
    DECLARE @email CHAR(30)
    SELECT @email = Email
    FROM inserted
    IF (@email NOT LIKE '%_@__%.__%')
        BEGIN
            RAISERROR ('Invalid Phone Number', 16, 1)
            ROLLBACK TRANSACTION
        END
GO

CREATE TRIGGER EmailSTORETrigger ON [STORE]
AFTER
  INSERT, UPDATE
AS
    DECLARE @email CHAR(30)
    SELECT @email = Email
    FROM inserted
    IF (@email NOT LIKE '%_@__%.__%')
        BEGIN
            RAISERROR ('Invalid Phone Number', 16, 1)
            ROLLBACK TRANSACTION
        END
GO

CREATE TRIGGER EmailMEMBERTrigger ON [MEMBER]
AFTER
  INSERT, UPDATE
AS
    DECLARE @email CHAR(30)
    SELECT @email = Email
    FROM inserted
    IF (@email NOT LIKE '%_@__%.__%')
        BEGIN
            RAISERROR ('Invalid Phone Number', 16, 1)
            ROLLBACK TRANSACTION
        END
GO


-- 3. CheckStatus
CREATE TRIGGER StatusREPORTTrigger ON [Report]
AFTER
  INSERT, UPDATE
AS
  DECLARE @status NVARCHAR(30)
  SELECT @status = CheckStatus
  FROM inserted
  IF (@status NOT IN (N'Chưa duyệt', N'Đã duyệt'))
    BEGIN
      RAISERROR ('Wrong Report Status', 16, 1)
      ROLLBACK TRANSACTION
    END
GO

CREATE TRIGGER StatusCOMMENTTrigger ON [Comment]
AFTER
  INSERT, UPDATE
AS
    DECLARE @status NVARCHAR(30)
    SELECT @status = CheckStatus
    FROM inserted
    IF (@status NOT IN (N'Chưa duyệt', N'Đã duyệt'))
        BEGIN
            RAISERROR ('Wrong Comment Status', 16, 1)
            ROLLBACK TRANSACTION
        END
GO


-- 4. Member.Gender
CREATE TRIGGER GenderMEMBERTrigger ON [MEMBER]
AFTER
  INSERT, UPDATE
AS
    DECLARE @gender NVARCHAR(30)
    SELECT @gender = Gender
    FROM inserted
    IF (@gender NOT IN (N'Nam', N'Nữ', N'Chưa biết'))
        BEGIN
            RAISERROR ('Invalid Gender', 16, 1)
            ROLLBACK TRANSACTION
        END
GO


-- 5. Product.DiscountPrice < Product.Price
CREATE TRIGGER ValidPricePRODUCTTrigger ON [PRODUCT]
AFTER
  INSERT, UPDATE
AS
    DECLARE @price INT, @priceDiscount INT, @Message VARCHAR(MAX)
    SELECT @price = Price, @priceDiscount = PriceDiscount
    FROM inserted
    SET @Message = 'Invalid Discount = <' + CAST(@priceDiscount AS VARCHAR(10)) + '>, Origin = <' + CAST(@price AS VARCHAR(10)) + '> ?';
    IF (@priceDiscount IS NOT NULL AND @price <= @priceDiscount)
        BEGIN
            RAISERROR (@Message, 16, 1)
            ROLLBACK TRANSACTION
        END
GO


-- 6. Vote.Rate
CREATE TRIGGER RateVOTETrigger ON [Vote]
AFTER
  INSERT, UPDATE
AS
    DECLARE @rate INT
    SELECT @rate = Rate
    FROM inserted
    IF (@rate < 1 OR 5 < @rate)
        BEGIN
            RAISERROR ('Invalid Rate', 16, 1)
            ROLLBACK TRANSACTION
        END
GO


-- 7.	Message.Sender
CREATE TRIGGER SenderMESSAGETrigger ON [Message]
AFTER
  INSERT, UPDATE
AS
    DECLARE @sender NVARCHAR(30)
    SELECT @sender = Sender
    FROM inserted
    IF (@sender NOT IN (N'Thành viên', N'Cửa hàng'))
        BEGIN
            RAISERROR ('Wrong Order Status', 16, 1)
            ROLLBACK TRANSACTION
        END
GO


-- 9. Order.OrderStatus
CREATE TRIGGER StatusORDERTrigger ON [Order]
AFTER
  INSERT, UPDATE
AS
    DECLARE @status NVARCHAR(30)
    SELECT @status = OrderStatus
    FROM inserted
    IF (@status NOT IN (N'Đã đặt', N'Đang xử lý', N'Đang giao hàng', N'Đã hủy'))
        BEGIN
            RAISERROR ('Wrong Order Status', 16, 1)
            ROLLBACK TRANSACTION
        END
GO
