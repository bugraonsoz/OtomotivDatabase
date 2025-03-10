USE [Otomotiv]
GO
/****** Object:  Table [dbo].[Vehicles]    Script Date: 9/20/2024 1:09:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicles](
	[VehicleID] [int] NOT NULL,
	[SupplierID] [int] NULL,
	[Brand] [varchar](50) NULL,
	[Model] [varchar](50) NULL,
	[Year] [int] NULL,
	[Color] [varchar](20) NULL,
	[Price] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[VehicleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 9/20/2024 1:09:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailID] [int] NOT NULL,
	[VehicleID] [int] NULL,
	[OrderID] [int] NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 9/20/2024 1:09:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Title] [varchar](50) NULL,
	[ReportsTo] [int] NULL,
	[City] [varchar](50) NULL,
	[Region] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 9/20/2024 1:09:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] NOT NULL,
	[CustomerID] [int] NULL,
	[EmployeeID] [int] NULL,
	[OrderDate] [date] NULL,
	[TotalAmount] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[order_per_employee]    Script Date: 9/20/2024 1:09:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[order_per_employee] as 
select e.EmployeeID,e.FirstName,e.LastName,e.Title,sum(Price*Quantity) toplam_satis,count(*) siparis_sayisi  from 
dbo.Employees e inner join dbo.Orders o
on e.EmployeeID = o.EmployeeID
inner join dbo.OrderDetails od
on od.OrderID = o.OrderID
inner join dbo.Vehicles v 
on v.VehicleID=od.VehicleID
group by e.EmployeeID,e.FirstName,e.LastName,e.Title
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 9/20/2024 1:09:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Phone] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Region] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 9/20/2024 1:09:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] NOT NULL,
	[Name] [varchar](100) NULL,
	[Phone] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Region] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[HomePage] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Info]    Script Date: 9/20/2024 1:09:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Info](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[kullanici_adi] [nvarchar](50) NULL,
	[sifre] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Phone], [Email], [City], [Region], [Country]) VALUES (1, N'Mehmet', N'Demirel', N'05463852965', N'm.demirel@gmail.com', N'Istanbul', N'Marmara', N'Türkiye')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Phone], [Email], [City], [Region], [Country]) VALUES (2, N'Kadir', N'Akkus', N'05527418523', N'kadirak@gmail.com', N'Ankara', N'Iç Anadolu', N'Türkiye')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Phone], [Email], [City], [Region], [Country]) VALUES (3, N'Tugba', N'Coskun', N'05967419630', N'tugbacoskun@gmail.com', N'Bursa', N'Marmara', N'Türkiye')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Phone], [Email], [City], [Region], [Country]) VALUES (4, N'Aynur', N'Alici', N'05368527536', N'aynuralici@gmail.com', N'Izmir', N'Ege', N'Türkiye')
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Title], [ReportsTo], [City], [Region], [Country]) VALUES (1, N'Bugra', N'Önsöz', N'CEO', NULL, N'Izmir', N'Ege', N'Türkiye')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Title], [ReportsTo], [City], [Region], [Country]) VALUES (2, N'Eren', N'Çelik', N'Müdür', 1, N'Istanbul', N'Marmara', N'Türkiye')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Title], [ReportsTo], [City], [Region], [Country]) VALUES (3, N'Hasan', N'Arslan', N'Müdür Yardimcisi', 2, N'Istanbul', N'Marmara', N'Türkiye')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Title], [ReportsTo], [City], [Region], [Country]) VALUES (4, N'Zafer ', N'Mülayim', N'Satis Yetkilisi', 3, N'Istanbul', N'Marmara', N'Türkiye')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Title], [ReportsTo], [City], [Region], [Country]) VALUES (5, N'Burak', N'Mülayim', N'Satis Danismani ', 4, N'Kocaeli', N'Marmara', N'Türkiye')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Title], [ReportsTo], [City], [Region], [Country]) VALUES (6, N'Bekirhan', N'Asgenaz', N'Satis Danismani ', 4, N'Sakarya', N'Marmara', N'Türkiye')
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [VehicleID], [OrderID], [Quantity]) VALUES (1, 3, 1, 35)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [VehicleID], [OrderID], [Quantity]) VALUES (2, 4, 2, 72)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [VehicleID], [OrderID], [Quantity]) VALUES (3, 6, 3, 23)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [VehicleID], [OrderID], [Quantity]) VALUES (4, 1, 4, 8)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [VehicleID], [OrderID], [Quantity]) VALUES (5, 1, 4, 10)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [TotalAmount]) VALUES (1, 1, 2, CAST(N'2024-01-10' AS Date), CAST(33250000.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [TotalAmount]) VALUES (2, 2, 3, CAST(N'2023-10-25' AS Date), CAST(86400000.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [TotalAmount]) VALUES (3, 3, 4, CAST(N'2024-04-15' AS Date), CAST(22678000.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [TotalAmount]) VALUES (4, 4, 5, CAST(N'2024-05-17' AS Date), CAST(60240000.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [TotalAmount]) VALUES (5, 1, 2, CAST(N'2024-05-16' AS Date), CAST(44221122.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [TotalAmount]) VALUES (6, 2, 3, CAST(N'2024-04-20' AS Date), CAST(19000000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Suppliers] ([SupplierID], [Name], [Phone], [Email], [City], [Region], [Country], [HomePage]) VALUES (1, N'Mercedes-Benz Kamyon Fabrikasi', N'0 382 288 50 00', N'mercedesbenzturk@hs03.kep.tr ', N'Aksaray', N'Iç Anadolu', N'Türkiye', N'mercedesbenzturk.com.tr/')
INSERT [dbo].[Suppliers] ([SupplierID], [Name], [Phone], [Email], [City], [Region], [Country], [HomePage]) VALUES (2, N'Oyak Otomobil Fabrikasi', N'0 224 219 45 00', N'oyak@renault.com.tr', N'Bursa', N'Marmara', N'Türkiye', N'oyak-renault.com')
INSERT [dbo].[Suppliers] ([SupplierID], [Name], [Phone], [Email], [City], [Region], [Country], [HomePage]) VALUES (3, N'Ford Otosan Gölcük Fabrikas', N'0 262 315 50 00', N'otosan@ford.com.tr', N'Kocaeli', N'Marmara', N'Türkiye', N'fordotosan.com.tr')
INSERT [dbo].[Suppliers] ([SupplierID], [Name], [Phone], [Email], [City], [Region], [Country], [HomePage]) VALUES (4, N'Türk Otomobil Fabrikasi', N'0 212 275 33 90', NULL, N'Bursa', N'Marmara', N'Türkiye', N'tofas.com.tr')
INSERT [dbo].[Suppliers] ([SupplierID], [Name], [Phone], [Email], [City], [Region], [Country], [HomePage]) VALUES (5, N'Hyundai Fertan Plaza', N'0 262 335 56 00', N'satisfertanhyundai', N'Kocaeli', N'Marmara', N'Türkiye', N'fertan.hyundaiplaza.com.tr')
INSERT [dbo].[Suppliers] ([SupplierID], [Name], [Phone], [Email], [City], [Region], [Country], [HomePage]) VALUES (6, N'Toyota Plaza Sandikçi', N'0 264 291 20 20', N'satis@sandikci.toyota.com.tr', N'Sakarya', N'Marmara', N'Türkiye', N'toyotasandikci.com.tr/')
GO
SET IDENTITY_INSERT [dbo].[User_Info] ON 

INSERT [dbo].[User_Info] ([id], [kullanici_adi], [sifre]) VALUES (1, N'admin', N'123')
SET IDENTITY_INSERT [dbo].[User_Info] OFF
GO
INSERT [dbo].[Vehicles] ([VehicleID], [SupplierID], [Brand], [Model], [Year], [Color], [Price]) VALUES (1, 1, N'Mercedes-Benz', N'Actros', 2019, N'Black', CAST(7530000.00 AS Decimal(10, 2)))
INSERT [dbo].[Vehicles] ([VehicleID], [SupplierID], [Brand], [Model], [Year], [Color], [Price]) VALUES (2, 3, N'Ford', N'Focus', 2021, N'Blue', CAST(840000.00 AS Decimal(10, 2)))
INSERT [dbo].[Vehicles] ([VehicleID], [SupplierID], [Brand], [Model], [Year], [Color], [Price]) VALUES (3, 2, N'Renault', N'Megane', 2023, N'White', CAST(950000.00 AS Decimal(10, 2)))
INSERT [dbo].[Vehicles] ([VehicleID], [SupplierID], [Brand], [Model], [Year], [Color], [Price]) VALUES (4, 4, N'Fiat', N'Egea', 2024, N'Red', CAST(1200000.00 AS Decimal(10, 2)))
INSERT [dbo].[Vehicles] ([VehicleID], [SupplierID], [Brand], [Model], [Year], [Color], [Price]) VALUES (5, 6, N'Toyota', N'Corolla', 2019, N'Gray', CAST(760000.00 AS Decimal(10, 2)))
INSERT [dbo].[Vehicles] ([VehicleID], [SupplierID], [Brand], [Model], [Year], [Color], [Price]) VALUES (6, 5, N'Hyundai', N'Elantra', 2021, N'Black', CAST(986000.00 AS Decimal(10, 2)))
INSERT [dbo].[Vehicles] ([VehicleID], [SupplierID], [Brand], [Model], [Year], [Color], [Price]) VALUES (7, 3, N'Ford', N'Fiesta', 2016, N'Blue', CAST(540000.00 AS Decimal(10, 2)))
INSERT [dbo].[Vehicles] ([VehicleID], [SupplierID], [Brand], [Model], [Year], [Color], [Price]) VALUES (8, 2, N'Renault', N'Express', 2022, N'White', CAST(800000.00 AS Decimal(10, 2)))
INSERT [dbo].[Vehicles] ([VehicleID], [SupplierID], [Brand], [Model], [Year], [Color], [Price]) VALUES (9, 4, N'Fiat', N'Doblo', 2012, N'Green', CAST(450000.00 AS Decimal(10, 2)))
INSERT [dbo].[Vehicles] ([VehicleID], [SupplierID], [Brand], [Model], [Year], [Color], [Price]) VALUES (10, 3, N'Nissan', N'Juke', 2021, N'Black', CAST(950000.00 AS Decimal(10, 2)))
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD FOREIGN KEY([ReportsTo])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__Vehic__14E61A24] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK__OrderDeta__Vehic__14E61A24]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Vehicles] FOREIGN KEY([VehicleID])
REFERENCES [dbo].[Vehicles] ([VehicleID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Vehicles]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Vehicles]  WITH CHECK ADD FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
/****** Object:  StoredProcedure [dbo].[model123]    Script Date: 9/20/2024 1:09:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[model123] as select* from Vehicles
where Brand='Renault' 
GO
/****** Object:  Trigger [dbo].[Employee_Trigger]    Script Date: 9/20/2024 1:09:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[Employee_Trigger]
on [dbo].[Employees]
after update
as 
begin 
select 'Güncelleme İşlemi Gerçekleşti.'
end
GO
ALTER TABLE [dbo].[Employees] ENABLE TRIGGER [Employee_Trigger]
GO
/****** Object:  Trigger [dbo].[supplier_update]    Script Date: 9/20/2024 1:09:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[supplier_update]
ON [dbo].[Suppliers]
   AFTER UPDATE
   AS
   BEGIN    UPDATE dbo.[Vehicles]
    SET    dbo.[Vehicles].SupplierID = inserted.SupplierID
    FROM   INSERTED
    WHERE  INSERTED.SupplierID = dbo.[Vehicles].[SupplierID]
END
GO
ALTER TABLE [dbo].[Suppliers] ENABLE TRIGGER [supplier_update]
GO
/****** Object:  Trigger [dbo].[Vehicle_Trigger]    Script Date: 9/20/2024 1:09:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[Vehicle_Trigger]
on [dbo].[Vehicles]
after insert 
as 
begin 
select 'Yeni Bir Araç Kaydı Yapıldı.'
end
GO
ALTER TABLE [dbo].[Vehicles] ENABLE TRIGGER [Vehicle_Trigger]
GO
/****** Object:  Trigger [dbo].[Vehicle_Trigger1]    Script Date: 9/20/2024 1:09:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[Vehicle_Trigger1]
on [dbo].[Vehicles]
after insert 
as 
begin 
select brand,model,year,Price=Price+150000 from Vehicles
where year>2020
end
GO
ALTER TABLE [dbo].[Vehicles] ENABLE TRIGGER [Vehicle_Trigger1]
GO
