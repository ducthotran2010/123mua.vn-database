Redesign website 123mua.vn database

## ER diagram
![ERD](/src/ERD.png)

## Relational scheme

EMPLOYEE(`ID`, Name, Email, Address, Phone#)

STORE(`ID`, Name, Email, SignUpDate, Address, Phone#)

MEMBER(`ID`, Name, Email, Gender, DayOfBirth, Address, Phone#, Hobby)

PRODUCT(`Code`, StoreID, Name, Detail, Price, PriceDiscount, UploadDate, Location)

Like(`MemberID, ProductCode`) 

Vote(`MemberID`, `ProductCode`, Rate, Content)

Report(`MemberID, ProductCode, EmployeeID`, CheckStatus)

Message(`SentTime`, MemberID, StoreID, Title, Content, Sender)

Comment(`SentTime`, MemberID, ProductCode, EmployeeID, Content, CheckStatus)

Order(`Code`, StoreID, MemberID, ProductCode, Amount, Cost, Requires, OrderDate, OrderStatus)

## Contraints
1.	*.Phone# consists of only numeric characters and a length of 10 to 11.
2.	*.Email must have the form example@email.com.
3.	*.CheckStatus must be ‘Chưa duyệt’ or ‘Đã duyệt’.
4.	Member.Gender must be ‘Nam’, ‘Nữ’ or ‘Chưa biết’.
5.	Product.DiscountPrice must be smaller than Product.Price.
6.	Vote.Rate is only between 1 and 5.
7.	Message.Sender must be ‘Thành viên’ or ‘Cửa hàng’.
8.	Order.Amount is a positve integer.
9.	Order.OrderStatus must be ‘Đã đặt’, ‘Đang xử lý’, ‘Đang giao’ or ‘Đã hủy’.
