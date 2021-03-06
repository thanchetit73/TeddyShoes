USE [master]
GO
/****** Object:  Database [QLSHOPTEDDY]    Script Date: 04/10/2019 22:13:40 ******/
CREATE DATABASE [QLSHOPTEDDY] ON  PRIMARY 
( NAME = N'QLSHOPTEDDY', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\QLSHOPTEDDY.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLSHOPTEDDY_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\QLSHOPTEDDY_log.LDF' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLSHOPTEDDY] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLSHOPTEDDY].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLSHOPTEDDY] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [QLSHOPTEDDY] SET ANSI_NULLS OFF
GO
ALTER DATABASE [QLSHOPTEDDY] SET ANSI_PADDING OFF
GO
ALTER DATABASE [QLSHOPTEDDY] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [QLSHOPTEDDY] SET ARITHABORT OFF
GO
ALTER DATABASE [QLSHOPTEDDY] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [QLSHOPTEDDY] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [QLSHOPTEDDY] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [QLSHOPTEDDY] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [QLSHOPTEDDY] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [QLSHOPTEDDY] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [QLSHOPTEDDY] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [QLSHOPTEDDY] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [QLSHOPTEDDY] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [QLSHOPTEDDY] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [QLSHOPTEDDY] SET  DISABLE_BROKER
GO
ALTER DATABASE [QLSHOPTEDDY] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [QLSHOPTEDDY] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [QLSHOPTEDDY] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [QLSHOPTEDDY] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [QLSHOPTEDDY] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [QLSHOPTEDDY] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [QLSHOPTEDDY] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [QLSHOPTEDDY] SET  READ_WRITE
GO
ALTER DATABASE [QLSHOPTEDDY] SET RECOVERY SIMPLE
GO
ALTER DATABASE [QLSHOPTEDDY] SET  MULTI_USER
GO
ALTER DATABASE [QLSHOPTEDDY] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [QLSHOPTEDDY] SET DB_CHAINING OFF
GO
USE [QLSHOPTEDDY]
GO
/****** Object:  Table [dbo].[Type_Products]    Script Date: 04/10/2019 22:13:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type_Products](
	[type_Id] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Type_Products] PRIMARY KEY CLUSTERED 
(
	[type_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Type_Products] ([type_Id], [name]) VALUES (N'1', N'Giày Thể Thao')
INSERT [dbo].[Type_Products] ([type_Id], [name]) VALUES (N'2', N'Boot & Cao got')
INSERT [dbo].[Type_Products] ([type_Id], [name]) VALUES (N'3', N'Oxpord & Sandal')
INSERT [dbo].[Type_Products] ([type_Id], [name]) VALUES (N'4', N'Giay bup be')
/****** Object:  Table [dbo].[Customer]    Script Date: 04/10/2019 22:13:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customer_id] [nvarchar](50) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[showname] [nvarchar](50) NULL,
	[type] [int] NULL,
	[avatar] [nchar](10) NULL,
 CONSTRAINT [PK_Customer_1] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Customer] ([customer_id], [username], [password], [email], [showname], [type], [avatar]) VALUES (N'1', N'phuongbt4', N'123456', N'd@gmail.com', N'sdfdfds', 0, N'avata.png ')
INSERT [dbo].[Customer] ([customer_id], [username], [password], [email], [showname], [type], [avatar]) VALUES (N'2', N'admin', N'123', N'kkkk@gmail.com', N'phuong bt', 1, N'avata.png ')
INSERT [dbo].[Customer] ([customer_id], [username], [password], [email], [showname], [type], [avatar]) VALUES (N'3', N'longbt', N'123', N'longkk@gmail.com', N'long bt', 0, N'avata.png ')
INSERT [dbo].[Customer] ([customer_id], [username], [password], [email], [showname], [type], [avatar]) VALUES (N'4', N'nhungcute', N'123', N'nhungcute@gmail.com', N'nhung cute', 0, N'avata.png ')
INSERT [dbo].[Customer] ([customer_id], [username], [password], [email], [showname], [type], [avatar]) VALUES (N'5', N'hungkk', N'123', N'hungkk@gmail.com', N'hung kaka', 1, N'avata.png ')
/****** Object:  Table [dbo].[Blogs]    Script Date: 04/10/2019 22:13:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blogs](
	[blog_Id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NULL,
	[contents] [nvarchar](max) NULL,
	[image] [nvarchar](50) NULL,
	[customer_Id] [nvarchar](50) NULL,
	[datePost] [nvarchar](50) NULL,
	[describe] [nvarchar](max) NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[blog_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Blogs] ON
INSERT [dbo].[Blogs] ([blog_Id], [title], [contents], [image], [customer_Id], [datePost], [describe]) VALUES (1, N'Câu chuyện về đôi giày rách và hai đồng tiền', N'Trên đường đi, hai người bắt gặp một đôi giày cũ nằm giữa đường. Họ cho rằng đó là đôi giày của một nông dân nghèo làm việc ở một cánh đồng gần bên, có lẽ ông ta đang chuẩn bị kết thúc ngày làm việc của mình.', N'2.jpg', N'1', N'11/11/2017', N'‘Cho đi còn hạnh phúc hơn nhận về’')
INSERT [dbo].[Blogs] ([blog_Id], [title], [contents], [image], [customer_Id], [datePost], [describe]) VALUES (2, N'Câu chuyện về đôi giày rách và hai đồng tiền  2', N'Sự kinh ngạc bàng hoàng hiện rõ trên gương mặt ông. Ông ta chăm chú nhìn đồng tiền, lật hai mặt đồng tiền qua lại và ngắm nhìn thật kỹ. Rồi ông nhìn khắp xung quanh nhưng chẳng thấy ai.', N'3.jpg', N'1', N'12/12/2018', N'Chẳng mấy chốc người nông dân đã xong việc và băng qua cánh đồng đến nơi đặt giày và áo khoác của mình. Người nông dân vừa mặc áo khoác vừa xỏ chân vào một chiếc giày thì cảm thấy có vật gì cứng cứng bên trong, ông ta cúi xuống xem đó là vật gì và tìm thấy một đồng tiền.')
INSERT [dbo].[Blogs] ([blog_Id], [title], [contents], [image], [customer_Id], [datePost], [describe]) VALUES (3, N'Đôi giày rách của bác nông dân', N'Cậu học sinh reo lên: “Này mấy cậu hay là bọn mình giấu đôi giày này rồi trốn đi, thử xem bác nông dân hoảng hốt thế nào. Chắc hẳn sẽ có chuyện vui để cười đấy, các cậu đồng ý không?”', N'1.jpg', N'1', N'12/12/2014', N'Vì bài học về thiên nhiên nên thầy giáo đã quyết định tổ chức một buổi dã ngoại ở nông thôn dành cho học sinh của mình. Mấy đứa trẻ thành phố rất thích thú khi được nhìn ngắm tận mắt cảnh đồng quê yên bình. Khi thầy trò chuẩn bị ra về thì bất chợt có một cậu học sinh nhìn thấy một đôi giày cũ rách để gần bờ ruộng, chắc hẳn của một bác nông dân nghèo đang sắp sửa trở về nhà sau một ngày làm việc mệt nhọc trên đồng ruộng.')
INSERT [dbo].[Blogs] ([blog_Id], [title], [contents], [image], [customer_Id], [datePost], [describe]) VALUES (4, N'Đôi giày cũ', N'– Thầy ơi, đôi giầy quá cũ rồi… thầy có thể mua đôi khác được mà?', N'4.jpg', N'1', N'07/07/2011', N'Có một Thầy Truyền Ðạo đem đôi giày cũ đi sửa, khi thì vá lại chỗ sờn, khi thì đóng lại chiếc đế bị mòn. Riêng việc đóng đế lại nhiều đến năm, sáu lần nên người thợ đóng giày không còn kiên nhẫn nữa mà góp ý rằng:')
INSERT [dbo].[Blogs] ([blog_Id], [title], [contents], [image], [customer_Id], [datePost], [describe]) VALUES (5, N'Đôi ba ta màu xanh', N'Nhưng ước mơ vốn chỉ là ước mơ, bởi gia đình chị nghèo lắm, lấy đâu ra tiền mà mua đôi giày ba ta màu xanh.', N'5.jpg', N'1', N'07/07/2012', N'Ngày còn bé, có lần chị phụ trách đợi thấy anh họ chị đi đồi giày ba ta màu xanh nước biển. Lúc đó chị thấy đôi giày đẹp làm sao! Cổ giày ôm sát chân. Thân giày làm bằng vải cứng, dáng thon thả, màu vải như màu da trời những ngày thu. Phần thân giày gần sát cổ chân có hai hàng khung dập và luồn một sợi dây trắng nhỏ vắt ngang. Chỉ tưởng tượng nếu mang nó vào chắc bước đi sẽ nhẹ và nhanh hơn, chị sẽ chạy trên những con đường đất mịn trong làng, trước cái nhìn thèm thuồng của lũ bạn')
INSERT [dbo].[Blogs] ([blog_Id], [title], [contents], [image], [customer_Id], [datePost], [describe]) VALUES (6, N'Đôi giày nước mắt của tôi', N'Thú thật tôi chẳng thể nhớ được chính xác mình đã trở thành một kẻ-nghiện-giày từ lúc nào. Chỉ nhớ rằng một ngày đẹp trời, tôi phát hiện ra rằng khi ra đường, tôi thích nhìn xung quanh xem ai mặc đẹp mặc xấu và tôi sẽ nhìn giày của họ đầu tiên. Nếu đôi giày đẹp,  mắt tôi sẽ chuyển tiếp nhìn lên trên, vì tôi biết rằng  quần áo, phụ kiện của cô gái ấy cũng sẽ đẹp, vì cô ấy có gu thẩm mỹ tốt.', N'6.jpg', N'1', N'07/07/2012', N'My name is Chi. And I’m a shoe-aholic.')
SET IDENTITY_INSERT [dbo].[Blogs] OFF
/****** Object:  Table [dbo].[Bills]    Script Date: 04/10/2019 22:13:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bills](
	[bill_Id] [int] IDENTITY(1,1) NOT NULL,
	[customer_user] [nvarchar](50) NOT NULL,
	[date_order] [date] NULL,
	[total] [float] NULL,
	[payment] [nvarchar](50) NULL,
	[adress] [nvarchar](50) NULL,
 CONSTRAINT [PK_Bills] PRIMARY KEY CLUSTERED 
(
	[bill_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bills] ON
INSERT [dbo].[Bills] ([bill_Id], [customer_user], [date_order], [total], [payment], [adress]) VALUES (2, N'1', CAST(0x8B350B00 AS Date), 100000, N'1', N'1')
INSERT [dbo].[Bills] ([bill_Id], [customer_user], [date_order], [total], [payment], [adress]) VALUES (3, N'1', CAST(0x9D3F0B00 AS Date), 200000, N'1', N'1')
INSERT [dbo].[Bills] ([bill_Id], [customer_user], [date_order], [total], [payment], [adress]) VALUES (11, N'1', CAST(0x603F0B00 AS Date), 35000, N'Live', N'1')
SET IDENTITY_INSERT [dbo].[Bills] OFF
/****** Object:  Table [dbo].[Products]    Script Date: 04/10/2019 22:13:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[product_id] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NULL,
	[type_Id] [nvarchar](50) NULL,
	[description] [text] NULL,
	[unit_price] [int] NULL,
	[promotion_price] [int] NULL,
	[image] [nvarchar](50) NULL,
	[unit] [nvarchar](50) NULL,
	[new] [nvarchar](50) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Products] ([product_id], [name], [type_Id], [description], [unit_price], [promotion_price], [image], [unit], [new]) VALUES (N'1', N'gtt1', N'1', NULL, 350000, 5, N'gtt1.jpg', N'converser', N'1')
INSERT [dbo].[Products] ([product_id], [name], [type_Id], [description], [unit_price], [promotion_price], [image], [unit], [new]) VALUES (N'10', N'cg1', N'2', NULL, 100000, 0, N'cg1.jpg', N'Converser ', N'0')
INSERT [dbo].[Products] ([product_id], [name], [type_Id], [description], [unit_price], [promotion_price], [image], [unit], [new]) VALUES (N'11', N'cg2', N'2', NULL, 200000, 0, N'cg2.jpg', N'sneaker', N'0')
INSERT [dbo].[Products] ([product_id], [name], [type_Id], [description], [unit_price], [promotion_price], [image], [unit], [new]) VALUES (N'12', N'cg3', N'2', NULL, 350000, 10, N'cg3.jpg', N'van muoi', N'1')
INSERT [dbo].[Products] ([product_id], [name], [type_Id], [description], [unit_price], [promotion_price], [image], [unit], [new]) VALUES (N'13', N'of1', N'3', NULL, 550000, 5, N'of1.jpg', N'sneaker', N'1')
INSERT [dbo].[Products] ([product_id], [name], [type_Id], [description], [unit_price], [promotion_price], [image], [unit], [new]) VALUES (N'14', N'of2', N'3', NULL, 380000, 0, N'of2.jpg', N'sneaker', N'0')
INSERT [dbo].[Products] ([product_id], [name], [type_Id], [description], [unit_price], [promotion_price], [image], [unit], [new]) VALUES (N'15', N'of3', N'3', NULL, 850000, 10, N'of3.jpg', N'sneaker', N'1')
INSERT [dbo].[Products] ([product_id], [name], [type_Id], [description], [unit_price], [promotion_price], [image], [unit], [new]) VALUES (N'16', N'sd1', N'2', NULL, 650000, 0, N'sd1.jpg', N'sneaker', N'0')
INSERT [dbo].[Products] ([product_id], [name], [type_Id], [description], [unit_price], [promotion_price], [image], [unit], [new]) VALUES (N'17', N'sd2', N'2', NULL, 1000000, 5, N'sd2.jpg', N'sneaker', N'1')
INSERT [dbo].[Products] ([product_id], [name], [type_Id], [description], [unit_price], [promotion_price], [image], [unit], [new]) VALUES (N'18', N'sd3', N'2', NULL, 150000, 0, N'sd3.jpg', N'sneaker', N'0')
INSERT [dbo].[Products] ([product_id], [name], [type_Id], [description], [unit_price], [promotion_price], [image], [unit], [new]) VALUES (N'19', N'gbb1', N'4', NULL, 220000, 0, N'gbb1.jpg', N'sneaker', N'0')
INSERT [dbo].[Products] ([product_id], [name], [type_Id], [description], [unit_price], [promotion_price], [image], [unit], [new]) VALUES (N'2', N'gtt2', N'1', NULL, 200000, 10, N'gtt2.jpg', N'Nike      ', N'1')
INSERT [dbo].[Products] ([product_id], [name], [type_Id], [description], [unit_price], [promotion_price], [image], [unit], [new]) VALUES (N'20', N'gbb2', N'4', NULL, 160000, 0, N'gbb2.jpg', N'bitis', N'0')
INSERT [dbo].[Products] ([product_id], [name], [type_Id], [description], [unit_price], [promotion_price], [image], [unit], [new]) VALUES (N'21', N'gbb3', N'4', NULL, 200000, 0, N'gbb3.jpg', N'bitis', N'0')
INSERT [dbo].[Products] ([product_id], [name], [type_Id], [description], [unit_price], [promotion_price], [image], [unit], [new]) VALUES (N'22', N'gbb4', N'4', NULL, 170000, 0, N'gbb4.jpg', N'bitis', N'0')
INSERT [dbo].[Products] ([product_id], [name], [type_Id], [description], [unit_price], [promotion_price], [image], [unit], [new]) VALUES (N'23', N'gbb5', N'4', NULL, 150000, 0, N'gbb5.jpg', N'bitis', N'0')
INSERT [dbo].[Products] ([product_id], [name], [type_Id], [description], [unit_price], [promotion_price], [image], [unit], [new]) VALUES (N'24', N'boot1', N'3', NULL, 300000, 30, N'boot1.jpg', N'Nike', N'1')
INSERT [dbo].[Products] ([product_id], [name], [type_Id], [description], [unit_price], [promotion_price], [image], [unit], [new]) VALUES (N'25', N'boot2', N'3', NULL, 400000, 0, N'boot2.jpg', N'Van', N'1')
INSERT [dbo].[Products] ([product_id], [name], [type_Id], [description], [unit_price], [promotion_price], [image], [unit], [new]) VALUES (N'26', N'boot3', N'3', NULL, 200000, 20, N'boot3.jpg', N'Adidas', N'0')
INSERT [dbo].[Products] ([product_id], [name], [type_Id], [description], [unit_price], [promotion_price], [image], [unit], [new]) VALUES (N'3', N'gtt3', N'1', NULL, 300000, 20, N'gtt3.jpg', N'Nike      ', N'1')
INSERT [dbo].[Products] ([product_id], [name], [type_Id], [description], [unit_price], [promotion_price], [image], [unit], [new]) VALUES (N'4', N'gtt4', N'1', NULL, 200000, 0, N'gtt4.jpg', N'Adidas    ', N'0')
INSERT [dbo].[Products] ([product_id], [name], [type_Id], [description], [unit_price], [promotion_price], [image], [unit], [new]) VALUES (N'5', N'gtt5', N'1', NULL, 300000, 0, N'gtt5.jpg', N'Van       ', N'0')
INSERT [dbo].[Products] ([product_id], [name], [type_Id], [description], [unit_price], [promotion_price], [image], [unit], [new]) VALUES (N'6', N'gtt6', N'1', NULL, 200000, 50, N'gtt6.jpg', N'Sneaker   ', N'0')
/****** Object:  Table [dbo].[Reviews]    Script Date: 04/10/2019 22:13:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[review_Id] [int] IDENTITY(1,1) NOT NULL,
	[blog_Id] [int] NULL,
	[customer_Id] [nvarchar](50) NULL,
	[contents] [nvarchar](50) NULL,
	[datePost] [nvarchar](50) NULL,
	[userName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Reviews] PRIMARY KEY CLUSTERED 
(
	[review_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Reviews] ON
INSERT [dbo].[Reviews] ([review_Id], [blog_Id], [customer_Id], [contents], [datePost], [userName]) VALUES (1, 1, N'1', N'teddy shop cố lên', N'11/2/11/2101', N'hung')
INSERT [dbo].[Reviews] ([review_Id], [blog_Id], [customer_Id], [contents], [datePost], [userName]) VALUES (2, 2, N'1', N'hihihi đồ ngốc', N'11/11/2011', N'hung')
INSERT [dbo].[Reviews] ([review_Id], [blog_Id], [customer_Id], [contents], [datePost], [userName]) VALUES (3, 1, N'2', N'việt nam vô địch', N'11/11/2011', N'nhung')
INSERT [dbo].[Reviews] ([review_Id], [blog_Id], [customer_Id], [contents], [datePost], [userName]) VALUES (4, 2, N'3', N'một con vịt xòe ra 2 cái cánh', N'11/11/2011', N'long')
INSERT [dbo].[Reviews] ([review_Id], [blog_Id], [customer_Id], [contents], [datePost], [userName]) VALUES (5, 3, N'2', N'shop phục vụ nhiệt tình cho 10 điểm', N'11/11/2011', N'long')
INSERT [dbo].[Reviews] ([review_Id], [blog_Id], [customer_Id], [contents], [datePost], [userName]) VALUES (6, 1, N'4', N'hàng đẹp', N'11/11/2011', N'ykk')
INSERT [dbo].[Reviews] ([review_Id], [blog_Id], [customer_Id], [contents], [datePost], [userName]) VALUES (7, 4, N'1', N'đẩy con heo xuống biển', N'11/11/2011', N'nhung')
INSERT [dbo].[Reviews] ([review_Id], [blog_Id], [customer_Id], [contents], [datePost], [userName]) VALUES (8, 2, N'2', N'5 sao', N'11/11/2011', N'long')
INSERT [dbo].[Reviews] ([review_Id], [blog_Id], [customer_Id], [contents], [datePost], [userName]) VALUES (9, 5, N'1', N'5 sao', N'11/11/2011', N'phuong')
INSERT [dbo].[Reviews] ([review_Id], [blog_Id], [customer_Id], [contents], [datePost], [userName]) VALUES (10, 4, N'3', N'5 sao', N'11/11/2011', N'ykk')
INSERT [dbo].[Reviews] ([review_Id], [blog_Id], [customer_Id], [contents], [datePost], [userName]) VALUES (11, 4, N'2', N'5 sao', N'11/11/2011', N'nhung')
INSERT [dbo].[Reviews] ([review_Id], [blog_Id], [customer_Id], [contents], [datePost], [userName]) VALUES (12, 5, N'4', N'hàng đẹp', N'11/11/2011', N'phuong')
INSERT [dbo].[Reviews] ([review_Id], [blog_Id], [customer_Id], [contents], [datePost], [userName]) VALUES (13, 1, N'3', N'đẩy con heo xuống biển', N'11/11/2011', N'long')
INSERT [dbo].[Reviews] ([review_Id], [blog_Id], [customer_Id], [contents], [datePost], [userName]) VALUES (14, 4, N'2', N'teddy shop cố lên', N'11/11/2011', N'phuong')
INSERT [dbo].[Reviews] ([review_Id], [blog_Id], [customer_Id], [contents], [datePost], [userName]) VALUES (15, 3, N'1', N'teddy shop cố lên', N'11/11/2011', N'nhung')
SET IDENTITY_INSERT [dbo].[Reviews] OFF
/****** Object:  Table [dbo].[Bill_Detail]    Script Date: 04/10/2019 22:13:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill_Detail](
	[bd_id] [int] IDENTITY(1,1) NOT NULL,
	[bill_id] [int] NOT NULL,
	[product_id] [nvarchar](50) NOT NULL,
	[quantity] [int] NULL,
	[unit_price] [int] NULL,
 CONSTRAINT [PK_Bill_Detail] PRIMARY KEY CLUSTERED 
(
	[bd_id] ASC,
	[bill_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bill_Detail] ON
INSERT [dbo].[Bill_Detail] ([bd_id], [bill_id], [product_id], [quantity], [unit_price]) VALUES (5, 2, N'1', 6, 30000000)
INSERT [dbo].[Bill_Detail] ([bd_id], [bill_id], [product_id], [quantity], [unit_price]) VALUES (12, 3, N'11', 1, 30000000)
INSERT [dbo].[Bill_Detail] ([bd_id], [bill_id], [product_id], [quantity], [unit_price]) VALUES (13, 11, N'11', 3, 30000)
SET IDENTITY_INSERT [dbo].[Bill_Detail] OFF
/****** Object:  ForeignKey [FK_Blogs_Customer]    Script Date: 04/10/2019 22:13:42 ******/
ALTER TABLE [dbo].[Blogs]  WITH CHECK ADD  CONSTRAINT [FK_Blogs_Customer] FOREIGN KEY([customer_Id])
REFERENCES [dbo].[Customer] ([customer_id])
GO
ALTER TABLE [dbo].[Blogs] CHECK CONSTRAINT [FK_Blogs_Customer]
GO
/****** Object:  ForeignKey [FK_Bills_Customer]    Script Date: 04/10/2019 22:13:42 ******/
ALTER TABLE [dbo].[Bills]  WITH CHECK ADD  CONSTRAINT [FK_Bills_Customer] FOREIGN KEY([customer_user])
REFERENCES [dbo].[Customer] ([customer_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bills] CHECK CONSTRAINT [FK_Bills_Customer]
GO
/****** Object:  ForeignKey [FK_Products_Type_Products1]    Script Date: 04/10/2019 22:13:42 ******/
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Type_Products1] FOREIGN KEY([type_Id])
REFERENCES [dbo].[Type_Products] ([type_Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Type_Products1]
GO
/****** Object:  ForeignKey [FK_Reviews_Blogs]    Script Date: 04/10/2019 22:13:42 ******/
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Blogs] FOREIGN KEY([blog_Id])
REFERENCES [dbo].[Blogs] ([blog_Id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Blogs]
GO
/****** Object:  ForeignKey [FK_Reviews_Customer]    Script Date: 04/10/2019 22:13:42 ******/
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Customer] FOREIGN KEY([customer_Id])
REFERENCES [dbo].[Customer] ([customer_id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Customer]
GO
/****** Object:  ForeignKey [FK_Bill_Detail_Bills1]    Script Date: 04/10/2019 22:13:42 ******/
ALTER TABLE [dbo].[Bill_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Detail_Bills1] FOREIGN KEY([bill_id])
REFERENCES [dbo].[Bills] ([bill_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bill_Detail] CHECK CONSTRAINT [FK_Bill_Detail_Bills1]
GO
/****** Object:  ForeignKey [FK_Bill_Detail_Products]    Script Date: 04/10/2019 22:13:42 ******/
ALTER TABLE [dbo].[Bill_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Detail_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bill_Detail] CHECK CONSTRAINT [FK_Bill_Detail_Products]
GO
