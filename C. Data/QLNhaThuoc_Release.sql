USE [QLNhaThuoc]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 2016-06-02 12:52:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Level] [int] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTHoadonbanthuoc]    Script Date: 2016-06-02 12:52:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTHoadonbanthuoc](
	[HoadonbanthuocID] [int] NOT NULL,
	[Thuoc] [int] NOT NULL,
	[Soluong] [real] NULL,
	[Dongia] [real] NULL,
 CONSTRAINT [PK_CTHoadonbanhang] PRIMARY KEY CLUSTERED 
(
	[HoadonbanthuocID] ASC,
	[Thuoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTHoadonnhapthuoc]    Script Date: 2016-06-02 12:52:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTHoadonnhapthuoc](
	[HoadonnhapthuocID] [int] NOT NULL,
	[ThuocID] [int] NOT NULL,
	[Soluong] [real] NULL,
	[Dongia] [real] NULL,
 CONSTRAINT [PK_CTHoadonnhaphang] PRIMARY KEY CLUSTERED 
(
	[HoadonnhapthuocID] ASC,
	[ThuocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Hoadonbanthuoc]    Script Date: 2016-06-02 12:52:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hoadonbanthuoc](
	[HoadonbanthuocID] [int] IDENTITY(1,1) NOT NULL,
	[Ngayviet] [datetime] NULL,
	[KhachhangID] [int] NULL,
	[NhanvienID] [int] NULL,
	[Thanhtien] [real] NULL,
 CONSTRAINT [PK_Hoadonbanhang] PRIMARY KEY CLUSTERED 
(
	[HoadonbanthuocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Hoadonnhapthuoc]    Script Date: 2016-06-02 12:52:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hoadonnhapthuoc](
	[HoadonnhapthuocID] [int] IDENTITY(1,1) NOT NULL,
	[Ngayviet] [datetime] NULL,
	[NhanvienID] [int] NULL,
	[NhacungcapID] [int] NULL,
	[Thanhtien] [real] NULL,
 CONSTRAINT [PK_Hoadonnhaphang] PRIMARY KEY CLUSTERED 
(
	[HoadonnhapthuocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Khachhang]    Script Date: 2016-06-02 12:52:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khachhang](
	[KhachhangID] [int] IDENTITY(1,1) NOT NULL,
	[Tenkhachhang] [nvarchar](50) NULL,
	[Ngaysinh] [datetime] NULL,
	[Gioitinh] [bit] NULL,
	[Sodienthoai] [nchar](17) NULL,
	[Diachi] [nvarchar](100) NULL,
 CONSTRAINT [PK_Khachhang] PRIMARY KEY CLUSTERED 
(
	[KhachhangID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Nhacungcap]    Script Date: 2016-06-02 12:52:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Nhacungcap](
	[NhacungcapID] [int] IDENTITY(1,1) NOT NULL,
	[Tennhacungcap] [nvarchar](50) NULL,
	[Diachi] [nvarchar](50) NULL,
	[Dienthoai] [varchar](20) NULL,
 CONSTRAINT [PK_Nhacungcap] PRIMARY KEY CLUSTERED 
(
	[NhacungcapID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Nhanvien]    Script Date: 2016-06-02 12:52:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nhanvien](
	[NhanvienID] [int] IDENTITY(1,1) NOT NULL,
	[Hoten] [nvarchar](50) NULL,
	[Hesoluong] [real] NULL,
	[Gioitinh] [bit] NULL,
	[Ngaysinh] [datetime] NULL,
	[Diachi] [nvarchar](100) NULL,
	[Email] [nvarchar](50) NULL,
	[AccountID] [int] NULL,
 CONSTRAINT [PK_Nhanvien] PRIMARY KEY CLUSTERED 
(
	[NhanvienID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Nhomthuoc]    Script Date: 2016-06-02 12:52:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nhomthuoc](
	[NhomthuocID] [int] IDENTITY(1,1) NOT NULL,
	[Tennhomthuoc] [nvarchar](50) NULL,
 CONSTRAINT [PK_Loaisanpham] PRIMARY KEY CLUSTERED 
(
	[NhomthuocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Thuoc]    Script Date: 2016-06-02 12:52:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Thuoc](
	[ThuocID] [int] IDENTITY(1,1) NOT NULL,
	[Tenthuoc] [nvarchar](50) NULL,
	[Donvitinh] [nvarchar](10) NULL,
	[Dongia] [real] NULL,
	[Ngaysanxuat] [datetime] NULL,
	[Ngayhethan] [datetime] NULL,
	[Noisanxuat] [nvarchar](50) NULL,
	[Congdung] [nvarchar](max) NULL,
	[Thanhphan] [nvarchar](max) NULL,
	[NhacungcapID] [int] NULL,
	[NhomthuocID] [int] NULL,
	[Soluong] [int] NULL,
 CONSTRAINT [PK_Sanpham] PRIMARY KEY CLUSTERED 
(
	[ThuocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Level]) VALUES (1, N'hieutt', N'123456', 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Level]) VALUES (2, N'dzunght', N'123456', 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Level]) VALUES (3, N'doanvd', N'123456', 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Level]) VALUES (4, N'Linhnt', N'462149', 2)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Level]) VALUES (5, N'Minhpn', N'763154', 3)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Level]) VALUES (6, N'Huynq', N'123456', 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Level]) VALUES (7, N'Anhnn', N'060135', 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Level]) VALUES (8, N'Hungpq', N'300042', 2)
