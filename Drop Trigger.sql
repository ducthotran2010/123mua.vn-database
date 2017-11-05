USE [123mua.vn]
GO

-- 1. Phone# check
DROP TRIGGER PhoneNumberEMPLOYEETrigger
DROP TRIGGER PhoneNumberSTORETrigger
DROP TRIGGER PhoneNumberMEMBERTrigger

-- 2. Email
DROP TRIGGER EmailEMPLOYEETrigger
DROP TRIGGER EmailSTORETrigger
DROP TRIGGER EmailMEMBERTrigger

-- 3. CheckStatus
DROP TRIGGER StatusREPORTTrigger
DROP TRIGGER StatusCOMMENTTrigger

-- 4. Member.Gender
DROP TRIGGER GenderMEMBERTrigger

-- 5. Product.DiscountPrice < Product.Price
DROP TRIGGER ValidPricePRODUCTTrigger

-- 6. Vote.Rate
DROP TRIGGER RateVOTETrigger

-- 7.	Message.Sender
DROP TRIGGER SenderMESSAGETrigger

-- 8. Order.OrderStatus
DROP TRIGGER StatusORDERTrigger
