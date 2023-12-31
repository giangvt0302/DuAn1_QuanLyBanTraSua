USE [master]
GO
/****** Object:  Database [DuAn1_QuanLyBanTraSua]    Script Date: 12/7/2022 3:49:35 PM ******/
CREATE DATABASE [DuAn1_QuanLyBanTraSua]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DuAn1_QuanLyBanTraSua', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DuAn1_QuanLyBanTraSua.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DuAn1_QuanLyBanTraSua_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DuAn1_QuanLyBanTraSua_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DuAn1_QuanLyBanTraSua] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DuAn1_QuanLyBanTraSua].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DuAn1_QuanLyBanTraSua] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DuAn1_QuanLyBanTraSua] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DuAn1_QuanLyBanTraSua] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DuAn1_QuanLyBanTraSua] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DuAn1_QuanLyBanTraSua] SET ARITHABORT OFF 
GO
ALTER DATABASE [DuAn1_QuanLyBanTraSua] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DuAn1_QuanLyBanTraSua] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DuAn1_QuanLyBanTraSua] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DuAn1_QuanLyBanTraSua] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DuAn1_QuanLyBanTraSua] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DuAn1_QuanLyBanTraSua] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DuAn1_QuanLyBanTraSua] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DuAn1_QuanLyBanTraSua] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DuAn1_QuanLyBanTraSua] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DuAn1_QuanLyBanTraSua] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DuAn1_QuanLyBanTraSua] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DuAn1_QuanLyBanTraSua] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DuAn1_QuanLyBanTraSua] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DuAn1_QuanLyBanTraSua] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DuAn1_QuanLyBanTraSua] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DuAn1_QuanLyBanTraSua] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DuAn1_QuanLyBanTraSua] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DuAn1_QuanLyBanTraSua] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DuAn1_QuanLyBanTraSua] SET  MULTI_USER 
GO
ALTER DATABASE [DuAn1_QuanLyBanTraSua] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DuAn1_QuanLyBanTraSua] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DuAn1_QuanLyBanTraSua] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DuAn1_QuanLyBanTraSua] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DuAn1_QuanLyBanTraSua] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DuAn1_QuanLyBanTraSua] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DuAn1_QuanLyBanTraSua] SET QUERY_STORE = OFF
GO
USE [DuAn1_QuanLyBanTraSua]
GO
/****** Object:  Table [dbo].[muc_da]    Script Date: 12/7/2022 3:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[muc_da](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma] [varchar](50) NULL,
	[ten] [nvarchar](50) NULL,
	[gia] [int] NULL,
	[trang_thai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
Select hoa_don.ma,nhan_vien.ho_va_ten as 'nguoi_tao',
                    khach_hang.ho_va_ten as 'khach_hang',hoa_don.ngay_tao,
                    hoa_don.ngay_thanh_toan,tong_tien,hoa_don.ghi_chu,hoa_don.trang_thai
                    from hoa_don inner join nhan_vien on hoa_don.id_nhan_vien=nhan_vien.id
                    left join khach_hang on hoa_don.id_khach_hang=khach_hang.id
Select * from hoa_don
Select  san_pham.ma,san_pham.ten,san_pham.gia, hoa_don_chi_tiet.so_luong,muc_da.ten as 'muc_da',
                    muc_duong.ten as 'muc_duong',topping.ten as 'topping',hoa_don_chi_tiet.tong_tien, hoa_don_chi_tiet.trang_thai
                    from  hoa_don_chi_tiet left join san_pham on hoa_don_chi_tiet.id_san_pham=san_pham.id
                    inner join muc_da on hoa_don_chi_tiet.id_da=muc_da.id
                    inner join muc_duong on hoa_don_chi_tiet.id_duong=muc_duong.id
                    inner join topping on hoa_don_chi_tiet.id_topping=topping.id
                    inner join hoa_don on hoa_don_chi_tiet.id_hoa_don=hoa_don.id
                    where hoa_don.ma='HD6'
Select * from hoa_don
Select id,ma,ten,ngay_tao,kieu_khuyen_mai,
                    tien_khuyen_mao,phan_tram_khuyen_mai,ghi_chu,trang_thai from khuyen_mai
Select * from gio_hang
Select top(10)  san_pham.ma,san_pham.ten,san_pham.gia, 
                    sum(gio_hang.so_luong_sp) as'so_luong_ban',san_pham.trang_thai
                    from  gio_hang inner join san_pham 
                    on gio_hang.id_san_pham=san_pham.id 
                    group by san_pham.ma,san_pham.ten,san_pham.gia,san_pham.trang_thai order by 'so_luong_ban' 
go
Select top(5) gio_hang.so_luong_sp as'so_luong_ban' from gio_hang order by gio_hang.so_luong_sp asc
Select * from khuyen_mai
Select id,ten,ghi_chu,trang_thai from ban
Select * from ban
Select count(ma) as 'so_hoa_don_huy' from hoa_don where trang_thai=2 and ngay_tao between '2022-12-15' and '2022-12-15'
Select ma from hoa_don where trang_thai=2 and ngay_tao between '2022-12-15' and '2022-12-15'

GO
/****** Object:  View [dbo].[view_xemThongTinDa]    Script Date: 12/7/2022 3:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_xemThongTinDa]
AS
SELECT  muc_da.id, muc_da.ma, muc_da.ten, muc_da.gia,muc_da.trang_thai
FROM muc_da
GO
/****** Object:  Table [dbo].[topping]    Script Date: 12/7/2022 3:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[topping](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma] [varchar](50) NULL,
	[ten] [nvarchar](50) NULL,
	[gia] [float] NULL,
	[trang_thai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_xemThongTinTopping]    Script Date: 12/7/2022 3:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_xemThongTinTopping]
AS
SELECT id,ma,ten,gia,trang_thai
FROM topping
GO
/****** Object:  Table [dbo].[size]    Script Date: 12/7/2022 3:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[size](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma] [varchar](50) NULL,
	[ten] [nvarchar](50) NULL,
	[gia] [float] NULL,
	[trang_thai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_xemThongTinSize]    Script Date: 12/7/2022 3:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_xemThongTinSize]
AS
SELECT id,ma,ten,gia,trang_thai
FROM size
GO
/****** Object:  Table [dbo].[san_pham]    Script Date: 12/7/2022 3:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[san_pham](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma] [varchar](20) NULL,
	[ten] [nvarchar](50) NULL,
	[gia] [float] NULL,
	[mo_ta] [nvarchar](200) NULL,
	[trang_thai] [int] NULL,
	[id_size] [int] NULL,
	[id_danh_muc] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[danh_muc_sp]    Script Date: 12/7/2022 3:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[danh_muc_sp](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma] [varchar](50) NULL,
	[ten] [nvarchar](50) NULL,
	[trang_thai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hinh_anh]    Script Date: 12/7/2022 3:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hinh_anh](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_san_pham] [int] NULL,
	[ten] [nvarchar](50) NULL,
	[duong_dan_anh] [nvarchar](200) NULL,
	[trang_thai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_fillSPTable]    Script Date: 12/7/2022 3:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_fillSPTable]
AS
SELECT san_pham.ma'ma_sp',san_pham.ten+ ' ('+ [size].ten+  ')'AS'ten_sp', san_pham.gia+[size].gia 'gia_sp',san_pham.mo_ta,
       danh_muc_sp.ten,hinh_anh.duong_dan_anh,san_pham.trang_thai
FROM san_pham LEFT JOIN size ON san_pham.id_size = size.id
              LEFT JOIN danh_muc_sp ON san_pham.id_danh_muc = danh_muc_sp.id 
              LEFT JOIN hinh_anh ON hinh_anh.id_san_pham = san_pham.id 
GO
/****** Object:  View [dbo].[view_xemThongTinSanPham]    Script Date: 12/7/2022 3:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_xemThongTinSanPham]
AS
SELECT san_pham.id,san_pham.ma'ma_sp',san_pham.ten'ten_sp',san_pham.gia'gia_sp',san_pham.mo_ta,[size].id'id_size',[size].ma'ma_size',
       [size].ten,[size].gia'gia_size',danh_muc_sp.id'id_dm',danh_muc_sp.ma'ma_dm',danh_muc_sp.ten'ten_dm',san_pham.[trang_thai]
FROM san_pham JOIN size ON san_pham.id_size = size.id JOIN danh_muc_sp ON san_pham.id_danh_muc = danh_muc_sp.id 
GO
/****** Object:  Table [dbo].[hoa_don]    Script Date: 12/7/2022 3:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoa_don](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma] [varchar](20) NULL,
	[ngay_tao] [date] NULL,
	[tong_tien] [float] NULL,
	[gia_voucher] [float] NULL,
	[gia_khuyen_mai] [float] NULL,
	[gia_thanh_toan] [float] NULL,
	[ngay_thanh_toan] [date] NULL,
	[id_ban] [int] NULL,
	[id_nhan_vien] [int] NULL,
	[id_dung_diem] [int] NULL,
	[id_khach_hang] [int] NULL,
	[ghi_chu] [nvarchar](100) NULL,
	[trang_thai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hoa_don_chi_tiet]    Script Date: 12/7/2022 3:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoa_don_chi_tiet](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_hoa_don] [int] NULL,
	[id_san_pham] [int] NULL,
	[don_gia] [float] NULL,
	[so_luong] [int] NULL,
	[id_duong] [int] NULL,
	[id_da] [int] NULL,
	[gia_duong] [float] NULL,
	[gia_da] [float] NULL,
	[gia_topping] [float] NULL,
	[trang_thai] [int] NULL,
	[id_topping] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[muc_duong]    Script Date: 12/7/2022 3:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[muc_duong](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma] [varchar](50) NULL,
	[ten] [nvarchar](50) NULL,
	[gia] [int] NULL,
	[trang_thai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_xemThongTinHDCT]    Script Date: 12/7/2022 3:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_xemThongTinHDCT]
AS
SELECT hoa_don_chi_tiet.id,san_pham.id'id_san_pham',san_pham.ten'ten_san_pham', hoa_don.id'id_hoa_don',hoa_don.ma'ma_hoa_don',muc_da.id'id_da',
muc_da.ten'ten_da', muc_duong.id'id_duong',muc_duong.ten'ten_duong',topping.id'id_topping',topping.ten'ten_topping',don_gia,so_luong,gia_duong,gia_da,gia_topping,hoa_don_chi_tiet.trang_thai
FROM hoa_don_chi_tiet LEFT JOIN san_pham ON hoa_don_chi_tiet.id_san_pham = san_pham.id
LEFT JOIN hoa_don ON hoa_don_chi_tiet.id_hoa_don = hoa_don.id
LEFT JOIN muc_da ON hoa_don_chi_tiet.id_da = muc_da.id
LEFT JOIN muc_duong ON hoa_don_chi_tiet.id_duong = muc_duong.id
LEFT JOIN topping ON hoa_don_chi_tiet.id_topping = topping.id
GO
/****** Object:  Table [dbo].[nhan_vien]    Script Date: 12/7/2022 3:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nhan_vien](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma] [varchar](20) NULL,
	[ho_va_ten] [nvarchar](50) NULL,
	[mat_khau] [varchar](2000) NOT NULL,
	[sdt] [varchar](12) NULL,
	[cccd] [varchar](20) NULL,
	[ngay_sinh] [date] NULL,
	[gioi_tinh] [int] NULL,
	[dia_chi] [nvarchar](100) NULL,
	[email] [varchar](100) NULL,
	[ghi_chu] [nvarchar](100) NULL,
	[trang_thai] [int] NULL,
	[id_chuc_vu] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_HoaDonFormBanHang]    Script Date: 12/7/2022 3:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_HoaDonFormBanHang]
AS
SELECT hoa_don.ma, nhan_vien.ho_va_ten,hoa_don.ngay_tao,hoa_don.trang_thai
FROM hoa_don JOIN nhan_vien ON hoa_don.id_nhan_vien = nhan_vien.id
GO
/****** Object:  View [dbo].[view_SanPhamFromBanHang]    Script Date: 12/7/2022 3:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_SanPhamFromBanHang]
AS
SELECT san_pham.id,san_pham.ten+ ' ('+ [size].ten+  ')'AS'ten_sp', san_pham.gia+[size].gia 'gia_sp',
       hinh_anh.duong_dan_anh,danh_muc_sp.ten,san_pham.mo_ta
FROM san_pham LEFT JOIN size ON san_pham.id_size = size.id
              LEFT JOIN danh_muc_sp ON san_pham.id_danh_muc = danh_muc_sp.id 
              LEFT JOIN hinh_anh ON hinh_anh.id_san_pham = san_pham.id
GO
/****** Object:  Table [dbo].[chuc_vu]    Script Date: 12/7/2022 3:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chuc_vu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma] [varchar](20) NULL,
	[ten] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_thongTinNhanVien]    Script Date: 12/7/2022 3:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_thongTinNhanVien]
AS
SELECT nhan_vien.id,nhan_vien.ma'ma_nv',ho_va_ten,mat_khau,sdt,cccd,ngay_sinh,
       gioi_tinh,dia_chi,email,ghi_chu,chuc_vu.ma'ma_cv',chuc_vu.ten,trang_thai
FROM nhan_vien JOIN chuc_vu ON nhan_vien.id_chuc_vu = chuc_vu.id
GO
/****** Object:  Table [dbo].[ban]    Script Date: 12/7/2022 3:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ban](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma] [nvarchar](100) NULL,
	[ten] [nvarchar](100) NULL,
	[trang_thai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[khach_hang]    Script Date: 12/7/2022 3:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khach_hang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma] [varchar](20) NULL,
	[ho_va_ten] [nvarchar](50) NULL,
	[sdt] [varchar](12) NULL,
	[ngay_sinh] [date] NULL,
	[email] [varchar](100) NULL,
	[dia_chi] [nvarchar](100) NULL,
	[diem] [int] NOT NULL,
	[ghi_chu] [nvarchar](100) NULL,
	[trang_thai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_xemThongTinHoaDon]    Script Date: 12/7/2022 3:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_xemThongTinHoaDon]
AS
SELECT hoa_don.id'id_hd', hoa_don.ma'ma_hd',hoa_don.ngay_tao,hoa_don.tong_tien,hoa_don.gia_voucher,hoa_don.gia_khuyen_mai,
    hoa_don.gia_thanh_toan,hoa_don.ghi_chu'ghi_chu_hd',nhan_vien.id'id_nhan_vien',nhan_vien.ma'ma_nv',nhan_vien.ho_va_ten'ho_ten_nhan_vien',
    khach_hang.id'id_khach_hang',khach_hang.ho_va_ten'ho_ten_khach_hang',khach_hang.diem,hoa_don.trang_thai'trang_thai_hd'
FROM hoa_don LEFT JOIN ban ON hoa_don.id_ban = ban.id LEFT JOIN nhan_vien ON hoa_don.id_nhan_vien = nhan_vien.id LEFT JOIN khach_hang ON hoa_don.id = khach_hang.id
--Viewl HD BanHang
GO
/****** Object:  View [dbo].[view_xemThongTinDuong]    Script Date: 12/7/2022 3:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_xemThongTinDuong]
AS
SELECT muc_duong.id,muc_duong.ma,muc_duong.ten,muc_duong.gia,muc_duong.trang_thai
FROM muc_duong
GO
/****** Object:  Table [dbo].[combo]    Script Date: 12/7/2022 3:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[combo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma] [varchar](50) NULL,
	[ten] [nvarchar](100) NOT NULL,
	[gia] [float] NULL,
	[so_luong_sp] [int] NULL,
	[ngay_tao] [date] NULL,
	[ghi_chu] [nvarchar](100) NULL,
	[trang_thai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[combo_san_pham]    Script Date: 12/7/2022 3:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[combo_san_pham](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_combo] [int] NULL,
	[id_san_pham] [int] NULL,
	[trang_thai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dung_diem]    Script Date: 12/7/2022 3:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dung_diem](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[so_diem_su_dung] [int] NULL,
	[ngay_su_dung] [date] NULL,
	[ghi_chu] [nvarchar](100) NULL,
	[trang_thai] [int] NULL,
	[id_quy_doi] [int] NULL,
	[id_khach_hang] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[giao_ca]    Script Date: 12/7/2022 3:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[giao_ca](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma_nhan_vien_nhan_ca] [varchar](20) NULL,
	[tong_so_don_hang] [int] NULL,
	[tong_tien_ban_hang] [float] NULL,
	[tien_phat_sinh] [float] NULL,
	[tien_trong_ket] [float] NULL,
	[tien_hien_co] [float] NULL,
	[ghi_chu] [nvarchar](100) NULL,
	[trang_thai] [int] NULL,
	[id_nhan_vien] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gio_hang]    Script Date: 12/7/2022 3:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gio_hang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma_hoa_don] [varchar](20) NOT NULL,
	[id_san_pham] [varchar](20) NOT NULL,
	[ten_san_pham] [nvarchar](100) NOT NULL,
	[so_luong_sp] [int] NOT NULL,
	[don_gia] [float] NOT NULL,
	[tong_tien] [float] NULL,
	[id_duong] [int] NULL,
	[ten_duong] [nvarchar](20) NULL,
	[id_da] [int] NULL,
	[ten_da] [nvarchar](20) NULL,
	[id_topping] [int] NULL,
	[ten_topping] [nvarchar](20) NULL,
	[trang_thai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hoa_don_chi_tiet_topping]    Script Date: 12/7/2022 3:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoa_don_chi_tiet_topping](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_hoa_don_chi_tiet] [int] NULL,
	[id_topping] [int] NULL,
	[trang_thai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[khuyen_mai]    Script Date: 12/7/2022 3:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khuyen_mai](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma] [varchar](20) NULL,
	[ten] [nvarchar](100) NULL,
	[ngay_tao] [date] NULL,
	[kieu_khuyen_mai] [int] NULL,
	[tien_khuyen_mao] [float] NULL,
	[phan_tram_khuyen_mai] [int] NULL,
	[ghi_chu] [nvarchar](100) NULL,
	[trang_thai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[khuyen_mai_chi_tiet]    Script Date: 12/7/2022 3:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khuyen_mai_chi_tiet](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_hoa_don] [int] NULL,
	[id_khuyen_mai] [int] NULL,
	[trang_thai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nhat_ki_dung_diem]    Script Date: 12/7/2022 3:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nhat_ki_dung_diem](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_hoa_don] [int] NULL,
	[id_dung_diem] [int] NULL,
	[id_khach_hang] [int] NULL,
	[diem_da_dung] [int] NULL,
	[diem_cong_them] [int] NULL,
	[diem_con_lai] [int] NULL,
	[ngay_tao] [date] NULL,
	[trang_thai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[quy_doi]    Script Date: 12/7/2022 3:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[quy_doi](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[so_tien] [float] NULL,
	[so_diem] [int] NULL,
	[ghi_chu] [nvarchar](100) NULL,
	[trang_thai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ban] ON 

INSERT [dbo].[ban] ([id], [ma], [ten], [trang_thai]) VALUES (1, N'B1', N'Bàn 1', 0)
INSERT [dbo].[ban] ([id], [ma], [ten], [trang_thai]) VALUES (2, N'B2', N'Bàn 2', 0)
INSERT [dbo].[ban] ([id], [ma], [ten], [trang_thai]) VALUES (3, N'Bàn 3', N'Không có ghi chú', 0)
INSERT [dbo].[ban] ([id], [ma], [ten], [trang_thai]) VALUES (4, N'Bàn 4', N'Không có ghi chú', 0)
INSERT [dbo].[ban] ([id], [ma], [ten], [trang_thai]) VALUES (5, N'Bàn 5', N'Không có ghi chú', 0)
INSERT [dbo].[ban] ([id], [ma], [ten], [trang_thai]) VALUES (6, N'Bàn 6', N'Không có ghi chú', 0)
INSERT [dbo].[ban] ([id], [ma], [ten], [trang_thai]) VALUES (7, N'Bàn 7', N'Không có ghi chú', 0)
SET IDENTITY_INSERT [dbo].[ban] OFF
GO
SET IDENTITY_INSERT [dbo].[chuc_vu] ON 

INSERT [dbo].[chuc_vu] ([id], [ma], [ten]) VALUES (1, N'CV01', N'Nhân Viên')
INSERT [dbo].[chuc_vu] ([id], [ma], [ten]) VALUES (2, N'CV02', N'Quản Lý')
SET IDENTITY_INSERT [dbo].[chuc_vu] OFF
GO
SET IDENTITY_INSERT [dbo].[danh_muc_sp] ON 

INSERT [dbo].[danh_muc_sp] ([id], [ma], [ten], [trang_thai]) VALUES (1, N'DM01', N'Trà Sữa', 0)
INSERT [dbo].[danh_muc_sp] ([id], [ma], [ten], [trang_thai]) VALUES (2, N'DM02', N'Trà Hoa Quả', 0)
INSERT [dbo].[danh_muc_sp] ([id], [ma], [ten], [trang_thai]) VALUES (3, N'DM03', N'Macchiato Cream Cheese', 0)
INSERT [dbo].[danh_muc_sp] ([id], [ma], [ten], [trang_thai]) VALUES (4, N'DM04', N'Sữa Chua Dẻo', 0)
SET IDENTITY_INSERT [dbo].[danh_muc_sp] OFF
GO
SET IDENTITY_INSERT [dbo].[gio_hang] ON 

INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (17, N'HD0001', N'2', N'Trà Xanh Sữa Vị Nhài(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (18, N'HD0001', N'3', N'Trà Sữa Matcha(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (19, N'HD0001', N'2', N'Trà Xanh Sữa Vị Nhài(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (20, N'HD0002', N'2', N'Trà Xanh Sữa Vị Nhài(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (21, N'HD0002', N'1', N'Trà Sữa Hoàng Gia(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (22, N'HD0001', N'2', N'Trà Xanh Sữa Vị Nhài(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (23, N'HD0001', N'1', N'Trà Sữa Hoàng Gia(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (24, N'HD0001', N'1', N'Trà Sữa Hoàng Gia(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (25, N'HD0001', N'2', N'Trà Xanh Sữa Vị Nhài(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (26, N'HD0001', N'5', N'Hồng Trà(Size S)', 1, 28000, 20000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (27, N'HD0001', N'1', N'Trà Sữa Hoàng Gia(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (28, N'HD0001', N'2', N'Trà Xanh Sữa Vị Nhài(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (29, N'HD0005', N'2', N'Trà Xanh Sữa Vị Nhài(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 0)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (30, N'HD0002', N'2', N'Trà Xanh Sữa Vị Nhài(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (31, N'HD0002', N'1', N'Trà Sữa Hoàng Gia(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (32, N'HD0001', N'1', N'Trà Sữa Hoàng Gia(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (33, N'HD0001', N'2', N'Trà Xanh Sữa Vị Nhài(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (34, N'HD0001', N'1', N'Trà Sữa Hoàng Gia(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (35, N'HD0002', N'2', N'Trà Xanh Sữa Vị Nhài(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (36, N'HD0002', N'2', N'Trà Xanh Sữa Vị Nhài(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (37, N'HD0002', N'3', N'Trà Sữa Matcha(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (38, N'HD0002', N'5', N'Hồng Trà(Size S)', 1, 28000, 20000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (39, N'HD0002', N'1', N'Trà Sữa Hoàng Gia(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (40, N'HD0001', N'1', N'Trà Sữa Hoàng Gia(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (41, N'HD0001', N'2', N'Trà Xanh Sữa Vị Nhài(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (42, N'HD0001', N'2', N'Trà Xanh Sữa Vị Nhài(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (43, N'HD0001', N'1', N'Trà Sữa Hoàng Gia(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (44, N'HD0001', N'5', N'Hồng Trà(Size S)', 1, 28000, 20000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (45, N'HD0002', N'6', N'Trà Xanh(Size S)', 1, 28000, 20000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 0)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (46, N'HD0001', N'3', N'Trà Sữa Matcha(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (47, N'HD0001', N'2', N'Trà Xanh Sữa Vị Nhài(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (48, N'HD0001', N'4', N'Trà Sữa Socola(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (49, N'HD0001', N'1', N'Trà Sữa Hoàng Gia(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (50, N'HD0001', N'2', N'Trà Xanh Sữa Vị Nhài(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (51, N'HD0001', N'4', N'Trà Sữa Socola(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (52, N'HD0001', N'1', N'Trà Sữa Hoàng Gia(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (53, N'HD0001', N'1', N'Trà Sữa Hoàng Gia(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (54, N'HD0001', N'1', N'Trà Sữa Hoàng Gia(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (55, N'HD0001', N'1', N'Trà Sữa Hoàng Gia(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (56, N'HD0001', N'2', N'Trà Xanh Sữa Vị Nhài(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (57, N'HD0001', N'4', N'Trà Sữa Socola(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (58, N'HD0003', N'4', N'Trà Sữa Socola(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (59, N'HD0003', N'5', N'Hồng Trà(Size S)', 1, 28000, 20000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (60, N'HD0003', N'1', N'Trà Sữa Hoàng Gia(Size S)', 3, 38000, 114000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (61, N'HD0003', N'4', N'Trà Sữa Socola(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (62, N'HD0003', N'6', N'Trà Xanh(Size S)', 1, 28000, 20000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (63, N'HD0003', N'12', N'Trà Sữa Hoàng Gia(Size M)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (64, N'HD0002', N'3', N'Trà Sữa Matcha(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 0)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (65, N'HD0002', N'1', N'Trà Sữa Hoàng Gia(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 0)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (66, N'HD0003', N'4', N'Trà Sữa Socola(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (67, N'HD0002', N'4', N'Trà Sữa Socola(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 0)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (68, N'HD0003', N'5', N'Hồng Trà(Size S)', 1, 28000, 28000, 1, N'Không đường', 1, N'Không đá', 5, N'Macchiato', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (69, N'HD0001', N'1', N'Trà Sữa Hoàng Gia(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 0)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (70, N'HD0001', N'2', N'Trà Xanh Sữa Vị Nhài(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 0)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (71, N'HD0002', N'1', N'Trà Sữa Hoàng Gia(Size S)', 1, 38000, 38000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 0)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (72, N'HD0001', N'3', N'Trà Sữa Matcha(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 0)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (73, N'HD0006', N'1', N'Trà Sữa Hoàng Gia(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (74, N'HD0006', N'3', N'Trà Sữa Matcha(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (75, N'HD0006', N'5', N'Hồng Trà(Size S)', 2, 27000, 54000, 1, N'Không đường', 1, N'Không đá', 2, N'Trân Châu Baby', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (76, N'HD1000', N'1', N'Trà Sữa Hoàng Gia(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (77, N'HD3', N'1', N'Trà Sữa Hoàng Gia(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (78, N'HD3', N'4', N'Trà Sữa Socola(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (79, N'HD3', N'5', N'Hồng Trà(Size S)', 1, 28000, 20000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (80, N'HD3', N'8', N'Choco Ngũ Cốc Kem Cà Phê(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (89, N'HD4', N'3', N'Trà Sữa Matcha(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 0)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (90, N'HD6', N'1', N'Trà Sữa Hoàng Gia(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (91, N'HD6', N'4', N'Trà Sữa Socola(Size S)', 1, 38000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Trân Châu Sương Mai', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (92, N'HD5', N'4', N'Trà Sữa Socola(Size S)', 1, 30000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Không Topping', 0)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (93, N'HD610', N'3', N'Trà Sữa Matcha(Size S)', 3, 37000, 111000, 4, N'70 đường', 3, N'50% đá', 4, N'Trân Châu Băng Tuyết', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (95, N'HD610', N'5', N'Hồng Trà(Size S)', 1, 20000, 20000, 1, N'Không đường', 1, N'Không đá', 1, N'Không Topping', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (96, N'HD610', N'8', N'Choco Ngũ Cốc Kem Cà Phê(Size S)', 1, 30000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Không Topping', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (97, N'HD1', N'3', N'Trà Sữa Matcha(Size S)', 1, 30000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Không Topping', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (99, N'HD1', N'2', N'Trà Xanh Sữa Vị Nhài(Size S)', 1, 30000, 30000, 1, N'Không đường', 1, N'Không đá', 1, N'Không Topping', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (101, N'HD1', N'2', N'Trà Xanh Sữa Vị Nhài(Size S)', 4, 37000, 148000, 3, N'50 đường', 3, N'50% đá', 4, N'Trân Châu Băng Tuyết', 1)
INSERT [dbo].[gio_hang] ([id], [ma_hoa_don], [id_san_pham], [ten_san_pham], [so_luong_sp], [don_gia], [tong_tien], [id_duong], [ten_duong], [id_da], [ten_da], [id_topping], [ten_topping], [trang_thai]) VALUES (102, N'HD5', N'4', N'Trà Sữa Socola(Size S)', 2, 37000, 74000, 4, N'70 đường', 2, N'30% đá', 3, N'Trân Châu Hoàng Kim', 0)
SET IDENTITY_INSERT [dbo].[gio_hang] OFF
GO
SET IDENTITY_INSERT [dbo].[hoa_don] ON 

INSERT [dbo].[hoa_don] ([id], [ma], [ngay_tao], [tong_tien], [gia_voucher], [gia_khuyen_mai], [gia_thanh_toan], [ngay_thanh_toan], [id_ban], [id_nhan_vien], [id_dung_diem], [id_khach_hang], [ghi_chu], [trang_thai]) VALUES (75, N'HD1', CAST(N'2022-12-05' AS Date), 208000, NULL, 0, 208000, CAST(N'2022-12-05' AS Date), NULL, 1, NULL, NULL, N'Khách hàng khó tính', 1)
INSERT [dbo].[hoa_don] ([id], [ma], [ngay_tao], [tong_tien], [gia_voucher], [gia_khuyen_mai], [gia_thanh_toan], [ngay_thanh_toan], [id_ban], [id_nhan_vien], [id_dung_diem], [id_khach_hang], [ghi_chu], [trang_thai]) VALUES (76, N'HD2', CAST(N'2022-12-05' AS Date), NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'qqqq', 2)
INSERT [dbo].[hoa_don] ([id], [ma], [ngay_tao], [tong_tien], [gia_voucher], [gia_khuyen_mai], [gia_thanh_toan], [ngay_thanh_toan], [id_ban], [id_nhan_vien], [id_dung_diem], [id_khach_hang], [ghi_chu], [trang_thai]) VALUES (77, N'HD3', CAST(N'2022-12-05' AS Date), NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'Không có ghi chú', 0)
INSERT [dbo].[hoa_don] ([id], [ma], [ngay_tao], [tong_tien], [gia_voucher], [gia_khuyen_mai], [gia_thanh_toan], [ngay_thanh_toan], [id_ban], [id_nhan_vien], [id_dung_diem], [id_khach_hang], [ghi_chu], [trang_thai]) VALUES (78, N'HD4', CAST(N'2022-12-05' AS Date), NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'Không có ghi chú', 0)
INSERT [dbo].[hoa_don] ([id], [ma], [ngay_tao], [tong_tien], [gia_voucher], [gia_khuyen_mai], [gia_thanh_toan], [ngay_thanh_toan], [id_ban], [id_nhan_vien], [id_dung_diem], [id_khach_hang], [ghi_chu], [trang_thai]) VALUES (79, N'HD5', CAST(N'2022-12-05' AS Date), NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'Không có ghi chú', 0)
INSERT [dbo].[hoa_don] ([id], [ma], [ngay_tao], [tong_tien], [gia_voucher], [gia_khuyen_mai], [gia_thanh_toan], [ngay_thanh_toan], [id_ban], [id_nhan_vien], [id_dung_diem], [id_khach_hang], [ghi_chu], [trang_thai]) VALUES (80, N'HD6', CAST(N'2022-12-05' AS Date), 60000, NULL, 0, 60000, CAST(N'2022-12-05' AS Date), NULL, 1, NULL, NULL, N'', 1)
INSERT [dbo].[hoa_don] ([id], [ma], [ngay_tao], [tong_tien], [gia_voucher], [gia_khuyen_mai], [gia_thanh_toan], [ngay_thanh_toan], [id_ban], [id_nhan_vien], [id_dung_diem], [id_khach_hang], [ghi_chu], [trang_thai]) VALUES (81, N'HD7', CAST(N'2022-12-05' AS Date), NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'Không có ghi chú', 0)
INSERT [dbo].[hoa_don] ([id], [ma], [ngay_tao], [tong_tien], [gia_voucher], [gia_khuyen_mai], [gia_thanh_toan], [ngay_thanh_toan], [id_ban], [id_nhan_vien], [id_dung_diem], [id_khach_hang], [ghi_chu], [trang_thai]) VALUES (82, N'HD8', CAST(N'2022-12-05' AS Date), NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'Không có ghi chú', 0)
SET IDENTITY_INSERT [dbo].[hoa_don] OFF
GO
SET IDENTITY_INSERT [dbo].[hoa_don_chi_tiet] ON 

INSERT [dbo].[hoa_don_chi_tiet] ([id], [id_hoa_don], [id_san_pham], [don_gia], [so_luong], [id_duong], [id_da], [gia_duong], [gia_da], [gia_topping], [trang_thai], [id_topping]) VALUES (137, 75, 3, 30000, 1, 1, 1, 0, 0, 0, 0, 1)
INSERT [dbo].[hoa_don_chi_tiet] ([id], [id_hoa_don], [id_san_pham], [don_gia], [so_luong], [id_duong], [id_da], [gia_duong], [gia_da], [gia_topping], [trang_thai], [id_topping]) VALUES (138, 75, 2, 30000, 1, 1, 1, 0, 0, 0, 0, 1)
INSERT [dbo].[hoa_don_chi_tiet] ([id], [id_hoa_don], [id_san_pham], [don_gia], [so_luong], [id_duong], [id_da], [gia_duong], [gia_da], [gia_topping], [trang_thai], [id_topping]) VALUES (139, 75, 2, 37000, 4, 3, 3, 0, 0, 0, 0, 4)
INSERT [dbo].[hoa_don_chi_tiet] ([id], [id_hoa_don], [id_san_pham], [don_gia], [so_luong], [id_duong], [id_da], [gia_duong], [gia_da], [gia_topping], [trang_thai], [id_topping]) VALUES (140, 80, 1, 38000, 1, 1, 1, 0, 0, 0, 0, 1)
INSERT [dbo].[hoa_don_chi_tiet] ([id], [id_hoa_don], [id_san_pham], [don_gia], [so_luong], [id_duong], [id_da], [gia_duong], [gia_da], [gia_topping], [trang_thai], [id_topping]) VALUES (141, 80, 4, 38000, 1, 1, 1, 0, 0, 0, 0, 1)
SET IDENTITY_INSERT [dbo].[hoa_don_chi_tiet] OFF
GO
SET IDENTITY_INSERT [dbo].[muc_da] ON 

INSERT [dbo].[muc_da] ([id], [ma], [ten], [gia], [trang_thai]) VALUES (1, N'DA00', N'Không đá', 0, 0)
INSERT [dbo].[muc_da] ([id], [ma], [ten], [gia], [trang_thai]) VALUES (2, N'DA01', N'30% đá', 0, 0)
INSERT [dbo].[muc_da] ([id], [ma], [ten], [gia], [trang_thai]) VALUES (3, N'DA02', N'50% đá', 0, 0)
INSERT [dbo].[muc_da] ([id], [ma], [ten], [gia], [trang_thai]) VALUES (4, N'DA03', N'70% đá', 0, 0)
INSERT [dbo].[muc_da] ([id], [ma], [ten], [gia], [trang_thai]) VALUES (5, N'DA04', N'100% đá', 0, 0)
SET IDENTITY_INSERT [dbo].[muc_da] OFF
GO
SET IDENTITY_INSERT [dbo].[muc_duong] ON 

INSERT [dbo].[muc_duong] ([id], [ma], [ten], [gia], [trang_thai]) VALUES (1, N'DG000', N'Không đường', 0, 0)
INSERT [dbo].[muc_duong] ([id], [ma], [ten], [gia], [trang_thai]) VALUES (2, N'DG030', N'30% đường', 0, 0)
INSERT [dbo].[muc_duong] ([id], [ma], [ten], [gia], [trang_thai]) VALUES (3, N'DG50', N'50 đường', 0, 0)
INSERT [dbo].[muc_duong] ([id], [ma], [ten], [gia], [trang_thai]) VALUES (4, N'DG70', N'70 đường', 0, 0)
INSERT [dbo].[muc_duong] ([id], [ma], [ten], [gia], [trang_thai]) VALUES (7, N'DG150', N'150% đường', 0, 0)
INSERT [dbo].[muc_duong] ([id], [ma], [ten], [gia], [trang_thai]) VALUES (8, N'DG170', N'170% đường', 0, 0)
SET IDENTITY_INSERT [dbo].[muc_duong] OFF
GO
SET IDENTITY_INSERT [dbo].[nhan_vien] ON 

INSERT [dbo].[nhan_vien] ([id], [ma], [ho_va_ten], [mat_khau], [sdt], [cccd], [ngay_sinh], [gioi_tinh], [dia_chi], [email], [ghi_chu], [trang_thai], [id_chuc_vu]) VALUES (1, N'NV001', N'Vũ Đức Trung', N'1', N'0345820879', N'030099002250', CAST(N'1999-01-23' AS Date), 0, N'Hải Dương', N'trungvd@gmail.com', N'Không có ghi chú', 0, 1)
SET IDENTITY_INSERT [dbo].[nhan_vien] OFF
GO
SET IDENTITY_INSERT [dbo].[san_pham] ON 

INSERT [dbo].[san_pham] ([id], [ma], [ten], [gia], [mo_ta], [trang_thai], [id_size], [id_danh_muc]) VALUES (1, N'SP01', N'Trà Sữa Hoàng Gia', 30000, N'Không có mô tả', 0, 1, 1)
INSERT [dbo].[san_pham] ([id], [ma], [ten], [gia], [mo_ta], [trang_thai], [id_size], [id_danh_muc]) VALUES (2, N'SP02', N'Trà Xanh Sữa Vị Nhài', 30000, N'Không có mô tả', 0, 1, 1)
INSERT [dbo].[san_pham] ([id], [ma], [ten], [gia], [mo_ta], [trang_thai], [id_size], [id_danh_muc]) VALUES (3, N'SP03', N'Trà Sữa Matcha', 30000, N'Không có mô tả', 0, 1, 1)
INSERT [dbo].[san_pham] ([id], [ma], [ten], [gia], [mo_ta], [trang_thai], [id_size], [id_danh_muc]) VALUES (4, N'SP04', N'Trà Sữa Socola', 30000, N'Không có mô tả', 0, 1, 1)
INSERT [dbo].[san_pham] ([id], [ma], [ten], [gia], [mo_ta], [trang_thai], [id_size], [id_danh_muc]) VALUES (5, N'SP05', N'Hồng Trà', 20000, N'Không có mô tả', 0, 1, 1)
INSERT [dbo].[san_pham] ([id], [ma], [ten], [gia], [mo_ta], [trang_thai], [id_size], [id_danh_muc]) VALUES (6, N'SP06', N'Trà Xanh', 20000, N'Không có mô tả', 0, 1, 1)
INSERT [dbo].[san_pham] ([id], [ma], [ten], [gia], [mo_ta], [trang_thai], [id_size], [id_danh_muc]) VALUES (7, N'SP07', N'Trà Mận Hạt Sen', 25000, N'Không có mô tả', 0, 1, 2)
INSERT [dbo].[san_pham] ([id], [ma], [ten], [gia], [mo_ta], [trang_thai], [id_size], [id_danh_muc]) VALUES (8, N'SP08', N'Choco Ngũ Cốc Kem Cà Phê', 30000, N'Không có mô tả', 0, 1, 3)
INSERT [dbo].[san_pham] ([id], [ma], [ten], [gia], [mo_ta], [trang_thai], [id_size], [id_danh_muc]) VALUES (10, N'SP10', N'Trà Sữa Hạnh Phúc', 30000, N'Không có mô tả', 0, 2, 1)
INSERT [dbo].[san_pham] ([id], [ma], [ten], [gia], [mo_ta], [trang_thai], [id_size], [id_danh_muc]) VALUES (11, N'SP11', N'Hồng Trà Ngũ Cốc Cà Phê', 35000, N'Sản phẩm có lợi cho bệnh nhân huyết áp thấp', 1, 3, 3)
INSERT [dbo].[san_pham] ([id], [ma], [ten], [gia], [mo_ta], [trang_thai], [id_size], [id_danh_muc]) VALUES (12, N'SP12', N'Trà Sữa Hoàng Gia', 30000, N'Không có mô tả', 0, 2, 1)
INSERT [dbo].[san_pham] ([id], [ma], [ten], [gia], [mo_ta], [trang_thai], [id_size], [id_danh_muc]) VALUES (13, N'SP13', N'Trà Sữa Hoàng Gia', 30000, N'Trà sữa ngon nhất quán', 0, 3, 1)
INSERT [dbo].[san_pham] ([id], [ma], [ten], [gia], [mo_ta], [trang_thai], [id_size], [id_danh_muc]) VALUES (18, N'SP14', N'Trà Sữa Hoàng Gia', 30000, N'Trà sữa ngon nhất quán', 0, 3, 1)
INSERT [dbo].[san_pham] ([id], [ma], [ten], [gia], [mo_ta], [trang_thai], [id_size], [id_danh_muc]) VALUES (20, N'SP15', N'Trà Xanh', 20000, N'Không có mô tả', 0, 3, 1)
INSERT [dbo].[san_pham] ([id], [ma], [ten], [gia], [mo_ta], [trang_thai], [id_size], [id_danh_muc]) VALUES (21, N'SP16', N'Trà Sữa Trang Ngu Ngok', 30000, N'Không có mô tả', 0, 1, 2)
INSERT [dbo].[san_pham] ([id], [ma], [ten], [gia], [mo_ta], [trang_thai], [id_size], [id_danh_muc]) VALUES (23, N'SP17', N'Trà Sữa Trang Ngu Ngok', 30000, N'Không có mô tả', 0, 1, 2)
INSERT [dbo].[san_pham] ([id], [ma], [ten], [gia], [mo_ta], [trang_thai], [id_size], [id_danh_muc]) VALUES (24, N'SP18', N'Trà Sữa Trang Ngu Ngok', 30000, N'Không có mô tả', 0, 3, 2)
SET IDENTITY_INSERT [dbo].[san_pham] OFF
GO
SET IDENTITY_INSERT [dbo].[size] ON 

INSERT [dbo].[size] ([id], [ma], [ten], [gia], [trang_thai]) VALUES (1, N'S01', N'Size S', 0, 0)
INSERT [dbo].[size] ([id], [ma], [ten], [gia], [trang_thai]) VALUES (2, N'S02', N'Size M', 5000, 0)
INSERT [dbo].[size] ([id], [ma], [ten], [gia], [trang_thai]) VALUES (3, N'S03', N'Size L', 10000, 0)
SET IDENTITY_INSERT [dbo].[size] OFF
GO
SET IDENTITY_INSERT [dbo].[topping] ON 

INSERT [dbo].[topping] ([id], [ma], [ten], [gia], [trang_thai]) VALUES (1, N'T01', N'Không Topping', 0, 0)
INSERT [dbo].[topping] ([id], [ma], [ten], [gia], [trang_thai]) VALUES (2, N'T02', N'Trân Châu Baby', 7000, 0)
INSERT [dbo].[topping] ([id], [ma], [ten], [gia], [trang_thai]) VALUES (3, N'T03', N'Trân Châu Hoàng Kim', 7000, 0)
INSERT [dbo].[topping] ([id], [ma], [ten], [gia], [trang_thai]) VALUES (4, N'T04', N'Trân Châu Băng Tuyết', 7000, 0)
INSERT [dbo].[topping] ([id], [ma], [ten], [gia], [trang_thai]) VALUES (5, N'T05', N'Macchiato', 8000, 0)
INSERT [dbo].[topping] ([id], [ma], [ten], [gia], [trang_thai]) VALUES (6, N'T06', N'Rau Câu', 7000, 0)
INSERT [dbo].[topping] ([id], [ma], [ten], [gia], [trang_thai]) VALUES (7, N'T07', N'Trân Châu Sợi', 7000, 0)
INSERT [dbo].[topping] ([id], [ma], [ten], [gia], [trang_thai]) VALUES (8, N'TP8', N'Trân Châu Sương Mai', 8000, 0)
SET IDENTITY_INSERT [dbo].[topping] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__chuc_vu__3213C8B6B3858C9D]    Script Date: 12/7/2022 3:49:35 PM ******/
ALTER TABLE [dbo].[chuc_vu] ADD UNIQUE NONCLUSTERED 
(
	[ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__combo__3213C8B6564D86E8]    Script Date: 12/7/2022 3:49:35 PM ******/
ALTER TABLE [dbo].[combo] ADD UNIQUE NONCLUSTERED 
(
	[ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__danh_muc__3213C8B6EB6FBFC8]    Script Date: 12/7/2022 3:49:35 PM ******/
ALTER TABLE [dbo].[danh_muc_sp] ADD UNIQUE NONCLUSTERED 
(
	[ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__hoa_don__3213C8B68FB8A539]    Script Date: 12/7/2022 3:49:35 PM ******/
ALTER TABLE [dbo].[hoa_don] ADD UNIQUE NONCLUSTERED 
(
	[ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__khach_ha__3213C8B68B01EF38]    Script Date: 12/7/2022 3:49:35 PM ******/
ALTER TABLE [dbo].[khach_hang] ADD UNIQUE NONCLUSTERED 
(
	[ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__khuyen_m__3213C8B67E9596A8]    Script Date: 12/7/2022 3:49:35 PM ******/
ALTER TABLE [dbo].[khuyen_mai] ADD UNIQUE NONCLUSTERED 
(
	[ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__muc_da__3213C8B6493788C1]    Script Date: 12/7/2022 3:49:35 PM ******/
ALTER TABLE [dbo].[muc_da] ADD UNIQUE NONCLUSTERED 
(
	[ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__muc_duon__3213C8B6B9B0DC17]    Script Date: 12/7/2022 3:49:35 PM ******/
ALTER TABLE [dbo].[muc_duong] ADD UNIQUE NONCLUSTERED 
(
	[ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__nhan_vie__3213C8B65580185B]    Script Date: 12/7/2022 3:49:35 PM ******/
ALTER TABLE [dbo].[nhan_vien] ADD UNIQUE NONCLUSTERED 
(
	[ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__san_pham__3213C8B6A0776AC5]    Script Date: 12/7/2022 3:49:35 PM ******/
ALTER TABLE [dbo].[san_pham] ADD UNIQUE NONCLUSTERED 
(
	[ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__size__3213C8B60D88137B]    Script Date: 12/7/2022 3:49:35 PM ******/
ALTER TABLE [dbo].[size] ADD UNIQUE NONCLUSTERED 
(
	[ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__topping__3213C8B625CF28CD]    Script Date: 12/7/2022 3:49:35 PM ******/
ALTER TABLE [dbo].[topping] ADD UNIQUE NONCLUSTERED 
(
	[ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ban] ADD  DEFAULT (N'Chưa nhập tên bàn') FOR [ma]
GO
ALTER TABLE [dbo].[ban] ADD  DEFAULT (N'Không có ghi chú') FOR [ten]
GO
ALTER TABLE [dbo].[ban] ADD  DEFAULT ((0)) FOR [trang_thai]
GO
ALTER TABLE [dbo].[chuc_vu] ADD  DEFAULT (N'Chưa nhập tên chức vụ') FOR [ten]
GO
ALTER TABLE [dbo].[combo] ADD  DEFAULT (N'Chưa đặt tên combo') FOR [ten]
GO
ALTER TABLE [dbo].[combo] ADD  DEFAULT ((0)) FOR [gia]
GO
ALTER TABLE [dbo].[combo] ADD  DEFAULT (NULL) FOR [so_luong_sp]
GO
ALTER TABLE [dbo].[combo] ADD  DEFAULT (getdate()) FOR [ngay_tao]
GO
ALTER TABLE [dbo].[combo] ADD  DEFAULT (N'Không có ghi chú') FOR [ghi_chu]
GO
ALTER TABLE [dbo].[combo] ADD  DEFAULT ((0)) FOR [trang_thai]
GO
ALTER TABLE [dbo].[combo_san_pham] ADD  DEFAULT ((0)) FOR [trang_thai]
GO
ALTER TABLE [dbo].[danh_muc_sp] ADD  DEFAULT (N'Chưa nhập tên danh mục') FOR [ten]
GO
ALTER TABLE [dbo].[danh_muc_sp] ADD  DEFAULT ((0)) FOR [trang_thai]
GO
ALTER TABLE [dbo].[dung_diem] ADD  DEFAULT (NULL) FOR [so_diem_su_dung]
GO
ALTER TABLE [dbo].[dung_diem] ADD  DEFAULT (getdate()) FOR [ngay_su_dung]
GO
ALTER TABLE [dbo].[dung_diem] ADD  DEFAULT (N'Không có ghi chú') FOR [ghi_chu]
GO
ALTER TABLE [dbo].[dung_diem] ADD  DEFAULT ((0)) FOR [trang_thai]
GO
ALTER TABLE [dbo].[giao_ca] ADD  DEFAULT (NULL) FOR [ma_nhan_vien_nhan_ca]
GO
ALTER TABLE [dbo].[giao_ca] ADD  DEFAULT (NULL) FOR [tong_so_don_hang]
GO
ALTER TABLE [dbo].[giao_ca] ADD  DEFAULT (NULL) FOR [tong_tien_ban_hang]
GO
ALTER TABLE [dbo].[giao_ca] ADD  DEFAULT (NULL) FOR [tien_phat_sinh]
GO
ALTER TABLE [dbo].[giao_ca] ADD  DEFAULT (NULL) FOR [tien_trong_ket]
GO
ALTER TABLE [dbo].[giao_ca] ADD  DEFAULT (NULL) FOR [tien_hien_co]
GO
ALTER TABLE [dbo].[giao_ca] ADD  DEFAULT (N'Không có ghi chú') FOR [ghi_chu]
GO
ALTER TABLE [dbo].[giao_ca] ADD  DEFAULT ((0)) FOR [trang_thai]
GO
ALTER TABLE [dbo].[gio_hang] ADD  DEFAULT (NULL) FOR [id_duong]
GO
ALTER TABLE [dbo].[gio_hang] ADD  DEFAULT (NULL) FOR [ten_duong]
GO
ALTER TABLE [dbo].[gio_hang] ADD  DEFAULT (NULL) FOR [id_da]
GO
ALTER TABLE [dbo].[gio_hang] ADD  DEFAULT (NULL) FOR [ten_da]
GO
ALTER TABLE [dbo].[gio_hang] ADD  DEFAULT (NULL) FOR [id_topping]
GO
ALTER TABLE [dbo].[gio_hang] ADD  DEFAULT (NULL) FOR [ten_topping]
GO
ALTER TABLE [dbo].[gio_hang] ADD  DEFAULT ((0)) FOR [trang_thai]
GO
ALTER TABLE [dbo].[hinh_anh] ADD  DEFAULT (N'Chưa nhập tên hình ảnh') FOR [ten]
GO
ALTER TABLE [dbo].[hinh_anh] ADD  DEFAULT (NULL) FOR [duong_dan_anh]
GO
ALTER TABLE [dbo].[hinh_anh] ADD  DEFAULT ((0)) FOR [trang_thai]
GO
ALTER TABLE [dbo].[hoa_don] ADD  DEFAULT (getdate()) FOR [ngay_tao]
GO
ALTER TABLE [dbo].[hoa_don] ADD  DEFAULT (NULL) FOR [tong_tien]
GO
ALTER TABLE [dbo].[hoa_don] ADD  DEFAULT (NULL) FOR [gia_voucher]
GO
ALTER TABLE [dbo].[hoa_don] ADD  DEFAULT (NULL) FOR [gia_khuyen_mai]
GO
ALTER TABLE [dbo].[hoa_don] ADD  DEFAULT (NULL) FOR [gia_thanh_toan]
GO
ALTER TABLE [dbo].[hoa_don] ADD  DEFAULT (NULL) FOR [ngay_thanh_toan]
GO
ALTER TABLE [dbo].[hoa_don] ADD  DEFAULT (N'Không có ghi chú') FOR [ghi_chu]
GO
ALTER TABLE [dbo].[hoa_don] ADD  DEFAULT ((0)) FOR [trang_thai]
GO
ALTER TABLE [dbo].[hoa_don_chi_tiet] ADD  DEFAULT (NULL) FOR [don_gia]
GO
ALTER TABLE [dbo].[hoa_don_chi_tiet] ADD  DEFAULT (NULL) FOR [so_luong]
GO
ALTER TABLE [dbo].[hoa_don_chi_tiet] ADD  DEFAULT ((0)) FOR [gia_duong]
GO
ALTER TABLE [dbo].[hoa_don_chi_tiet] ADD  DEFAULT ((0)) FOR [gia_da]
GO
ALTER TABLE [dbo].[hoa_don_chi_tiet] ADD  DEFAULT ((8000)) FOR [gia_topping]
GO
ALTER TABLE [dbo].[hoa_don_chi_tiet] ADD  DEFAULT ((0)) FOR [trang_thai]
GO
ALTER TABLE [dbo].[hoa_don_chi_tiet_topping] ADD  DEFAULT ((0)) FOR [trang_thai]
GO
ALTER TABLE [dbo].[khach_hang] ADD  DEFAULT (N'Chưa nhập họ tên khách hàng') FOR [ho_va_ten]
GO
ALTER TABLE [dbo].[khach_hang] ADD  DEFAULT (N'Chưa nhập SDT') FOR [sdt]
GO
ALTER TABLE [dbo].[khach_hang] ADD  DEFAULT (NULL) FOR [ngay_sinh]
GO
ALTER TABLE [dbo].[khach_hang] ADD  DEFAULT (N'Chưa nhập email') FOR [email]
GO
ALTER TABLE [dbo].[khach_hang] ADD  DEFAULT (N'Chưa nhập địa chỉ') FOR [dia_chi]
GO
ALTER TABLE [dbo].[khach_hang] ADD  DEFAULT ((1)) FOR [diem]
GO
ALTER TABLE [dbo].[khach_hang] ADD  DEFAULT (N'Không có ghi chú') FOR [ghi_chu]
GO
ALTER TABLE [dbo].[khach_hang] ADD  DEFAULT ((0)) FOR [trang_thai]
GO
ALTER TABLE [dbo].[khuyen_mai] ADD  DEFAULT (N'Chưa nhập tên khuyến mãi') FOR [ten]
GO
ALTER TABLE [dbo].[khuyen_mai] ADD  DEFAULT (getdate()) FOR [ngay_tao]
GO
ALTER TABLE [dbo].[khuyen_mai] ADD  DEFAULT ((0)) FOR [kieu_khuyen_mai]
GO
ALTER TABLE [dbo].[khuyen_mai] ADD  DEFAULT (NULL) FOR [tien_khuyen_mao]
GO
ALTER TABLE [dbo].[khuyen_mai] ADD  DEFAULT (NULL) FOR [phan_tram_khuyen_mai]
GO
ALTER TABLE [dbo].[khuyen_mai] ADD  DEFAULT (N'Không có ghi chú') FOR [ghi_chu]
GO
ALTER TABLE [dbo].[khuyen_mai] ADD  DEFAULT ((0)) FOR [trang_thai]
GO
ALTER TABLE [dbo].[khuyen_mai_chi_tiet] ADD  DEFAULT ((0)) FOR [trang_thai]
GO
ALTER TABLE [dbo].[muc_da] ADD  DEFAULT (NULL) FOR [ten]
GO
ALTER TABLE [dbo].[muc_da] ADD  DEFAULT (NULL) FOR [gia]
GO
ALTER TABLE [dbo].[muc_da] ADD  DEFAULT ((0)) FOR [trang_thai]
GO
ALTER TABLE [dbo].[muc_duong] ADD  DEFAULT (NULL) FOR [ten]
GO
ALTER TABLE [dbo].[muc_duong] ADD  DEFAULT (NULL) FOR [gia]
GO
ALTER TABLE [dbo].[muc_duong] ADD  DEFAULT ((0)) FOR [trang_thai]
GO
ALTER TABLE [dbo].[nhan_vien] ADD  DEFAULT (NULL) FOR [ho_va_ten]
GO
ALTER TABLE [dbo].[nhan_vien] ADD  DEFAULT (N'Chưa nhập sdt') FOR [sdt]
GO
ALTER TABLE [dbo].[nhan_vien] ADD  DEFAULT (N'Chưa nhập số CCCD') FOR [cccd]
GO
ALTER TABLE [dbo].[nhan_vien] ADD  DEFAULT (NULL) FOR [ngay_sinh]
GO
ALTER TABLE [dbo].[nhan_vien] ADD  DEFAULT (NULL) FOR [gioi_tinh]
GO
ALTER TABLE [dbo].[nhan_vien] ADD  DEFAULT (N'Chưa nhập địa chỉ') FOR [dia_chi]
GO
ALTER TABLE [dbo].[nhan_vien] ADD  DEFAULT (N'Chưa nhập email') FOR [email]
GO
ALTER TABLE [dbo].[nhan_vien] ADD  DEFAULT (N'Không có ghi chú') FOR [ghi_chu]
GO
ALTER TABLE [dbo].[nhan_vien] ADD  DEFAULT ((0)) FOR [trang_thai]
GO
ALTER TABLE [dbo].[nhat_ki_dung_diem] ADD  DEFAULT (NULL) FOR [diem_da_dung]
GO
ALTER TABLE [dbo].[nhat_ki_dung_diem] ADD  DEFAULT (NULL) FOR [diem_cong_them]
GO
ALTER TABLE [dbo].[nhat_ki_dung_diem] ADD  DEFAULT (NULL) FOR [diem_con_lai]
GO
ALTER TABLE [dbo].[nhat_ki_dung_diem] ADD  DEFAULT (getdate()) FOR [ngay_tao]
GO
ALTER TABLE [dbo].[nhat_ki_dung_diem] ADD  DEFAULT ((0)) FOR [trang_thai]
GO
ALTER TABLE [dbo].[quy_doi] ADD  DEFAULT (NULL) FOR [so_tien]
GO
ALTER TABLE [dbo].[quy_doi] ADD  DEFAULT (NULL) FOR [so_diem]
GO
ALTER TABLE [dbo].[quy_doi] ADD  DEFAULT (N'Không có ghi chú') FOR [ghi_chu]
GO
ALTER TABLE [dbo].[quy_doi] ADD  DEFAULT ((0)) FOR [trang_thai]
GO
ALTER TABLE [dbo].[san_pham] ADD  DEFAULT (N'Chưa nhập tên sản phẩm') FOR [ten]
GO
ALTER TABLE [dbo].[san_pham] ADD  DEFAULT ((0)) FOR [gia]
GO
ALTER TABLE [dbo].[san_pham] ADD  DEFAULT (N'Không có mô tả') FOR [mo_ta]
GO
ALTER TABLE [dbo].[san_pham] ADD  DEFAULT ((0)) FOR [trang_thai]
GO
ALTER TABLE [dbo].[size] ADD  DEFAULT (N'Chưa nhâp tên size') FOR [ten]
GO
ALTER TABLE [dbo].[size] ADD  DEFAULT ((0)) FOR [gia]
GO
ALTER TABLE [dbo].[size] ADD  DEFAULT ((0)) FOR [trang_thai]
GO
ALTER TABLE [dbo].[topping] ADD  DEFAULT (N'Chưa nhâp tên topping') FOR [ten]
GO
ALTER TABLE [dbo].[topping] ADD  DEFAULT ((0)) FOR [gia]
GO
ALTER TABLE [dbo].[topping] ADD  DEFAULT ((0)) FOR [trang_thai]
GO
ALTER TABLE [dbo].[combo_san_pham]  WITH CHECK ADD FOREIGN KEY([id_combo])
REFERENCES [dbo].[combo] ([id])
GO
ALTER TABLE [dbo].[combo_san_pham]  WITH CHECK ADD FOREIGN KEY([id_san_pham])
REFERENCES [dbo].[san_pham] ([id])
GO
ALTER TABLE [dbo].[dung_diem]  WITH CHECK ADD FOREIGN KEY([id_khach_hang])
REFERENCES [dbo].[khach_hang] ([id])
GO
ALTER TABLE [dbo].[dung_diem]  WITH CHECK ADD FOREIGN KEY([id_quy_doi])
REFERENCES [dbo].[quy_doi] ([id])
GO
ALTER TABLE [dbo].[giao_ca]  WITH CHECK ADD FOREIGN KEY([id_nhan_vien])
REFERENCES [dbo].[nhan_vien] ([id])
GO
ALTER TABLE [dbo].[hinh_anh]  WITH CHECK ADD FOREIGN KEY([id_san_pham])
REFERENCES [dbo].[san_pham] ([id])
GO
ALTER TABLE [dbo].[hoa_don]  WITH CHECK ADD FOREIGN KEY([id_ban])
REFERENCES [dbo].[ban] ([id])
GO
ALTER TABLE [dbo].[hoa_don]  WITH CHECK ADD FOREIGN KEY([id_dung_diem])
REFERENCES [dbo].[dung_diem] ([id])
GO
ALTER TABLE [dbo].[hoa_don]  WITH CHECK ADD FOREIGN KEY([id_khach_hang])
REFERENCES [dbo].[khach_hang] ([id])
GO
ALTER TABLE [dbo].[hoa_don]  WITH CHECK ADD FOREIGN KEY([id_nhan_vien])
REFERENCES [dbo].[nhan_vien] ([id])
GO
ALTER TABLE [dbo].[hoa_don_chi_tiet]  WITH CHECK ADD FOREIGN KEY([id_da])
REFERENCES [dbo].[muc_da] ([id])
GO
ALTER TABLE [dbo].[hoa_don_chi_tiet]  WITH CHECK ADD FOREIGN KEY([id_duong])
REFERENCES [dbo].[muc_duong] ([id])
GO
ALTER TABLE [dbo].[hoa_don_chi_tiet]  WITH CHECK ADD FOREIGN KEY([id_hoa_don])
REFERENCES [dbo].[hoa_don] ([id])
GO
ALTER TABLE [dbo].[hoa_don_chi_tiet]  WITH CHECK ADD FOREIGN KEY([id_san_pham])
REFERENCES [dbo].[san_pham] ([id])
GO
ALTER TABLE [dbo].[hoa_don_chi_tiet_topping]  WITH CHECK ADD FOREIGN KEY([id_hoa_don_chi_tiet])
REFERENCES [dbo].[hoa_don_chi_tiet] ([id])
GO
ALTER TABLE [dbo].[hoa_don_chi_tiet_topping]  WITH CHECK ADD FOREIGN KEY([id_topping])
REFERENCES [dbo].[topping] ([id])
GO
ALTER TABLE [dbo].[khuyen_mai_chi_tiet]  WITH CHECK ADD FOREIGN KEY([id_hoa_don])
REFERENCES [dbo].[hoa_don] ([id])
GO
ALTER TABLE [dbo].[khuyen_mai_chi_tiet]  WITH CHECK ADD FOREIGN KEY([id_khuyen_mai])
REFERENCES [dbo].[khuyen_mai] ([id])
GO
ALTER TABLE [dbo].[nhan_vien]  WITH CHECK ADD FOREIGN KEY([id_chuc_vu])
REFERENCES [dbo].[chuc_vu] ([id])
GO
ALTER TABLE [dbo].[nhat_ki_dung_diem]  WITH CHECK ADD FOREIGN KEY([id_dung_diem])
REFERENCES [dbo].[dung_diem] ([id])
GO
ALTER TABLE [dbo].[nhat_ki_dung_diem]  WITH CHECK ADD FOREIGN KEY([id_hoa_don])
REFERENCES [dbo].[hoa_don] ([id])
GO
ALTER TABLE [dbo].[nhat_ki_dung_diem]  WITH CHECK ADD FOREIGN KEY([id_khach_hang])
REFERENCES [dbo].[khach_hang] ([id])
GO
ALTER TABLE [dbo].[san_pham]  WITH CHECK ADD FOREIGN KEY([id_danh_muc])
REFERENCES [dbo].[danh_muc_sp] ([id])
GO
ALTER TABLE [dbo].[san_pham]  WITH CHECK ADD FOREIGN KEY([id_size])
REFERENCES [dbo].[size] ([id])
GO
USE [master]
GO
ALTER DATABASE [DuAn1_QuanLyBanTraSua] SET  READ_WRITE 

GO