SET IDENTITY_INSERT [dbo].[Account] OFF
INSERT [dbo].[CTHoadonbanthuoc] ([HoadonbanthuocID], [Thuoc], [Soluong], [Dongia]) VALUES (1, 45, 2, 100)
INSERT [dbo].[CTHoadonbanthuoc] ([HoadonbanthuocID], [Thuoc], [Soluong], [Dongia]) VALUES (1, 48, 3, 45)
INSERT [dbo].[CTHoadonbanthuoc] ([HoadonbanthuocID], [Thuoc], [Soluong], [Dongia]) VALUES (2, 44, 2, 15)
INSERT [dbo].[CTHoadonbanthuoc] ([HoadonbanthuocID], [Thuoc], [Soluong], [Dongia]) VALUES (2, 47, 3, 45)
INSERT [dbo].[CTHoadonbanthuoc] ([HoadonbanthuocID], [Thuoc], [Soluong], [Dongia]) VALUES (3, 49, 5, 45)
INSERT [dbo].[CTHoadonbanthuoc] ([HoadonbanthuocID], [Thuoc], [Soluong], [Dongia]) VALUES (4, 41, 3, 20)
INSERT [dbo].[CTHoadonbanthuoc] ([HoadonbanthuocID], [Thuoc], [Soluong], [Dongia]) VALUES (4, 42, 2, 67)
INSERT [dbo].[CTHoadonbanthuoc] ([HoadonbanthuocID], [Thuoc], [Soluong], [Dongia]) VALUES (5, 40, 2, 37)
INSERT [dbo].[CTHoadonbanthuoc] ([HoadonbanthuocID], [Thuoc], [Soluong], [Dongia]) VALUES (6, 40, 3, 45)
INSERT [dbo].[CTHoadonbanthuoc] ([HoadonbanthuocID], [Thuoc], [Soluong], [Dongia]) VALUES (7, 48, 2, 100)
INSERT [dbo].[CTHoadonbanthuoc] ([HoadonbanthuocID], [Thuoc], [Soluong], [Dongia]) VALUES (8, 41, 3, 20)
INSERT [dbo].[CTHoadonbanthuoc] ([HoadonbanthuocID], [Thuoc], [Soluong], [Dongia]) VALUES (8, 44, 1, 50)
INSERT [dbo].[CTHoadonbanthuoc] ([HoadonbanthuocID], [Thuoc], [Soluong], [Dongia]) VALUES (8, 45, 2, 100)
INSERT [dbo].[CTHoadonbanthuoc] ([HoadonbanthuocID], [Thuoc], [Soluong], [Dongia]) VALUES (9, 47, 2, 250)
INSERT [dbo].[CTHoadonbanthuoc] ([HoadonbanthuocID], [Thuoc], [Soluong], [Dongia]) VALUES (10, 41, 3, 45)
INSERT [dbo].[CTHoadonbanthuoc] ([HoadonbanthuocID], [Thuoc], [Soluong], [Dongia]) VALUES (11, 41, 3, 45)
INSERT [dbo].[CTHoadonbanthuoc] ([HoadonbanthuocID], [Thuoc], [Soluong], [Dongia]) VALUES (11, 45, 2, 100)
INSERT [dbo].[CTHoadonbanthuoc] ([HoadonbanthuocID], [Thuoc], [Soluong], [Dongia]) VALUES (12, 40, 2, 37)
INSERT [dbo].[CTHoadonbanthuoc] ([HoadonbanthuocID], [Thuoc], [Soluong], [Dongia]) VALUES (12, 41, 1, 45)
INSERT [dbo].[CTHoadonbanthuoc] ([HoadonbanthuocID], [Thuoc], [Soluong], [Dongia]) VALUES (12, 49, 2, 23)
INSERT [dbo].[CTHoadonbanthuoc] ([HoadonbanthuocID], [Thuoc], [Soluong], [Dongia]) VALUES (37, 37, 2, 45)
INSERT [dbo].[CTHoadonbanthuoc] ([HoadonbanthuocID], [Thuoc], [Soluong], [Dongia]) VALUES (37, 40, 2, 50)
INSERT [dbo].[CTHoadonbanthuoc] ([HoadonbanthuocID], [Thuoc], [Soluong], [Dongia]) VALUES (38, 38, 2, 67)
INSERT [dbo].[CTHoadonbanthuoc] ([HoadonbanthuocID], [Thuoc], [Soluong], [Dongia]) VALUES (39, 39, 5, 15)
INSERT [dbo].[CTHoadonbanthuoc] ([HoadonbanthuocID], [Thuoc], [Soluong], [Dongia]) VALUES (40, 37, 1, 45)
INSERT [dbo].[CTHoadonbanthuoc] ([HoadonbanthuocID], [Thuoc], [Soluong], [Dongia]) VALUES (41, 40, 1, 50)
INSERT [dbo].[CTHoadonbanthuoc] ([HoadonbanthuocID], [Thuoc], [Soluong], [Dongia]) VALUES (42, 42, 5, 70)
INSERT [dbo].[CTHoadonnhapthuoc] ([HoadonnhapthuocID], [ThuocID], [Soluong], [Dongia]) VALUES (13, 41, 10, 20)
INSERT [dbo].[CTHoadonnhapthuoc] ([HoadonnhapthuocID], [ThuocID], [Soluong], [Dongia]) VALUES (13, 43, 50, 15)
INSERT [dbo].[CTHoadonnhapthuoc] ([HoadonnhapthuocID], [ThuocID], [Soluong], [Dongia]) VALUES (14, 43, 100, 42)
INSERT [dbo].[CTHoadonnhapthuoc] ([HoadonnhapthuocID], [ThuocID], [Soluong], [Dongia]) VALUES (15, 44, 50, 50)
INSERT [dbo].[CTHoadonnhapthuoc] ([HoadonnhapthuocID], [ThuocID], [Soluong], [Dongia]) VALUES (16, 44, 60, 50)
INSERT [dbo].[CTHoadonnhapthuoc] ([HoadonnhapthuocID], [ThuocID], [Soluong], [Dongia]) VALUES (17, 40, 50, 3.7)
SET IDENTITY_INSERT [dbo].[Hoadonbanthuoc] ON 

