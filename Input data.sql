-- EXAMPLE DATA
USE [123mua.vn];
GO

INSERT INTO
  EMPLOYEE(ID, Name, Email, Address, [Phone#])
VALUES
  ('Employee01', N'Người Kiểm Duyệt 01', 'email1@email.com', 'Việt Nam', '01234567891'),
  ('Employee02', N'Người Kiểm Duyệt 02', 'email1@email.com', 'Việt Nam', '01234567891'),
  ('Employee03', N'Người Kiểm Duyệt 03', 'email1@email.com', 'Việt Nam', '01234567891'),
  ('Employee04', N'Người Kiểm Duyệt 04', 'email1@email.com', 'Việt Nam', '01234567891'),
  ('Employee05', N'Người Kiểm Duyệt 05', 'email1@email.com', 'Việt Nam', '01234567891'),
  ('Employee06', N'Người Kiểm Duyệt 06', 'email1@email.com', 'Việt Nam', '01234567891')
GO


INSERT INTO
  STORE(ID, Name, Email, SignUpDate, Address, [Phone#])
VALUES
  ('Store01', N'Người Bán Hàng 01', 'nguoibanhang01@email.com', '20120618 10:34:09 AM', N'Việt Nam', '0947857302'),
  ('Store02', N'Người Bán Hàng 02', 'nguoibanhang02@email.com', '20120618 10:34:09 AM', N'Việt Nam', '0947857303'),
  ('Store03', N'Người Bán Hàng 03', 'nguoibanhang03@email.com', '20120618 10:34:09 AM', N'Việt Nam', '0947857304'),
  ('Store04', N'Người Bán Hàng 04', 'nguoibanhang04@email.com', '20120618 10:34:09 AM', N'Việt Nam', '0947857305'),
  ('Store05', N'Người Bán Hàng 05', 'nguoibanhang05@email.com', '20120618 10:34:09 AM', N'Việt Nam', '0947857306'),
  ('Store06', N'Người Bán Hàng 06', 'nguoibanhang06@email.com', '20120618 10:34:09 AM', N'Việt Nam', '0947857307')
GO

INSERT INTO
  MEMBER(ID, Name, Email, Gender, DayOfBirth, Address, [Phone#])
VALUES
  ('shougo.10', N'Trần Đức Thọ', 'ducthotran2010@gmail.com',  'Nam', '20120618 10:34:09 AM', N'Việt Nam', '0954567891'),
  ('dokidoki',  N'Doki-chan', 'Dokiachan@doridori.com',       'Nữ', '20120618 10:34:09 AM', N'Nhật Bản', '0954567892'),
  ('phqb',      N'Bảo BT', 'lucyuknowhat@gmail.com',          'Nam', '20120618 10:34:09 AM', N'Hàn Quốc', '0954567893'),
  ('bbd.mid',   N'Bảo ĐD', 'justrandomname@gmail.com',         DEFAULT, '20120618 10:34:09 AM', N'Nhật Bản', '0954567894'),
  ('spamer01',  N'Thành viên 01', 'thanhvien01@email.com',     DEFAULT, '20120618 10:34:09 AM', N'Nhật Bản', '0954567895'),
  ('spamer02',  N'Thành viên 02', 'thanhvien02@email.com',     DEFAULT, '20120618 10:34:09 AM', N'Nhật Bản', '0954567896'),
  ('spamer03',  N'Thành viên 03', 'thanhvien03@email.com',     DEFAULT, '20120618 10:34:09 AM', N'Nhật Bản', '0954567897')
GO

INSERT INTO
  PRODUCT(Code, StoreID, Name, Detail, Price, PriceDiscount, UploadDate, Location)
VALUES
  ('SXXA001', 'Store01', N'Ốp lưng điện thoại samsung', N'Chỉ dành cho SSG J7 | SSG A5 | SS9', '20000', '18000', '20120618 10:34:09 AM', N'HCM'),
  ('SFX3432', 'Store01', N'Ốp lưng điện thoại iphone!', N'Dành cho tất cả dòng iphone', '30000', DEFAULT, '20120618 10:34:09 AM', N'HN'),
  ('GIAY__X', 'Store02', N'Giày cho bé tập đi', DEFAULT, '45000', '35000', '20120618 10:34:09 AM', N'Toàn quốc'),
  ('TUIXACH94A', 'Store03', N'Túi xách da hàng hiệu', DEFAULT, '2000000', '1500000', '20140618 10:34:09 AM', N'Tây Nam Bộ'),
  ('GIADUNGX01', 'Store04', N'Dây trói 3m', DEFAULT, '40000', DEFAULT, '20140618 10:34:09 AM', N'Đông Nam Bộ')
GO

INSERT INTO
  [Like](MemberID, ProductCode)
VALUES
  ('dokidoki','GIADUNGX01'),
  ('dokidoki','GIAY__X'),
  ('dokidoki','TUIXACH94A'),
  ('dokidoki','SFX3432'),
  ('bbd.mid','GIAY__X'),
  ('bbd.mid','SXXA001'),
  ('phqb','SXXA001'),
  ('phqb','SFX3432'),
  ('phqb','GIAY__X')
GO

INSERT INTO
  [Vote](MemberID, ProductCode, Rate, Content)
VALUES
  ('bbd.mid', 'GIADUNGX01', 5, N'Tuyệt vời'),
  ('phqb', 'GIAY__X', 1, N'Tệ'),
  ('shougo.10', 'SFX3432', 4, DEFAULT)
GO

INSERT INTO
  [Message](SentTime, MemberID, StoreID, Title, Content, Sender)
VALUES
  ('1955-12-13 12:43:10', 'spamer01', 'Store01', N'Anh oi', N'Alo', DEFAULT),
  ('1955-12-13 12:43:11', 'spamer01', 'Store01', N'Anh oi', N'Alo', DEFAULT),
  ('1955-12-13 12:43:12', 'spamer01', 'Store01', N'Anh oi', N'Sao em?', N'Cửa hàng'),
  ('1955-12-13 12:43:13', 'spamer01', 'Store01', N'Anh oi', N'Alo anh con ban hang khong vay?', DEFAULT),
  ('1955-12-13 12:43:14', 'spamer01', 'Store01', N'Anh oi', N'Còn mới bán chứ em?', N'Cửa hàng')
GO

INSERT INTO
  [Comment](SentTime, MemberID, ProductCode, EmployeeID, Content, CheckStatus)
VALUES
  ('1955-12-13 12:43:10', 'spamer01', 'SXXA001', 'Employee01', N'Sản phẩm chất lượng, giống như hình', DEFAULT),
  ('1955-12-13 12:43:11', 'spamer01', 'SXXA001', 'Employee02', N'Sản phẩm chất lượng, giống như hình', DEFAULT),
  ('1955-12-13 12:43:12', 'spamer01', 'SXXA001', 'Employee01', N'Sản phẩm chất lượng, giống như hình', N'Đã duyệt'),
  ('1955-12-13 12:43:13', 'spamer01', 'SXXA001', 'Employee01', N'Sản phẩm chất lượng, giống như hình', N'Đã duyệt')
GO

INSERT INTO
  [Order](Code, StoreID, MemberID, ProductCode, Amount, Cost, Requires, OrderDate, OrderStatus)
VALUES
  ('HANG01', 'Store01', 'bbd.mid', 'SFX3432', 9, 200000, N'Giao vào buổi chiều dùm em nha', '20120618 10:34:09 AM', N'Đã đặt'),
  ('HANG02', 'Store01', 'bbd.mid', 'SXXA001', 1, 18000, DEFAULT, '20120618 10:34:09 AM', N'Đang giao')
GO

INSERT INTO
  [Report](MemberID, ProductCode, EmployeeID, CheckStatus)
VALUES
  ('bbd.mid', 'SFX3432', 'Employee01', DEFAULT),
  ('dokidoki', 'SFX3432', 'Employee01', DEFAULT),
  ('phqb', 'SFX3432', 'Employee02', DEFAULT),
  ('phqb', 'GIADUNGX01', 'Employee01', DEFAULT)
GO