USE master
GO
IF  EXISTS (SELECT name 
			FROM sys.databases 
			WHERE name = 'WoodShop')
	DROP DATABASE WoodShop
GO
CREATE DATABASE WoodShop
GO
USE [WoodShop]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 20/03/2022 12:44:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Category__19093A0B1F70D7CB] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 20/03/2022 12:44:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[InvoiceId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[InvoiceDate] [datetime] NULL,
	[DeliveryFee] [float] NULL,
	[DiscountCode] [char](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[InvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 20/03/2022 12:44:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[ProductName] [nvarchar](255) NOT NULL,
	[OldPrice] [float] NOT NULL,
	[Image] [nvarchar](200) NULL,
	[CurrentPrice] [float] NOT NULL,
	[InventQuantity] [int] NOT NULL,
	[Description] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductsCart]    Script Date: 20/03/2022 12:44:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductsCart](
	[UserId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductsOrder]    Script Date: 20/03/2022 12:44:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductsOrder](
	[ProductId] [int] NOT NULL,
	[InvoiceId] [int] NOT NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[InvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 20/03/2022 12:44:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[PhoneNumber] [varchar](20) NULL,
	[AddressDetail] [ntext] NULL,
	[City] [nvarchar](50) NULL,
	[District] [nvarchar](50) NULL,
	[Password] [char](50) NOT NULL,
	[Status] [bit] NOT NULL,
	[IsAdmin] [bit] NULL,
	[quyen] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (1, N'Bàn ghế bộ')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (2, N'Đồ Thờ')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (3, N'Tủ')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (4, N'Bộ ghế sofa')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (5, N'Giường')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (6, N'Đồng hồ cây')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (7, N'Bàn ghế phòng khách')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Invoice] ON 

INSERT [dbo].[Invoice] ([InvoiceId], [UserId], [InvoiceDate], [DeliveryFee], [DiscountCode]) VALUES (3, 1005, CAST(N'2022-08-13T00:00:00.000' AS DateTime), 1270000, N'AHB1                                              ')
INSERT [dbo].[Invoice] ([InvoiceId], [UserId], [InvoiceDate], [DeliveryFee], [DiscountCode]) VALUES (4, 1005, CAST(N'2020-08-12T00:00:00.000' AS DateTime), 125000, N'AHB                                               ')
INSERT [dbo].[Invoice] ([InvoiceId], [UserId], [InvoiceDate], [DeliveryFee], [DiscountCode]) VALUES (5, 1005, CAST(N'2022-08-12T00:00:00.000' AS DateTime), 12400, N'AHB0001                                           ')
SET IDENTITY_INSERT [dbo].[Invoice] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [OldPrice], [Image], [CurrentPrice], [InventQuantity], [Description]) VALUES (2, 1, N'Bộ bàn ghế hoàng gia nguyên khối gỗ gõ đỏ', 150000000, N'h1.jpg', 150000000, 20, N'Bộ bàn ghế hoàng gia nguyên khối gỗ gõ đỏ
 — Link video :

- Thông Tin Sản Phẩm :

+ Chất Liệu : Gỗ Gõ Đõ

- Hàng chọn vân đẹp , không giác - hàng ván 10p - vách tựa lưng dày 10p - chương tựa đầu 10p liền - yếm 4p -chân tiền 18 - tay rộng 23 ,

- Bộ bàn ghế Gồm 6 món :

+ 01 bàn - 80 x 1m68 x mặt 8p

+ 02 ghế - 125 x 75 - cao 1m48 x mặt 10p

+ 01 đoản, 2m6 x 75 x cao 1m55 x mặt 10p

+ 01 bàn nhỏ - 45 x 61 x 7p

+ 01 đôn ngồi - 42 x 42 x 7p

——- Giá :150.000.000d - Giá đã bao gồm SƠn PU hoặc đánh vecni

- khi mua hàng tặng ngay kính bàn , kính đôn + combo khay trà

+ miễn phí vận chuyển bán kính 66km .')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [OldPrice], [Image], [CurrentPrice], [InventQuantity], [Description]) VALUES (5, 1, N'An Gian Thờ Loại Nhỏ Gỗ Gõ Đỏ', 16000000, N'h2.jpg', 14000000, 0, N'An Gian Thờ Loại Nhỏ Gỗ Gõ Đỏ
Chất Liệu : Gỗ Gõ Đỏ,Kate
Hàng Gồm Các Kích Thước và giá : 
 ---Kích thước : 1m27 x 67 x cao 1m27 , tủ nhỏ 67 x 67 x 47 
Combo cả án to tủ nhỏ giá 14tr
Giá bán đã bao gồm sơn PU hoặc đánh vecni đẹp đẽ ! 

~~~>>> Lợi Ích Khi Mua Sản Phẩm : 
-- Tặng Ngay 1 tam cấp để trên án trị giá 400k ! 

~~~ Miễn phí giao hàng bán kính 50km ~~~ 
->>> Chú Ý : Ưu Đãi Đặc Biệt Khi Quý Khách Mua 3 sản phẩm cùng 1 lúc bên công ty chúng tôi có khuyến mãi giảm giá tất lên đến 3% tổng hóa đơn giá trị sản phẩm ! 

Hàng bền,đẹp phun PU tỷ mỉ - độ bền trên 500 năm 
Bảo Hành : 50 năm  mối mọt ')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [OldPrice], [Image], [CurrentPrice], [InventQuantity], [Description]) VALUES (6, 1, N'Bộ Bàn Ghế Âu Á Cuốn Thư Gỗ Mun Đuôi Công Siêu Víp', 49999999, N'h3.jpg', 47000000, 0, N'Bộ Bàn Ghế Âu Á Cuốn Thư Gỗ Mun Đuôi Công Siêu Víp
-- Link video :https://www.youtube.com/watch?v=KiIxTN4J2Lg
- Thông Tin Sản Phẩm :

+ Chất Liệu : Gỗ mun đuôi công

- Hàng chọn vân đẹp , không giác , Hàng chọn lựa gỗ kĩ càng , mộc sắc nét .
- hàng tay 12 liền chân 12 , k4 ván 2p cột liền 7p8 tay đặc nguyên khối , yếm 4p , vách tựa dày 2p đậu , 

- Bộ bàn ghế Gồm 6 món :

+ 01 bàn - 80 x 1m57 x cao 1m16

+ 02 ghế - 88 x 65 cao 1m16

+ 01 đoản, - 2m45 x 65

+ 01 bàn nhỏ - 45 x 80

+ 01 đôn ngồi - 45 x 45

- Giá Bán Đã Bao Gồm Sơn Pu Đẹp Đẽ ! 

- khi mua hàng tặng ngay kính bàn , kính đôn + khay trà gỗ hương đỏ !

+ miễn phí vận chuyển bán kính 50km')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [OldPrice], [Image], [CurrentPrice], [InventQuantity], [Description]) VALUES (7, 1, N'Bộ âu á cuốn thư hàng trơn Loại Chân 10 tay đặc gỗ mun đuôi công', 40000000, N'h4.jpg', 40000000, 20, N' Thông Tin Sản Phẩm :+ Chất Liệu : Gỗ mun đuôi công- Hàng chọn vân đẹp , không giác ,hàng Cột 10 liền chân 10, tay đặc k4 ván 2p cột dày 7p3 bàn đục gương , vách dày 2p , yếm 4p , thêm tầng cổ chỉ đục ! - Bộ bàn ghế Gồm 6 món :+ 01 bàn - 75 x 1m40 + 02 ghế - 85 x 65+ 01 đoản, - 2m45 x 65+ 01 bàn nhỏ - 40 x 70+ 01 đôn ngồi - 40 x 40——- Giá giảm còn : 40.00.000dGiá Bán Đã Bao Gồm Hoàn thiện sơn Pu đẹp đẽ ! - khi mua hàng tặng ngay kính bàn , kính đôn + khay trà gỗ hương đỏ !+ miễn phí vận chuyển bán kính 50km')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [OldPrice], [Image], [CurrentPrice], [InventQuantity], [Description]) VALUES (8, 1, N'Bộ bàn ghế nghê đỉnh gỗ hương đỏ nam phi tay 14 10 món', 99999999, N'h5.jpg', 95000000, 20, N'- Thông Tin Sản Phẩm :

- Hàng chọn vân đẹp , không giác, ko dập - hàng khuôn tranh 4p ván 2p - yếm 4p -chân 14 - tay liền đặc nguyên khối ,

- Bộ bàn ghế Gồm 10 món - giá 95tr :

+ 01 bàn - 110 x 1m80

+ 02 ghế - 111 x 75 - cao 1m55

+ 01 đoản, 2m53 x 75 x cao 1m6

+ 02 đôn kẹp - 50 x 60

+ 02 đôn ngồi - 48 x 48

— Kệ tivi hương đá giá 8tr500 - kích thước : 2m4 x cao 81 x sâu 43

- khi mua hàng tặng ngay kính bàn , kính đôn + combo khay trà hộp giấy .

+ miễn phí vận chuyển bán kính 66km .')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [OldPrice], [Image], [CurrentPrice], [InventQuantity], [Description]) VALUES (10, 1, N'Bộ Cuốn Thư Câu Đối Phượng Hoá Gỗ Mít', 16666666, N'h6.jpg', 14000000, 20, N'Bộ Cuốn Thư Câu Đối Phượng Hoá Gỗ Mít

Giá giảm còn : 14.000.000 - giá đã bao gồm sơn pu và sơn son thiếp vàng như trên !

- Thông Tin Sản Phẩm :

Kích thước : cuốn thư : 1m97 x 87 x dày 4p - câu đối : 1m97 x 32 x 4p

Chất Liệu : Gỗ mít')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [OldPrice], [Image], [CurrentPrice], [InventQuantity], [Description]) VALUES (13, 1, N'Bộ Bàn Ghế Tân Cổ Điển Hoàng Gia Đục 2 Mặt Gỗ Hương Đá', 75000000, N'h7.jpg', 65000000, 20, N'- Thông Tin Sản Phẩm :

+ Chất Liệu : Gỗ hương đá

- Hàng chọn vân đẹp , không giác - hàng khuôn tranh 4p ván 2p - vách tựa lưng dày 3p đục 2 mặt - chương 10p - yếm 4p -chân 14 - tay liền đặc nguyên khối , vách tựa đầu liền .

- Bộ bàn ghế Gồm 6 món :

+ 01 bàn - 87 x 1m57

+ 02 ghế - 110 x 80 - cao 1m51

+ 01 đoản, 2m6 x 80 x cao 1m51

+ 01 bàn nhỏ - 50 x 87

+ 01 đôn ngồi - 48 x 48

——- Giá : 65.000.000đ

- khi mua hàng tặng ngay kính bàn , kính đôn + combo khay trà hộp giấy .

+ miễn phí vận chuyển bán kính 66km .')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [OldPrice], [Image], [CurrentPrice], [InventQuantity], [Description]) VALUES (14, 1, N'Bộ bàn ghế minh quốc voi ma mút cột 14 gỗ hương đá', 88000000, N'h8.jpg', 88000000, 20, N'- Thông Tin Sản Phẩm :

+ Chất Liệu : Gỗ hương đá

- Hàng chọn vân đẹp , không giác - hàng khuôn tranh 5p ván 2p - vách tựa lưng dày 5p - yếm 4p - cột 14, chân 14 - tay liền đặc nguyên khối , vách liền

- Bộ bàn ghế Gồm 6 món :

+ 01 bàn - 81 x 1m57

+ 02 ghế - 98 x 88 - cao 1m33

+ 01 đoản, 2m29 x 88 x cao 1m33

+ 01 bàn nhỏ - 81 x 55

+ 01 đôn ngồi - 45 x 45

——- Giá : 88.000.000d

- khi mua hàng tặng ngay kính bàn , kính đôn + combo khay trà hộp giấy .

+ miễn phí vận chuyển bán kính 166km .')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [OldPrice], [Image], [CurrentPrice], [InventQuantity], [Description]) VALUES (16, 1, N'Bộ bàn ghế khổng tử gỗ mun đuôi công đục 2 mặt', 38888888, N'h9.jpg', 37000000, 20, N'- Thông Tin Sản Phẩm :

+ Chất Liệu : Gỗ mun đuôi công

- Hàng chọn vân đẹp , không giác , Hàng vách tựa lưng dày 2p đục 2 mặt , khuôn tranh 3p ván 1p5 .

- Bộ bàn ghế Gồm 6 món :

+ 01 bàn - 73 x 1m45 - kích thước phủ bì

+ 02 ghế - 1m01 x 63

+ 01 đoản, - 2m45 x 63

+ 01 bàn nhỏ - 40 x 73

+ 01 đôn ngồi - 40 x 40

——- Giá giảm còn : 37.00.000d

- khi mua hàng tặng ngay kính bàn , kính đôn + khay trà gỗ hương đỏ !

+ miễn phí vận chuyển bán kính 50km')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [OldPrice], [Image], [CurrentPrice], [InventQuantity], [Description]) VALUES (17, 1, N'Giường Hoa Lá Tây Gỗ Hương Đá', 23333333, N'h10.jpg', 21000000, 20, N'Giường Hoa Lá Tây Gỗ Hương Đá mẫu mã đẹp sang trọng ! 
Chất Liệu: gỗ hương đá 
Hàng có kích thước và giá :
Giường 1m6 x 2m = 21.000.000
Giường 1m8 x 2m = 23.000.000
Giường 2m x 2m2 = 26.500.000
Giá bán đã bao gồm sơn PU hoặc đánh vecni
~~~>>> Lợi Ích Khi Mua Sản Phẩm : 

~~~ Miễn phí giao hàng bán kính 50km ~~~
->>> Chú Ý : Ưu Đãi Đặc Biệt Khi Quý Khách Mua 3 sản phẩm cùng 1 lúc bên công ty chúng tôi có khuyến mãi giảm giá tất lên đến 3% tổng hóa đơn giá trị sản phẩm ! 

Hàng bền,đẹp phun PU tỷ mỉ - độ bền trên 500 năm 
Bảo Hành : 50 năm  mối mọt ')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [OldPrice], [Image], [CurrentPrice], [InventQuantity], [Description]) VALUES (18, 1, N'Bộ bàn ghế ăn tròn gỗ gõ đỏ 6 ghế hoa lá tây ván tràn, mâm xoay', 22500000, N'h11.jpg', 22500000, 20, N'Bộ bàn ghế ăn tròn gỗ gõ đỏ 8 ghế hoa lá tây ván tràn, mâm xoay !

Giá giảm còn : 22.500.000

Giá đã bao gồm đánh sơn pu hoàn thiện

- Thông Tin Sản Phẩm :

+ hàng gồm : 6 ghế + 1 bàn tặng kèm kính bàn dày 1 phân

+ Kích thước : bàn đường kính 1m37 x cao 75 . Ghế 42 x 45 x cao 45 chỗ ngồi

- Chất Liệu : gỗ gõ đỏ

+++ Miễn phí giao hàng 50km')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [OldPrice], [Image], [CurrentPrice], [InventQuantity], [Description]) VALUES (19, 1, N'Bộ bàn ghế ăn vòm 10 ghế đục 2 mặt hoa lá tây ván tràn gỗ gõ đỏ', 46666666, N'h12.jpg', 43000000, 20, N'Bộ bàn ghế ăn vòm 10 ghế đục 2 mặt hoa lá tây ván tràn . Hiện chưa có chủ nhân sở hữu !

- Link video : https://www.youtube.com/watch?v=bVyoxeT7F_Q

Giá giảm còn : 43.000.000

Giá đã bao gồm đánh sơn pu hoàn thiện

- Thông Tin Sản Phẩm :

+ hàng gồm : 10 ghế + 1 bàn tặng kèm kính bàn dày 1 phân

+ Kích thước : bàn dài 2m17 x rộng 97 x cao 75 . Ghế 43 x 46 x cao 45 chỗ ngồi , ván ghế dày 3p , vách tựa lưng đục 2 mặt dày 2p5

- Chất Liệu : gỗ gõ đỏ

+++ Miễn phí giao hàng 50km')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [OldPrice], [Image], [CurrentPrice], [InventQuantity], [Description]) VALUES (21, 1, N'Bộ Bàn Ghế Ăn Đóng Hộp Gỗ Hương Xám , Cẩm Vàng , Xo', 1000000000, N'h14.jpg', 9500000, 20, N'Bộ bàn ghế ăn đóng hộp gỗ hương xám , cẩm vàng , hương đá đỏ , xoan đào .Giá giảm còn : 9.500.000Giá đã bao gồm đánh sơn pu hoàn thiện- Thông Tin Sản Phẩm :+ hàng gồm : 6 ghế + 1 bàn tặng kèm kính bàn dày 1 phân+ Kích thước : bàn đường kính 1m2 x cao 75 x mặt dày 18p đóng hộp - Ghế 42 x 45 x cao 45 chỗ ngồi- Chất Liệu : gỗ hương đá đỏ , cẩm vàng , hương xám , xoan đào giá như nhau .+++ Miễn phí giao hàng miền bắc - miền nam+ miền trung mất phí thêm 1tr')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [OldPrice], [Image], [CurrentPrice], [InventQuantity], [Description]) VALUES (22, 1, N'Bộ bàn ghế ăn hoa lá tây ván tràn bàn chữ nhật gỗ gõ đỏ', 25500000, N'h15.jpg', 25500000, 20, N'Bộ Bàn Ghế ăn hoa lá tây ván tràn gỗ gõ đỏ - Hàng 8 ghế 1 bàn - Bộ bàn ghế phòng ăn - Đồ Gỗ Đỗ Mạnh .
Kích thước : ghế 45 x 43 x cao 112 — bàn 87 x 1m8 x cao 77
Giá : 25.500.000 đã bao gồm sơn pu')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [OldPrice], [Image], [CurrentPrice], [InventQuantity], [Description]) VALUES (23, 2, N'Cuốn Thư Câu Đối Phượng Hoá Gỗ Gụ', 18888888, N'h16.jpg', 18000000, 20, N'- Thông Tin Sản Phẩm : 
Chất liệu : gỗ gụ lào
Hàng Gồm Các Kích Thước và giá : 
1m97 = 18.000.000
2m17 = 20.000.000

Giá ĐÃ Bao Gồm Sơn Pu hoặc đánh véc ly và dát vàng ! 
Hàng gồm 3 món :
 - 2 câu đối 1m97 x 42 x dày 4p2
  - 1 cuốn thư  1m97 x cao 87 x dày 4p2 
- Hàng dày 5p2 đắt hơn 2tr đồng ! 
~~~>>> Lợi Ích Khi Mua Sản Phẩm : 

~~~ Miễn phí giao hàng bán kính 50km ~~~ 
->>> Chú Ý : Ưu Đãi Đặc Biệt Khi Quý Khách Mua 3 sản phẩm cùng 1 lúc bên công ty chúng tôi có khuyến mãi giảm giá tất lên đến 3% tổng hóa đơn giá trị sản phẩm ! 

Hàng bền,đẹp phun PU tỷ mỉ - độ bền trên 500 năm 
Bảo Hành : 50 năm  mối mọt ')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [OldPrice], [Image], [CurrentPrice], [InventQuantity], [Description]) VALUES (24, 2, N'An Gian Thờ Gỗ Gõ Đỏ', 13333333, N'h17.jpg', 13000000, 20, N'Chất Liệu : Gỗ Gõ Đỏ,Kate
Hàng Gồm Các Kích Thước và giá : 
1m53x67 = 13.000.000
1m75x81 = 14.000.000
1m97x87 = 15.000.000
có bàn cơm + 4.000.000
Giá bán đã bao gồm sơn PU hoặc đánh vecni đẹp đẽ ! 
Sơn Son Kiếp Vàng + 3.000.000

~~~>>> Lợi Ích Khi Mua Sản Phẩm : 
-- Tặng Ngay 1 tam cấp để trên án trị giá 400k ! 

~~~ Miễn phí giao hàng bán kính 50km ~~~ 
->>> Chú Ý : Ưu Đãi Đặc Biệt Khi Quý Khách Mua 3 sản phẩm cùng 1 lúc bên công ty chúng tôi có khuyến mãi giảm giá tất lên đến 3% tổng hóa đơn giá trị sản phẩm ! 

Hàng bền,đẹp phun PU tỷ mỉ - độ bền trên 500 năm 
Bảo Hành : 50 năm  mối mọt ')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [OldPrice], [Image], [CurrentPrice], [InventQuantity], [Description]) VALUES (25, 2, N'An Gian Thờ mẫu rồng Gỗ Gụ', 20000000, N'h18.jpg', 20000000, 20, N'Chất liệu : gỗ gụ lào
hàng có giá và kích thước :
2m17 x 1m07  = 20.000.000
Giá bán đã bao gồm sơn PU hoặc đánh vecni đẹp đẽ ! 
Sơn Son Kiếp Vàng +3.000.000

~~~>>> Lợi Ích Khi Mua Sản Phẩm : 

~~~ Miễn phí giao hàng bán kính 50km ~~~ 
->>> Chú Ý : Ưu Đãi Đặc Biệt Khi Quý Khách Mua 3 sản phẩm cùng 1 lúc bên công ty chúng tôi có khuyến mãi giảm giá tất lên đến 3% tổng hóa đơn giá trị sản phẩm ! 

Hàng bền,đẹp phun PU tỷ mỉ - độ bền trên 500 năm 
Bảo Hành : 50 năm  mối mọt ')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [OldPrice], [Image], [CurrentPrice], [InventQuantity], [Description]) VALUES (26, 2, N'Án Gian Thờ Gỗ Gụ', 16666666, N'h19.jpg', 13000000, 20, N'Chất liệu : gỗ gụ lào
Hàng Gồm Các Kích Thước và giá : 
1m53x67 = 13.000.000
1m75x81 = 14.000.000
1m97x87 = 15.000.000
có bàn cơm + 4.000.000
Giá bán đã bao gồm sơn PU hoặc đánh vecni đẹp đẽ ! 
Sơn Son Kiếp Vàng + 3.000.000

~~~>>> Lợi Ích Khi Mua Sản Phẩm : 

~~~ Miễn phí giao hàng bán kính 50km ~~~ 
->>> Chú Ý : Ưu Đãi Đặc Biệt Khi Quý Khách Mua 3 sản phẩm cùng 1 lúc bên công ty chúng tôi có khuyến mãi giảm giá tất lên đến 3% tổng hóa đơn giá trị sản phẩm ! 

Hàng bền,đẹp phun PU tỷ mỉ - độ bền trên 500 năm 
Bảo Hành : 50 năm  mối mọt ')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [OldPrice], [Image], [CurrentPrice], [InventQuantity], [Description]) VALUES (27, 2, N'Án Gian Thờ Gỗ Mít', 9900000, N'h20.jpg', 9900000, 20, N'chất liệu : gỗ mít lõi - gỗ mít giác rẻ hơn 2tr so với giá trên
Hàng Gồm Các Kích Thước và giá : 
1m53x67= 9.900.000
1m75x81 = 10.900.000
1m97x87 = 11.900.000
Giá bán đã bao gồm sơn PU hoặc đánh vecni đẹp đẽ ! 
Sơn Son Kiếp Vàng + 2.000.000

~~~>>> Lợi Ích Khi Mua Sản Phẩm : 

~~~ Miễn phí giao hàng bán kính 50km ~~~ 
->>> Chú Ý : Ưu Đãi Đặc Biệt Khi Quý Khách Mua 3 sản phẩm cùng 1 lúc bên công ty chúng tôi có khuyến mãi giảm giá tất lên đến 3% tổng hóa đơn giá trị sản phẩm ! 

Hàng bền,đẹp phun PU tỷ mỉ - độ bền trên 500 năm 
Bảo Hành : 50 năm  mối mọt ')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [OldPrice], [Image], [CurrentPrice], [InventQuantity], [Description]) VALUES (28, 2, N'Án gian thờ gỗ sồi nga', 9999999, N'h21.jpg', 9000000, 20, N'Hàng Gồm Các Kích Thước và giá :
1m53x81 = 9.000.000
1m75x81 = 9.500.000
1m97x81 = 10.000.000
Giá bán đã bao gồm sơn PU hoặc đánh vecni đẹp đẽ ! 
Mua Thêm Bàn Con Cơm + 3.000.000 ( sơn pu)

~~~>>> Lợi Ích Khi Mua Sản Phẩm : 

~~~ Miễn phí giao hàng bán kính 50km ~~~ 
->>> Chú Ý : Ưu Đãi Đặc Biệt Khi Quý Khách Mua 3 sản phẩm cùng 1 lúc bên công ty chúng tôi có khuyến mãi giảm giá tất lên đến 3% tổng hóa đơn giá trị sản phẩm ! 

Hàng bền,đẹp phun PU tỷ mỉ - độ bền trên 500 năm 
Bảo Hành : 10 năm  mối mọt ')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [OldPrice], [Image], [CurrentPrice], [InventQuantity], [Description]) VALUES (29, 2, N'Sập Thờ Gỗ Mít', 2222222, N'h22.jpg', 20000000, 20, N'chất liệu : gỗ mít 
Hàng Có Các Loại Kích Thước và giá :
Chân 16 - 1m97x97= 20.000.000
Chân 18 - 2m17x107 = 22.000.000
Chân 20 - 2m17x107 = 25.000.000
Chấn 22 - 2m17 x107 =28.000.000 
Chân 24 - 2m17 x 107 = 31.000.000
Giá bán đã bao gồm sơn PU hoặc đánh vecni đẹp đẽ ! 
Sơn Son Kiếp Vàng + 4.000.000

~~~>>> Lợi Ích Khi Mua Sản Phẩm :

~~~ Miễn phí giao hàng bán kính 50km ~~~ 
->>> Chú Ý : Ưu Đãi Đặc Biệt Khi Quý Khách Mua 3 sản phẩm cùng 1 lúc bên công ty chúng tôi có khuyến mãi giảm giá tất lên đến 3% tổng hóa đơn giá trị sản phẩm ! 

Hàng bền,đẹp phun PU tỷ mỉ - độ bền trên 500 năm 
Bảo Hành : 50 năm  mối mọt ')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [OldPrice], [Image], [CurrentPrice], [InventQuantity], [Description]) VALUES (30, 2, N'Tủ Thờ Gỗ Gụ', 15000000, N'h23.jpg', 12000000, 20, N'Chất liệu : gỗ gụ lào
Hàng Có Các Loại Kích Thước và giá :
1m27x67 = 12.000.000
1m53x81 = 13.000.000
1m75x81 = 14.000.000
1m97x81 = 15.000.000
Giá bán đã bao gồm sơn PU hoặc đánh vecni đẹp đẽ ! 
~~~>>> Lợi Ích Khi Mua Sản Phẩm : 

~~~ Miễn phí giao hàng bán kính 50km ~~~ 
->>> Chú Ý : Ưu Đãi Đặc Biệt Khi Quý Khách Mua 3 sản phẩm cùng 1 lúc bên công ty chúng tôi có khuyến mãi giảm giá tất lên đến 3% tổng hóa đơn giá trị sản phẩm ! 

Hàng bền,đẹp phun PU tỷ mỉ - độ bền trên 500 năm 
Bảo Hành : 50 năm  mối mọt ')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [OldPrice], [Image], [CurrentPrice], [InventQuantity], [Description]) VALUES (31, 2, N'Tủ Thờ Gỗ Mít', 11000000, N'h24.jpg', 9900000, 20, N'Chất liệu : gỗ mít 
Hàng Có Các Loại Kích Thước và giá :
1m53x67= 9.900.000
1m75x81 = 10.900.000
1m97x87 = 11.900.000

Giá bán đã bao gồm sơn PU hoặc đánh vecni đẹp đẽ ! 
~~~>>> Lợi Ích Khi Mua Sản Phẩm : 

~~~ Miễn phí giao hàng bán kính 50km ~~~ 
->>> Chú Ý : Ưu Đãi Đặc Biệt Khi Quý Khách Mua 3 sản phẩm cùng 1 lúc bên công ty chúng tôi có khuyến mãi giảm giá tất lên đến 3% tổng hóa đơn giá trị sản phẩm ! 

Hàng bền,đẹp phun PU tỷ mỉ - độ bền trên 500 năm 
Bảo Hành : 50 năm  mối mọt ')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [OldPrice], [Image], [CurrentPrice], [InventQuantity], [Description]) VALUES (32, 2, N'An Gian Thờ Loại Nhỏ Gỗ Gõ Đỏ', 16000000, N'h25.jpg', 14000000, 20, N'An Gian Thờ Loại Nhỏ Gỗ Gõ Đỏ
Chất Liệu : Gỗ Gõ Đỏ,Kate
Hàng Gồm Các Kích Thước và giá : 
 ---Kích thước : 1m27 x 67 x cao 1m27 , tủ nhỏ 67 x 67 x 47 
Combo cả án to tủ nhỏ giá 14tr
Giá bán đã bao gồm sơn PU hoặc đánh vecni đẹp đẽ ! 

~~~>>> Lợi Ích Khi Mua Sản Phẩm : 
-- Tặng Ngay 1 tam cấp để trên án trị giá 400k ! 

~~~ Miễn phí giao hàng bán kính 50km ~~~ 
->>> Chú Ý : Ưu Đãi Đặc Biệt Khi Quý Khách Mua 3 sản phẩm cùng 1 lúc bên công ty chúng tôi có khuyến mãi giảm giá tất lên đến 3% tổng hóa đơn giá trị sản phẩm ! 

Hàng bền,đẹp phun PU tỷ mỉ - độ bền trên 500 năm 
Bảo Hành : 50 năm  mối mọt ')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [OldPrice], [Image], [CurrentPrice], [InventQuantity], [Description]) VALUES (33, 3, N'

Tủ Quần Áo Gỗ Hương Đá', 12222222, N'h26.jpg', 11000000, 20, N'chất liệu : gỗ hương đá
Hàng có kích thước và giá : 
Tủ 3 buồng = 11.000.000
Tủ 4 buồng = 12.000.000
Tủ 5 buồng = 14.100.000
Tủ 6 buồng = 17.500.000
Giá bán đã bao gồm sơn PU
-- Lợi ích khi mua sản phẩm --- ;

~~~ Miễn phí giao hàng bán kính 50km ~~~ 
->>> Chú Ý : Ưu Đãi Đặc Biệt Khi Quý Khách Mua 3 sản phẩm cùng 1 lúc bên công ty chúng tôi có khuyến mãi giảm giá tất lên đến 3% tổng hóa đơn giá trị sản phẩm ! 

Hàng bền,đẹp phun PU tỷ mỉ - độ bền trên 500 năm 
Bảo Hành : 50 năm  mối mọt ')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [OldPrice], [Image], [CurrentPrice], [InventQuantity], [Description]) VALUES (34, 3, N'Tủ Quần Áo Gỗ Gõ Đỏ', 26666666, N'h27.jpg', 23000000, 20, N'Tủ quần áo gỗ gõ đỏ,kate
- Thông tin sản phẩm :
Hàng có kích thước và giá : 
Tủ 3 kt: 190x215 x 61 = 23.000.000đ
Tủ 4 kt: 217x215 x 61 = 26.000.000đ
Tủ 5 buồng = 31.000.000
Tủ 6 buồng = 38.000.000
Giá bán đã bao gồm sơn PU hoặc đánh vecni

~~~>>> Lợi Ích Khi Mua Sản Phẩm : 

~~~ Miễn phí giao hàng bán kính 50km ~~~ 
->>> Chú Ý : Ưu Đãi Đặc Biệt Khi Quý Khách Mua 3 sản phẩm cùng 1 lúc bên công ty chúng tôi có khuyến mãi giảm giá tất lên đến 3% tổng hóa đơn giá trị sản phẩm ! 

Hàng bền,đẹp phun PU tỷ mỉ - độ bền trên 5000 năm 
Bảo Hành : 100 năm  mối mọt ')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [OldPrice], [Image], [CurrentPrice], [InventQuantity], [Description]) VALUES (35, 3, N'Tủ Rượu Góc Gỗ Mun Lào', 33333333, N'h28.jpg', 31500000, 20, N'Tủ Rượu Góc Gỗ Mun Lào
Loại góc 60 = 31.500.000
Loại góc 70 = 36.000.000
Giá bán đã bao gồm SƠn Pu 
~~~>>> Lợi Ích Khi Mua Sản Phẩm : 

~~ lắp kính , gương phản chiếu ! 

~~~ Miễn phí giao hàng bán kính 100km ~~~ 

->>> Chú Ý : Ưu Đãi Đặc Biệt Khi Quý Khách Mua 3 sản phẩm cùng 1 lúc bên công ty chúng tôi có khuyến mãi giảm giá tất lên đến 3% tổng hóa đơn giá trị sản phẩm ! 

Hàng bền,đẹp phun PU tỷ mỉ - độ bền trên 1000 năm 
Bảo Hành : trọn đời')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [OldPrice], [Image], [CurrentPrice], [InventQuantity], [Description]) VALUES (37, 3, N'Tủ Quần Áo Gỗ Hương Xám', 12689999, N'h29.jpg', 10000000, 20, N'chất liệu : gỗ hương xám
Hàng có kích thước và giá : 
Tủ 3 buồng = 10.000.000
Tủ 4 buồng = 11.000.000
Tủ 5 buồng = 13.100.000
Tủ 6 buồng = 16.500.000
Giá bán đã bao gồm sơn PU
-- Lợi ích khi mua sản phẩm --- ;

~~~ Miễn phí giao hàng bán kính 50km ~~~ 
->>> Chú Ý : Ưu Đãi Đặc Biệt Khi Quý Khách Mua 3 sản phẩm cùng 1 lúc bên công ty chúng tôi có khuyến mãi giảm giá tất lên đến 3% tổng hóa đơn giá trị sản phẩm ! 

Hàng bền,đẹp phun PU tỷ mỉ - độ bền trên 500 năm 
Bảo Hành : 50 năm  mối mọt ')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [OldPrice], [Image], [CurrentPrice], [InventQuantity], [Description]) VALUES (38, 3, N'Tủ Rượu Mẫu Mới Cực Đẹp', 18888888, N'h30.jpg', 17500000, 20, N'- Hàng có các chất liệu gỗ và giá bằng nhau như : gỗ gõ đỏ , gỗ hương đá - chất liệu 2 loại gỗ cực tốt - tùy chọn loại gỗ,mẫu mã như nhau ! 
- Thông Tin Sản Phẩm : 
 ++++ Hàng có Kích Thước  và giá
 ++ dài 1m6 x 45 x 2m3 = 17.500.000
++  dài 1m8 x 45 x 2m3 = 18.500.000
Chất Liệu : Gỗ Hương Đá -Hoặc - Gỗ Gõ Đỏ,Kate ( giá bằng nhau ) 
Giá bán đã  bao gồm sơn PU hoặc đánh vecni
~~~>>> Lợi Ích Khi Mua Sản Phẩm : 

~~~ Miễn phí giao hàng bán kính 50km ~~~ 
->>> Chú Ý : Ưu Đãi Đặc Biệt Khi Quý Khách Mua 3 sản phẩm cùng 1 lúc bên công ty chúng tôi có khuyến mãi giảm giá tất lên đến 3% tổng hóa đơn giá trị sản phẩm ! 

Hàng bền,đẹp phun PU tỷ mỉ - độ bền trên 500 năm 
Bảo Hành : 50 năm  mối mọt ')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [OldPrice], [Image], [CurrentPrice], [InventQuantity], [Description]) VALUES (39, 3, N'Tủ Quần Áo Gỗ Gụ', 25000000, N'h31.jpg', 25000000, 20, N'Tủ quần áo gỗ gụ
- Thông tin sản phẩm :
Hàng có kích thước và giá : 
Tủ 3 buồng = 25.000.000
Tủ 4 buồng = 31.000.000
Tủ 5 buồng = 39.000.000
Tủ 6 buồng = 48.000.000
Giá bán đã bao gồm sơn PU hoặc đánh vecni
 

~~~>>> Lợi Ích Khi Mua Sản Phẩm : 

~~~ Miễn phí giao hàng bán kính 50km ~~~ 
->>> Chú Ý : Ưu Đãi Đặc Biệt Khi Quý Khách Mua 3 sản phẩm cùng 1 lúc bên công ty chúng tôi có khuyến mãi giảm giá tất lên đến 3% tổng hóa đơn giá trị sản phẩm ! 

Hàng bền,đẹp phun PU tỷ mỉ - độ bền trên 500 năm 
Bảo Hành : 50 năm  mối mọt ')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [OldPrice], [Image], [CurrentPrice], [InventQuantity], [Description]) VALUES (40, 3, N'Tủ Thờ Sồi Nga', 9999999, N'h32.jpg', 85000000, 20, N'Tủ Thờ Sồi Nga - vân gỗ sồi cực kì nhiều,to, đẹp ! 
- Thông tin sản phẩm :
Chất Liệu : Gỗ Sồi Nga
Hàng Có Các Loại Kích Thước và giá :
1m53x81 = 8.500.000
1m75x81 = 9.000.000
1m97x81 = 9.500.000
Giá bán đã bao gồm sơn PU hoặc đánh vecni
~~~>>> Lợi Ích Khi Mua Sản Phẩm : 

~~~ Miễn phí giao hàng bán kính 50km ~~~
->>> Chú Ý : Ưu Đãi Đặc Biệt Khi Quý Khách Mua 3 sản phẩm cùng 1 lúc bên công ty chúng tôi có khuyến mãi giảm giá tất lên đến 3% tổng hóa đơn giá trị sản phẩm ! 

Hàng bền,đẹp phun PU tỷ mỉ - độ bền trên 500 năm 
Bảo Hành : 10 năm  mối mọt ')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [OldPrice], [Image], [CurrentPrice], [InventQuantity], [Description]) VALUES (41, 4, N'Bộ Bàn Ghế Sofa Da nhập Khẩu', 22222222, N'h33.jpg', 19500000, 20, N'Bộ Bàn Ghế Sofa, Da nhập Khẩu !

Chất Liệu : gỗ sồi nga

+ Hàng có kích thước :

- Ghế Dài : 2m50x70

- Ghế Ngắn : 1m65x70

- Bàn to : 65x1m25

- Bàn kẹp 65x65

- 1 đôn : 1mx45

+ Giá Khuyến Mãi : 19.500.000đ

Giá bán đã bao gồm sơn pu hoàn thiện như ảnh!

~~~>>> Lợi Ích Khi Mua Sản Phẩm :

~~~ Miễn phí giao hàng bán kính 50km ~~~

->>> Chú Ý : Ưu Đãi Đặc Biệt Khi Quý Khách Mua 3 sản phẩm cùng 1 lúc bên công ty chúng tôi có khuyến mãi giảm giá tất lên đến 3% tổng hóa đơn giá trị sản phẩm !

Hàng bền,đẹp phun PU tỷ mỉ - độ bền trên 500 năm

Bảo Hành : 50 năm mối mọt')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [OldPrice], [Image], [CurrentPrice], [InventQuantity], [Description]) VALUES (42, 4, N'Bộ Sofa góc gỗ cẩm vàng', 19999999, N'h34.jpg', 18000000, 20, N'Bộ Sofa góc sẻ ván đóng hộp gỗ cẩm vàng cực kì đẹp , giá cực kì phải chăng ! 
Thông tin sản phẩm :
Chất Liệu : gỗ cẩm vàng
Kích Thước : 
- Ghế dài góc 1m8 x 2m4 x 70  
- bàn 70x1m6
- đôn 35x35 đôn kính 40x70
Giá = 18.000.000đ
Giá bán đã bao gồm sơn pu
Khi Mua Hoàn Thiện Tặng Ngay Kính Bàn, Kính Đôn kẹp
Hàng Gồm 06 món:

+ 01 bàn,

+ 02 ghế,

+ 01 đoản,

+01 bàn nách

+ 01 đôn
~~~>>> Lợi Ích Khi Mua Sản Phẩm : 
~~ Khi mua sản phẩm Tặng ngay 1 khay trà hương đỏ lên tới 600k 
~~~ Khi Mua Hoàn Thiện Tặng Ngay Kính Bàn, Kính Đôn kẹp

~~~ Miễn phí giao hàng bán kính 50km ~~~ 
->>> Chú Ý : Ưu Đãi Đặc Biệt Khi Quý Khách Mua 3 sản phẩm cùng 1 lúc bên công ty chúng tôi có khuyến mãi giảm giá tất lên đến 3% tổng hóa đơn giá trị sản phẩm ! 

Hàng bền,đẹp phun PU tỷ mỉ - độ bền trên 500 năm 
Bảo Hành : 50 năm  mối mọt ')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [OldPrice], [Image], [CurrentPrice], [InventQuantity], [Description]) VALUES (43, 4, N'Bộ bàn ghế minh quốc voi ma mút gỗ gõ đỏ siêu víp', 46000000, N'h35.jpg', 44000000, 20, N'+ Hàng siêu víp , khuôn tranh dày 4p , ván dày 2p , yếm 4p5 , tay voi liền , đặc nguyên con , vách tựa lưng 5p , bàn liền tấm đục tứ linh, hàng uốn cong cực đẹp ,tựa đầu đục 2 mặt cực đẹp, dáng ghế cực cong ! 

Giá hoàn thiện sơn pu hoặc vecni : 44.000.000d

- Thông Tin Sản Phẩm :

Kích thước : Tay 12 - Cột 12

Chất Liệu : Gỗ gõ đỏ,kate

Hàng siêu víp , khuôn tranh dày 4p , ván dày 2p , yếm 4p5 , tay voi liền , đặc nguyên con , vách tựa lưng 5p , bàn liền tấm đục tứ linh , hàng thêm 2 lớp sen dẹo cực đẹp ! 

Hàng Gồm 6 món:

+ 01 bàn,

+ 02 ghế,

+ 01 đoản,

+ 01 đôn kẹp

+ 01 đôn ngồi

~~~>>> Lợi Ích Khi Mua Sản Phẩm : 
~~ Khi mua sản phẩm Tặng ngay 1 khay trà hương đỏ lên tới 600k 
~~~ Khi Mua Hoàn Thiện Tặng Ngay Kính Bàn, Kính Đôn kẹp

~~~ Miễn phí giao hàng bán kính 50km ~~~ 
->>> Chú Ý : Ưu Đãi Đặc Biệt Khi Quý Khách Mua 3 sản phẩm cùng 1 lúc bên công ty chúng tôi có khuyến mãi giảm giá tất lên đến 3% tổng hóa đơn giá trị sản phẩm ! 

Hàng bền,đẹp phun PU tỷ mỉ - độ bền trên 500 năm 
Bảo Hành : 50 năm  mối mọt ')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [OldPrice], [Image], [CurrentPrice], [InventQuantity], [Description]) VALUES (45, 5, N'Giường Hoa Lá Tây Gỗ Hương Đá', 23333333, N'h36.jpg', 21000000, 20, N'Giường Hoa Lá Tây Gỗ Hương Đá mẫu mã đẹp sang trọng ! 
Chất Liệu: gỗ hương đá 
Hàng có kích thước và giá :
Giường 1m6 x 2m = 21.000.000
Giường 1m8 x 2m = 23.000.000
Giường 2m x 2m2 = 26.500.000
Giá bán đã bao gồm sơn PU hoặc đánh vecni
~~~>>> Lợi Ích Khi Mua Sản Phẩm : 

~~~ Miễn phí giao hàng bán kính 50km ~~~
->>> Chú Ý : Ưu Đãi Đặc Biệt Khi Quý Khách Mua 3 sản phẩm cùng 1 lúc bên công ty chúng tôi có khuyến mãi giảm giá tất lên đến 3% tổng hóa đơn giá trị sản phẩm ! 

Hàng bền,đẹp phun PU tỷ mỉ - độ bền trên 500 năm 
Bảo Hành : 50 năm  mối mọt ')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [OldPrice], [Image], [CurrentPrice], [InventQuantity], [Description]) VALUES (46, 5, N'Giường Hoàng Gia Gỗ Gõ Đỏ', 28888888, N'h37.jpg', 25000000, 20, N'Chất Liệu: gỗ gõ đỏ - kate
Hàng có kích thước và giá :
Giường 1m6 x 2m = 25.000.000
Giường 1m8 x 2m = 26.500.000
Giường 2m x 2m2 = 29.000.000
Giá bán đã bao gồm sơn PU hoặc đánh vecni
~~~>>> Lợi Ích Khi Mua Sản Phẩm : 

~~~ Miễn phí giao hàng bán kính 50km và lắp đặt ~~~
->>> Chú Ý : Ưu Đãi Đặc Biệt Khi Quý Khách Mua 3 sản phẩm cùng 1 lúc bên công ty chúng tôi có khuyến mãi giảm giá tất lên đến 3% tổng hóa đơn giá trị sản phẩm ! 

Hàng bền,đẹp phun PU tỷ mỉ - độ bền trên 500 năm 
Bảo Hành : 50 năm  mối mọt ')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [OldPrice], [Image], [CurrentPrice], [InventQuantity], [Description]) VALUES (48, 5, N'Giường Gỗ Gõ Đỏ', 19999999, N'h38.jpg', 18000000, 20, N'Chất Liệu: gỗ gõ đỏ - kate
Hàng có kích thước và giá :
Giường 1m6 x 2m = 18.000.000
Giường 1m8 x 2m = 19.000.000
Giường 2m x 2m2 = 20.500.000
Giá bán đã bao gồm sơn PU hoặc đánh vecni
~~~>>> Lợi Ích Khi Mua Sản Phẩm : 

~~~ Miễn phí giao hàng bán kính 50km ~~~
->>> Chú Ý : Ưu Đãi Đặc Biệt Khi Quý Khách Mua 3 sản phẩm cùng 1 lúc bên công ty chúng tôi có khuyến mãi giảm giá tất lên đến 3% tổng hóa đơn giá trị sản phẩm ! 

Hàng bền,đẹp phun PU tỷ mỉ - độ bền trên 500 năm 
Bảo Hành : 50 năm  mối mọt ')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [OldPrice], [Image], [CurrentPrice], [InventQuantity], [Description]) VALUES (50, 5, N'Giường Gỗ Hương Đá', 8888888, N'h39.jpg', 8500000, 0, N'Chất Liệu : gỗ hương đá - hàng cực kì đẹp
Hàng có kích thước và giá :  
Giường 1m6 x 2m = 8.500.000
Giường 1m8 x 2m = 9.000.000
Giường 2m x 2m2 = 10.500.000
Giá bán đã bao gồm dát phản như ảnh

~~~>>> Lợi Ích Khi Mua Sản Phẩm :

~~~ Miễn phí giao hàng bán kính 50km ~~~ 
->>> Chú Ý : Ưu Đãi Đặc Biệt Khi Quý Khách Mua 3 sản phẩm cùng 1 lúc bên công ty chúng tôi có khuyến mãi giảm giá tất lên đến 3% tổng hóa đơn giá trị sản phẩm ! 

Hàng bền,đẹp phun PU tỷ mỉ - độ bền trên 500 năm 
Bảo Hành : 20 năm  mối mọt ')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [OldPrice], [Image], [CurrentPrice], [InventQuantity], [Description]) VALUES (53, 6, N'Cây Đồng Hồ Tứ Trụ Dát Vàng Cực Kì Víp', 22222222, N'h41.jpg', 20000000, 2, N'Hàng có các loại chất liệu gỗ như : gỗ gõ đỏ, gỗ hương đá - gỗ mun đuôi công - mẫu hàng có 3 loại gỗ khác nhau - mẫu như nhau - giá bằng nhau ! 

Hàng có kích Thước và Giá : 
Cây Cao 2m5 x 50 x 105 = 20.000.000
Giá bán đã gồm Sơn PU và dát vàng đẹp như ảnh

~~~>>> Lợi Ích Khi Mua Sản Phẩm : 

~~~ Miễn phí giao hàng bán kính 50km ~~~ 
->>> Chú Ý : Ưu Đãi Đặc Biệt Khi Quý Khách Mua 3 sản phẩm cùng 1 lúc bên công ty chúng tôi có khuyến mãi giảm giá tất lên đến 3% tổng hóa đơn giá trị sản phẩm ! 

Hàng bền,đẹp phun PU tỷ mỉ - độ bền trên 500 năm 
Bảo Hành : 50 năm  mối mọt ')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [PhoneNumber], [AddressDetail], [City], [District], [Password], [Status], [IsAdmin], [quyen]) VALUES (1005, N'Đỗ', N'Trung Kiên', N'trungkien@gmail.com', N'0396345724', N'Số 298 Đ. Cầu Diễn, Minh Khai, Bắc Từ Liêm, Hà Nội', N'Hà Nội', N'Bắc Từ Liêm', N'123456                                            ', 0, 1, N'Quản trị viên')
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [PhoneNumber], [AddressDetail], [City], [District], [Password], [Status], [IsAdmin], [quyen]) VALUES (1006, N'Phạm Văn', N'Phong', N'phong@gmail.com', N'0347623848', N'Phường Tây Tựu, quận Bắc Từ Liêm, thành phố Hà Nội.', N'Hà Nội', N'Bắc Từ Liêm', N'123456                                            ', 0, 1, N'Quản lý')
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [PhoneNumber], [AddressDetail], [City], [District], [Password], [Status], [IsAdmin], [quyen]) VALUES (1008, N'Cao', N'Khải', N'caokhai@gmail.com', N'0984826146', N'Phường Lê Hồng Phong , xã Phù Vân, thành phố Phủ Lý, tỉnh Hà Nam', N'Hà Nam', N'Phủ Lý', N'123456                                            ', 1, 0, N'Nhân viên')
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [PhoneNumber], [AddressDetail], [City], [District], [Password], [Status], [IsAdmin], [quyen]) VALUES (1009, N'Tùng', N'Dương', N'tungduong@gmail.com', N'0976462753', N'Kiên Thành, Trấn Yên, Yên Bái', N'Yên Bái', N'Trấn Yên', N'123456                                            ', 1, 0, N'Nhân viên')
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [PhoneNumber], [AddressDetail], [City], [District], [Password], [Status], [IsAdmin], [quyen]) VALUES (1010, N'Thanh', N'Thanh', N'Thanh@gmail.com', N'0787253232', N'ĐT39B, Thạch Khôi, Gia Lộc, Hải Dương', N'Hải Dương', N'Gia Lộc', N'123456                                            ', 1, 0, N'Nhân viên')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__Categor__2E1BDC42] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__Categor__2E1BDC42]
GO
ALTER TABLE [dbo].[ProductsCart]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductsCart]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[ProductsOrder]  WITH CHECK ADD FOREIGN KEY([InvoiceId])
REFERENCES [dbo].[Invoice] ([InvoiceId])
GO
ALTER TABLE [dbo].[ProductsOrder]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