INSERT [dbo].[Hoadonbanthuoc] ([HoadonbanthuocID], [Ngayviet], [KhachhangID], [NhanvienID], [Thanhtien]) VALUES (1, CAST(N'2016-05-20 00:00:00.000' AS DateTime), 7, 1, NULL)
INSERT [dbo].[Hoadonbanthuoc] ([HoadonbanthuocID], [Ngayviet], [KhachhangID], [NhanvienID], [Thanhtien]) VALUES (2, CAST(N'2016-05-20 00:00:00.000' AS DateTime), 10, 2, NULL)
INSERT [dbo].[Hoadonbanthuoc] ([HoadonbanthuocID], [Ngayviet], [KhachhangID], [NhanvienID], [Thanhtien]) VALUES (3, CAST(N'2016-05-20 00:00:00.000' AS DateTime), 13, 6, NULL)
INSERT [dbo].[Hoadonbanthuoc] ([HoadonbanthuocID], [Ngayviet], [KhachhangID], [NhanvienID], [Thanhtien]) VALUES (4, CAST(N'2016-05-20 00:00:00.000' AS DateTime), 14, 8, NULL)
INSERT [dbo].[Hoadonbanthuoc] ([HoadonbanthuocID], [Ngayviet], [KhachhangID], [NhanvienID], [Thanhtien]) VALUES (5, CAST(N'2016-05-21 00:00:00.000' AS DateTime), 3, 1, NULL)
INSERT [dbo].[Hoadonbanthuoc] ([HoadonbanthuocID], [Ngayviet], [KhachhangID], [NhanvienID], [Thanhtien]) VALUES (6, CAST(N'2016-05-21 00:00:00.000' AS DateTime), 1, 2, NULL)
INSERT [dbo].[Hoadonbanthuoc] ([HoadonbanthuocID], [Ngayviet], [KhachhangID], [NhanvienID], [Thanhtien]) VALUES (7, CAST(N'2016-05-21 00:00:00.000' AS DateTime), 11, 6, NULL)
INSERT [dbo].[Hoadonbanthuoc] ([HoadonbanthuocID], [Ngayviet], [KhachhangID], [NhanvienID], [Thanhtien]) VALUES (8, CAST(N'2016-05-21 00:00:00.000' AS DateTime), 4, 8, NULL)
INSERT [dbo].[Hoadonbanthuoc] ([HoadonbanthuocID], [Ngayviet], [KhachhangID], [NhanvienID], [Thanhtien]) VALUES (9, CAST(N'2016-05-22 00:00:00.000' AS DateTime), 7, 1, NULL)
INSERT [dbo].[Hoadonbanthuoc] ([HoadonbanthuocID], [Ngayviet], [KhachhangID], [NhanvienID], [Thanhtien]) VALUES (10, CAST(N'2016-05-22 00:00:00.000' AS DateTime), 8, 2, NULL)
INSERT [dbo].[Hoadonbanthuoc] ([HoadonbanthuocID], [Ngayviet], [KhachhangID], [NhanvienID], [Thanhtien]) VALUES (11, CAST(N'2016-05-22 00:00:00.000' AS DateTime), 13, 6, NULL)
INSERT [dbo].[Hoadonbanthuoc] ([HoadonbanthuocID], [Ngayviet], [KhachhangID], [NhanvienID], [Thanhtien]) VALUES (12, CAST(N'2016-05-22 00:00:00.000' AS DateTime), 2, 8, NULL)
INSERT [dbo].[Hoadonbanthuoc] ([HoadonbanthuocID], [Ngayviet], [KhachhangID], [NhanvienID], [Thanhtien]) VALUES (37, CAST(N'2016-06-02 02:00:15.027' AS DateTime), 2, 1, NULL)
INSERT [dbo].[Hoadonbanthuoc] ([HoadonbanthuocID], [Ngayviet], [KhachhangID], [NhanvienID], [Thanhtien]) VALUES (38, CAST(N'2016-06-02 03:05:55.170' AS DateTime), 5, 1, NULL)
INSERT [dbo].[Hoadonbanthuoc] ([HoadonbanthuocID], [Ngayviet], [KhachhangID], [NhanvienID], [Thanhtien]) VALUES (39, CAST(N'2016-06-02 03:06:25.850' AS DateTime), 5, 1, NULL)
INSERT [dbo].[Hoadonbanthuoc] ([HoadonbanthuocID], [Ngayviet], [KhachhangID], [NhanvienID], [Thanhtien]) VALUES (40, CAST(N'2016-06-02 04:12:10.313' AS DateTime), 3, 6, NULL)
INSERT [dbo].[Hoadonbanthuoc] ([HoadonbanthuocID], [Ngayviet], [KhachhangID], [NhanvienID], [Thanhtien]) VALUES (41, CAST(N'2016-06-02 04:13:44.547' AS DateTime), 3, 6, NULL)
INSERT [dbo].[Hoadonbanthuoc] ([HoadonbanthuocID], [Ngayviet], [KhachhangID], [NhanvienID], [Thanhtien]) VALUES (42, CAST(N'2016-06-02 04:15:42.650' AS DateTime), 3, 6, NULL)
SET IDENTITY_INSERT [dbo].[Hoadonbanthuoc] OFF
SET IDENTITY_INSERT [dbo].[Hoadonnhapthuoc] ON 

INSERT [dbo].[Hoadonnhapthuoc] ([HoadonnhapthuocID], [Ngayviet], [NhanvienID], [NhacungcapID], [Thanhtien]) VALUES (13, CAST(N'2016-05-11 00:00:00.000' AS DateTime), 5, 11, 950)
INSERT [dbo].[Hoadonnhapthuoc] ([HoadonnhapthuocID], [Ngayviet], [NhanvienID], [NhacungcapID], [Thanhtien]) VALUES (14, CAST(N'2016-05-13 00:00:00.000' AS DateTime), 5, 6, 4200)
INSERT [dbo].[Hoadonnhapthuoc] ([HoadonnhapthuocID], [Ngayviet], [NhanvienID], [NhacungcapID], [Thanhtien]) VALUES (15, CAST(N'2016-05-15 00:00:00.000' AS DateTime), 5, 9, 2500)
INSERT [dbo].[Hoadonnhapthuoc] ([HoadonnhapthuocID], [Ngayviet], [NhanvienID], [NhacungcapID], [Thanhtien]) VALUES (16, CAST(N'2016-05-20 00:00:00.000' AS DateTime), 5, 10, 3000)
INSERT [dbo].[Hoadonnhapthuoc] ([HoadonnhapthuocID], [Ngayviet], [NhanvienID], [NhacungcapID], [Thanhtien]) VALUES (17, CAST(N'2016-05-25 00:00:00.000' AS DateTime), 5, 13, 185)
SET IDENTITY_INSERT [dbo].[Hoadonnhapthuoc] OFF
SET IDENTITY_INSERT [dbo].[Khachhang] ON 

INSERT [dbo].[Khachhang] ([KhachhangID], [Tenkhachhang], [Ngaysinh], [Gioitinh], [Sodienthoai], [Diachi]) VALUES (1, N'Khách lẻ', CAST(N'1972-09-08 00:00:00.000' AS DateTime), 1, N'01679384751      ', N'Hà Nội')
INSERT [dbo].[Khachhang] ([KhachhangID], [Tenkhachhang], [Ngaysinh], [Gioitinh], [Sodienthoai], [Diachi]) VALUES (2, N'Phùng Ngọc Anh', CAST(N'1991-09-11 00:00:00.000' AS DateTime), 1, N'01663049875      ', N'54 Giải Phóng, Hoàng Mai, Hà Nội')
INSERT [dbo].[Khachhang] ([KhachhangID], [Tenkhachhang], [Ngaysinh], [Gioitinh], [Sodienthoai], [Diachi]) VALUES (3, N'Nguyễn Minh Thành', CAST(N'1990-12-04 00:00:00.000' AS DateTime), 0, N'01234567890      ', N'192 Ngọc Hồi, Thanh Trì, Hà Nội')
INSERT [dbo].[Khachhang] ([KhachhangID], [Tenkhachhang], [Ngaysinh], [Gioitinh], [Sodienthoai], [Diachi]) VALUES (4, N'Hoàng Văn Minh', CAST(N'1984-12-07 00:00:00.000' AS DateTime), 0, N'0974568213       ', N'1 Đội Cấn, Ba Đình, Hà Nội')
INSERT [dbo].[Khachhang] ([KhachhangID], [Tenkhachhang], [Ngaysinh], [Gioitinh], [Sodienthoai], [Diachi]) VALUES (5, N'Phạm Phương Linh', CAST(N'1997-01-01 00:00:00.000' AS DateTime), 1, N'0934661291       ', N'236 Hoàng Quốc Viêt, Cầu Giấy, Hà Nội')
INSERT [dbo].[Khachhang] ([KhachhangID], [Tenkhachhang], [Ngaysinh], [Gioitinh], [Sodienthoai], [Diachi]) VALUES (6, N'Mai Thu Lan', CAST(N'1963-03-10 00:00:00.000' AS DateTime), 1, N'09776851234      ', N'198 Trần Cung, Nam Từ Liêm, Hà Nội')
INSERT [dbo].[Khachhang] ([KhachhangID], [Tenkhachhang], [Ngaysinh], [Gioitinh], [Sodienthoai], [Diachi]) VALUES (7, N'Dương Minh Tiến', CAST(N'1985-06-02 00:00:00.000' AS DateTime), 0, N'0168971543       ', N'112 Xuân Thủy, Cầu Giấy, Hà Nội')
INSERT [dbo].[Khachhang] ([KhachhangID], [Tenkhachhang], [Ngaysinh], [Gioitinh], [Sodienthoai], [Diachi]) VALUES (8, N'Phạm Xuân Thành', CAST(N'1999-01-10 00:00:00.000' AS DateTime), 0, N'01684568921      ', N'234 Đội Cấn, Ba Đình, Hà Nội')
INSERT [dbo].[Khachhang] ([KhachhangID], [Tenkhachhang], [Ngaysinh], [Gioitinh], [Sodienthoai], [Diachi]) VALUES (9, N'Phùng Ngọc Sơn', CAST(N'1968-11-10 00:00:00.000' AS DateTime), 0, N'01623548962      ', N'547 Phạm Văn Đồng, Nam Từ Liêm, Hà Nội')
INSERT [dbo].[Khachhang] ([KhachhangID], [Tenkhachhang], [Ngaysinh], [Gioitinh], [Sodienthoai], [Diachi]) VALUES (10, N'Lê Thị Mơ', CAST(N'1988-02-09 00:00:00.000' AS DateTime), 1, N'01236548994      ', N'123 Trần Thái Tông, Cầu Giấy, Hà Nội')
INSERT [dbo].[Khachhang] ([KhachhangID], [Tenkhachhang], [Ngaysinh], [Gioitinh], [Sodienthoai], [Diachi]) VALUES (11, N'Phan Nhật Ánh', CAST(N'1975-09-10 00:00:00.000' AS DateTime), 0, N'01227894125      ', N'148 Xuân Thủy, Cầu Giấy, Hà Nội')
INSERT [dbo].[Khachhang] ([KhachhangID], [Tenkhachhang], [Ngaysinh], [Gioitinh], [Sodienthoai], [Diachi]) VALUES (12, N'Nguyễn Thị Anh', CAST(N'1998-02-10 00:00:00.000' AS DateTime), 1, N'0962597541       ', N'15 Nguyễn Phong Sắc, Cầu Giấy, Hà Nội')
INSERT [dbo].[Khachhang] ([KhachhangID], [Tenkhachhang], [Ngaysinh], [Gioitinh], [Sodienthoai], [Diachi]) VALUES (13, N'Vũ Thành Nam', CAST(N'1967-08-10 00:00:00.000' AS DateTime), 0, N'01694587611      ', N'165 Cầu Giấy, Cầu Giấy, Hà Nội')
INSERT [dbo].[Khachhang] ([KhachhangID], [Tenkhachhang], [Ngaysinh], [Gioitinh], [Sodienthoai], [Diachi]) VALUES (14, N'Trịnh Viết Hoàng', CAST(N'1981-10-11 00:00:00.000' AS DateTime), 0, N'0945613287       ', N'466 Nguyễn Trãi, Thanh Xuân, Hà Nội')
INSERT [dbo].[Khachhang] ([KhachhangID], [Tenkhachhang], [Ngaysinh], [Gioitinh], [Sodienthoai], [Diachi]) VALUES (15, N'Phạm Thành Đạt', CAST(N'1968-11-12 00:00:00.000' AS DateTime), 0, N'0984561591       ', N'186 Trần Phú, Hà Đông, Hà Nội')
INSERT [dbo].[Khachhang] ([KhachhangID], [Tenkhachhang], [Ngaysinh], [Gioitinh], [Sodienthoai], [Diachi]) VALUES (16, N'Nguyễn Thị Lan Hương', CAST(N'1978-02-02 00:00:00.000' AS DateTime), 1, N'0968541368       ', N'159 Nguyễn Phong Sắc, Cầu Giấy, Hà Nội')
INSERT [dbo].[Khachhang] ([KhachhangID], [Tenkhachhang], [Ngaysinh], [Gioitinh], [Sodienthoai], [Diachi]) VALUES (17, N'Hoàng Ngọc Bích', CAST(N'1979-05-12 00:00:00.000' AS DateTime), 1, N'018846577126     ', N'2 Đội Cấn, Ba Đình, Hà Nội')
SET IDENTITY_INSERT [dbo].[Khachhang] OFF
SET IDENTITY_INSERT [dbo].[Nhacungcap] ON 

INSERT [dbo].[Nhacungcap] ([NhacungcapID], [Tennhacungcap], [Diachi], [Dienthoai]) VALUES (4, N'Công ty cổ phần hoá dược phẩm Mekophar', N'56 Minh Khai, Hai Bà Trưng, Hà Nội', N'043976432')
INSERT [dbo].[Nhacungcap] ([NhacungcapID], [Tennhacungcap], [Diachi], [Dienthoai]) VALUES (5, N'Unique Pharmaceutical Laboratories ', N'KCN Bắc Thăng Long, Hà Nội', N'043784698')
INSERT [dbo].[Nhacungcap] ([NhacungcapID], [Tennhacungcap], [Diachi], [Dienthoai]) VALUES (6, N'Hyphens Marketing & Technical Service Pte. Ltd', N'46 Trần Phú, Tp.Nam Định', N'0245688379')
INSERT [dbo].[Nhacungcap] ([NhacungcapID], [Tennhacungcap], [Diachi], [Dienthoai]) VALUES (7, N'Công ty dược trang thiết bị y tế Bình Định', N'KCN Phố Mới, Bình Định', N'029857452')
INSERT [dbo].[Nhacungcap] ([NhacungcapID], [Tennhacungcap], [Diachi], [Dienthoai]) VALUES (8, N'Zuellig Pharma Pte., Ltd', N'197 Trần Cung, Từ Liêm, Hà Nội', N'0439867463')
INSERT [dbo].[Nhacungcap] ([NhacungcapID], [Tennhacungcap], [Diachi], [Dienthoai]) VALUES (9, N'Xí nghiệp dược phẩm trung ương 1', N'KCN Quang Minh, Mê Linh, Hà Nội', N'0438957489')
INSERT [dbo].[Nhacungcap] ([NhacungcapID], [Tennhacungcap], [Diachi], [Dienthoai]) VALUES (10, N'Sanofi-Synthélabo France', N'968 Giải Phóng, Hoàng Mai, Hà Nội', N'04378495748')
INSERT [dbo].[Nhacungcap] ([NhacungcapID], [Tennhacungcap], [Diachi], [Dienthoai]) VALUES (11, N'Công ty TNHH Sao Kim', N'19 C2 Nghĩa Tân, Cầu Giấy, Hà Nội', N'0437894653')
INSERT [dbo].[Nhacungcap] ([NhacungcapID], [Tennhacungcap], [Diachi], [Dienthoai]) VALUES (12, N'Công ty TNHH SPM ', N'396 Tô Hiệu, Hà Đông, Hà Nội', N'0438957891')
INSERT [dbo].[Nhacungcap] ([NhacungcapID], [Tennhacungcap], [Diachi], [Dienthoai]) VALUES (13, N'Công ty TNHH Dược phẩm Toàn Chân', N'19 Nguyễn Huy Tưởng, Đống Đa, Hà Nội', N'0438976758')
INSERT [dbo].[Nhacungcap] ([NhacungcapID], [Tennhacungcap], [Diachi], [Dienthoai]) VALUES (14, N'Công ty cổ phần dược phẩm trung ương Vidipha', N'26 Hồ Đắc Di, Đống Đa, Hà Nội', N'0437995768')
INSERT [dbo].[Nhacungcap] ([NhacungcapID], [Tennhacungcap], [Diachi], [Dienthoai]) VALUES (15, N'S.I.A. (Tenamyd Canada) Inc', N'199 Kim Mã, Ba Đình Hà Nội', N'0439564319')
INSERT [dbo].[Nhacungcap] ([NhacungcapID], [Tennhacungcap], [Diachi], [Dienthoai]) VALUES (16, N'Novartis AG', N'KCN Hoàng Mai, Hoàng Mai, Hà Nôi', N'043984218')
INSERT [dbo].[Nhacungcap] ([NhacungcapID], [Tennhacungcap], [Diachi], [Dienthoai]) VALUES (28, N'S.I.A. (Tenamyd Canada) Inc', N'199 Kim Mã, Ba Đình Hà Nội', N'0439564319')
INSERT [dbo].[Nhacungcap] ([NhacungcapID], [Tennhacungcap], [Diachi], [Dienthoai]) VALUES (29, N'Novartis AG', N'KCN Hoàng Mai, Hoàng Mai, Hà Nôi', N'043984218')
SET IDENTITY_INSERT [dbo].[Nhacungcap] OFF
SET IDENTITY_INSERT [dbo].[Nhanvien] ON 

INSERT [dbo].[Nhanvien] ([NhanvienID], [Hoten], [Hesoluong], [Gioitinh], [Ngaysinh], [Diachi], [Email], [AccountID]) VALUES (1, N'Trần Trung Hiếu', 3.5, 1, CAST(N'1986-09-08 00:00:00.000' AS DateTime), N'36 Hoàng Cầu, Đống Đa, Hà Nội', N'hieutt@gmail.com', 1)
INSERT [dbo].[Nhanvien] ([NhanvienID], [Hoten], [Hesoluong], [Gioitinh], [Ngaysinh], [Diachi], [Email], [AccountID]) VALUES (2, N'Hoàng Trí Dũng', 4, 1, CAST(N'1990-07-05 00:00:00.000' AS DateTime), N'42 Đinh Lễ, Hoàn Kiếm, Hà Nội', N'dzunght95@gmail.com', 2)
INSERT [dbo].[Nhanvien] ([NhanvienID], [Hoten], [Hesoluong], [Gioitinh], [Ngaysinh], [Diachi], [Email], [AccountID]) VALUES (3, N'Vương Đăng Đoàn', 5, 0, CAST(N'1984-04-09 00:00:00.000' AS DateTime), N'12 Âu Cơ, Tây Hồ, Hà Nội', N'doanvd@gmail.com', 3)
INSERT [dbo].[Nhanvien] ([NhanvienID], [Hoten], [Hesoluong], [Gioitinh], [Ngaysinh], [Diachi], [Email], [AccountID]) VALUES (4, N'Dương Thị Ngọc Huyền', 4.2, 0, CAST(N'1987-11-10 00:00:00.000' AS DateTime), N'321 Nghi Tàm, Tây Hồ, Hà Nội', N'huyendt@gmail.com', 4)
INSERT [dbo].[Nhanvien] ([NhanvienID], [Hoten], [Hesoluong], [Gioitinh], [Ngaysinh], [Diachi], [Email], [AccountID]) VALUES (5, N'Phan Ngọc Minh', 4.2, 0, CAST(N'1991-10-11 00:00:00.000' AS DateTime), N'195 Xuân Thủy, Cầu Giấy, Hà Nội', N'minhpn@gmail.com', 5)
INSERT [dbo].[Nhanvien] ([NhanvienID], [Hoten], [Hesoluong], [Gioitinh], [Ngaysinh], [Diachi], [Email], [AccountID]) VALUES (6, N'Nguyễn Quang Huy', 3.5, 1, CAST(N'1985-09-09 00:00:00.000' AS DateTime), N'Đông Anh, Hà Nội', N'Huyqn@gmail.com', 6)
INSERT [dbo].[Nhanvien] ([NhanvienID], [Hoten], [Hesoluong], [Gioitinh], [Ngaysinh], [Diachi], [Email], [AccountID]) VALUES (7, N'Nguyễn Ngọc Ánh', 3.7, 1, CAST(N'1981-07-08 00:00:00.000' AS DateTime), N'69 Xã Đàn, Đống Đa, Hà Nội', N'anhnn@gmail.com', 7)
INSERT [dbo].[Nhanvien] ([NhanvienID], [Hoten], [Hesoluong], [Gioitinh], [Ngaysinh], [Diachi], [Email], [AccountID]) VALUES (8, N'Phan Quang Hùng', 3.5, 0, CAST(N'1984-12-10 00:00:00.000' AS DateTime), N'129 Giải Phóng, Hoàng Mai, Hà Nội', N'hungpq@gmail.com', 8)
SET IDENTITY_INSERT [dbo].[Nhanvien] OFF
SET IDENTITY_INSERT [dbo].[Nhomthuoc] ON 

INSERT [dbo].[Nhomthuoc] ([NhomthuocID], [Tennhomthuoc]) VALUES (3, N'Hô hấp')
INSERT [dbo].[Nhomthuoc] ([NhomthuocID], [Tennhomthuoc]) VALUES (4, N'Giảm đau, hạ sốt, chống co thắt')
INSERT [dbo].[Nhomthuoc] ([NhomthuocID], [Tennhomthuoc]) VALUES (5, N'Chống dị ứng')
INSERT [dbo].[Nhomthuoc] ([NhomthuocID], [Tennhomthuoc]) VALUES (6, N'Chống viêm')
INSERT [dbo].[Nhomthuoc] ([NhomthuocID], [Tennhomthuoc]) VALUES (7, N'Gây tê, gây mê, phục hồi chức năng')
INSERT [dbo].[Nhomthuoc] ([NhomthuocID], [Tennhomthuoc]) VALUES (8, N'Giải độc')
INSERT [dbo].[Nhomthuoc] ([NhomthuocID], [Tennhomthuoc]) VALUES (9, N'Ngoài da')
INSERT [dbo].[Nhomthuoc] ([NhomthuocID], [Tennhomthuoc]) VALUES (10, N'Nha khoa')
INSERT [dbo].[Nhomthuoc] ([NhomthuocID], [Tennhomthuoc]) VALUES (11, N'Nhãn khoa')
INSERT [dbo].[Nhomthuoc] ([NhomthuocID], [Tennhomthuoc]) VALUES (12, N'Tác động hệ máu, tạo máu')
INSERT [dbo].[Nhomthuoc] ([NhomthuocID], [Tennhomthuoc]) VALUES (13, N'Tác động hệ miễn dịch')
INSERT [dbo].[Nhomthuoc] ([NhomthuocID], [Tennhomthuoc]) VALUES (14, N'Tác động thần kinh')
INSERT [dbo].[Nhomthuoc] ([NhomthuocID], [Tennhomthuoc]) VALUES (15, N'Vitamin, thuốc bổ')
INSERT [dbo].[Nhomthuoc] ([NhomthuocID], [Tennhomthuoc]) VALUES (16, N'Tiêu hóa')
INSERT [dbo].[Nhomthuoc] ([NhomthuocID], [Tennhomthuoc]) VALUES (17, N'Tim mạch')
SET IDENTITY_INSERT [dbo].[Nhomthuoc] OFF
SET IDENTITY_INSERT [dbo].[Thuoc] ON 

INSERT [dbo].[Thuoc] ([ThuocID], [Tenthuoc], [Donvitinh], [Dongia], [Ngaysanxuat], [Ngayhethan], [Noisanxuat], [Congdung], [Thanhphan], [NhacungcapID], [NhomthuocID], [Soluong]) VALUES (37, N'Sandostatin-0,1 mg', N'Hộp', 45, CAST(N'2015-09-08 00:00:00.000' AS DateTime), CAST(N'2018-09-08 00:00:00.000' AS DateTime), N'Việt Nam', N'Rò dạ dày, ruột, tụy sau chấn thương. U nội tiết đường dạ dày – ruột – tụy. Tiêu chảy kéo dài do AIDS', N'Octreotide: 0.1mg/ml', 5, 13, 100)
INSERT [dbo].[Thuoc] ([ThuocID], [Tenthuoc], [Donvitinh], [Dongia], [Ngaysanxuat], [Ngayhethan], [Noisanxuat], [Congdung], [Thanhphan], [NhacungcapID], [NhomthuocID], [Soluong]) VALUES (38, N'Tetracycline 500mg', N'Vỉ', 67, CAST(N'2016-04-05 00:00:00.000' AS DateTime), CAST(N'2018-04-05 00:00:00.000' AS DateTime), N'Việt Nam', N'Điều trị các nhiễm khuẩn do Chlamydia, Rickettsia, lậu cầu, xoắn khuẩn, tả, nhất là các nhiễm khuẩn đường hô hấp, sinh dục, tiết niệu, mắt, tiêu hóa và mụn trứng cá.', N'Tetracyclin: 500mg', 8, 13, 40)
INSERT [dbo].[Thuoc] ([ThuocID], [Tenthuoc], [Donvitinh], [Dongia], [Ngaysanxuat], [Ngayhethan], [Noisanxuat], [Congdung], [Thanhphan], [NhacungcapID], [NhomthuocID], [Soluong]) VALUES (39, N'Timolol 0,5%', N'Lọ', 15, CAST(N'2015-09-04 00:00:00.000' AS DateTime), CAST(N'2017-09-04 00:00:00.000' AS DateTime), N'Việt Nam', N'Làm giảm nhãn áp ở người bệnh tăng nhãn áp hoặc glôccôm góc mở.', N'Timolol: 50mg', 6, 12, 31)
INSERT [dbo].[Thuoc] ([ThuocID], [Tenthuoc], [Donvitinh], [Dongia], [Ngaysanxuat], [Ngayhethan], [Noisanxuat], [Congdung], [Thanhphan], [NhacungcapID], [NhomthuocID], [Soluong]) VALUES (40, N'Neurontin 300mg ', N'Vỉ', 50, CAST(N'2015-08-08 00:00:00.000' AS DateTime), CAST(N'2017-09-08 00:00:00.000' AS DateTime), N'Việt Nam', N'Chữa động kinh. – Đau thần kinh.', N'Gabapentin: 300mg', 7, 15, 25)
INSERT [dbo].[Thuoc] ([ThuocID], [Tenthuoc], [Donvitinh], [Dongia], [Ngaysanxuat], [Ngayhethan], [Noisanxuat], [Congdung], [Thanhphan], [NhacungcapID], [NhomthuocID], [Soluong]) VALUES (41, N'Vinsamin 250mg', N'Vỉ', 100, CAST(N'2015-10-10 00:00:00.000' AS DateTime), CAST(N'2018-10-10 00:00:00.000' AS DateTime), N'Việt Nam', N'Glucosamin: 250mg', N'Tất cả các bệnh thoái hóa xương khớp, thoái khớp nguyên phát và thứ phát như thoái khớp gối, háng, tay, cột sống, vai, viêm quanh khớp, loãng xương, gãy xương teo khớp, viêm khớp mãn và cấp.', 6, 12, 51)
INSERT [dbo].[Thuoc] ([ThuocID], [Tenthuoc], [Donvitinh], [Dongia], [Ngaysanxuat], [Ngayhethan], [Noisanxuat], [Congdung], [Thanhphan], [NhacungcapID], [NhomthuocID], [Soluong]) VALUES (42, N'Nystatin-500000IU', N'Vỉ', 70, CAST(N'2015-02-03 00:00:00.000' AS DateTime), CAST(N'2018-02-03 00:00:00.000' AS DateTime), N'Mỹ', N'Trị Nhiễm nấm ở niêm mạc nhất là do Candida albicans ở miệng như tưa lưỡi, viêm họng, bệnh nấm candida ở ruột và nhiễm nấm ở đường âm đạo (phối hợp với metronidazol)', N'Nystatin: 500000IU', 7, 6, 5)
INSERT [dbo].[Thuoc] ([ThuocID], [Tenthuoc], [Donvitinh], [Dongia], [Ngaysanxuat], [Ngayhethan], [Noisanxuat], [Congdung], [Thanhphan], [NhacungcapID], [NhomthuocID], [Soluong]) VALUES (43, N'Symbicort Turbuhaler-160/4,5mcg', N'Lọ', 250, CAST(N'2016-05-04 00:00:00.000' AS DateTime), CAST(N'2019-05-04 00:00:00.000' AS DateTime), N'Pháp', N'Điều trị thường xuyên bệnh hen.', N'Budesonide: 160mcg', 12, 15, 24)
INSERT [dbo].[Thuoc] ([ThuocID], [Tenthuoc], [Donvitinh], [Dongia], [Ngaysanxuat], [Ngayhethan], [Noisanxuat], [Congdung], [Thanhphan], [NhacungcapID], [NhomthuocID], [Soluong]) VALUES (44, N'Oliza – 10 10 mg', N'Vỉ', 24, CAST(N'2016-02-01 00:00:00.000' AS DateTime), CAST(N'2019-02-01 00:00:00.000' AS DateTime), N'Việt Nam', N'phì đại tuyến tiền liệt, liệt ruột, tăng men gan, suy gan, đang dùng thuốc độc gan, có bạch cầu thấp', N'Olanzapine:10mg', 8, 13, 54)
INSERT [dbo].[Thuoc] ([ThuocID], [Tenthuoc], [Donvitinh], [Dongia], [Ngaysanxuat], [Ngayhethan], [Noisanxuat], [Congdung], [Thanhphan], [NhacungcapID], [NhomthuocID], [Soluong]) VALUES (45, N'Xatral XL 10mg', N'Vỉ', 23, CAST(N'2015-05-04 00:00:00.000' AS DateTime), CAST(N'2019-05-04 00:00:00.000' AS DateTime), N'Pháp', N'Hạ huyết áp', N'Alfuzosin: 10mg', 7, 14, 22)
INSERT [dbo].[Thuoc] ([ThuocID], [Tenthuoc], [Donvitinh], [Dongia], [Ngaysanxuat], [Ngayhethan], [Noisanxuat], [Congdung], [Thanhphan], [NhacungcapID], [NhomthuocID], [Soluong]) VALUES (46, N'Prednisolone 5mg', N'Vỉ', 37, CAST(N'2015-06-05 00:00:00.000' AS DateTime), CAST(N'2019-06-05 00:00:00.000' AS DateTime), N'Việt Nam', N'Chống viêm, chống dị ứng mạnh và ức chế miễn dịch. Dùng khi viêm đau khớp đặc biệt là viêm thấp khớp, đa khớp, viêm nhiễm đường hô hấp các bệnh ngoài da như mề đay mẫn ngứa, ezema, chàm.', N'prednisolone: 5mg', 9, 13, 43)
INSERT [dbo].[Thuoc] ([ThuocID], [Tenthuoc], [Donvitinh], [Dongia], [Ngaysanxuat], [Ngayhethan], [Noisanxuat], [Congdung], [Thanhphan], [NhacungcapID], [NhomthuocID], [Soluong]) VALUES (47, N'Rutin Vitamin C', N'Vỉ', 20, CAST(N'2016-01-01 00:00:00.000' AS DateTime), CAST(N'2019-01-01 00:00:00.000' AS DateTime), N'Việt Nam', N'Điều trị hội chứng chảy máu, xơ cứng, tăng huyết áp, ban xuất huyết, chứng giãn tĩnh mạch (phù, đau, nặng chân, bệnh trĩ…)', N'Acid ascorbic: 50mg', 9, 12, 29)
INSERT [dbo].[Thuoc] ([ThuocID], [Tenthuoc], [Donvitinh], [Dongia], [Ngaysanxuat], [Ngayhethan], [Noisanxuat], [Congdung], [Thanhphan], [NhacungcapID], [NhomthuocID], [Soluong]) VALUES (48, N'Digelase', N'Vỉ', 48, CAST(N'2016-05-05 00:00:00.000' AS DateTime), CAST(N'2019-05-05 00:00:00.000' AS DateTime), N'Mỹ', N'Điều trị các chứng bệnh đường tiêu hóa: ăn không tiêu, biếng ăn…chướng bụng, đầy hơi, các rối loạn hấp thu dinh dưỡng do các bệnh lý tiêu hóa (viêm loét dạ dày, tá tràng, ruột…)', N'Pancreatin: 176mg', 13, 13, 38)
INSERT [dbo].[Thuoc] ([ThuocID], [Tenthuoc], [Donvitinh], [Dongia], [Ngaysanxuat], [Ngayhethan], [Noisanxuat], [Congdung], [Thanhphan], [NhacungcapID], [NhomthuocID], [Soluong]) VALUES (49, N'Aspirin pH8-500mg', N'Vỉ', 42, CAST(N'2016-02-02 00:00:00.000' AS DateTime), CAST(N'2019-02-02 00:00:00.000' AS DateTime), N'Việt Nam', N'Hạ sốt, giảm đau: nhức đầu, đau dây thần kinh, đau răng, viêm khớp', N'dipyridamol, metoclopramid, motoprolol, NSAID, corticosteroid, Coumarin, sulfonylurea', 11, 10, 64)
INSERT [dbo].[Thuoc] ([ThuocID], [Tenthuoc], [Donvitinh], [Dongia], [Ngaysanxuat], [Ngayhethan], [Noisanxuat], [Congdung], [Thanhphan], [NhacungcapID], [NhomthuocID], [Soluong]) VALUES (50, N'Ior Leukocim-300mcg', N'Vỉ', 50, CAST(N'2015-08-01 00:00:00.000' AS DateTime), CAST(N'2019-08-01 00:00:00.000' AS DateTime), N'Việt Nam', N'Làm giảm sự nhiễm độc tế bào trong hoá trị gây giảm bạch cầu trung tính. ', N'Filgrastim: 300mcg', 10, 10, 58)
SET IDENTITY_INSERT [dbo].[Thuoc] OFF
ALTER TABLE [dbo].[CTHoadonbanthuoc]  WITH CHECK ADD  CONSTRAINT [FK_CTHoadonbanthuoc_Hoadonbanthuoc] FOREIGN KEY([HoadonbanthuocID])
REFERENCES [dbo].[Hoadonbanthuoc] ([HoadonbanthuocID])
GO
ALTER TABLE [dbo].[CTHoadonbanthuoc] CHECK CONSTRAINT [FK_CTHoadonbanthuoc_Hoadonbanthuoc]
GO
ALTER TABLE [dbo].[CTHoadonbanthuoc]  WITH CHECK ADD  CONSTRAINT [FK_CTHoadonbanthuoc_Thuoc] FOREIGN KEY([Thuoc])
REFERENCES [dbo].[Thuoc] ([ThuocID])
GO
ALTER TABLE [dbo].[CTHoadonbanthuoc] CHECK CONSTRAINT [FK_CTHoadonbanthuoc_Thuoc]
GO
ALTER TABLE [dbo].[CTHoadonnhapthuoc]  WITH CHECK ADD  CONSTRAINT [FK_CTHoadonnhapthuoc_Hoadonnhapthuoc] FOREIGN KEY([HoadonnhapthuocID])
REFERENCES [dbo].[Hoadonnhapthuoc] ([HoadonnhapthuocID])
GO
ALTER TABLE [dbo].[CTHoadonnhapthuoc] CHECK CONSTRAINT [FK_CTHoadonnhapthuoc_Hoadonnhapthuoc]
GO
ALTER TABLE [dbo].[CTHoadonnhapthuoc]  WITH CHECK ADD  CONSTRAINT [FK_CTHoadonnhapthuoc_Thuoc] FOREIGN KEY([ThuocID])
REFERENCES [dbo].[Thuoc] ([ThuocID])
GO
ALTER TABLE [dbo].[CTHoadonnhapthuoc] CHECK CONSTRAINT [FK_CTHoadonnhapthuoc_Thuoc]
GO
ALTER TABLE [dbo].[Hoadonbanthuoc]  WITH CHECK ADD  CONSTRAINT [FK_Hoadonbanthuoc_Khachhang] FOREIGN KEY([KhachhangID])
REFERENCES [dbo].[Khachhang] ([KhachhangID])
GO
ALTER TABLE [dbo].[Hoadonbanthuoc] CHECK CONSTRAINT [FK_Hoadonbanthuoc_Khachhang]
GO
ALTER TABLE [dbo].[Hoadonbanthuoc]  WITH CHECK ADD  CONSTRAINT [FK_Hoadonbanthuoc_Nhanvien] FOREIGN KEY([NhanvienID])
REFERENCES [dbo].[Nhanvien] ([NhanvienID])
GO
ALTER TABLE [dbo].[Hoadonbanthuoc] CHECK CONSTRAINT [FK_Hoadonbanthuoc_Nhanvien]
GO
ALTER TABLE [dbo].[Hoadonnhapthuoc]  WITH CHECK ADD  CONSTRAINT [FK_Hoadonnhapthuoc_Nhacungcap] FOREIGN KEY([NhacungcapID])
REFERENCES [dbo].[Nhacungcap] ([NhacungcapID])
GO
ALTER TABLE [dbo].[Hoadonnhapthuoc] CHECK CONSTRAINT [FK_Hoadonnhapthuoc_Nhacungcap]
GO
ALTER TABLE [dbo].[Hoadonnhapthuoc]  WITH CHECK ADD  CONSTRAINT [FK_Hoadonnhapthuoc_Nhanvien] FOREIGN KEY([NhanvienID])
REFERENCES [dbo].[Nhanvien] ([NhanvienID])
GO
ALTER TABLE [dbo].[Hoadonnhapthuoc] CHECK CONSTRAINT [FK_Hoadonnhapthuoc_Nhanvien]
GO
ALTER TABLE [dbo].[Nhanvien]  WITH CHECK ADD  CONSTRAINT [FK_Nhanvien_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Nhanvien] CHECK CONSTRAINT [FK_Nhanvien_Account]
GO
ALTER TABLE [dbo].[Thuoc]  WITH CHECK ADD  CONSTRAINT [FK_Thuoc_Nhacungcap] FOREIGN KEY([NhacungcapID])
REFERENCES [dbo].[Nhacungcap] ([NhacungcapID])
GO
ALTER TABLE [dbo].[Thuoc] CHECK CONSTRAINT [FK_Thuoc_Nhacungcap]
GO
ALTER TABLE [dbo].[Thuoc]  WITH CHECK ADD  CONSTRAINT [FK_Thuoc_Nhomthuoc] FOREIGN KEY([NhomthuocID])
REFERENCES [dbo].[Nhomthuoc] ([NhomthuocID])
GO
ALTER TABLE [dbo].[Thuoc] CHECK CONSTRAINT [FK_Thuoc_Nhomthuoc]
GO
