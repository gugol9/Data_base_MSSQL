USE [master]
GO
/****** Object:  Database [w64152_Sklep_internetowy01]    Script Date: 21.12.2021 14:01:20 ******/
CREATE DATABASE [w64152_Sklep_internetowy01]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'w64152_Sklep_internetowy01', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQL2017\MSSQL\DATA\w64152_Sklep_internetowy01.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'w64152_Sklep_internetowy01_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQL2017\MSSQL\DATA\w64152_Sklep_internetowy01_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [w64152_Sklep_internetowy01] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [w64152_Sklep_internetowy01].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [w64152_Sklep_internetowy01] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [w64152_Sklep_internetowy01] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [w64152_Sklep_internetowy01] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [w64152_Sklep_internetowy01] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [w64152_Sklep_internetowy01] SET ARITHABORT OFF 
GO
ALTER DATABASE [w64152_Sklep_internetowy01] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [w64152_Sklep_internetowy01] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [w64152_Sklep_internetowy01] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [w64152_Sklep_internetowy01] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [w64152_Sklep_internetowy01] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [w64152_Sklep_internetowy01] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [w64152_Sklep_internetowy01] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [w64152_Sklep_internetowy01] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [w64152_Sklep_internetowy01] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [w64152_Sklep_internetowy01] SET  ENABLE_BROKER 
GO
ALTER DATABASE [w64152_Sklep_internetowy01] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [w64152_Sklep_internetowy01] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [w64152_Sklep_internetowy01] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [w64152_Sklep_internetowy01] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [w64152_Sklep_internetowy01] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [w64152_Sklep_internetowy01] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [w64152_Sklep_internetowy01] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [w64152_Sklep_internetowy01] SET RECOVERY FULL 
GO
ALTER DATABASE [w64152_Sklep_internetowy01] SET  MULTI_USER 
GO
ALTER DATABASE [w64152_Sklep_internetowy01] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [w64152_Sklep_internetowy01] SET DB_CHAINING OFF 
GO
ALTER DATABASE [w64152_Sklep_internetowy01] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [w64152_Sklep_internetowy01] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [w64152_Sklep_internetowy01] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'w64152_Sklep_internetowy01', N'ON'
GO
ALTER DATABASE [w64152_Sklep_internetowy01] SET QUERY_STORE = OFF
GO
USE [w64152_Sklep_internetowy01]
GO
/****** Object:  Table [dbo].[Adres]    Script Date: 21.12.2021 14:01:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adres](
	[AdresID] [int] NOT NULL,
	[Adres] [nvarchar](150) NULL,
	[Kraj] [nvarchar](150) NULL,
	[Miasto] [nvarchar](150) NULL,
	[Kod_pocztowy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Adres] PRIMARY KEY CLUSTERED 
(
	[AdresID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dostawcy]    Script Date: 21.12.2021 14:01:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dostawcy](
	[DostawcaID] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa_dostawcy] [nvarchar](40) NULL,
	[Nr_telefonu] [nvarchar](30) NULL,
	[AdresID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DostawcaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faktury]    Script Date: 21.12.2021 14:01:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faktury](
	[FakturaID] [int] IDENTITY(1,1) NOT NULL,
	[Stawka_vat_ID] [int] NULL,
	[Typ_fakturyID] [int] NULL,
	[Nazwa_faktury] [nvarchar](100) NULL,
	[NIP] [nvarchar](10) NULL,
	[Data_wystawienia_faktury] [datetime] NULL,
	[Nazwa_wystawcy] [nvarchar](100) NULL,
	[Nazwa_odbiorcy] [nvarchar](100) NULL,
	[AdresID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[FakturaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gwarancja]    Script Date: 21.12.2021 14:01:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gwarancja](
	[GwarancjaID] [int] NOT NULL,
	[Okres_gwarancji] [nvarchar](25) NULL,
 CONSTRAINT [PK_Gwarancja] PRIMARY KEY CLUSTERED 
(
	[GwarancjaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kategorie]    Script Date: 21.12.2021 14:01:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategorie](
	[KategoriaID] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa_kategorii] [nvarchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[KategoriaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Klient]    Script Date: 21.12.2021 14:01:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klient](
	[KlientID] [int] IDENTITY(1,1) NOT NULL,
	[Imie] [nvarchar](25) NULL,
	[Nazwisko] [nvarchar](30) NULL,
	[Telefon] [nvarchar](18) NULL,
	[Data_urodzenia] [datetime] NULL,
	[AdresID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[KlientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kontrahenci]    Script Date: 21.12.2021 14:01:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kontrahenci](
	[KontrahenciID] [int] IDENTITY(1,1) NOT NULL,
	[KlientID] [int] NULL,
	[Nazwa] [nvarchar](50) NULL,
	[NIP] [nvarchar](10) NULL,
	[AdresID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[KontrahenciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Obuwie]    Script Date: 21.12.2021 14:01:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Obuwie](
	[ObuwieID] [int] IDENTITY(1,1) NOT NULL,
	[KategoriaID] [int] NULL,
	[Nazwa_obuwia] [nvarchar](100) NULL,
	[Rozmiar_obuwia] [nvarchar](100) NULL,
	[Kolor_obuwia] [nvarchar](100) NULL,
	[Ilosc_w_magazynie] [nvarchar](15) NULL,
	[cena] [money] NULL,
 CONSTRAINT [PK_Obuwie] PRIMARY KEY CLUSTERED 
(
	[ObuwieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Odziez]    Script Date: 21.12.2021 14:01:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Odziez](
	[OdziezID] [int] IDENTITY(1,1) NOT NULL,
	[KategoriaID] [int] NULL,
	[Nazwa_odziezy] [nvarchar](50) NULL,
	[Rozmiar_odziezy] [nvarchar](50) NULL,
	[Kolor_odziezy] [nvarchar](50) NULL,
	[Ilosc_w_magazynie] [nvarchar](50) NULL,
	[Cena] [money] NULL,
 CONSTRAINT [PK_Odziez] PRIMARY KEY CLUSTERED 
(
	[OdziezID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Opinia]    Script Date: 21.12.2021 14:01:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Opinia](
	[OpiniaID] [int] IDENTITY(1,1) NOT NULL,
	[Tresc_opinii] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[OpiniaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pracownicy]    Script Date: 21.12.2021 14:01:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pracownicy](
	[PracownikID] [int] IDENTITY(1,1) NOT NULL,
	[Imie] [nvarchar](25) NULL,
	[Nazwisko] [nvarchar](30) NULL,
	[Stanowisko] [nvarchar](20) NULL,
	[Telefon] [nvarchar](18) NULL,
	[Data_urodzenia] [datetime] NULL,
	[Pesel] [nvarchar](11) NULL,
	[Pensja] [decimal](18, 0) NULL,
	[AdresID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PracownikID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producenci]    Script Date: 21.12.2021 14:01:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producenci](
	[ProducentID] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa_producenta] [nvarchar](40) NULL,
	[Kontakt] [nvarchar](100) NULL,
	[AdresID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProducentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produkty]    Script Date: 21.12.2021 14:01:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produkty](
	[ProduktID] [int] IDENTITY(1,1) NOT NULL,
	[KategoriaID] [int] NULL,
	[DostawcaID] [int] NULL,
	[ProducentID] [int] NULL,
	[OpiniaID] [int] NULL,
	[GwarancjaID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProduktID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rabat]    Script Date: 21.12.2021 14:01:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rabat](
	[RabatID] [int] IDENTITY(1,1) NOT NULL,
	[Kod_rabatu] [nvarchar](15) NULL,
	[Ile_rabatu] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RabatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reklamacje]    Script Date: 21.12.2021 14:01:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reklamacje](
	[ReklamacjaID] [int] IDENTITY(1,1) NOT NULL,
	[ZamowienieID] [int] NULL,
	[Nazwa_reklamacji] [nvarchar](40) NULL,
	[Opis_reklamacji] [nvarchar](250) NULL,
	[Nazwa_produktu] [nvarchar](40) NULL,
	[Data_przjecia_reklamacji] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReklamacjaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rodzaj_faktury]    Script Date: 21.12.2021 14:01:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rodzaj_faktury](
	[Typ_fakturyID] [int] IDENTITY(1,1) NOT NULL,
	[Typ_faktury] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Typ_fakturyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sposoby_platnosci]    Script Date: 21.12.2021 14:01:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sposoby_platnosci](
	[Sposoby_platnosciID] [int] IDENTITY(1,1) NOT NULL,
	[Sposob_platnosci] [nvarchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[Sposoby_platnosciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sposoby_wysylki]    Script Date: 21.12.2021 14:01:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sposoby_wysylki](
	[Sposoby_wysylkiID] [int] IDENTITY(1,1) NOT NULL,
	[Sposob_wysylki] [nvarchar](40) NULL,
	[Cena_wysylki] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[Sposoby_wysylkiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stawka_vat]    Script Date: 21.12.2021 14:01:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stawka_vat](
	[Stawka_vat_ID] [int] IDENTITY(1,1) NOT NULL,
	[Stawka_vat] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Stawka_vat_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Szczegoly_zamowienia]    Script Date: 21.12.2021 14:01:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Szczegoly_zamowienia](
	[ZamowienieID] [int] NOT NULL,
	[ProduktID] [int] NOT NULL,
	[Cena_jednostkowa] [money] NULL,
	[Ilosc] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ZamowienieID] ASC,
	[ProduktID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zamowienia]    Script Date: 21.12.2021 14:01:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zamowienia](
	[ZamowienieID] [int] IDENTITY(1,1) NOT NULL,
	[PracownikID] [int] NULL,
	[KlientID] [int] NULL,
	[Data_wysylki_zamowienia] [datetime] NULL,
	[Sposoby_platnosciID] [int] NULL,
	[Sposoby_wysylkiID] [int] NULL,
	[FakturaID] [int] NULL,
	[RabatID] [int] NULL,
	[ReklamacjaID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ZamowienieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (1, N'2 Boyd Point', N'Czech Republic', N'Hošťka', N'348 06')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (2, N'0585 Dahle Drive', N'Tunisia', N'Menzel Jemil', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (3, N'29279 Briar Crest Way', N'China', N'Duma', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (4, N'53 Towne Drive', N'Portugal', N'Lages', N'4620-279')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (5, N'037 Texas Alley', N'Sweden', N'Smalandsstenar', N'333 24')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (6, N'462 Russell Point', N'Argentina', N'Famatina', N'4203')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (7, N'96418 Anniversary Trail', N'Armenia', N'Tsaghkadzor', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (8, N'42 Quincy Alley', N'Russia', N'Sarov', N'607189')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (9, N'0197 Scofield Plaza', N'Indonesia', N'Wakapuken', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (10, N'00108 Division Place', N'Portugal', N'Covas', N'4560-061')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (11, N'0 Algoma Lane', N'South Korea', N'Wonju', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (12, N'5 Manley Park', N'Togo', N'Tchamba', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (13, N'750 Stone Corner Alley', N'Philippines', N'Kalawit', N'7124')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (14, N'58341 Schmedeman Hill', N'Indonesia', N'Nangerang', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (15, N'63002 Sutherland Parkway', N'Micronesia', N'Elato', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (16, N'282 Garrison Hill', N'China', N'Jiudu', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (17, N'4 Anniversary Parkway', N'Philippines', N'Santa Cruz', N'5105')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (18, N'4284 Grover Road', N'Macedonia', N'Lisičani', N'6539')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (19, N'14 Sage Circle', N'China', N'Hedao', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (20, N'58 Oak Drive', N'France', N'Compiegne', N'60477 CEDEX')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (21, N'0 Arizona Trail', N'Philippines', N'Villa Aglipay', N'2020')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (22, N'2 Shasta Crossing', N'Iran', N'Torbat-e Jam', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (23, N'6227 Fairview Park', N'Russia', N'Lukhovka', N'450075')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (24, N'20 Waubesa Parkway', N'France', N'Domont', N'95445 CEDEX')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (25, N'3 Linden Pass', N'France', N'Issy-les-Moulineaux', N'92139 CEDEX')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (26, N'266 Kensington Pass', N'China', N'Hanchang', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (27, N'907 Calypso Pass', N'Mexico', N'San Jose', N'85227')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (28, N'56360 Corry Circle', N'Indonesia', N'Mojolampir', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (29, N'3 Annamark Hill', N'Mexico', N'Del Valle', N'88980')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (30, N'36 Little Fleur Crossing', N'France', N'Tours', N'37082 CEDEX 2')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (31, N'8 Darwin Road', N'Indonesia', N'Cipunglu', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (32, N'65 Holy Cross Crossing', N'Vietnam', N'Qu?ng Yen', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (33, N'0556 Charing Cross Place', N'Russia', N'Pavlovskaya', N'353147')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (34, N'8 Oneill Way', N'Thailand', N'Seka', N'43150')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (35, N'5330 Annamark Alley', N'Finland', N'Elimäki', N'47201')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (36, N'14 Esker Park', N'Germany', N'Hamburg Harvestehude', N'20249')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (37, N'997 Dottie Plaza', N'Brazil', N'Barroso', N'36212-000')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (38, N'4526 Monument Park', N'Peru', N'Coasa', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (39, N'94568 Burning Wood Park', N'Indonesia', N'Krajan Gebangan', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (40, N'2 Becker Street', N'China', N'Xujia', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (41, N'803 Bunting Way', N'Portugal', N'Marco de Canaveses', N'4630-087')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (42, N'9195 Knutson Hill', N'Indonesia', N'Banjar Sedang', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (43, N'2591 5th Road', N'Cameroon', N'Bafang', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (44, N'32912 Dahle Trail', N'Poland', N'Lubin', N'59-339')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (45, N'647 Sugar Court', N'Mongolia', N'Bayasgalant', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (46, N'0412 Hayes Point', N'Nigeria', N'Bokkos', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (47, N'25893 Nobel Road', N'China', N'Batuan', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (48, N'4 Mesta Plaza', N'Kazakhstan', N'Aral', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (49, N'87177 Anhalt Terrace', N'Indonesia', N'Mlawat', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (50, N'285 Cordelia Road', N'Nigeria', N'Kafarati', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (51, N'4596 Westridge Lane', N'France', N'Montceau-les-Mines', N'71309 CEDEX')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (52, N'50058 Onsgard Point', N'Philippines', N'Pangascasan', N'2504')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (53, N'0947 Orin Street', N'Indonesia', N'Wewit', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (54, N'96325 South Trail', N'Poland', N'Szelków', N'45-559')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (55, N'7 Cascade Parkway', N'Argentina', N'Macachín', N'5561')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (56, N'90973 Truax Plaza', N'China', N'Qitao', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (57, N'3 Burrows Drive', N'Mexico', N'Fernando Gutierrez Barrios', N'93420')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (58, N'6 Dwight Center', N'China', N'Gaohe', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (59, N'817 Esker Hill', N'Jordan', N'Aydun', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (60, N'34446 Victoria Circle', N'Russia', N'Nerchinsk', N'673416')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (61, N'972 Oak Valley Junction', N'Canada', N'Barrie', N'L9J')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (62, N'995 Jackson Lane', N'Serbia', N'Pavliš', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (63, N'4 Messerschmidt Way', N'Iran', N'Qal‘eh Ganj', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (64, N'891 Gateway Pass', N'Nigeria', N'Samamiya', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (65, N'47159 Ilene Alley', N'China', N'Yangchao', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (66, N'462 Arizona Center', N'Thailand', N'Nong Chik', N'94170')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (67, N'7 Springview Lane', N'France', N'Paris 15', N'75712 CEDEX 15')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (68, N'95 Hauk Center', N'Peru', N'Cerro de Pasco', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (69, N'06 Northland Lane', N'Indonesia', N'Noemuti', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (70, N'798 Meadow Ridge Avenue', N'Indonesia', N'Winduraja', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (71, N'1 Springview Center', N'Cuba', N'Nueva Gerona', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (72, N'9 Elgar Avenue', N'Poland', N'Kłoczew', N'08-550')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (73, N'0 Surrey Park', N'China', N'Pukou', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (74, N'7 Rigney Parkway', N'Peru', N'Cabanilla', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (75, N'81724 Di Loreto Place', N'Japan', N'Tahara', N'879-7305')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (76, N'328 Hollow Ridge Street', N'Brazil', N'Orós', N'63520-000')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (77, N'6977 Warbler Lane', N'Iceland', N'Borgarnes', N'311')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (78, N'1044 Dunning Street', N'China', N'Zhengji', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (79, N'4 Hansons Park', N'Philippines', N'Daguma', N'1009')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (80, N'72 Veith Trail', N'Brazil', N'Murici', N'57820-000')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (81, N'524 Bayside Park', N'Greece', N'Néa Ionía', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (82, N'58 6th Terrace', N'Ireland', N'Cherryville', N'P31')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (83, N'77286 Emmet Crossing', N'France', N'Longjumeau', N'91821 CEDEX')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (84, N'2931 Spenser Alley', N'Japan', N'Oarai', N'311-1500')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (85, N'763 Miller Way', N'Morocco', N'Zinat', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (86, N'226 Oxford Crossing', N'Colombia', N'Carmen de Viboral', N'054457')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (87, N'83 Starling Road', N'Tokelau', N'Atafu Village', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (88, N'0634 Portage Center', N'Ivory Coast', N'Tengrela', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (89, N'4505 Tomscot Court', N'Pakistan', N'Basirpur', N'45750')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (90, N'4705 John Wall Center', N'Bosnia and Herzegovina', N'Gornje Živinice', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (91, N'3728 Schurz Avenue', N'Cyprus', N'Rizokárpaso', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (92, N'1718 Brickson Park Point', N'China', N'Datang', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (93, N'76 Waywood Pass', N'Palestinian Territory', N'Al Midyah', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (94, N'1 Brentwood Circle', N'Thailand', N'Phak Hai', N'31000')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (95, N'44434 Norway Maple Hill', N'Tunisia', N'Tozeur', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (96, N'247 Lakewood Gardens Street', N'Indonesia', N'Long Beluah', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (97, N'8447 Ridgeway Crossing', N'Russia', N'Novomoskovsk', N'301767')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (98, N'3 Esker Parkway', N'Portugal', N'Couto', N'4750-417')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (99, N'4281 Ridge Oak Plaza', N'France', N'Castelsarrasin', N'82104 CEDEX')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (100, N'6 Portage Park', N'Uganda', N'Kapchorwa', NULL)
GO
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (101, N'8 Gulseth Way', N'Slovenia', N'Preserje pri Radomljah', N'1241')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (102, N'59651 Florence Trail', N'China', N'Qiaozhen', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (103, N'5737 Superior Place', N'Ukraine', N'Nyzhni Sirohozy', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (104, N'55344 Fuller Junction', N'Indonesia', N'Nggambel', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (105, N'38 Elmside Park', N'Georgia', N'Zhinvali', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (106, N'30187 Summerview Crossing', N'Russia', N'Svobody', N'357560')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (107, N'213 Lakewood Gardens Place', N'China', N'Baishan', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (108, N'74371 Vidon Junction', N'Poland', N'Piekoszów', N'26-065')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (109, N'71160 Schlimgen Parkway', N'Russia', N'Kosh-Agach', N'649780')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (110, N'4 Stoughton Trail', N'France', N'Aime', N'73216 CEDEX')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (111, N'2 Namekagon Alley', N'Germany', N'Freiburg im Breisgau', N'79114')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (112, N'5 Tomscot Road', N'Uruguay', N'Porvenir', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (113, N'80 Arizona Center', N'Portugal', N'A-da-Gorda', N'2510-015')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (114, N'9282 Huxley Crossing', N'China', N'Shimen', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (115, N'1177 Dapin Lane', N'Indonesia', N'Kombandaru', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (116, N'62 Linden Point', N'Canada', N'Kelowna', N'V1Y')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (117, N'22118 Anthes Street', N'China', N'Shazi', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (118, N'2 Hauk Park', N'Sweden', N'Arboga', N'732 46')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (119, N'091 Dwight Crossing', N'China', N'Jiangjiazui', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (120, N'96653 Delladonna Junction', N'Czech Republic', N'Lipník nad Bečvou', N'757 01')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (121, N'282 Corry Lane', N'Vietnam', N'Quy Đa?t', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (122, N'66814 Golf Course Parkway', N'Peru', N'Hongos', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (123, N'207 Muir Drive', N'Mongolia', N'Badrah', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (124, N'83 Buell Park', N'Georgia', N'Dmanisi', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (125, N'67 Scofield Alley', N'Uruguay', N'Quebracho', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (126, N'94 Elka Crossing', N'China', N'Shangbahe', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (127, N'2 Garrison Center', N'Sweden', N'Vargön', N'468 82')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (128, N'41 Bluejay Pass', N'China', N'Suchen', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (129, N'12 1st Court', N'Peru', N'Licupis', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (130, N'18961 Maple Wood Parkway', N'China', N'Yun’an', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (131, N'00256 Dapin Trail', N'Nigeria', N'Lame', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (132, N'29930 Barnett Trail', N'Norway', N'Gjovik', N'2821')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (133, N'27 Hazelcrest Street', N'Russia', N'Krasnyy Yar', N'646176')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (134, N'55825 Sundown Crossing', N'Sweden', N'Sundbyberg', N'172 79')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (135, N'1 Fair Oaks Lane', N'Colombia', N'Buenos Aires', N'191017')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (136, N'88 Oxford Park', N'Sweden', N'Simrishamn', N'272 24')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (137, N'67 Clove Drive', N'Indonesia', N'Ngroto', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (138, N'56844 Village Green Plaza', N'Philippines', N'Tagoloan', N'9222')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (139, N'95096 Nevada Lane', N'Indonesia', N'Caringin Lor', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (140, N'4311 Lakewood Gardens Park', N'Namibia', N'Tsumeb', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (141, N'5197 Sundown Plaza', N'United States', N'Corpus Christi', N'78410')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (142, N'6242 Riverside Alley', N'China', N'Xegar', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (143, N'17078 Haas Lane', N'China', N'Beitou', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (144, N'32 Beilfuss Junction', N'China', N'Jiuxian', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (145, N'86161 Sutteridge Place', N'Poland', N'Białobrzegi', N'37-114')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (146, N'41 Schiller Hill', N'Germany', N'Berlin', N'13509')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (147, N'3 Hoepker Way', N'China', N'Shiyaogou', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (148, N'3 Coleman Avenue', N'Ukraine', N'Kobleve', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (149, N'3487 Petterle Center', N'Macedonia', N'Bogovinje', N'1220')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (150, N'802 Bluejay Pass', N'Kyrgyzstan', N'Cholpon-Ata', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (151, N'25024 Morningstar Parkway', N'Ukraine', N'Subottsi', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (152, N'5 Del Mar Crossing', N'Uganda', N'Kaabong', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (153, N'29633 Cordelia Place', N'Sweden', N'Bohus', N'445 33')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (154, N'71 Nova Court', N'Russia', N'Atlasovo', N'901095')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (155, N'03 4th Pass', N'France', N'Épinal', N'88009 CEDEX')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (156, N'8971 Eastlawn Park', N'Macedonia', N'Jankovec', N'7320')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (157, N'818 Carberry Avenue', N'China', N'Daminggong', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (158, N'42 Dottie Drive', N'Philippines', N'Guagua', N'2003')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (159, N'8 Everett Point', N'Zimbabwe', N'Kwekwe', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (160, N'24 Ohio Point', N'Sweden', N'Gävle', N'802 80')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (161, N'5 Lake View Junction', N'United States', N'Marietta', N'30061')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (162, N'7825 Everett Pass', N'Tunisia', N'Zouila', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (163, N'865 North Street', N'China', N'Xinan', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (164, N'896 Pankratz Hill', N'China', N'Dalianhe', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (165, N'2189 North Center', N'Argentina', N'Florentino Ameghino', N'9113')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (166, N'9874 Merrick Lane', N'Canada', N'Alma', N'N6J')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (167, N'33 Blackbird Road', N'Palestinian Territory', N'Majdal Bani Fa?il', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (168, N'73667 Marcy Crossing', N'China', N'Dengfang', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (169, N'983 Almo Trail', N'Armenia', N'Spandaryan', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (170, N'14309 Manufacturers Alley', N'China', N'Huanghua', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (171, N'72625 Ridge Oak Parkway', N'Russia', N'Mosal’sk', N'249930')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (172, N'0699 Little Fleur Place', N'China', N'Liufang', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (173, N'430 Lakewood Terrace', N'Russia', N'Borovichi', N'174420')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (174, N'4 Sunbrook Alley', N'Indonesia', N'Panimbang', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (175, N'69 Scott Terrace', N'Brazil', N'Araxá', N'38180-000')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (176, N'47 Knutson Pass', N'Peru', N'Antabamba', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (177, N'58528 Tony Avenue', N'Indonesia', N'Jeruk', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (178, N'13 Del Mar Street', N'Poland', N'Puszczykowo', N'62-040')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (179, N'5 Merrick Lane', N'China', N'Shangchewan', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (180, N'4 Marcy Lane', N'China', N'Laohekou', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (181, N'48499 Spohn Drive', N'Vietnam', N'Di An', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (182, N'84 Darwin Lane', N'Indonesia', N'Daja', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (183, N'9962 Ilene Hill', N'Finland', N'Uurainen', N'41231')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (184, N'9 Eastlawn Court', N'United States', N'Little Rock', N'72215')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (185, N'484 Thackeray Point', N'Indonesia', N'Panghadangan', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (186, N'014 Service Alley', N'Indonesia', N'Tepal', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (187, N'25 Coleman Trail', N'Canada', N'Hantsport', N'N5A')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (188, N'21 Gina Court', N'Poland', N'Lubochnia', N'97-217')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (189, N'40 Weeping Birch Trail', N'Indonesia', N'Aegela', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (190, N'8331 Milwaukee Hill', N'Greece', N'Kérkyra', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (191, N'20 Heffernan Park', N'Argentina', N'Arroyito', N'2434')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (192, N'11192 David Parkway', N'Luxembourg', N'Clervaux', N'L-9765')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (193, N'95249 American Park', N'Portugal', N'Passos', N'4990-770')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (194, N'420 Moulton Lane', N'Kazakhstan', N'Zhanaozen', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (195, N'199 Butterfield Point', N'Venezuela', N'Capatárida', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (196, N'5 Vidon Parkway', N'China', N'Songbai', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (197, N'76 Cambridge Pass', N'Suriname', N'Nieuw Nickerie', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (198, N'48769 Sheridan Avenue', N'Indonesia', N'Cipari', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (199, N'451 Trailsway Place', N'Czech Republic', N'Velké Pavlovice', N'691 06')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (200, N'821 Corry Park', N'Russia', N'Brusyanka', N'403567')
GO
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (201, N'72294 Hollow Ridge Avenue', N'Bulgaria', N'Chernomorets', N'8151')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (202, N'3 Quincy Plaza', N'Uganda', N'Nakasongola', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (203, N'4 Sutherland Terrace', N'Bosnia and Herzegovina', N'Pajić Polje', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (204, N'197 Sachs Trail', N'Portugal', N'Telheira', N'4650-669')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (205, N'82331 1st Junction', N'Malaysia', N'Kuala Lumpur', N'55928')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (206, N'84309 Daystar Park', N'China', N'Huilong', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (207, N'1 Loeprich Street', N'Indonesia', N'Tiyingtali Kelod', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (208, N'31400 Schlimgen Avenue', N'China', N'Yayao', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (209, N'11064 Holmberg Lane', N'Brazil', N'Barreiro do Jaíba', N'29785-000')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (210, N'7772 Jenifer Junction', N'Denmark', N'Kobenhavn', N'1349')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (211, N'40 Maple Wood Avenue', N'China', N'Xiamazhuang', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (212, N'31 Loomis Road', N'China', N'Zhantang', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (213, N'1 Emmet Street', N'Germany', N'Essen', N'45356')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (214, N'75140 Nancy Lane', N'France', N'Paris 17', N'75817 CEDEX 17')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (215, N'506 Novick Court', N'Argentina', N'Ezeiza', N'1804')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (216, N'9 American Park', N'China', N'Loufan', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (217, N'0 Macpherson Avenue', N'Paraguay', N'Nueva Germania', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (218, N'34 Arkansas Center', N'Portugal', N'Sande Sao Lourenço', N'4805-583')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (219, N'4062 West Crossing', N'Germany', N'Gelsenkirchen', N'45886')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (220, N'1 Sloan Plaza', N'Czech Republic', N'Hradec Králové', N'500 02')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (221, N'07402 Karstens Way', N'Russia', N'Rebrikha', N'658540')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (222, N'25 Dakota Hill', N'Indonesia', N'Kaduseeng', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (223, N'753 La Follette Point', N'Morocco', N'Guisser', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (224, N'392 Acker Park', N'Albania', N'Otllak', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (225, N'351 Sunfield Park', N'Mexico', N'Los Mangos', N'93228')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (226, N'6 Maywood Road', N'China', N'Xi’an', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (227, N'11082 Main Parkway', N'China', N'Lingzhi', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (228, N'5 Darwin Circle', N'China', N'Wenquan', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (229, N'66447 Mccormick Alley', N'Indonesia', N'Lobuk', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (230, N'32804 Welch Point', N'Indonesia', N'Solok', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (231, N'75888 Old Shore Crossing', N'China', N'Luzhang', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (232, N'67 Gateway Hill', N'Tajikistan', N'Norak', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (233, N'031 Logan Place', N'Indonesia', N'Gandoang', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (234, N'0223 High Crossing Center', N'Indonesia', N'Lewolen', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (235, N'069 Green Court', N'China', N'Hangji', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (236, N'4 Trailsway Parkway', N'Mali', N'Youwarou', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (237, N'2 Surrey Road', N'Indonesia', N'Bilalang', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (238, N'664 Rutledge Place', N'Cameroon', N'Somié', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (239, N'44363 Fieldstone Trail', N'Russia', N'Vostochnyy', N'143969')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (240, N'02 Del Sol Park', N'Japan', N'Yaita', N'329-2165')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (241, N'39 Kensington Alley', N'China', N'Siquanpu', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (242, N'15793 Monument Alley', N'Belarus', N'Lyozna', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (243, N'87 Kennedy Street', N'Burundi', N'Bujumbura', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (244, N'89 Longview Street', N'Peru', N'Andarapa', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (245, N'9653 Quincy Parkway', N'Botswana', N'Sebina', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (246, N'8 John Wall Circle', N'Thailand', N'Ban Na Muang', N'71150')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (247, N'8812 Buena Vista Point', N'Mayotte', N'Dzaoudzi', N'97615')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (248, N'9071 Upham Drive', N'China', N'Junshan', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (249, N'1 Straubel Circle', N'Peru', N'Barranca', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (250, N'8271 Mcguire Park', N'China', N'Tomorlog', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (251, N'52 Towne Center', N'Philippines', N'Lilio', N'4004')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (252, N'20090 Sugar Alley', N'Greece', N'Lianokládhion', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (253, N'0788 Toban Avenue', N'Indonesia', N'Palon', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (254, N'375 Burning Wood Plaza', N'Indonesia', N'Purbalingga', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (255, N'8962 Old Gate Parkway', N'Poland', N'Biecz', N'38-340')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (256, N'13 Annamark Junction', N'Denmark', N'Kobenhavn', N'1718')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (257, N'291 Logan Trail', N'Ethiopia', N'Mojo', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (258, N'13 Schurz Trail', N'China', N'Chengyue', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (259, N'838 Lakewood Road', N'Thailand', N'Bua Yai', N'30120')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (260, N'47562 Eagle Crest Terrace', N'Philippines', N'Gubat', N'4710')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (261, N'93442 Johnson Court', N'Libya', N'Bani Walid', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (262, N'89851 Commercial Road', N'Cuba', N'Encrucijada', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (263, N'6 Grayhawk Way', N'Colombia', N'Puerto Narino', N'911018')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (264, N'90 Garrison Trail', N'Brazil', N'Itororó', N'45710-000')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (265, N'403 Clarendon Point', N'France', N'Granville', N'50404 CEDEX')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (266, N'36090 Bluestem Center', N'Norway', N'Oslo', N'0211')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (267, N'98264 Morningstar Circle', N'Belarus', N'Tsyelyakhany', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (268, N'0045 Northwestern Pass', N'France', N'Bourges', N'18025 CEDEX')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (269, N'3 Sauthoff Pass', N'Chile', N'Osorno', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (270, N'9 Buena Vista Lane', N'Philippines', N'Tupsan', N'9101')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (271, N'3 Mariners Cove Court', N'Nigeria', N'Mberubu', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (272, N'57386 Goodland Crossing', N'Nigeria', N'Umuahia', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (273, N'1 Hintze Terrace', N'Japan', N'Sendai', N'939-1351')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (274, N'48140 Kenwood Crossing', N'Ukraine', N'Chynadiyovo', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (275, N'10 Loftsgordon Place', N'Indonesia', N'Kotauneng', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (276, N'67 Fair Oaks Point', N'Nigeria', N'Malummaduri', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (277, N'552 Almo Alley', N'Uganda', N'Bugembe', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (278, N'40 Quincy Court', N'Madagascar', N'Antsohihy', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (279, N'0 Arkansas Lane', N'China', N'Yangzi', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (280, N'37800 Mccormick Terrace', N'Philippines', N'Kauran', N'1106')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (281, N'4 Old Gate Crossing', N'Russia', N'Beloyarskiy', N'624030')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (282, N'629 Boyd Place', N'Brazil', N'Sao Fidélis', N'28400-000')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (283, N'975 8th Park', N'China', N'Xinfa', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (284, N'10 Sunbrook Crossing', N'France', N'Paris La Défense', N'92056 CEDEX')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (285, N'1 Bultman Point', N'China', N'Antou', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (286, N'90 8th Avenue', N'Russia', N'Salmi', N'186822')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (287, N'4 Golden Leaf Pass', N'Philippines', N'Bucay', N'2805')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (288, N'0491 Cascade Road', N'Philippines', N'Navotas', N'1485')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (289, N'394 Forster Trail', N'Philippines', N'Pinoma', N'3404')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (290, N'79340 Spaight Avenue', N'Zimbabwe', N'Lalapanzi', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (291, N'84866 Algoma Lane', N'Poland', N'Rzozów', N'32-060')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (292, N'9548 Crownhardt Point', N'Uruguay', N'Mercedes', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (293, N'8 Kennedy Junction', N'Ireland', N'Fairview', N'D17')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (294, N'618 Pleasure Circle', N'Armenia', N'Alaverdi', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (295, N'90 Prairieview Terrace', N'Syria', N'Ar Ru?aybah', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (296, N'41697 Cordelia Alley', N'Sri Lanka', N'Unawatuna', N'80600')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (297, N'328 Charing Cross Hill', N'Ireland', N'Charlesland', N'A63')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (298, N'1 Artisan Hill', N'Cuba', N'Jovellanos', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (299, N'60451 Cottonwood Avenue', N'China', N'Huangtu', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (300, N'9013 Cottonwood Center', N'Mexico', N'Fovissste', N'33980')
GO
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (301, N'09494 Maple Place', N'Indonesia', N'Bukitkemuning', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (302, N'1742 La Follette Way', N'Uganda', N'Kanoni', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (303, N'9766 Sachtjen Park', N'Malaysia', N'Kota Bharu', N'15670')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (304, N'3613 Clove Park', N'Russia', N'Krasnofarfornyy', N'174214')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (305, N'32 Ludington Hill', N'Greece', N'Erétria', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (306, N'62 Monument Street', N'Armenia', N'Fantan', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (307, N'0 Mccormick Way', N'Sweden', N'Stockholm', N'113 39')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (308, N'9052 Shelley Trail', N'Poland', N'Pilchowice', N'44-145')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (309, N'132 Grasskamp Point', N'Poland', N'Uścimów Stary', N'21-109')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (310, N'2 Amoth Terrace', N'Ukraine', N'Novovasylivka', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (311, N'730 Moland Street', N'Philippines', N'Daraitan', N'1105')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (312, N'37 Onsgard Drive', N'France', N'Boulogne-Billancourt', N'92511 CEDEX')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (313, N'76 Ilene Lane', N'Honduras', N'El Puente', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (314, N'00 Lakewood Alley', N'Portugal', N'Pereira', N'4755-402')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (315, N'65673 Westridge Trail', N'United States', N'Cincinnati', N'45249')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (316, N'5439 Delaware Avenue', N'Indonesia', N'Tanakawu Dua', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (317, N'05 Maywood Circle', N'Sweden', N'Strängnäs', N'645 84')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (318, N'46005 Coolidge Place', N'Brazil', N'Macapá', N'68900-000')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (319, N'10625 Donald Crossing', N'United States', N'Phoenix', N'85099')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (320, N'03 Mendota Road', N'China', N'Julun', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (321, N'9401 Artisan Drive', N'Indonesia', N'Gedongmulyo', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (322, N'4 Garrison Lane', N'Japan', N'Nihommatsu', N'969-1513')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (323, N'241 Delaware Junction', N'China', N'Caoping', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (324, N'68316 Reinke Circle', N'Ukraine', N'Arbuzynka', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (325, N'96 Holy Cross Plaza', N'Russia', N'Konstantinovskoye', N'356500')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (326, N'481 Village Green Street', N'Poland', N'Sośnicowice', N'44-153')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (327, N'41539 Roxbury Center', N'Kazakhstan', N'Sorang', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (328, N'1284 Londonderry Place', N'Sri Lanka', N'Vavuniya', N'43000')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (329, N'74 Maple Lane', N'China', N'Jingdu', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (330, N'511 Merchant Crossing', N'Brazil', N'Satuba', N'57120-000')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (331, N'13136 Sherman Trail', N'China', N'Zhongbao', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (332, N'74041 Waywood Park', N'Russia', N'Budagovo', N'665236')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (333, N'1682 Washington Road', N'Indonesia', N'Cikadu', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (334, N'328 Melody Court', N'China', N'Chengxiang', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (335, N'5 Anhalt Alley', N'United States', N'Montgomery', N'36177')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (336, N'56 Anthes Plaza', N'Djibouti', N'Tadjoura', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (337, N'493 Heath Street', N'United States', N'Washington', N'20520')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (338, N'90 Macpherson Parkway', N'Somalia', N'Mahaddayweyne', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (339, N'8025 Independence Junction', N'Indonesia', N'Sinargalih', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (340, N'4949 Fremont Crossing', N'Thailand', N'Mae Wang', N'50360')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (341, N'6008 Logan Plaza', N'Poland', N'Wysoka', N'89-320')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (342, N'1 Melby Alley', N'China', N'Pozhang', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (343, N'8343 Quincy Lane', N'China', N'Emalgolin Mongolzuxiang', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (344, N'41761 Badeau Pass', N'China', N'Zongluzui', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (345, N'2 Redwing Circle', N'Indonesia', N'Muaraenim', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (346, N'142 Clove Junction', N'China', N'Chencai', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (347, N'682 Clarendon Pass', N'Philippines', N'Gumaus', N'4606')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (348, N'72038 Golden Leaf Alley', N'Japan', N'Ishii', N'969-5316')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (349, N'78 Twin Pines Lane', N'Indonesia', N'Cemplang', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (350, N'2 Lukken Lane', N'Czech Republic', N'Nýdek', N'739 95')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (351, N'9 Moland Street', N'Indonesia', N'Bangkal', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (352, N'6798 Swallow Junction', N'United States', N'Wilmington', N'19805')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (353, N'6879 Bultman Place', N'Russia', N'Rognedino', N'242774')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (354, N'61 Derek Way', N'Indonesia', N'Kubang', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (355, N'31 Lukken Avenue', N'China', N'Xiashitai', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (356, N'79 Monument Point', N'Greece', N'Évlalo', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (357, N'5 Drewry Junction', N'Peru', N'Las Yaras', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (358, N'9981 Kipling Alley', N'Brazil', N'Águas Vermelhas', N'39990-000')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (359, N'92084 Nancy Plaza', N'Venezuela', N'Santa Ana', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (360, N'1495 Crescent Oaks Avenue', N'Finland', N'Siikajoki', N'92320')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (361, N'436 Northview Terrace', N'Slovenia', N'Vnanje Gorice', N'1358')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (362, N'751 Hayes Court', N'Nepal', N'Baglung', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (363, N'79904 Vera Crossing', N'Mongolia', N'Horgo', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (364, N'306 School Avenue', N'Chad', N'Bitkine', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (365, N'944 Mariners Cove Center', N'Pakistan', N'Daulatpur', N'67190')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (366, N'526 Becker Trail', N'Uruguay', N'Nueva Helvecia', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (367, N'2016 Brown Point', N'South Korea', N'Muan', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (368, N'16 Upham Avenue', N'Czech Republic', N'Železná Ruda', N'340 04')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (369, N'94059 Marquette Drive', N'Portugal', N'Vila Nova de Milfontes', N'7645-215')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (370, N'78201 Mockingbird Alley', N'Colombia', N'El Tambo', N'522068')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (371, N'47086 Lunder Place', N'Philippines', N'Ramon Magsaysay', N'7024')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (372, N'64646 Bobwhite Park', N'Portugal', N'Vinhas', N'4575-062')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (373, N'70 Carberry Avenue', N'Peru', N'Jeberos', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (374, N'69278 Oneill Junction', N'Ireland', N'Enniskerry', N'D18')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (375, N'62418 Division Trail', N'China', N'Wenquan', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (376, N'11 Wayridge Circle', N'Russia', N'Mikhaylov', N'391710')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (377, N'40811 Anthes Crossing', N'China', N'Haliut', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (378, N'1 Granby Avenue', N'United States', N'Greensboro', N'27499')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (379, N'96 3rd Avenue', N'Ecuador', N'Puerto Francisco de Orellana', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (380, N'09540 Stoughton Trail', N'Russia', N'Ostrov', N'181353')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (381, N'61911 Everett Crossing', N'Indonesia', N'Lenakapa', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (382, N'0332 Kim Trail', N'Portugal', N'Varge Mondar', N'2635-483')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (383, N'43159 New Castle Avenue', N'Macedonia', N'??????', N'1047')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (384, N'2 Acker Park', N'France', N'Lyon', N'69212 CEDEX 03')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (385, N'411 Columbus Lane', N'Russia', N'Badar', N'665212')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (386, N'7 Laurel Junction', N'Czech Republic', N'Smiřice', N'503 03')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (387, N'3 Cordelia Hill', N'Canada', N'Biggar', N'N1S')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (388, N'8 Melrose Point', N'China', N'Renhe', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (389, N'905 Hoard Way', N'Philippines', N'San Narciso', N'4313')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (390, N'2854 Melrose Place', N'China', N'Baishan', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (391, N'57 Hoepker Hill', N'France', N'Paris 09', N'75439 CEDEX 09')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (392, N'17 Fallview Trail', N'Palestinian Territory', N'Ţubas', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (393, N'70 Sunbrook Trail', N'Armenia', N'Shenavan', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (394, N'83616 Transport Point', N'Brazil', N'Entre Rios', N'89862-000')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (395, N'4 Stoughton Alley', N'Philippines', N'Kipit', N'1101')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (396, N'13 Lunder Junction', N'Indonesia', N'Genang', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (397, N'50 Lien Crossing', N'Thailand', N'Ban Talat Nua', N'83120')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (398, N'45 Daystar Street', N'North Korea', N'Sinmak', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (399, N'698 Hoard Circle', N'Japan', N'Kitahiroshima', N'349-1111')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (400, N'68 Toban Hill', N'China', N'Maji', NULL)
GO
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (401, N'59938 Charing Cross Lane', N'France', N'Rennes', N'35059 CEDEX')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (402, N'43 Del Sol Alley', N'Brazil', N'Sao José dos Campos', N'12200-000')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (403, N'7 Linden Terrace', N'Indonesia', N'Ciawitali', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (404, N'83016 Oak Plaza', N'Peru', N'Turpay', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (405, N'1418 Valley Edge Hill', N'China', N'Chengjiao Chengguanzhen', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (406, N'5 Ilene Circle', N'Russia', N'Bezenchuk', N'446254')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (407, N'8382 Killdeer Place', N'Philippines', N'Cagayan', N'7508')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (408, N'96 Boyd Hill', N'Thailand', N'Na Chaluai', N'34280')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (409, N'21369 8th Terrace', N'China', N'Fanrong', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (410, N'78 Mariners Cove Lane', N'France', N'Meylan', N'38944 CEDEX')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (411, N'64610 David Drive', N'Brazil', N'Telemaco Borba', N'84260-000')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (412, N'07986 Talisman Trail', N'France', N'Tarbes', N'65022 CEDEX 9')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (413, N'7 Morning Junction', N'Kosovo', N'Orahovac', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (414, N'1 South Parkway', N'China', N'Naran Bulag', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (415, N'0 Hauk Avenue', N'China', N'Guanyao', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (416, N'1 East Road', N'Russia', N'Murmashi', N'184358')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (417, N'8930 Esch Circle', N'United States', N'Macon', N'31205')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (418, N'509 Clove Terrace', N'Portugal', N'Quinta', N'4600-652')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (419, N'902 Fallview Terrace', N'Indonesia', N'Sumberrejo', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (420, N'09515 Oneill Plaza', N'Armenia', N'Kasakh', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (421, N'7 Nevada Plaza', N'Ukraine', N'Krolevets’', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (422, N'3 Delladonna Hill', N'Portugal', N'Reinaldes', N'2525-675')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (423, N'42 Johnson Junction', N'Portugal', N'Quinta', N'4980-559')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (424, N'94305 Judy Trail', N'Italy', N'Trieste', N'34129')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (425, N'12 Forest Run Terrace', N'Russia', N'Udachny', N'678188')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (426, N'51752 Manufacturers Center', N'Russia', N'Tungor', N'694471')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (427, N'66587 Springview Point', N'Philippines', N'Polo', N'1444')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (428, N'323 Bunker Hill Way', N'Azerbaijan', N'Pushkino', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (429, N'776 Elgar Terrace', N'Ireland', N'Bearna', N'F93')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (430, N'169 Oriole Center', N'Peru', N'Santa Rosa', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (431, N'48686 Oakridge Road', N'Pakistan', N'Muzaffargarh', N'34201')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (432, N'0 Huxley Lane', N'Afghanistan', N'Tsaperai', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (433, N'75 Morrow Parkway', N'Morocco', N'Bouabout', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (434, N'46932 Dayton Way', N'China', N'Chuangwang', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (435, N'750 Eastlawn Alley', N'Denmark', N'Kobenhavn', N'1738')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (436, N'79731 Graedel Crossing', N'Poland', N'Jeżów', N'95-047')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (437, N'6 Sutteridge Hill', N'Indonesia', N'Darungan', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (438, N'5290 Rigney Center', N'Poland', N'Łętownia', N'37-312')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (439, N'9611 Sutteridge Circle', N'Czech Republic', N'Boršice', N'687 10')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (440, N'554 Reindahl Junction', N'Canada', N'Camrose', N'T4V')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (441, N'1184 Jenna Place', N'Poland', N'Mrągowo', N'11-709')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (442, N'840 Leroy Way', N'China', N'Shicha', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (443, N'04717 Logan Point', N'Sweden', N'Stockholm', N'105 52')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (444, N'85 Redwing Junction', N'Russia', N'Krasnogorodskoye', N'182370')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (445, N'0201 Bowman Way', N'China', N'Taoyuan', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (446, N'358 Troy Alley', N'Indonesia', N'Pengulu', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (447, N'9071 Melrose Parkway', N'Portugal', N'Prado', N'4625-361')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (448, N'44 Fieldstone Junction', N'China', N'Yuncheng', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (449, N'15679 Summer Ridge Circle', N'Brazil', N'Manaquiri', N'69435-000')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (450, N'3364 Hermina Circle', N'Uzbekistan', N'Zafar', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (451, N'53 Schlimgen Place', N'Philippines', N'Bayombong', N'3700')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (452, N'64061 Vahlen Way', N'Bangladesh', N'Kalia', N'7521')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (453, N'16 Westport Street', N'Brazil', N'Orleans', N'88870-000')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (454, N'4 Bluejay Road', N'Colombia', N'Patía', N'195509')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (455, N'0739 Hooker Alley', N'Portugal', N'Quintao', N'4745-328')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (456, N'4 Coolidge Point', N'Malaysia', N'Kota Kinabalu', N'88788')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (457, N'706 Linden Crossing', N'China', N'Mamu', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (458, N'408 Colorado Alley', N'China', N'Xiahong', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (459, N'47626 Clove Drive', N'China', N'Maoping', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (460, N'06 Ridgeway Crossing', N'Turkmenistan', N'Köneürgench', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (461, N'46654 Ludington Parkway', N'Malaysia', N'Kuala Lumpur', N'55100')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (462, N'4 Lindbergh Center', N'Poland', N'Śniadowo', N'18-411')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (463, N'1 Hermina Point', N'France', N'Poissy', N'78304 CEDEX')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (464, N'28294 Quincy Lane', N'China', N'Sanhe', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (465, N'58914 Stoughton Lane', N'France', N'Chenôve', N'21304 CEDEX')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (466, N'01831 Jay Pass', N'Colombia', N'San Jacinto', N'132037')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (467, N'2821 Pawling Park', N'Brazil', N'Cajamar', N'07750-000')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (468, N'15 Westport Point', N'Philippines', N'Kauswagan', N'9202')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (469, N'83711 Evergreen Drive', N'Czech Republic', N'Dobřív', N'338 44')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (470, N'5 Brentwood Point', N'Kazakhstan', N'Lugovoy', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (471, N'383 Mayfield Parkway', N'Philippines', N'Magatos', N'8113')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (472, N'2450 Northland Center', N'Russia', N'Zheleznodorozhnyy', N'238411')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (473, N'209 Killdeer Road', N'Peru', N'Pacucha', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (474, N'73060 Prairie Rose Park', N'Montserrat', N'Brades', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (475, N'882 Sugar Park', N'Argentina', N'Veinticinco de Mayo', N'8201')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (476, N'5 Sugar Park', N'Brazil', N'Palmital', N'19970-000')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (477, N'36477 Grim Trail', N'Mexico', N'Lazaro Cardenas', N'92933')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (478, N'57 Ruskin Court', N'Bulgaria', N'Bratsigovo', N'4585')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (479, N'76 Becker Place', N'Sweden', N'Bagarmossen', N'128 48')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (480, N'923 Steensland Junction', N'Poland', N'Promna', N'26-803')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (481, N'73266 Melby Pass', N'Peru', N'Miraflores', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (482, N'519 Hanover Trail', N'Aland Islands', N'Lemland', N'22610')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (483, N'21 Burrows Junction', N'China', N'Xiaochi', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (484, N'68 Muir Trail', N'South Africa', N'Brandfort', N'9400')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (485, N'804 School Point', N'Cuba', N'Cauto Cristo', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (486, N'668 Forest Dale Court', N'Russia', N'Orlovskiy', N'687520')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (487, N'60786 Dennis Drive', N'Russia', N'Likino-Dulevo', N'142672')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (488, N'53 Hollow Ridge Road', N'Finland', N'Sulkava', N'58701')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (489, N'6 Village Green Street', N'Vietnam', N'B?n Tre', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (490, N'82 Vermont Drive', N'Ukraine', N'Myhiya', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (491, N'167 Lillian Circle', N'China', N'Yuguan', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (492, N'6 Lerdahl Parkway', N'Indonesia', N'Cihaladan', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (493, N'4983 Kedzie Trail', N'Serbia', N'Čajetina', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (494, N'263 Macpherson Crossing', N'Philippines', N'Alangalang', N'6517')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (495, N'78213 Buhler Crossing', N'Japan', N'Ageoshimo', N'362-0025')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (496, N'14 Arizona Circle', N'Colombia', N'La Plata', N'416067')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (497, N'4 Pawling Court', N'Mexico', N'Vista Hermosa', N'39130')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (498, N'305 David Point', N'China', N'Junzhuang', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (499, N'67 Butterfield Street', N'China', N'Wulipu', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (500, N'53 Ridge Oak Trail', N'Uzbekistan', N'Salor', NULL)
GO
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (501, N'6 Donald Trail', N'China', N'Gushi', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (502, N'22352 Pearson Lane', N'Ukraine', N'Chornukhyne', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (503, N'08881 Sauthoff Terrace', N'Mongolia', N'Jargalant', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (504, N'6942 Hoard Street', N'Yemen', N'Dhi Na‘im', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (505, N'301 Elmside Park', N'Taiwan', N'Yilan', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (506, N'13695 Texas Center', N'Portugal', N'Lama', N'4890-372')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (507, N'8642 Westport Terrace', N'Philippines', N'Binitinan', N'9005')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (508, N'8677 Florence Crossing', N'Finland', N'Puolanka', N'89201')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (509, N'8 Forest Run Junction', N'China', N'Xianghua', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (510, N'82 Tony Point', N'France', N'Chantilly', N'60506 CEDEX')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (511, N'86 Westerfield Terrace', N'Japan', N'Ichinoseki', N'981-4121')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (512, N'10301 Division Lane', N'China', N'Shikeng', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (513, N'4 Heffernan Plaza', N'Indonesia', N'Dawe', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (514, N'8981 Westridge Way', N'Japan', N'Tatebayashi', N'374-0079')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (515, N'8 Dryden Park', N'Kosovo', N'Nishor', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (516, N'3 Sage Place', N'Pakistan', N'Zafarwal', N'80100')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (517, N'445 Dwight Terrace', N'China', N'Suicheng', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (518, N'8174 Thackeray Court', N'Cambodia', N'Battambang', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (519, N'35 Garrison Hill', N'Sudan', N'Talodi', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (520, N'6749 Fulton Avenue', N'Tajikistan', N'Obikiik', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (521, N'4578 Loomis Point', N'China', N'Nubma', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (522, N'7551 Longview Place', N'Portugal', N'Sao Martinho', N'4780-320')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (523, N'21269 Clemons Way', N'Syria', N'Al Qamşiyah', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (524, N'0 Loeprich Park', N'United States', N'Chicago', N'60652')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (525, N'777 Longview Court', N'Philippines', N'Maluno Sur', N'3332')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (526, N'6513 Reindahl Road', N'China', N'Haolaishan', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (527, N'42897 Macpherson Lane', N'Indonesia', N'Aliuroba', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (528, N'11 Schmedeman Trail', N'Indonesia', N'Rokoy', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (529, N'22102 Kenwood Lane', N'China', N'Chengzhong', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (530, N'0193 Ohio Trail', N'Venezuela', N'Caraballeda', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (531, N'294 Melody Plaza', N'China', N'Lixi', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (532, N'97259 Kenwood Park', N'Afghanistan', N'Burkah', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (533, N'8 Sycamore Park', N'Pakistan', N'Malakand', N'23050')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (534, N'0718 Gina Park', N'Indonesia', N'Sokobanteng', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (535, N'8922 Maple Terrace', N'Honduras', N'El Progreso', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (536, N'29884 Sunfield Pass', N'France', N'Charleville-Mézieres', N'08013 CEDEX')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (537, N'4 Westend Junction', N'Central African Republic', N'Berbérati', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (538, N'733 Grayhawk Trail', N'Malawi', N'Dedza', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (539, N'71 Nelson Road', N'Poland', N'Namysłów', N'46-100')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (540, N'69 American Ash Hill', N'Czech Republic', N'Bořetice', N'691 08')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (541, N'01530 Crest Line Circle', N'Nicaragua', N'Chichigalpa', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (542, N'601 Sauthoff Park', N'China', N'Xixiang', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (543, N'10746 Fairview Court', N'Brazil', N'Penha', N'88385-000')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (544, N'0 Chive Point', N'China', N'Youdunjie', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (545, N'90 Ridgeview Road', N'Poland', N'Dziergowice', N'47-244')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (546, N'81 Pepper Wood Hill', N'China', N'Shiyuetian', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (547, N'69 Macpherson Point', N'China', N'Jiuhu', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (548, N'70 Dottie Alley', N'China', N'Erdaohe', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (549, N'37 Fremont Center', N'China', N'Shengli', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (550, N'2 Anthes Crossing', N'China', N'Longtian', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (551, N'9 Anthes Street', N'Greece', N'Páchni', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (552, N'62 Anniversary Road', N'Argentina', N'Pico Truncado', N'9015')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (553, N'15 Sherman Way', N'Albania', N'Gjoçaj', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (554, N'10 Ludington Street', N'China', N'Yantongtun', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (555, N'1100 Bashford Street', N'Brazil', N'Sao Domingos do Maranhao', N'65790-000')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (556, N'5 Welch Terrace', N'Indonesia', N'Pohonsirih', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (557, N'1240 Westridge Drive', N'Brazil', N'Joao Pinheiro', N'38770-000')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (558, N'374 Schiller Pass', N'China', N'Zhoinda', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (559, N'01 Prairie Rose Court', N'China', N'Nanjie', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (560, N'011 Pond Court', N'Finland', N'Kittilä', N'99101')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (561, N'0 Miller Street', N'Japan', N'Omuta', N'864-0166')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (562, N'668 Hazelcrest Street', N'Croatia', N'Gračac', N'23440')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (563, N'1 Wayridge Hill', N'Belize', N'Belize City', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (564, N'19434 Sage Parkway', N'Jamaica', N'Moneague', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (565, N'2479 Wayridge Hill', N'Russia', N'Vostochnyy', N'143969')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (566, N'39734 Delaware Terrace', N'Syria', N'Banan', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (567, N'087 Clemons Road', N'China', N'Sanxi', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (568, N'2633 Darwin Pass', N'Indonesia', N'Gelang', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (569, N'00 Nova Crossing', N'Finland', N'Valtimo', N'75701')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (570, N'10 Eagle Crest Alley', N'United States', N'Detroit', N'48258')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (571, N'13 Maywood Plaza', N'Poland', N'Drobin', N'09-210')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (572, N'4697 Warrior Way', N'France', N'Saint-Malo', N'35409 CEDEX')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (573, N'1 Dayton Hill', N'Indonesia', N'Bunder', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (574, N'86681 Laurel Hill', N'Portugal', N'Candelária', N'9950-125')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (575, N'1 Waubesa Way', N'China', N'Yinghua', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (576, N'39 Debra Way', N'China', N'Jiekeng', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (577, N'73 Bellgrove Park', N'Indonesia', N'Bojongsari', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (578, N'1 Tennessee Circle', N'Malaysia', N'Kuala Lumpur', N'50913')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (579, N'5 Troy Park', N'Brazil', N'Paraisópolis', N'37660-000')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (580, N'48 Gateway Hill', N'Spain', N'Malaga', N'29005')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (581, N'1 Paget Pass', N'Macedonia', N'Butel', N'1040')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (582, N'537 Hazelcrest Alley', N'China', N'Changzheng', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (583, N'204 Susan Hill', N'Indonesia', N'Perjuangan', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (584, N'01 School Trail', N'South Africa', N'Midrand', N'4147')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (585, N'7526 Harper Crossing', N'Bosnia and Herzegovina', N'Gornje Živinice', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (586, N'922 Clarendon Avenue', N'Mexico', N'Tierra y Libertad', N'32628')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (587, N'692 Upham Court', N'Indonesia', N'Pendawanbaru', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (588, N'5 Morrow Way', N'Russia', N'Bolgar', N'422840')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (589, N'7365 Pierstorff Parkway', N'Indonesia', N'Weepangali', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (590, N'08 Everett Crossing', N'Philippines', N'Caminauit', N'2921')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (591, N'43 Annamark Way', N'China', N'Guoduwan', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (592, N'425 Morning Way', N'Poland', N'Olesno', N'46-300')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (593, N'7687 Village Pass', N'Russia', N'Svobody', N'357560')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (594, N'93045 Jay Way', N'Netherlands', N'Enschede', N'7534')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (595, N'8 Mcbride Pass', N'France', N'Savigny-le-Temple', N'77544 CEDEX')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (596, N'4936 Katie Alley', N'Morocco', N'Mhamid', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (597, N'9 Bartillon Parkway', N'Costa Rica', N'Alajuela', N'20101')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (598, N'8 Delladonna Hill', N'China', N'Gudong', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (599, N'7 Riverside Center', N'China', N'Tiandiba', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (600, N'788 Macpherson Court', N'Greece', N'Monastirákion', NULL)
GO
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (601, N'53 Myrtle Hill', N'France', N'Toulouse', N'31059 CEDEX 9')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (602, N'5203 Jana Junction', N'Germany', N'Düsseldorf', N'40489')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (603, N'5086 Fuller Trail', N'Vietnam', N'Tân Hi?p', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (604, N'04397 Declaration Road', N'Uzbekistan', N'Nurota Shahri', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (605, N'73999 Morningstar Junction', N'Macedonia', N'Češinovo', N'2333')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (606, N'3421 Lukken Terrace', N'United States', N'Grand Rapids', N'49505')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (607, N'26679 Waxwing Drive', N'Japan', N'Takarazuka', N'666-0137')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (608, N'59605 Russell Street', N'Ireland', N'Aghada', N'F23')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (609, N'32018 Northland Drive', N'United States', N'Stockton', N'95205')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (610, N'89105 Anhalt Place', N'Russia', N'Starobachaty', N'652685')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (611, N'9435 Nobel Street', N'Kyrgyzstan', N'Kara-Balta', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (612, N'4324 Brickson Park Place', N'United States', N'Charleston', N'29424')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (613, N'7702 Annamark Junction', N'Japan', N'Otawara', N'329-3155')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (614, N'68 Gale Crossing', N'China', N'Longgang', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (615, N'39 Hoard Pass', N'Uganda', N'Bukomansimbi', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (616, N'1687 Jenna Plaza', N'Brazil', N'Araras', N'13600-000')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (617, N'0208 Hoffman Street', N'Cape Verde', N'Tarrafal', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (618, N'57628 Lotheville Pass', N'Indonesia', N'Tempursari Wetan', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (619, N'741 Dottie Park', N'Maldives', N'Viligili', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (620, N'674 Tennyson Circle', N'Brazil', N'Itu', N'13300-000')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (621, N'03332 Ruskin Pass', N'Brazil', N'Carandaí', N'36280-000')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (622, N'7 Old Gate Center', N'China', N'Chakou', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (623, N'5 Express Hill', N'Lithuania', N'Rietavas', N'90018')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (624, N'5 Colorado Road', N'Morocco', N'Tazouta', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (625, N'22 Loeprich Avenue', N'United Kingdom', N'Norton', N'NN11')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (626, N'909 Forest Run Place', N'China', N'Jiangyou', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (627, N'612 Commercial Way', N'Russia', N'Navashino', N'452538')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (628, N'3017 Maple Parkway', N'Finland', N'Muhos', N'91501')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (629, N'238 Morning Place', N'Nigeria', N'Kwali', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (630, N'812 Nevada Road', N'China', N'Liangguang', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (631, N'08242 Anniversary Point', N'Brazil', N'Cafarnaum', N'44880-000')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (632, N'52178 Ilene Alley', N'South Africa', N'Nelspruit', N'1360')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (633, N'473 Trailsway Plaza', N'Palestinian Territory', N'Bayt ‘Awwa', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (634, N'76 Northwestern Center', N'Peru', N'Soraya', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (635, N'3 Maryland Court', N'Spain', N'Santiago De Compostela', N'15705')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (636, N'730 Luster Street', N'Dominican Republic', N'Jarabacoa', N'10801')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (637, N'19552 Westport Plaza', N'Japan', N'Kushima', N'959-4501')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (638, N'0 Homewood Road', N'Belarus', N'Khatsyezhyna', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (639, N'26929 Nelson Trail', N'China', N'Zhongpai', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (640, N'7 Roth Road', N'Armenia', N'Darpas', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (641, N'80033 Coolidge Street', N'Brazil', N'Pirapora do Bom Jesus', N'06550-000')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (642, N'975 Fairview Way', N'France', N'Ussel', N'19204 CEDEX')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (643, N'15717 Cottonwood Center', N'Kenya', N'Kiambu', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (644, N'800 Sullivan Junction', N'North Korea', N'Iwon-up', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (645, N'06293 Monica Circle', N'Czech Republic', N'Město Albrechtice', N'793 95')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (646, N'398 Shopko Park', N'Russia', N'Zyuzino', N'142817')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (647, N'64 Tennyson Hill', N'China', N'Xindian', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (648, N'74 Superior Hill', N'China', N'Fucha', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (649, N'65 Hovde Junction', N'United States', N'Rochester', N'14683')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (650, N'3601 Jenna Pass', N'Finland', N'Jäppilä', N'77570')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (651, N'57 Chinook Trail', N'Canada', N'Espanola', N'P5E')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (652, N'370 Mayer Center', N'China', N'Longhu', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (653, N'619 Mayfield Lane', N'China', N'Longyuanba', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (654, N'6889 Cody Alley', N'Russia', N'Rudnya', N'216790')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (655, N'6 Fordem Way', N'United States', N'San Diego', N'92132')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (656, N'74 Coleman Center', N'Ukraine', N'Semypolky', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (657, N'16280 Eastwood Alley', N'United States', N'Oakland', N'94627')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (658, N'2009 Fuller Terrace', N'Portugal', N'Sao Brás de Alportel', N'8150-105')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (659, N'9 Birchwood Pass', N'United States', N'Jamaica', N'11480')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (660, N'648 Oriole Center', N'China', N'Gaotian', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (661, N'1 Badeau Hill', N'Honduras', N'Sabá', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (662, N'64257 Oak Street', N'Czech Republic', N'Strání', N'687 65')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (663, N'62447 Bartillon Hill', N'Botswana', N'Mmathubudukwane', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (664, N'98407 Nelson Center', N'France', N'Paris 04', N'75188 CEDEX 04')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (665, N'6 Jenna Pass', N'Japan', N'Atami', N'413-0033')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (666, N'6 Duke Center', N'Iceland', N'Vogar', N'190')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (667, N'53 Lawn Terrace', N'Dominican Republic', N'Santiago de los Caballeros', N'11403')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (668, N'9 Buell Junction', N'Philippines', N'Katipunan', N'7109')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (669, N'863 Logan Point', N'Tunisia', N'Bani ?assan', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (670, N'399 East Avenue', N'China', N'Enhe Hada', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (671, N'1 Charing Cross Alley', N'Morocco', N'Nador', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (672, N'856 Village Green Place', N'Iraq', N'Na?iyat Ba?ar', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (673, N'958 Anthes Point', N'France', N'Meylan', N'38944 CEDEX')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (674, N'73379 Cherokee Crossing', N'China', N'Shangqing', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (675, N'952 Banding Court', N'China', N'Dongzhaogezhuang', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (676, N'8855 Pepper Wood Hill', N'Peru', N'Molinos', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (677, N'7271 Hanover Point', N'Poland', N'Mosty', N'84-353')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (678, N'56 Atwood Crossing', N'Greece', N'Kavásilas', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (679, N'7850 Birchwood Trail', N'Brazil', N'Canguçu', N'96600-000')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (680, N'3 Morning Avenue', N'Brazil', N'Belo Horizonte', N'30000-000')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (681, N'4 Meadow Vale Pass', N'Colombia', N'Magangué', N'132527')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (682, N'00820 Judy Way', N'Indonesia', N'Cisantri', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (683, N'01 Blue Bill Park Park', N'Croatia', N'Jankomir', N'10255')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (684, N'0 Dawn Parkway', N'Indonesia', N'Sukahening', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (685, N'845 Glacier Hill Drive', N'Tanzania', N'Kidodi', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (686, N'91081 Truax Junction', N'Indonesia', N'Krajan', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (687, N'6292 Harbort Pass', N'Philippines', N'Lavezares', N'6404')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (688, N'33 Dottie Alley', N'Indonesia', N'Kaum', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (689, N'73792 Johnson Avenue', N'France', N'Lyon', N'69446 CEDEX 03')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (690, N'7 Milwaukee Way', N'Indonesia', N'Cirahab', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (691, N'068 Maywood Crossing', N'China', N'Yihe', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (692, N'331 Elgar Drive', N'France', N'Rumilly', N'74154 CEDEX')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (693, N'6 Sloan Hill', N'Nigeria', N'Bida', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (694, N'4 Portage Plaza', N'Indonesia', N'Timur', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (695, N'79407 Buena Vista Drive', N'France', N'Saint-Quentin', N'02104 CEDEX')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (696, N'6059 Graceland Center', N'Portugal', N'Elvas', N'7350-005')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (697, N'4 Hooker Parkway', N'Finland', N'Suodenniemi', N'04501')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (698, N'4 Gerald Way', N'Thailand', N'Na Kae', N'48130')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (699, N'9 Sutteridge Parkway', N'China', N'Jinshandian', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (700, N'6 Union Terrace', N'Sweden', N'Hammarö', N'663 42')
GO
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (701, N'90 Linden Point', N'Russia', N'Sovetskaya Gavan’', N'682803')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (702, N'663 Sundown Pass', N'Czech Republic', N'Rýmařov', N'795 01')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (703, N'6528 Oak Valley Avenue', N'Russia', N'Shabel’skoye', N'353643')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (704, N'280 Schmedeman Point', N'Niger', N'Birni N Konni', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (705, N'9352 Merrick Trail', N'Ukraine', N'Uhlove', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (706, N'761 Russell Lane', N'Brazil', N'Escada', N'55500-000')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (707, N'431 Mcguire Avenue', N'Venezuela', N'San Juan de Manapiare', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (708, N'89309 Hooker Street', N'Tanzania', N'Nkove', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (709, N'17 Hudson Terrace', N'Mexico', N'Benito Juarez', N'96720')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (710, N'80899 Hallows Parkway', N'China', N'Chengyang', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (711, N'0 7th Center', N'France', N'Quimperlé', N'29399 CEDEX')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (712, N'6 Thompson Avenue', N'Czech Republic', N'Heřmanův Městec', N'538 03')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (713, N'02 Pleasure Pass', N'China', N'Wenqiao', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (714, N'15 Algoma Point', N'Poland', N'Białobrzegi', N'37-114')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (715, N'864 Sauthoff Place', N'China', N'Chizhou', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (716, N'6647 Stuart Terrace', N'China', N'Siguqiao', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (717, N'1771 Kedzie Lane', N'China', N'Xiashitai', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (718, N'119 Talisman Road', N'China', N'Niba', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (719, N'7501 Evergreen Junction', N'Russia', N'Tommot', N'678953')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (720, N'758 2nd Court', N'China', N'Liushikou', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (721, N'500 Bellgrove Court', N'China', N'Sangesi', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (722, N'25 Moose Trail', N'China', N'Huangjing', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (723, N'4 Sage Hill', N'Philippines', N'Tinambac', N'4426')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (724, N'323 Mockingbird Parkway', N'China', N'Fenglin', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (725, N'84 Crownhardt Alley', N'Czech Republic', N'Karviná', N'735 72')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (726, N'43382 Emmet Junction', N'China', N'Tiebiancheng', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (727, N'59484 Spenser Way', N'South Korea', N'Hwasun', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (728, N'10 School Place', N'China', N'Renfengzhuang', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (729, N'04 Esker Hill', N'Ukraine', N'Shabo', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (730, N'154 Bellgrove Point', N'Croatia', N'Semeljci', N'31402')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (731, N'3567 Marquette Trail', N'China', N'Banyue', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (732, N'551 Mcguire Hill', N'Brazil', N'Juazeirinho', N'58823-000')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (733, N'274 Lindbergh Alley', N'China', N'Guxian', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (734, N'6646 Huxley Drive', N'Bonaire, Saint Eustatius and Saba ', N'Dorp Antriol', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (735, N'43214 Dakota Place', N'Colombia', N'Junín', N'251227')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (736, N'6009 Dovetail Street', N'Syria', N'Baniyas', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (737, N'6523 Iowa Pass', N'Russia', N'Bokino', N'393194')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (738, N'3813 Arkansas Circle', N'Japan', N'Nagai', N'986-0303')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (739, N'85732 Schiller Place', N'North Korea', N'Kimch’aek-si', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (740, N'58203 Amoth Trail', N'Haiti', N'Torbeck', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (741, N'7865 Golf Course Terrace', N'Poland', N'Wola Rębkowska', N'08-410')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (742, N'3 Eagan Drive', N'United States', N'Lakeland', N'33805')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (743, N'8755 Alpine Alley', N'Tanzania', N'Mtwango', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (744, N'7279 Dexter Avenue', N'Palestinian Territory', N'Khursa', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (745, N'190 Fisk Pass', N'Sweden', N'Kungsbacka', N'434 43')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (746, N'3 Redwing Center', N'Indonesia', N'Ketawang', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (747, N'094 Ohio Alley', N'China', N'Xushangqiao', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (748, N'0379 Bultman Alley', N'Brazil', N'Pindobaçu', N'44770-000')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (749, N'26 Myrtle Point', N'Haiti', N'Pétionville', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (750, N'7171 Pierstorff Point', N'Portugal', N'Fajoes', N'3700-660')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (751, N'91 Algoma Court', N'Finland', N'Ristinummi', N'66999')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (752, N'78 Stephen Street', N'Portugal', N'Sande Sao Martinho', N'4805-505')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (753, N'17309 Superior Pass', N'Indonesia', N'Golek', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (754, N'643 Melody Alley', N'China', N'Sangpi', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (755, N'2146 Pine View Street', N'Canada', N'Lacolle', N'E5A')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (756, N'967 Macpherson Street', N'South Korea', N'Gumi', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (757, N'74 Badeau Drive', N'China', N'Tongshan', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (758, N'110 Mockingbird Plaza', N'Sri Lanka', N'Hikkaduwa', N'80240')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (759, N'9 Florence Circle', N'Uruguay', N'Tupambaé', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (760, N'716 Helena Avenue', N'China', N'Baiguo', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (761, N'09 Hintze Lane', N'Indonesia', N'Bantarpanjang', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (762, N'59342 Basil Point', N'Indonesia', N'Nangtang', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (763, N'80 Forster Park', N'Colombia', N'Heliconia', N'055827')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (764, N'348 Reindahl Park', N'China', N'Xiushan', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (765, N'04212 Stuart Terrace', N'Cameroon', N'Tibati', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (766, N'3456 Sugar Trail', N'Canada', N'Senneterre', N'L0P')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (767, N'53 Stang Terrace', N'Uruguay', N'Barra de Carrasco', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (768, N'0 Elmside Pass', N'Brazil', N'Itapetinga', N'45700-000')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (769, N'82969 Prairie Rose Avenue', N'Indonesia', N'Kebonagung', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (770, N'1 Fisk Crossing', N'Jordan', N'Jarash', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (771, N'3354 Monica Plaza', N'China', N'Nanzhao', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (772, N'407 Lotheville Drive', N'Thailand', N'Phan Thong', N'20160')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (773, N'5 Katie Plaza', N'China', N'Guangpu', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (774, N'59019 Myrtle Trail', N'Poland', N'Siedlce', N'33-321')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (775, N'88480 Logan Place', N'Philippines', N'Santa Maria', N'8011')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (776, N'858 Grayhawk Alley', N'Panama', N'Llano de Piedra', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (777, N'59 Pankratz Parkway', N'Philippines', N'Tinambac', N'4426')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (778, N'7853 Crescent Oaks Parkway', N'Germany', N'Hamburg', N'22559')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (779, N'8931 Scofield Way', N'China', N'Baochang', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (780, N'61 Debs Avenue', N'Philippines', N'Bolong', N'5001')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (781, N'5 Clarendon Pass', N'Guatemala', N'Santa María Chiquimula', N'08006')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (782, N'3 Prairieview Crossing', N'China', N'Jiangkou', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (783, N'44221 Dorton Road', N'France', N'Flers', N'61104 CEDEX')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (784, N'665 Delladonna Place', N'Azerbaijan', N'Çalxanqala', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (785, N'9 Haas Street', N'Iran', N'Khondab', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (786, N'7 Main Alley', N'Netherlands', N'Tiel', N'4004')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (787, N'5947 Buell Street', N'Estonia', N'Tabasalu', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (788, N'29763 Spaight Parkway', N'Russia', N'Chashnikovo', N'143912')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (789, N'61 Mifflin Terrace', N'Benin', N'Natitingou', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (790, N'2 Manufacturers Parkway', N'Indonesia', N'Adil Makmur', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (791, N'5767 Fremont Park', N'Czech Republic', N'Boskovice', N'680 01')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (792, N'05180 Gina Avenue', N'China', N'Yangjia', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (793, N'8 Pennsylvania Way', N'Bosnia and Herzegovina', N'Novi Šeher', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (794, N'403 Fair Oaks Pass', N'United States', N'Hartford', N'06183')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (795, N'8 6th Junction', N'Vietnam', N'Đuc Tr?ng', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (796, N'42 Dayton Street', N'Colombia', N'Riofrío', N'761028')
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (797, N'753 Hanover Avenue', N'Ghana', N'Sekondi-Takoradi', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (798, N'28 Stoughton Circle', N'China', N'Yanghuxiang', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (799, N'1362 Pleasure Parkway', N'Venezuela', N'Jacura', NULL)
INSERT [dbo].[Adres] ([AdresID], [Adres], [Kraj], [Miasto], [Kod_pocztowy]) VALUES (800, N'934 Eliot Court', N'Portugal', N'Feitoria', N'4650-291')
GO
SET IDENTITY_INSERT [dbo].[Dostawcy] ON 

INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (1, N'Pagac-McClure', N'917-111-9672', 177)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (2, N'McCullough Inc', N'592-952-4409', 99)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (3, N'Emard-Orn', N'786-187-6796', 216)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (4, N'Harber-Flatley', N'836-418-0922', 479)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (5, N'Lesch-Orn', N'375-642-7537', 105)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (6, N'Deckow, Nienow and Gusikowski', N'663-781-5906', 359)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (7, N'Reinger, Kuhn and Hyatt', N'464-586-2083', 532)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (8, N'Blanda LLC', N'673-933-8657', 528)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (9, N'Wiza Inc', N'857-624-0530', 114)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (10, N'Kessler-Schneider', N'824-422-0076', 475)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (11, N'Johns, Torphy and Hansen', N'822-400-0899', 275)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (12, N'Greenfelder, Carroll and Hintz', N'324-818-7004', 283)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (13, N'Flatley-Bauch', N'943-339-3266', 126)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (14, N'Hermiston-Stiedemann', N'466-813-6313', 428)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (15, N'Zulauf, Schiller and Denesik', N'448-668-3258', 122)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (16, N'Collins, O''Reilly and Block', N'637-742-3579', 401)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (17, N'Lemke-Armstrong', N'294-777-2316', 353)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (18, N'Borer Group', N'773-575-1884', 125)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (19, N'Lesch Inc', N'321-660-5969', 439)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (20, N'Ferry and Sons', N'462-633-1510', 167)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (21, N'Hintz-Gerlach', N'943-544-6331', 431)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (22, N'Barrows, Stoltenberg and Okuneva', N'533-287-7829', 157)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (23, N'Grady-Konopelski', N'897-106-4086', 268)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (24, N'Nader and Sons', N'742-262-7135', 29)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (25, N'Grant Group', N'467-510-9379', 402)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (26, N'Olson-Haley', N'165-727-5925', 500)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (27, N'Murray-Schinner', N'144-495-4379', 210)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (28, N'Jones, Hettinger and Gulgowski', N'192-132-8967', 266)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (29, N'Pollich LLC', N'207-521-9152', 428)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (30, N'Hansen-Zboncak', N'874-373-9578', 308)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (31, N'Fritsch Inc', N'885-879-1139', 545)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (32, N'Schamberger, Ziemann and Beahan', N'672-409-9077', 686)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (33, N'Shanahan, Kohler and Lesch', N'143-833-4176', 72)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (34, N'Luettgen-Walter', N'798-737-7649', 561)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (35, N'Hoppe-Reichel', N'712-440-4867', 187)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (36, N'Stamm and Sons', N'155-572-6677', 233)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (37, N'Brekke-Thompson', N'126-994-2583', 449)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (38, N'Kuvalis-Watsica', N'402-644-9283', 40)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (39, N'Schimmel and Sons', N'600-200-6495', 633)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (40, N'Boyer, Toy and Kuhic', N'123-901-3811', 16)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (41, N'Grimes-King', N'619-184-5376', 576)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (42, N'Luettgen Group', N'369-238-6801', 518)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (43, N'Sawayn-Gottlieb', N'353-961-9431', 355)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (44, N'Nolan, Turner and Veum', N'161-455-8493', 797)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (45, N'Schiller LLC', N'665-364-5191', 491)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (46, N'Beer-Rohan', N'386-711-4497', 510)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (47, N'Adams Group', N'589-108-8680', 68)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (48, N'Torphy, Grady and Russel', N'346-731-3279', 729)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (49, N'Langosh-Lind', N'168-377-6465', 697)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (50, N'Watsica-Ledner', N'463-360-2895', 716)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (51, N'Sporer, Heaney and Mitchell', N'579-842-2796', 628)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (52, N'Jakubowski, Shields and Watsica', N'538-829-6424', 748)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (53, N'Hansen, Mohr and Mills', N'142-968-6328', 592)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (54, N'Leffler LLC', N'280-737-0355', 756)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (55, N'Legros Inc', N'365-113-9024', 113)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (56, N'Turcotte, Lehner and Kshlerin', N'727-761-3876', 365)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (57, N'Schiller, Schneider and Grant', N'580-605-4228', 473)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (58, N'Moen Inc', N'738-504-1802', 469)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (59, N'O''Kon Group', N'539-695-5999', 98)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (60, N'Mante, Steuber and Mertz', N'277-621-3691', 451)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (61, N'Vandervort, Gibson and Hayes', N'378-174-5277', 228)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (62, N'Hayes-McGlynn', N'599-960-7604', 539)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (63, N'Reinger LLC', N'554-898-9381', 762)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (64, N'Breitenberg-Kshlerin', N'241-672-7855', 754)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (65, N'Schuster Group', N'337-440-5555', 475)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (66, N'Conroy-Marks', N'721-938-3710', 71)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (67, N'Thiel-Bosco', N'700-981-8777', 38)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (68, N'Pouros LLC', N'217-193-4614', 270)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (69, N'Schimmel and Sons', N'880-403-5807', 525)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (70, N'Bayer-Yost', N'206-168-3090', 448)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (71, N'Casper-Torphy', N'446-572-9858', 781)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (72, N'Boehm, Fadel and Prosacco', N'562-960-7797', 304)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (73, N'Parisian-Terry', N'444-576-2956', 687)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (74, N'Weber-Bergstrom', N'268-827-4907', 48)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (75, N'Stanton, Langworth and Pfeffer', N'225-229-6226', 331)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (76, N'Jaskolski LLC', N'740-574-3690', 108)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (77, N'Nienow-Sporer', N'286-205-6052', 427)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (78, N'Crona Inc', N'452-547-2975', 571)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (79, N'Abbott, Corkery and Auer', N'813-490-7774', 615)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (80, N'Hirthe-Kohler', N'141-406-6598', 653)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (81, N'Schinner-Nicolas', N'383-244-1953', 640)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (82, N'Steuber, Miller and Rogahn', N'561-471-4763', 135)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (83, N'Waelchi LLC', N'725-294-3465', 291)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (84, N'Wunsch Inc', N'806-701-8687', 327)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (85, N'Witting-Zemlak', N'581-220-9132', 75)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (86, N'Rutherford LLC', N'880-971-5701', 7)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (87, N'Hammes-Connelly', N'254-265-1600', 417)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (88, N'Ruecker Group', N'366-983-7979', 346)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (89, N'Keebler, Hills and Ward', N'285-238-8656', 161)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (90, N'Harris-Cummings', N'423-972-4733', 576)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (91, N'Bayer Inc', N'123-279-1627', 14)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (92, N'Waelchi and Sons', N'669-978-8509', 569)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (93, N'Veum-Veum', N'666-372-1243', 789)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (94, N'Wolff-Cassin', N'522-862-2287', 540)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (95, N'Kozey-Hermann', N'963-706-6917', 2)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (96, N'Roob Group', N'549-975-6204', 231)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (97, N'Stroman Group', N'359-995-4533', 53)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (98, N'Hermann Group', N'545-439-8496', 714)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (99, N'Leuschke Inc', N'161-467-1884', 436)
GO
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (100, N'Carter, Labadie and Reichel', N'752-670-9908', 22)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (101, N'Daugherty Group', N'807-180-6145', 701)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (102, N'Schowalter and Sons', N'108-405-9792', 238)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (103, N'Weber, Nienow and Rath', N'350-790-0457', 393)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (104, N'Gerlach, Vandervort and Will', N'547-147-4098', 369)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (105, N'Lesch and Sons', N'464-982-4248', 111)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (106, N'Christiansen, Wiza and Lowe', N'110-158-7233', 450)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (107, N'Mraz-Lehner', N'719-472-7971', 488)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (108, N'Fritsch and Sons', N'674-790-0730', 179)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (109, N'Paucek, Pfannerstill and Spencer', N'748-516-6767', 13)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (110, N'Farrell LLC', N'932-357-9049', 513)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (111, N'Rath and Sons', N'283-638-8680', 270)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (112, N'Konopelski, Grant and Nicolas', N'689-115-6820', 590)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (113, N'Sanford Group', N'420-248-0378', 202)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (114, N'Nader Group', N'681-452-4362', 424)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (115, N'Kshlerin-Smith', N'513-580-2874', 302)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (116, N'Rice, Kutch and Tromp', N'787-253-3001', 331)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (117, N'Boehm, Gleason and Gerhold', N'512-541-4381', 709)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (118, N'Von-Ullrich', N'566-863-0842', 39)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (119, N'Hermiston and Sons', N'494-173-5910', 219)
INSERT [dbo].[Dostawcy] ([DostawcaID], [Nazwa_dostawcy], [Nr_telefonu], [AdresID]) VALUES (120, N'Franecki-Fritsch', N'108-650-3193', 470)
SET IDENTITY_INSERT [dbo].[Dostawcy] OFF
GO
SET IDENTITY_INSERT [dbo].[Faktury] ON 

INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (1, 3, 1, N'Woodsia neomexicana Windham', N'3532881667', CAST(N'2020-09-26T00:00:00.000' AS DateTime), N'StyleShop', N'Fixflex', 441)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (2, 3, 1, N'Erysimum franciscanum G. Rossb.', N'3397884748', CAST(N'2020-12-02T00:00:00.000' AS DateTime), N'StyleShop', N'Solarbreeze', 456)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (3, 1, 2, N'Microchloa caffra Nees', N'7497209132', CAST(N'2020-02-09T00:00:00.000' AS DateTime), N'StyleShop', N'Konklab', 467)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (4, 2, 2, N'Leptogium cyanescens (Rabenh.) Körb.', N'8375194018', CAST(N'2020-07-10T00:00:00.000' AS DateTime), N'StyleShop', N'Trippledex', 654)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (5, 1, 2, N'Chaenactis macrantha D.C. Eaton', N'3182503545', CAST(N'2021-05-17T00:00:00.000' AS DateTime), N'StyleShop', N'Bigtax', 456)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (6, 3, 2, N'Verbena bracteata Cav. ex Lag. & Rodr.', N'8172169027', CAST(N'2021-07-12T00:00:00.000' AS DateTime), N'StyleShop', N'Regrant', 765)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (7, 1, 2, N'Pseudelephantopus spirilis (Less.) Cronquist', N'5242881208', CAST(N'2020-02-10T00:00:00.000' AS DateTime), N'StyleShop', N'Aerified', 668)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (8, 2, 4, N'Eurhynchium Schimp.', N'5520621004', CAST(N'2021-10-06T00:00:00.000' AS DateTime), N'StyleShop', N'Job', 776)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (9, 1, 4, N'Helianthella californica A. Gray', N'1884912877', CAST(N'2021-11-28T00:00:00.000' AS DateTime), N'StyleShop', N'Stim', 464)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (10, 3, 3, N'Trifolium apertum Bobrov', N'3106079452', CAST(N'2020-10-22T00:00:00.000' AS DateTime), N'StyleShop', N'Trippledex', 24)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (11, 3, 4, N'Pritchardia perlmanii C.E. Gemmill', N'6355924515', CAST(N'2020-09-18T00:00:00.000' AS DateTime), N'StyleShop', N'Fixflex', 66)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (12, 2, 4, N'Gypsophila scorzonerifolia Ser.', N'9322236353', CAST(N'2019-02-04T00:00:00.000' AS DateTime), N'StyleShop', N'Sonair', 54)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (13, 3, 2, N'Achnatherum lemmonii (Vasey) Barkworth var. lemmonii', N'4360365314', CAST(N'2021-02-12T00:00:00.000' AS DateTime), N'StyleShop', N'Bigtax', 75)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (14, 3, 2, N'Kalmia L.', N'3491581613', CAST(N'2020-02-08T00:00:00.000' AS DateTime), N'StyleShop', N'Fintone', 8)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (15, 1, 1, N'Pediomelum megalanthum (Wooton & Standl.) Rydb.', N'0448965518', CAST(N'2021-08-21T00:00:00.000' AS DateTime), N'StyleShop', N'Voltsillam', 85)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (16, 1, 3, N'Azadirachta A. Juss.', N'7635192698', CAST(N'2021-11-03T00:00:00.000' AS DateTime), N'StyleShop', N'Stronghold', 84)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (17, 2, 2, N'Ivesia unguiculata A. Gray', N'6074272646', CAST(N'2021-10-26T00:00:00.000' AS DateTime), N'StyleShop', N'Namfix', 86)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (18, 2, 4, N'Margaranthus Schltdl.', N'9355574843', CAST(N'2020-08-22T00:00:00.000' AS DateTime), N'StyleShop', N'Hatity', 75)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (19, 1, 1, N'Euonymus fortunei (Turcz.) Hand.-Maz.', N'4670228927', CAST(N'2021-08-30T00:00:00.000' AS DateTime), N'StyleShop', N'Transcof', 64)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (20, 1, 3, N'Gentiana rubricaulis Schwein.', N'7474631687', CAST(N'2020-11-17T00:00:00.000' AS DateTime), N'StyleShop', N'Aerified', 76)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (21, 2, 4, N'Brachyelytrum P. Beauv.', N'9866368238', CAST(N'2019-12-05T00:00:00.000' AS DateTime), N'StyleShop', N'Lotstring', 99)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (22, 1, 4, N'Distichium hagenii Ryan ex Philib.', N'9601127267', CAST(N'2020-11-10T00:00:00.000' AS DateTime), N'StyleShop', N'Home Ing', 54)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (23, 3, 1, N'Potentilla cristae Ferlatte & Strother', N'6857019509', CAST(N'2020-04-05T00:00:00.000' AS DateTime), N'StyleShop', N'Namfix', 35)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (24, 3, 1, N'Pappophorum pappiferum (Lam.) Kuntze', N'4274577058', CAST(N'2019-04-04T00:00:00.000' AS DateTime), N'StyleShop', N'Hatity', 7)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (25, 2, 3, N'Ranunculus platensis Spreng.', N'3188691742', CAST(N'2021-05-16T00:00:00.000' AS DateTime), N'StyleShop', N'Y-find', 75)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (26, 2, 4, N'Macaranga tanarius (L.) Müll. Arg.', N'1663687889', CAST(N'2020-09-17T00:00:00.000' AS DateTime), N'StyleShop', N'Aerified', 98)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (27, 2, 1, N'Cladonia wainioi Savicz', N'6249343342', CAST(N'2021-06-21T00:00:00.000' AS DateTime), N'StyleShop', N'Prodder', 90)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (28, 3, 2, N'Polytrichum ohioense Renauld & Cardot', N'8018793549', CAST(N'2021-12-05T00:00:00.000' AS DateTime), N'StyleShop', N'Stronghold', 80)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (29, 2, 1, N'Schizachyrium condensatum (Kunth) Nees', N'7984336326', CAST(N'2020-09-14T00:00:00.000' AS DateTime), N'StyleShop', N'Zaam-Dox', 70)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (30, 3, 3, N'Platanthera grandiflora (Bigelow) Lindl.', N'1124018069', CAST(N'2021-12-08T00:00:00.000' AS DateTime), N'StyleShop', N'Bytecard', 78)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (31, 1, 4, N'Oreostemma elatum (Greene) Greene', N'6887272237', CAST(N'2020-11-28T00:00:00.000' AS DateTime), N'StyleShop', N'Stronghold', 780)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (32, 2, 4, N'Rhodobryum roseum (Hedw.) Limpr.', N'9349834596', CAST(N'2020-12-18T00:00:00.000' AS DateTime), N'StyleShop', N'Domainer', 560)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (33, 2, 3, N'Pleuropogon californicus (Nees) Benth. ex Vasey var. davyi (L.D. Benson) But', N'6549181437', CAST(N'2020-05-31T00:00:00.000' AS DateTime), N'StyleShop', N'Zamit', 579)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (34, 3, 3, N'Corispermum hookeri Mosyakin var. hookeri', N'5506588518', CAST(N'2021-06-25T00:00:00.000' AS DateTime), N'StyleShop', N'Job', 532)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (35, 1, 1, N'Acacia sphaerocephala Schltdl. & Cham.', N'8682553201', CAST(N'2019-01-22T00:00:00.000' AS DateTime), N'StyleShop', N'Span', 432)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (36, 1, 2, N'Calochortus pulchellus Douglas ex Benth.', N'1667615610', CAST(N'2020-05-11T00:00:00.000' AS DateTime), N'StyleShop', N'Stringtough', 124)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (37, 2, 4, N'Corallorhiza mertensiana Bong.', N'4282447133', CAST(N'2019-03-21T00:00:00.000' AS DateTime), N'StyleShop', N'Fintone', 235)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (38, 2, 3, N'Ficus godeffroyi Warb.', N'0455492417', CAST(N'2019-02-14T00:00:00.000' AS DateTime), N'StyleShop', N'Keylex', 55)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (39, 1, 1, N'Asclepias uncialis Greene ssp. ruthiae (Maguire) Kartesz & Gandhi', N'4117224336', CAST(N'2021-05-28T00:00:00.000' AS DateTime), N'StyleShop', N'Cardify', 34)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (40, 2, 2, N'Festuca viviparoidea Krajina ex Pavlick ssp. viviparoidea', N'2927503311', CAST(N'2019-02-03T00:00:00.000' AS DateTime), N'StyleShop', N'Zoolab', 343)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (41, 1, 1, N'Santalum paniculatum Hook. & Arn. var. paniculatum', N'8197624569', CAST(N'2020-08-22T00:00:00.000' AS DateTime), N'StyleShop', N'Tresom', 345)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (42, 1, 4, N'Erodium texanum A. Gray', N'0717661253', CAST(N'2020-01-24T00:00:00.000' AS DateTime), N'StyleShop', N'Overhold', 423)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (43, 1, 1, N'Orthotrichum pellucidum Lindb.', N'0201721643', CAST(N'2020-10-25T00:00:00.000' AS DateTime), N'StyleShop', N'Greenlam', 426)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (44, 3, 3, N'Lepidium nitidum Nutt. var. oreganum (Howell ex Greene) C.L. Hitchc.', N'3556887894', CAST(N'2021-11-04T00:00:00.000' AS DateTime), N'StyleShop', N'Span', 474)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (45, 2, 1, N'Tabebuia heterophylla (DC.) Britton', N'2240156430', CAST(N'2020-03-09T00:00:00.000' AS DateTime), N'StyleShop', N'Keylex', 757)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (46, 3, 2, N'Lecanora orae-frigidae R. Sant.', N'1872802389', CAST(N'2020-09-04T00:00:00.000' AS DateTime), N'StyleShop', N'Span', 557)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (47, 2, 4, N'Drypetes ilicifolia (DC.) Krug & Urb.', N'7396354714', CAST(N'2020-03-10T00:00:00.000' AS DateTime), N'StyleShop', N'Holdlamis', 456)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (48, 2, 4, N'Polyblastia obsoleta Arnold', N'4516048302', CAST(N'2020-04-28T00:00:00.000' AS DateTime), N'StyleShop', N'Alphazap', 46)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (49, 1, 2, N'Eragrostis japonica (Thunb.) Trin.', N'5721925701', CAST(N'2021-06-02T00:00:00.000' AS DateTime), N'StyleShop', N'Opela', 356)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (50, 2, 1, N'Pyracantha fortuneana (Maxim.) Li', N'6731919888', CAST(N'2020-02-25T00:00:00.000' AS DateTime), N'StyleShop', N'Greenlam', 144)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (51, 2, 3, N'Stenanthium occidentale A. Gray', N'8666795913', CAST(N'2021-10-22T00:00:00.000' AS DateTime), N'StyleShop', N'Duobam', 119)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (52, 3, 1, N'Hygrophila difformis (L. f.) Blume', N'6033451481', CAST(N'2019-09-17T00:00:00.000' AS DateTime), N'StyleShop', N'Tin', 153)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (53, 1, 4, N'Psorotichia minuta H. Magn.', N'8793761724', CAST(N'2020-05-07T00:00:00.000' AS DateTime), N'StyleShop', N'Treeflex', 156)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (54, 2, 4, N'Polemonium occidentale Greene ssp. occidentale', N'8305250512', CAST(N'2021-11-10T00:00:00.000' AS DateTime), N'StyleShop', N'Wrapsafe', 177)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (55, 3, 4, N'Claytonia palustris Swanson & Kelley', N'0499960327', CAST(N'2019-06-20T00:00:00.000' AS DateTime), N'StyleShop', N'Namfix', 156)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (56, 2, 3, N'Elaphoglossum latifolium (Sw.) J. Sm.', N'0378183060', CAST(N'2020-11-20T00:00:00.000' AS DateTime), N'StyleShop', N'Zathin', 154)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (57, 1, 2, N'Zephyranthes proctorii Acev.-Rodr. & M.T. Strong', N'8012272849', CAST(N'2021-04-27T00:00:00.000' AS DateTime), N'StyleShop', N'Mat Lam Tam', 156)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (58, 1, 3, N'Anemone multifida Poir. var. stylosa (A. Nelson) Dutton & Keener', N'4437099001', CAST(N'2019-10-04T00:00:00.000' AS DateTime), N'StyleShop', N'Tin', 156)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (59, 3, 3, N'Physalis hederifolia A. Gray var. fendleri (A. Gray) Cronquist', N'1564161846', CAST(N'2020-01-09T00:00:00.000' AS DateTime), N'StyleShop', N'Subin', 154)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (60, 3, 2, N'Dactylina arctica (Richardson) Nyl.', N'0184948460', CAST(N'2021-04-11T00:00:00.000' AS DateTime), N'StyleShop', N'Stim', 315)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (61, 1, 1, N'Sedum spathulifolium Hook. ssp. purdyi (Jeps.) R.T. Clausen', N'7064019639', CAST(N'2019-01-05T00:00:00.000' AS DateTime), N'StyleShop', N'Zoolab', 156)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (62, 1, 3, N'Lomatium gormanii (Howell) J.M. Coult. & Rose', N'3505020753', CAST(N'2020-01-11T00:00:00.000' AS DateTime), N'StyleShop', N'Viva', 464)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (63, 2, 1, N'Bryum capillare Hedw. var. barbatum (C.E.O. Jensen) Podp.', N'5368425635', CAST(N'2020-03-21T00:00:00.000' AS DateTime), N'StyleShop', N'Cardguard', 6)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (64, 3, 1, N'Gillenia Moench', N'7004630617', CAST(N'2020-04-29T00:00:00.000' AS DateTime), N'StyleShop', N'Konklab', 56)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (65, 3, 3, N'Aralia chinensis L.', N'5840686417', CAST(N'2021-10-05T00:00:00.000' AS DateTime), N'StyleShop', N'Pannier', 7)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (66, 1, 4, N'Rhododendron catawbiense Michx.', N'4373447314', CAST(N'2021-10-22T00:00:00.000' AS DateTime), N'StyleShop', N'Ronstring', 556)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (67, 3, 1, N'Selenicereus pteranthus (Link ex A. Dietr.) Britton & Rose', N'0349092400', CAST(N'2020-10-21T00:00:00.000' AS DateTime), N'StyleShop', N'Konklux', 435)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (68, 1, 2, N'Escobaria robbinsiorum (W.H. Earle) D.R. Hunt', N'2018673408', CAST(N'2021-10-02T00:00:00.000' AS DateTime), N'StyleShop', N'Bitchip', 356)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (69, 2, 1, N'Myosoton Moench', N'3509538404', CAST(N'2019-08-31T00:00:00.000' AS DateTime), N'StyleShop', N'Subin', 366)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (70, 1, 2, N'Lupinus', N'2251007881', CAST(N'2020-09-21T00:00:00.000' AS DateTime), N'StyleShop', N'Regrant', 364)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (71, 2, 1, N'Rosmarinus L.', N'0822107953', CAST(N'2019-04-12T00:00:00.000' AS DateTime), N'StyleShop', N'Voyatouch', 775)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (72, 1, 2, N'Eubotrys recurvus (Buckley) Britton', N'9631580059', CAST(N'2020-04-11T00:00:00.000' AS DateTime), N'StyleShop', N'Home Ing', 746)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (73, 3, 4, N'Chamaesyce multiformis (Gaudich. ex Hook. & Arn.) Croizat & O. Deg.', N'6688909146', CAST(N'2021-02-08T00:00:00.000' AS DateTime), N'StyleShop', N'Prodder', 467)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (74, 3, 4, N'Phacelia exilis (A. Gray) G.L. Lee', N'8345126847', CAST(N'2019-08-02T00:00:00.000' AS DateTime), N'StyleShop', N'Mat Lam Tam', 754)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (75, 3, 1, N'Triantha (Nutt.) Baker', N'1804219282', CAST(N'2021-03-22T00:00:00.000' AS DateTime), N'StyleShop', N'Temp', 357)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (76, 1, 2, N'Huperzia ×carlquistii Beitel & W.H. Wagner', N'3090707063', CAST(N'2020-01-17T00:00:00.000' AS DateTime), N'StyleShop', N'Zathin', 335)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (77, 1, 4, N'Oenothera elata Kunth ssp. hirsutissima (A. Gray ex S. Watson) W. Dietr.', N'6388603068', CAST(N'2021-06-30T00:00:00.000' AS DateTime), N'StyleShop', N'Redhold', 524)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (78, 3, 2, N'Hypogymnia imshaugii Krog', N'7456950849', CAST(N'2020-02-12T00:00:00.000' AS DateTime), N'StyleShop', N'Span', 526)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (79, 2, 2, N'Saxifraga eriophora S. Watson', N'1557070245', CAST(N'2020-10-27T00:00:00.000' AS DateTime), N'StyleShop', N'Gembucket', 463)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (80, 3, 4, N'Festuca scabra Vahl', N'3169154214', CAST(N'2021-06-27T00:00:00.000' AS DateTime), N'StyleShop', N'Solarbreeze', 536)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (81, 2, 3, N'Castilleja lasiorhyncha (A. Gray) T.I. Chuang & Heckard', N'1559371269', CAST(N'2019-09-12T00:00:00.000' AS DateTime), N'StyleShop', N'Voyatouch', 464)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (82, 1, 1, N'Erigeron breweri A. Gray var. klamathensis G.L. Nesom', N'3576100059', CAST(N'2020-11-16T00:00:00.000' AS DateTime), N'StyleShop', N'Voyatouch', 785)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (83, 2, 1, N'Ceanothus ×lobbianus Hook. (pro sp.)', N'7197741106', CAST(N'2020-03-05T00:00:00.000' AS DateTime), N'StyleShop', N'Stringtough', 467)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (84, 3, 4, N'Senecio pattersonensis Hoover', N'8528558967', CAST(N'2021-08-23T00:00:00.000' AS DateTime), N'StyleShop', N'Subin', 467)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (85, 1, 2, N'Sisyrinchium idahoense E.P. Bicknell var. idahoense', N'4973763217', CAST(N'2019-02-15T00:00:00.000' AS DateTime), N'StyleShop', N'Tampflex', 432)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (86, 1, 2, N'Chamaesyce velleriflora (Klotzsch & Garcke) Millsp.', N'0322735858', CAST(N'2020-10-11T00:00:00.000' AS DateTime), N'StyleShop', N'Transcof', 224)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (87, 1, 4, N'Sphagnum pylaesii Brid.', N'5455465139', CAST(N'2019-08-23T00:00:00.000' AS DateTime), N'StyleShop', N'Zontrax', 225)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (88, 2, 2, N'Lantana achyranthifolia Desf.', N'3460189371', CAST(N'2021-08-28T00:00:00.000' AS DateTime), N'StyleShop', N'Treeflex', 622)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (89, 3, 1, N'Geranium pusillum L.', N'6442755029', CAST(N'2020-06-08T00:00:00.000' AS DateTime), N'StyleShop', N'Cardguard', 228)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (90, 1, 4, N'Vitis aestivalis Michx.', N'7100335477', CAST(N'2020-12-26T00:00:00.000' AS DateTime), N'StyleShop', N'Daltfresh', 223)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (91, 2, 4, N'Bouteloua hirsuta Lag. var. hirsuta', N'0222720506', CAST(N'2019-02-03T00:00:00.000' AS DateTime), N'StyleShop', N'Fintone', 215)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (92, 1, 2, N'Buellia placodiomorpha Vain.', N'1063896991', CAST(N'2019-09-28T00:00:00.000' AS DateTime), N'StyleShop', N'Otcom', 112)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (93, 3, 1, N'Tetramolopium filiforme Sherff', N'6955510355', CAST(N'2021-06-10T00:00:00.000' AS DateTime), N'StyleShop', N'Prodder', 211)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (94, 3, 3, N'Limosella L.', N'1711135135', CAST(N'2021-12-03T00:00:00.000' AS DateTime), N'StyleShop', N'Prodder', 414)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (95, 3, 3, N'Navarretia myersii Allen & Day ssp. myersii', N'9972638405', CAST(N'2020-12-24T00:00:00.000' AS DateTime), N'StyleShop', N'Subin', 436)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (96, 1, 4, N'Lactuca biennis (Moench) Fernald', N'5399016486', CAST(N'2020-01-14T00:00:00.000' AS DateTime), N'StyleShop', N'Veribet', 664)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (97, 1, 2, N'Rhododendron occidentale (Torr. & A. Gray) A. Gray var. occidentale', N'0879052821', CAST(N'2021-03-21T00:00:00.000' AS DateTime), N'StyleShop', N'Stronghold', 690)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (98, 1, 4, N'Gymnocarpium jessoense (Koidzumi) Koidzumi ssp. parvulum Sarvela', N'0172915694', CAST(N'2019-02-02T00:00:00.000' AS DateTime), N'StyleShop', N'Kanlam', 570)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (99, 3, 2, N'Cylindropu', N'0116671114', CAST(N'2019-09-18T00:00:00.000' AS DateTime), N'StyleShop', N'Kanlam', 689)
GO
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (100, 3, 2, N'Oxytropis oreophila A. Gray', N'4776771136', CAST(N'2021-11-15T00:00:00.000' AS DateTime), N'StyleShop', N'Subin', NULL)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (101, 2, 3, N'Tectaria ×amesiana A.A. Eaton (pro sp.)', N'2025786549', CAST(N'2021-01-05T00:00:00.000' AS DateTime), N'StyleShop', N'Zathin', 765)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (102, 1, 4, N'Adenostoma fasciculatum Hook. & Arn. var. obtusifolium S. Watson', N'8119086732', CAST(N'2019-06-12T00:00:00.000' AS DateTime), N'StyleShop', N'Latlux', 64)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (103, 1, 1, N'Astragalus laxmannii Jacq. var. robustior (Hook.) Barneby & S.L. Welsh', N'6847705639', CAST(N'2019-04-14T00:00:00.000' AS DateTime), N'StyleShop', N'Subin', 335)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (104, 3, 3, N'Helianthus atrorubens L.', N'3862342611', CAST(N'2019-02-06T00:00:00.000' AS DateTime), N'StyleShop', N'Hatity', 3)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (105, 3, 3, N'Oxytheca emarginata H.M. Hall', N'9273059104', CAST(N'2020-04-01T00:00:00.000' AS DateTime), N'StyleShop', N'Daltfresh', 67)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (106, 2, 3, N'Githopsis pulchella Vatke ssp. pulchella var. pulchella', N'9166143837', CAST(N'2021-09-17T00:00:00.000' AS DateTime), N'StyleShop', N'Alphazap', 4)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (107, 3, 2, N'Triosteum perfoliatum L.', N'0871195755', CAST(N'2020-09-22T00:00:00.000' AS DateTime), N'StyleShop', N'Stronghold', 7)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (108, 1, 2, N'Albizia lebbekoides (DC.) Benth.', N'5796808044', CAST(N'2019-06-20T00:00:00.000' AS DateTime), N'StyleShop', N'Hatity', 4)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (109, 1, 1, N'Ceanothus ×flexilis Greene ex McMinn', N'2016646195', CAST(N'2020-10-14T00:00:00.000' AS DateTime), N'StyleShop', N'Veribet', 7)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (110, 2, 2, N'Gilia tenuiflora Benth. ssp. arenaria (Benth.) A.D. Grant & V.E. Grant', N'9675892315', CAST(N'2021-06-04T00:00:00.000' AS DateTime), N'StyleShop', N'Sub-Ex', 4)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (111, 1, 4, N'Polyblastia gelatinosa (Ach.) Th. Fr.', N'2341585892', CAST(N'2020-12-06T00:00:00.000' AS DateTime), N'StyleShop', N'Andalax', 88)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (112, 1, 3, N'Oxytropis lambertii Pursh var. lambertii', N'9316426308', CAST(N'2020-10-24T00:00:00.000' AS DateTime), N'StyleShop', N'Konklab', 7)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (113, 1, 1, N'Solidago brachyphylla Chapm. ex Torr. & A. Gray', N'7837411749', CAST(N'2019-02-27T00:00:00.000' AS DateTime), N'StyleShop', N'Sonair', 57)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (114, 3, 2, N'Sisyrinchium macrocarpon E.P. Bicknell', N'2185658050', CAST(N'2019-06-04T00:00:00.000' AS DateTime), N'StyleShop', N'Stringtough', 5)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (115, 2, 3, N'Echinocereus poselgeri Lem.', N'3477155505', CAST(N'2018-12-22T00:00:00.000' AS DateTime), N'StyleShop', N'Span', 32)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (116, 3, 4, N'Eriogonum umbellatum Torr. var. vernum Reveal', N'9451813136', CAST(N'2020-10-01T00:00:00.000' AS DateTime), N'StyleShop', N'Bitwolf', 445)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (117, 2, 2, N'Sclerocarpus uniserialis (Benth.) Hemsl. var. austrotexanus B.L. Turner', N'1165864592', CAST(N'2019-09-07T00:00:00.000' AS DateTime), N'StyleShop', N'Zathin', 675)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (118, 1, 3, N'Harmonia guggolziorum B.G. Baldw.', N'0336494769', CAST(N'2021-04-16T00:00:00.000' AS DateTime), N'StyleShop', N'Vagram', 556)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (119, 3, 2, N'Isoetes prototypus D.M. Britton', N'9702601045', CAST(N'2021-10-30T00:00:00.000' AS DateTime), N'StyleShop', N'Aerified', 678)
INSERT [dbo].[Faktury] ([FakturaID], [Stawka_vat_ID], [Typ_fakturyID], [Nazwa_faktury], [NIP], [Data_wystawienia_faktury], [Nazwa_wystawcy], [Nazwa_odbiorcy], [AdresID]) VALUES (120, 1, 2, N'Haplostachys truncata (A. Gray) Hillebr.', N'5221529491', CAST(N'2020-12-14T00:00:00.000' AS DateTime), N'StyleShop', N'Pannier', 543)
SET IDENTITY_INSERT [dbo].[Faktury] OFF
GO
INSERT [dbo].[Gwarancja] ([GwarancjaID], [Okres_gwarancji]) VALUES (1, N'24')
INSERT [dbo].[Gwarancja] ([GwarancjaID], [Okres_gwarancji]) VALUES (2, N'36')
INSERT [dbo].[Gwarancja] ([GwarancjaID], [Okres_gwarancji]) VALUES (3, N'48')
GO
SET IDENTITY_INSERT [dbo].[Kategorie] ON 

INSERT [dbo].[Kategorie] ([KategoriaID], [Nazwa_kategorii]) VALUES (1, N'ODZIEZ')
INSERT [dbo].[Kategorie] ([KategoriaID], [Nazwa_kategorii]) VALUES (2, N'OBUWIE')
SET IDENTITY_INSERT [dbo].[Kategorie] OFF
GO
SET IDENTITY_INSERT [dbo].[Klient] ON 

INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (1, N'Gerhardt', N'Darrell', N'907-780-3352', CAST(N'1971-08-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (2, N'Marnia', N'McMorran', N'404-990-3623', CAST(N'1999-06-12T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (3, N'Ulric', N'Lode', N'683-517-3358', CAST(N'1994-12-20T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (4, N'Hashim', N'Lukesch', N'201-773-9060', CAST(N'1998-10-23T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (5, N'Kendrick', N'Riccardini', N'886-882-4450', CAST(N'1982-09-26T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (6, N'Tonie', N'Balnave', N'612-936-3883', CAST(N'1969-09-18T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (7, N'Dov', N'McTrustey', N'916-255-9339', CAST(N'1998-11-07T00:00:00.000' AS DateTime), 123)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (8, N'Dwight', N'Swaisland', N'487-337-3482', CAST(N'1996-11-23T00:00:00.000' AS DateTime), 432)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (9, N'Micheline', N'Benallack', N'434-238-1302', CAST(N'1996-10-11T00:00:00.000' AS DateTime), 32)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (10, N'Chrisse', N'Stegel', N'405-183-8404', CAST(N'1982-09-15T00:00:00.000' AS DateTime), 33)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (11, N'Kendricks', N'Arnall', N'251-929-0510', CAST(N'1988-07-09T00:00:00.000' AS DateTime), 10)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (12, N'Lotta', N'Readitt', N'378-906-0703', CAST(N'1978-08-29T00:00:00.000' AS DateTime), 13)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (13, N'Artair', N'Ferenczi', N'107-656-2079', CAST(N'1976-03-24T00:00:00.000' AS DateTime), 123)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (14, N'Sher', N'Eilles', N'406-326-5653', CAST(N'1990-09-06T00:00:00.000' AS DateTime), 123)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (15, N'Tybie', N'Reece', N'328-874-5555', CAST(N'1972-08-29T00:00:00.000' AS DateTime), 432)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (16, N'Rhona', N'Duffyn', N'164-288-0217', CAST(N'1969-07-31T00:00:00.000' AS DateTime), 321)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (17, N'Demetre', N'McEvay', N'434-217-2717', CAST(N'1991-04-06T00:00:00.000' AS DateTime), 123)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (18, N'Minni', N'Mann', N'444-259-7780', CAST(N'1993-05-07T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (19, N'Etty', N'Colby', N'204-490-4131', CAST(N'1968-07-12T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (20, N'Georgia', N'Pledger', N'141-791-7169', CAST(N'1973-01-19T00:00:00.000' AS DateTime), 21)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (21, N'Lil', N'Abry', N'214-297-6481', CAST(N'1970-09-14T00:00:00.000' AS DateTime), 23)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (22, N'Leon', N'McGeoch', N'298-464-9312', CAST(N'1980-04-28T00:00:00.000' AS DateTime), 343)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (23, N'Tonnie', N'Kamen', N'466-898-9871', CAST(N'1988-03-07T00:00:00.000' AS DateTime), 23)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (24, N'Christoffer', N'Dudeney', N'304-454-0539', CAST(N'1995-05-24T00:00:00.000' AS DateTime), 29)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (25, N'Rebekah', N'Walsh', N'258-711-5445', CAST(N'1999-10-24T00:00:00.000' AS DateTime), 28)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (26, N'Lida', N'Kroger', N'956-597-8973', CAST(N'1998-07-29T00:00:00.000' AS DateTime), 75)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (27, N'Wiatt', N'Pilgrim', N'891-525-0058', CAST(N'1972-01-26T00:00:00.000' AS DateTime), 86)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (28, N'Agnola', N'Kopfer', N'463-626-1991', CAST(N'1992-04-09T00:00:00.000' AS DateTime), 26)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (29, N'Elyn', N'Droogan', N'490-343-4585', CAST(N'1968-09-04T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (30, N'Jenny', N'Woolston', N'643-224-5008', CAST(N'1986-12-14T00:00:00.000' AS DateTime), 12)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (31, N'Dene', N'Karczinski', N'766-293-0828', CAST(N'1971-06-02T00:00:00.000' AS DateTime), 21)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (32, N'Halie', N'Moyer', N'928-551-0774', CAST(N'1972-05-08T00:00:00.000' AS DateTime), 77)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (33, N'Audrye', N'Armin', N'301-250-0650', CAST(N'1972-02-10T00:00:00.000' AS DateTime), 32)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (34, N'Lesly', N'MacCombe', N'163-717-5111', CAST(N'1975-08-13T00:00:00.000' AS DateTime), 66)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (35, N'Nevil', N'Wolstencroft', N'300-509-4965', CAST(N'1976-02-16T00:00:00.000' AS DateTime), 43)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (36, N'Fifi', N'Thiem', N'920-289-8319', CAST(N'1979-09-18T00:00:00.000' AS DateTime), 55)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (37, N'Godfree', N'Ruddock', N'670-135-0604', CAST(N'1993-08-23T00:00:00.000' AS DateTime), 67)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (38, N'Damian', N'Barlee', N'752-853-3922', CAST(N'1993-12-10T00:00:00.000' AS DateTime), 233)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (39, N'Sean', N'Boffey', N'623-490-4592', CAST(N'1985-11-29T00:00:00.000' AS DateTime), 234)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (40, N'Ansell', N'Heersma', N'923-144-1418', CAST(N'1991-06-23T00:00:00.000' AS DateTime), 34)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (41, N'Ketty', N'Duigenan', N'330-367-3563', CAST(N'1995-03-27T00:00:00.000' AS DateTime), 65)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (42, N'Barbey', N'Huzzay', N'234-938-0544', CAST(N'1984-08-10T00:00:00.000' AS DateTime), 333)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (43, N'Bartlet', N'Ravenshaw', N'583-735-0701', CAST(N'1988-04-02T00:00:00.000' AS DateTime), 32)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (44, N'Garald', N'Surridge', N'505-119-3526', CAST(N'1992-06-09T00:00:00.000' AS DateTime), 34)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (45, N'West', N'Gilstoun', N'142-858-4532', CAST(N'1999-06-10T00:00:00.000' AS DateTime), 322)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (46, N'Reginald', N'Bolden', N'593-193-8890', CAST(N'1998-06-26T00:00:00.000' AS DateTime), 544)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (47, N'Concordia', N'Blakebrough', N'681-596-9263', CAST(N'1994-08-22T00:00:00.000' AS DateTime), 21)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (48, N'Callean', N'Glisane', N'333-875-7783', CAST(N'1980-11-25T00:00:00.000' AS DateTime), 21)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (49, N'Hamish', N'Schwant', N'929-225-2265', CAST(N'1984-08-10T00:00:00.000' AS DateTime), 432)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (50, N'Ephraim', N'Werrett', N'883-122-0381', CAST(N'1991-07-26T00:00:00.000' AS DateTime), 543)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (51, N'Mira', N'Ayers', N'115-822-2695', CAST(N'1977-08-01T00:00:00.000' AS DateTime), 134)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (52, N'Jamie', N'Carden', N'733-287-1698', CAST(N'1994-03-22T00:00:00.000' AS DateTime), 132)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (53, N'Kippie', N'McComish', N'297-501-7592', CAST(N'1996-02-09T00:00:00.000' AS DateTime), 231)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (54, N'Spense', N'Kacheler', N'564-353-5367', CAST(N'1990-01-30T00:00:00.000' AS DateTime), 22)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (55, N'Corrie', N'Gye', N'668-968-7747', CAST(N'1993-05-21T00:00:00.000' AS DateTime), 233)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (56, N'Cletus', N'Hele', N'117-819-8224', CAST(N'1994-08-12T00:00:00.000' AS DateTime), 433)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (57, N'Gwyn', N'Bault', N'957-485-0269', CAST(N'1979-03-01T00:00:00.000' AS DateTime), 321)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (58, N'Schuyler', N'Cometti', N'694-960-3844', CAST(N'1970-06-18T00:00:00.000' AS DateTime), 12)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (59, N'Findlay', N'Kopecka', N'779-282-9955', CAST(N'1994-09-28T00:00:00.000' AS DateTime), 321)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (60, N'Betty', N'Ollivier', N'333-152-9076', CAST(N'1993-12-29T00:00:00.000' AS DateTime), 444)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (61, N'Kerry', N'Lammertz', N'496-476-0452', CAST(N'1995-10-14T00:00:00.000' AS DateTime), 42)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (62, N'Felicio', N'Colls', N'234-137-3192', CAST(N'1982-07-31T00:00:00.000' AS DateTime), 449)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (63, N'Micky', N'Alloisi', N'562-538-4833', CAST(N'1979-05-08T00:00:00.000' AS DateTime), 441)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (64, N'Stella', N'Leveridge', N'202-169-5665', CAST(N'1972-03-23T00:00:00.000' AS DateTime), 442)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (65, N'Dionysus', N'Moulsdall', N'171-793-4776', CAST(N'1969-08-19T00:00:00.000' AS DateTime), 443)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (66, N'Carlen', N'Sarjant', N'165-898-7645', CAST(N'1980-08-13T00:00:00.000' AS DateTime), 444)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (67, N'Lilian', N'Blues', N'818-865-4199', CAST(N'1981-05-02T00:00:00.000' AS DateTime), 445)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (68, N'Florance', N'Sellens', N'755-681-6584', CAST(N'1979-03-21T00:00:00.000' AS DateTime), 666)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (69, N'Franzen', N'Copyn', N'214-703-7682', CAST(N'1990-09-17T00:00:00.000' AS DateTime), 344)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (70, N'Fowler', N'Shevlan', N'975-215-4052', CAST(N'1983-01-30T00:00:00.000' AS DateTime), 424)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (71, N'Andie', N'Barajas', N'693-528-4262', CAST(N'1988-06-07T00:00:00.000' AS DateTime), 134)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (72, N'Daisie', N'Kann', N'757-505-7385', CAST(N'1982-03-09T00:00:00.000' AS DateTime), 129)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (73, N'Sid', N'Jukes', N'377-383-6158', CAST(N'1984-07-01T00:00:00.000' AS DateTime), 197)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (74, N'Margarete', N'Grassett', N'728-633-4946', CAST(N'1990-03-25T00:00:00.000' AS DateTime), 199)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (75, N'Ed', N'Semiras', N'109-771-7203', CAST(N'1993-07-05T00:00:00.000' AS DateTime), 198)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (76, N'Duky', N'Palphramand', N'972-192-0184', CAST(N'1985-10-16T00:00:00.000' AS DateTime), 39)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (77, N'Jenda', N'Freen', N'958-339-3005', CAST(N'1979-06-11T00:00:00.000' AS DateTime), 99)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (78, N'Nicolas', N'Dumelow', N'409-931-7168', CAST(N'1995-04-24T00:00:00.000' AS DateTime), 78)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (79, N'Hercules', N'Filyushkin', N'313-701-1643', CAST(N'1992-08-29T00:00:00.000' AS DateTime), 79)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (80, N'Nicky', N'Whewill', N'605-578-6577', CAST(N'2001-02-21T00:00:00.000' AS DateTime), 34)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (81, N'Arda', N'Brahan', N'882-972-7656', CAST(N'1986-06-30T00:00:00.000' AS DateTime), 46)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (82, N'Meridith', N'Jain', N'428-512-4325', CAST(N'1995-11-05T00:00:00.000' AS DateTime), 54)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (83, N'Danica', N'Ebbutt', N'994-400-5121', CAST(N'2000-09-11T00:00:00.000' AS DateTime), 54)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (84, N'Raf', N'Gayther', N'130-558-1561', CAST(N'1972-11-12T00:00:00.000' AS DateTime), 42)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (85, N'Arlee', N'Roscam', N'447-244-0052', CAST(N'1990-10-08T00:00:00.000' AS DateTime), 66)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (86, N'Zenia', N'Blitz', N'209-115-9626', CAST(N'1975-02-09T00:00:00.000' AS DateTime), 765)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (87, N'Gaby', N'Ferrero', N'473-491-8020', CAST(N'1996-05-27T00:00:00.000' AS DateTime), 56)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (88, N'Cindra', N'Markl', N'334-675-5212', CAST(N'1972-05-03T00:00:00.000' AS DateTime), 568)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (89, N'Dody', N'Laverenz', N'204-133-1870', CAST(N'1981-05-10T00:00:00.000' AS DateTime), 678)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (90, N'Richmond', N'Stobbart', N'786-483-0636', CAST(N'1987-09-02T00:00:00.000' AS DateTime), 754)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (91, N'Bernie', N'Housaman', N'209-471-9430', CAST(N'1974-05-18T00:00:00.000' AS DateTime), 345)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (92, N'Marty', N'Luna', N'858-960-5783', CAST(N'2000-03-14T00:00:00.000' AS DateTime), 345)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (93, N'Lanette', N'Vasquez', N'330-746-0829', CAST(N'1991-10-15T00:00:00.000' AS DateTime), 87)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (94, N'Eileen', N'Sposito', N'768-279-5922', CAST(N'1986-04-16T00:00:00.000' AS DateTime), 654)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (95, N'Zsa zsa', N'Mumberson', N'584-711-3029', CAST(N'1969-03-28T00:00:00.000' AS DateTime), 455)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (96, N'Cam', N'Grishagin', N'793-801-1194', CAST(N'1989-04-16T00:00:00.000' AS DateTime), 456)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (97, N'Chester', N'Tweedell', N'337-305-9425', CAST(N'1991-03-18T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (98, N'Aubine', N'Hubatsch', N'725-852-6099', CAST(N'1978-07-17T00:00:00.000' AS DateTime), 450)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (99, N'Fannie', N'Velde', N'449-533-8919', CAST(N'1978-05-16T00:00:00.000' AS DateTime), 600)
GO
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (100, N'Ellerey', N'Minogue', N'687-622-6313', CAST(N'1994-08-28T00:00:00.000' AS DateTime), 599)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (101, N'Eduardo', N'Twaite', N'506-716-5575', CAST(N'1999-04-27T00:00:00.000' AS DateTime), 432)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (102, N'Marya', N'Sore', N'905-351-3647', CAST(N'1984-12-13T00:00:00.000' AS DateTime), 424)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (103, N'Araldo', N'Northing', N'932-773-7479', CAST(N'1988-10-06T00:00:00.000' AS DateTime), 431)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (104, N'Christin', N'Fraanchyonok', N'751-898-2203', CAST(N'1984-08-19T00:00:00.000' AS DateTime), 412)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (105, N'Fonz', N'Fellnee', N'995-985-8535', CAST(N'1978-08-08T00:00:00.000' AS DateTime), 414)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (106, N'Magdalena', N'Shelsher', N'373-274-1510', CAST(N'1990-01-05T00:00:00.000' AS DateTime), 532)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (107, N'Inglis', N'Kneesha', N'330-267-1616', CAST(N'1972-09-19T00:00:00.000' AS DateTime), 421)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (108, N'Fran', N'Cheel', N'852-754-5515', CAST(N'1991-01-18T00:00:00.000' AS DateTime), 353)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (109, N'Stephen', N'Rupprecht', N'256-388-2369', CAST(N'1975-07-18T00:00:00.000' AS DateTime), 353)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (110, N'Danice', N'Jelphs', N'471-359-4400', CAST(N'1976-06-15T00:00:00.000' AS DateTime), 569)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (111, N'Rosalie', N'Tutchell', N'915-185-4888', CAST(N'2001-03-30T00:00:00.000' AS DateTime), 765)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (112, N'Woody', N'Ruskin', N'462-313-0587', CAST(N'1991-04-02T00:00:00.000' AS DateTime), 567)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (113, N'Deirdre', N'Wybourne', N'363-733-3675', CAST(N'1996-04-17T00:00:00.000' AS DateTime), 432)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (114, N'Mame', N'Trent', N'690-334-3615', CAST(N'1981-08-12T00:00:00.000' AS DateTime), 234)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (115, N'Willdon', N'Bartomeu', N'937-749-0153', CAST(N'1978-10-24T00:00:00.000' AS DateTime), 563)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (116, N'Datha', N'Bellward', N'843-419-0458', CAST(N'1983-12-12T00:00:00.000' AS DateTime), 535)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (117, N'Roderick', N'Crumb', N'515-595-1177', CAST(N'1996-02-29T00:00:00.000' AS DateTime), 367)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (118, N'Radcliffe', N'McNirlin', N'518-986-8366', CAST(N'1988-07-05T00:00:00.000' AS DateTime), 356)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (119, N'Hurleigh', N'Atmore', N'514-639-6334', CAST(N'1992-12-17T00:00:00.000' AS DateTime), 345)
INSERT [dbo].[Klient] ([KlientID], [Imie], [Nazwisko], [Telefon], [Data_urodzenia], [AdresID]) VALUES (120, N'Jenica', N'Jzhakov', N'207-644-6879', CAST(N'1974-06-06T00:00:00.000' AS DateTime), 765)
SET IDENTITY_INSERT [dbo].[Klient] OFF
GO
SET IDENTITY_INSERT [dbo].[Kontrahenci] ON 

INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (1, 54, N'Goodwin and Sons', N'7953947684', 584)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (2, 29, N'Cartwright Group', N'6718680036', 319)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (3, 27, N'Boyer, Erdman and Nicolas', N'3098401028', 52)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (4, 40, N'Veum, Kozey and Tremblay', N'7333993523', 18)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (5, 33, N'Jones LLC', N'6649001554', 386)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (6, 107, N'Abbott-Trantow', N'1594108854', 654)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (7, 50, N'Kihn-O''Kon', N'4386882936', 206)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (8, 69, N'Walker-Larson', N'5977433964', 413)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (9, 49, N'MacGyver Inc', N'1299979572', 488)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (10, 3, N'Wuckert, Grimes and Koss', N'0733808158', 23)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (11, 98, N'Marvin Inc', N'9183296220', 450)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (12, 57, N'Dietrich-Cartwright', N'0782957277', 23)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (13, 75, N'Johns, Carroll and Greenholt', N'4624033779', 708)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (14, 38, N'Gleichner-Lueilwitz', N'9394800565', 537)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (15, 17, N'Cronin Inc', N'2618565606', 53)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (16, 94, N'Lang, Herman and Beatty', N'1074254171', 488)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (17, 10, N'Jakubowski Group', N'0248829289', 604)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (18, 114, N'Harvey, Brekke and Hammes', N'4041088909', 463)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (19, 69, N'O''Keefe, Heaney and Little', N'1941929850', 382)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (20, 113, N'Altenwerth and Sons', N'3124456076', 212)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (21, 109, N'Cremin and Sons', N'0085139572', 357)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (22, 86, N'Medhurst-Zulauf', N'6702149654', 421)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (23, 25, N'Reynolds-Treutel', N'9794695211', 666)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (24, 111, N'Schroeder, Kerluke and Kassulke', N'7329053988', 464)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (25, 106, N'Satterfield Inc', N'6871660852', 706)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (26, 68, N'Davis, Veum and Roob', N'3898133176', 713)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (27, 70, N'Johns LLC', N'1498819699', 786)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (28, 46, N'Kunde-Gislason', N'5293158902', 657)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (29, 22, N'Rowe-Swift', N'2050943806', 405)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (30, 67, N'Macejkovic Inc', N'0650565444', 380)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (31, 95, N'Rowe LLC', N'9597015870', 654)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (32, 8, N'Metz, Gusikowski and Wisozk', N'9306087489', 749)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (33, 46, N'Kunze, Skiles and Balistreri', N'2645186289', 34)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (34, 38, N'Schroeder Inc', N'5286760856', 699)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (35, 87, N'Cormier-Nikolaus', N'8186625968', 435)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (36, 32, N'Monahan, O''Kon and Heathcote', N'5126525328', 233)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (37, 42, N'VonRueden-Halvorson', N'2647719276', 709)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (38, 75, N'Stiedemann, Brakus and Hessel', N'3227425009', 529)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (39, 40, N'Kutch Inc', N'6206990907', 422)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (40, 97, N'Rogahn and Sons', N'3399549733', 799)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (41, 47, N'Mante-Stiedemann', N'0011513764', 500)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (42, 1, N'Lehner LLC', N'0850473217', 106)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (43, 67, N'Lang-Hane', N'5245716550', 502)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (44, 89, N'Ernser, Becker and Leffler', N'8714265494', 321)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (45, 74, N'Waelchi-Hessel', N'6959400635', 468)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (46, 83, N'Gusikowski, Bechtelar and Effertz', N'9383735953', 194)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (47, 99, N'Pouros, Blanda and Donnelly', N'4286627055', 451)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (48, 109, N'Jenkins, Jerde and Bradtke', N'7675784839', 421)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (49, 107, N'Turcotte Group', N'4507030625', 771)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (50, 88, N'Pouros, Hane and Bashirian', N'9608986257', 496)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (51, 38, N'Little LLC', N'7238824094', 417)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (52, 105, N'Welch, Leuschke and Reinger', N'2775640028', 332)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (53, 110, N'Rath Group', N'4508652697', 500)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (54, 72, N'Ernser, Medhurst and Harris', N'7474661055', 654)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (55, 103, N'Kertzmann, Prosacco and Tremblay', N'0815367368', 99)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (56, 61, N'Shanahan, Tillman and Jacobs', N'4998617672', 298)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (57, 46, N'Kub and Sons', N'4358115764', 672)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (58, 90, N'Paucek, O''Hara and Gaylord', N'1705008674', 130)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (59, 95, N'Reichel-Harber', N'9032093932', 1)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (60, 37, N'Cremin-Zboncak', N'5730670486', 631)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (61, 29, N'Schamberger-Cassin', N'8538847457', 688)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (62, 16, N'Glover Group', N'1610115872', 73)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (63, 48, N'Dickens, Gottlieb and Schmidt', N'2471214614', 88)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (64, 56, N'O''Reilly-Corwin', N'5761289350', 333)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (65, 75, N'Larkin-Steuber', N'2622398816', 642)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (66, 22, N'Wolff-Nikolaus', N'8338558338', 707)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (67, 62, N'Romaguera-Emmerich', N'1854589970', 264)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (68, 6, N'Walsh Inc', N'3038232327', 124)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (69, 93, N'Bahringer-Conn', N'3797678363', 313)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (70, 68, N'Cummerata Group', N'6968214415', 535)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (71, 103, N'Smith Group', N'7715625981', 344)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (72, 60, N'Kuvalis, Romaguera and Reilly', N'0390755435', 532)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (73, 58, N'Prosacco Group', N'4333748119', 391)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (74, 105, N'Davis Inc', N'1648446078', 150)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (75, 32, N'Upton Group', N'2449747567', 630)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (76, 79, N'Bechtelar, Hagenes and Robel', N'7729959313', 509)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (77, 75, N'Hills, Becker and Runolfsdottir', N'7894663387', 322)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (78, 14, N'Rohan, Metz and Dicki', N'2049143044', 557)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (79, 36, N'Okuneva-Kassulke', N'9824330593', 215)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (80, 42, N'Lindgren LLC', N'3460038454', 399)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (81, 113, N'Ratke and Sons', N'2950146430', 584)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (82, 98, N'Hyatt Inc', N'0482793635', 514)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (83, 38, N'McKenzie, Daniel and Morar', N'0172828597', 732)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (84, 105, N'Von, Hammes and Ward', N'5422718003', 513)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (85, 38, N'Marvin LLC', N'3727064331', 37)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (86, 114, N'Durgan, Stehr and Nicolas', N'4635045536', 631)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (87, 43, N'Glover and Sons', N'2426281707', 671)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (88, 92, N'Davis, Hand and Terry', N'2671631316', 546)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (89, 113, N'Stamm-Russel', N'0214376591', 421)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (90, 30, N'Mitchell-Heathcote', N'8234879456', 584)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (91, 82, N'Stokes-Toy', N'1767555830', 749)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (92, 75, N'Hilll, Kilback and Bahringer', N'0566695367', 745)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (93, 27, N'Considine, Cartwright and Hermiston', N'5718648409', 745)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (94, 94, N'Abernathy, Walker and Dickens', N'6754053976', 706)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (95, 41, N'Swift-Vandervort', N'9355972032', 648)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (96, 119, N'Bahringer Inc', N'8634463699', 477)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (97, 50, N'Hills-Predovic', N'5933552534', 173)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (98, 36, N'Tremblay and Sons', N'4181782816', 728)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (99, 11, N'Lakin-Lang', N'5446878302', 283)
GO
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (100, 119, N'Shields and Sons', N'3854754361', 406)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (101, 100, N'Torphy LLC', N'0654999910', 335)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (102, 73, N'Heaney, Rice and Brakus', N'6158912638', 562)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (103, 69, N'Fay-Herman', N'3845865954', 591)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (104, 15, N'Russel, Witting and Yundt', N'9425169586', 412)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (105, 91, N'Rosenbaum, Quigley and Kovacek', N'2357924950', 315)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (106, 99, N'Mohr, Walker and Rippin', N'2544050403', 686)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (107, 105, N'Bahringer, Emard and Kuhn', N'9343940602', 114)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (108, 105, N'Mohr, Kertzmann and Bauch', N'3110973898', 494)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (109, 58, N'Pacocha and Sons', N'2757241281', 375)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (110, 51, N'Kuvalis Inc', N'6131006512', 244)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (111, 49, N'Hyatt and Sons', N'8787914611', 59)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (112, 32, N'Windler, Walter and Altenwerth', N'4646710048', 470)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (113, 93, N'Monahan LLC', N'9168983050', 716)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (114, 70, N'Batz, Goodwin and Dooley', N'8101113770', 537)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (115, 110, N'Stiedemann and Sons', N'7351701539', 389)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (116, 67, N'Rice Inc', N'9130659922', 769)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (117, 69, N'Kuphal-Lindgren', N'1272516415', 638)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (118, 97, N'Ferry, Blanda and Larkin', N'1104554917', 769)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (119, 81, N'Murazik, Hamill and Kuhn', N'7898011945', 175)
INSERT [dbo].[Kontrahenci] ([KontrahenciID], [KlientID], [Nazwa], [NIP], [AdresID]) VALUES (120, 71, N'Langosh and Sons', N'0709330073', 106)
SET IDENTITY_INSERT [dbo].[Kontrahenci] OFF
GO
SET IDENTITY_INSERT [dbo].[Obuwie] ON 

INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (1, 2, N'Brittle Spineflower', N'47', N'Crimson', N'79', 219.8600)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (2, 2, N'James'' Cryptantha', N'46', N'Teal', N'69', 234.3400)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (3, 2, N'Common Rue', N'35', N'Purple', N'56', 90.7200)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (4, 2, N'Licaria', N'48', N'Violet', N'1', 203.0800)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (5, 2, N'Northern Red Oak', N'31', N'Khaki', N'41', 264.8400)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (6, 2, N'Dwarf Stickpea', N'35', N'Mauv', N'87', 124.9200)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (7, 2, N'Cup Lichen', N'37', N'Yellow', N'7', 67.7000)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (8, 2, N'White Thoroughwort', N'43', N'Green', N'65', 81.2300)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (9, 2, N'Perennial Quakinggrass', N'38', N'Red', N'88', 84.0800)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (10, 2, N'Utah Columbine', N'33', N'Turquoise', N'27', 108.2600)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (11, 2, N'Western Fineleaf Pondweed', N'41', N'Khaki', N'9', 90.9800)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (12, 2, N'Thinleaf Goldenhead', N'33', N'Fuscia', N'41', 181.4600)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (13, 2, N'Coastal Plain Honeycombhead', N'29', N'Khaki', N'28', 268.1500)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (14, 2, N'Pignut', N'31', N'Turquoise', N'31', 59.0500)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (15, 2, N'Grimmia Dry Rock Moss', N'31', N'Pink', N'76', 129.6600)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (16, 2, N'Rimmed Lichen', N'42', N'Fuscia', N'6', 71.8300)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (17, 2, N'Fennel', N'36', N'Crimson', N'70', 151.9900)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (18, 2, N'Narrowleaf Minerslettuce', N'35', N'Violet', N'22', 289.6800)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (19, 2, N'Saltmeadow Cordgrass', N'37', N'Pink', N'87', 109.7200)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (20, 2, N'Alabama Serviceberry', N'42', N'Goldenrod', N'30', 75.8600)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (21, 2, N'Dogwoodleaf', N'34', N'Aquamarine', N'65', 61.1100)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (22, 2, N'Egg Milkvetch', N'30', N'Maroon', N'5', 244.6300)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (23, 2, N'Blue-leaf Stringybark', N'32', N'Mauv', N'86', 267.7900)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (24, 2, N'Common Fiddleneck', N'46', N'Pink', N'1', 228.3700)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (25, 2, N'Japanese Yam', N'49', N'Green', N'60', 248.1700)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (26, 2, N'Pulvinate Dry Rock Moss', N'31', N'Red', N'77', 263.4200)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (27, 2, N'Eastern Purple Coneflower', N'31', N'Purple', N'50', 217.7800)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (28, 2, N'Redtwig Doghobble', N'30', N'Indigo', N'1', 46.5200)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (29, 2, N'Point Reyes Bentgrass', N'34', N'Turquoise', N'96', 217.6600)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (30, 2, N'Variable Blackberry', N'35', N'Pink', N'35', 96.3700)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (31, 2, N'Broadlobe Phacelia', N'33', N'Blue', N'11', 229.5700)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (32, 2, N'Necklace Fern', N'42', N'Green', N'57', 94.8800)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (33, 2, N'Sawsedge', N'35', N'Blue', N'43', 219.1100)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (34, 2, N'Prickly Comfrey', N'43', N'Maroon', N'48', 48.2800)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (35, 2, N'Seringe Willow', N'31', N'Khaki', N'23', 76.2600)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (36, 2, N'Herb Of The Cross', N'41', N'Red', N'67', 221.6800)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (37, 2, N'Seaside Alumroot', N'46', N'Indigo', N'80', 262.5200)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (38, 2, N'Chamelaucium', N'30', N'Goldenrod', N'64', 169.0000)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (39, 2, N'Bristle Bent', N'37', N'Mauv', N'25', 222.5900)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (40, 2, N'Lanceleaf Goldenweed', N'44', N'Khaki', N'85', 262.3400)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (41, 2, N'Arizona Spikenard', N'34', N'Turquoise', N'34', 182.3100)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (42, 2, N'Hawthorn', N'30', N'Violet', N'30', 100.6000)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (43, 2, N'Dollar Orchid', N'29', N'Pink', N'64', 240.4500)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (44, 2, N'Senator Mine Alumroot', N'44', N'Mauv', N'79', 87.5700)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (45, 2, N'Bulletwood', N'32', N'Red', N'47', 215.3900)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (46, 2, N'Beardlip Penstemon', N'34', N'Maroon', N'80', 252.6100)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (47, 2, N'Skin Lichen', N'40', N'Orange', N'97', 121.4900)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (48, 2, N'Nail Lichen', N'44', N'Mauv', N'34', 124.5500)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (49, 2, N'Slender Sensitive Pea', N'30', N'Crimson', N'50', 119.5900)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (50, 2, N'Muehlenberg''s Nutrush', N'36', N'Crimson', N'40', 73.1800)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (51, 2, N'Boreal Sagebrush', N'41', N'Purple', N'2', 295.7500)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (52, 2, N'Iris', N'43', N'Fuscia', N'12', 290.4100)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (53, 2, N'Thelidium Lichen', N'49', N'Orange', N'16', 265.0100)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (54, 2, N'Florida Bluestem', N'35', N'Purple', N'9', 296.1100)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (55, 2, N'Rim Lichen', N'48', N'Mauv', N'42', 110.0100)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (56, 2, N'Sagebrush', N'29', N'Purple', N'71', 212.4300)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (57, 2, N'Cataract Physma Lichen', N'49', N'Indigo', N'93', 96.5700)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (58, 2, N'Pioneer Violet', N'38', N'Yellow', N'72', 118.9900)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (59, 2, N'Lescur''s Sphagnum', N'38', N'Blue', N'49', 66.4900)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (60, 2, N'Incised Agrimony', N'41', N'Puce', N'32', 103.7000)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (61, 2, N'Capitan Mountains Alumroot', N'36', N'Goldenrod', N'57', 196.4300)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (62, 2, N'Woman''s Tongue', N'39', N'Yellow', N'26', 237.4800)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (63, 2, N'Hybrid Pitcherplant', N'47', N'Mauv', N'10', 57.1400)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (64, 2, N'Trailplant', N'33', N'Yellow', N'77', 193.8600)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (65, 2, N'Nightblooming Cactus', N'41', N'Teal', N'22', 293.4500)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (66, 2, N'Western Coneflower', N'42', N'Blue', N'84', 253.3800)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (67, 2, N'Edible Milkpea', N'33', N'Purple', N'49', 213.2300)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (68, 2, N'Maidenplum', N'34', N'Yellow', N'51', 156.0700)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (69, 2, N'Catalina Island Mountain Mahogany', N'40', N'Aquamarine', N'51', 203.0600)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (70, 2, N'Upland Yellow Violet', N'34', N'Purple', N'39', 173.7100)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (71, 2, N'California Wax Myrtle', N'36', N'Crimson', N'86', 243.1800)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (72, 2, N'Persistent Sepal Yellowcress', N'36', N'Indigo', N'87', 264.1200)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (73, 2, N'Curvepod Fumewort', N'39', N'Blue', N'42', 238.4700)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (74, 2, N'Threepetal Bedstraw', N'37', N'Mauv', N'31', 78.4900)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (75, 2, N'Longleaf False Goldeneye', N'34', N'Fuscia', N'78', 284.2200)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (76, 2, N'Sea Dahlia', N'39', N'Violet', N'64', 68.0000)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (77, 2, N'Peking Cotoneaster', N'36', N'Blue', N'10', 101.1400)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (78, 2, N'Gallic Cracked Lichen', N'30', N'Turquoise', N'20', 201.4000)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (79, 2, N'Whitebuttons', N'30', N'Aquamarine', N'23', 50.2500)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (80, 2, N'Dwarf Prairie Clover', N'43', N'Purple', N'26', 154.6200)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (81, 2, N'Leiberg''s Panicum', N'48', N'Aquamarine', N'26', 205.7200)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (82, 2, N'Ragwort', N'35', N'Puce', N'91', 197.9600)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (83, 2, N'Mastic Tree', N'33', N'Goldenrod', N'7', 70.4100)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (84, 2, N'Estrella De Mar', N'37', N'Green', N'3', 151.0200)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (85, 2, N'Forest Plume Fern', N'33', N'Turquoise', N'11', 227.4500)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (86, 2, N'Needlegrass', N'29', N'Puce', N'68', 231.8200)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (87, 2, N'Zigzag Brake', N'49', N'Turquoise', N'97', 133.5000)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (88, 2, N'Southern Threecornerjack', N'45', N'Puce', N'52', 110.9300)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (89, 2, N'Yucatan Sage', N'49', N'Yellow', N'33', 266.7800)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (90, 2, N'Powdery Liveforever', N'30', N'Pink', N'10', 129.3400)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (91, 2, N'Arizona Willow', N'31', N'Aquamarine', N'28', 236.7800)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (92, 2, N'Butter And Eggs', N'36', N'Purple', N'60', 90.2700)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (93, 2, N'California Butterwort', N'34', N'Fuscia', N'84', 177.4800)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (94, 2, N'Fremont Cottonwood', N'41', N'Teal', N'3', 198.4900)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (95, 2, N'Whitewoolly Rose', N'34', N'Turquoise', N'95', 270.5600)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (96, 2, N'Mearns'' Bird''s-foot Trefoil', N'29', N'Purple', N'99', 154.3800)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (97, 2, N'Mouseear Hawkweed', N'37', N'Violet', N'1', 163.5100)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (98, 2, N'Whiteheart', N'41', N'Violet', N'88', 141.8300)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (99, 2, N'Fremont''s Milkvetch', N'48', N'Red', N'24', 93.8300)
GO
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (100, 2, N'Wild Garlic', N'40', N'Turquoise', N'43', 152.5000)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (101, 2, N'Tortured Tortella Moss', N'48', N'Indigo', N'75', 298.8200)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (102, 2, N'Firmleaf Willow', N'49', N'Mauv', N'41', 294.4800)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (103, 2, N'Small-leaf Angelica', N'45', N'Purple', N'48', 253.3300)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (104, 2, N'Wartremoving Herb', N'34', N'Purple', N'5', 269.0600)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (105, 2, N'Purple Pitcherplant', N'48', N'Violet', N'69', 277.2700)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (106, 2, N'Douglas'' Silverpuffs', N'46', N'Turquoise', N'16', 239.3200)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (107, 2, N'Caulerpa', N'30', N'Teal', N'2', 176.0400)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (108, 2, N'Bluish Spikemoss', N'32', N'Khaki', N'62', 141.1700)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (109, 2, N'Double Cinnamon Rose', N'31', N'Aquamarine', N'94', 74.3300)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (110, 2, N'King''s Plateau Sandwort', N'36', N'Fuscia', N'78', 232.7700)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (111, 2, N'Siberian Springbeauty', N'42', N'Blue', N'17', 216.0700)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (112, 2, N'Silk Cottontree', N'35', N'Purple', N'77', 85.1300)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (113, 2, N'Polyblastia Lichen', N'44', N'Red', N'20', 232.8800)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (114, 2, N'Sandyplain Clustervine', N'44', N'Mauv', N'3', 172.3400)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (115, 2, N'Buckeye', N'48', N'Goldenrod', N'79', 204.8000)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (116, 2, N'Ovate Pterygoneurum Moss', N'41', N'Blue', N'47', 151.5500)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (117, 2, N'Grassleaf Coneflower', N'38', N'Yellow', N'88', 62.4700)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (118, 2, N'Psilopilum Moss', N'45', N'Yellow', N'99', 189.8700)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (119, 2, N'Slender Woolly Buckwheat', N'33', N'Fuscia', N'74', 124.1600)
INSERT [dbo].[Obuwie] ([ObuwieID], [KategoriaID], [Nazwa_obuwia], [Rozmiar_obuwia], [Kolor_obuwia], [Ilosc_w_magazynie], [cena]) VALUES (120, 2, N'Arizona Fiestaflower', N'33', N'Yellow', N'24', 57.7000)
SET IDENTITY_INSERT [dbo].[Obuwie] OFF
GO
SET IDENTITY_INSERT [dbo].[Odziez] ON 

INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (1, 1, N'Red Bluff Dwarf Rush', N'XL', N'Mauv', N'82', 266.2200)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (2, 1, N'Sedge', N'3XL', N'Khaki', N'72', 281.7000)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (3, 1, N'Hypotrachyna Lichen', N'3XL', N'Pink', N'14', 49.9300)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (4, 1, N'White Colorado Columbine', N'S', N'Indigo', N'59', 171.2200)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (5, 1, N'Spoonshape Barbara''s Buttons', N'M', N'Orange', N'60', 96.2900)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (6, 1, N'Waxy Bonnet Orchid', N'L', N'Khaki', N'25', 183.4200)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (7, 1, N'Missouri Maidenbush', N'XL', N'Pink', N'67', 216.3500)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (8, 1, N'Pearlflower', N'3XL', N'Blue', N'47', 272.6900)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (9, 1, N'Bear Valley Sandwort', N'S', N'Khaki', N'41', 230.8500)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (10, 1, N'Seringe Willow', N'M', N'Yellow', N'80', 255.4800)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (11, 1, N'Schoepfia', N'L', N'Goldenrod', N'4', 277.9600)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (12, 1, N'Longleaf Brickellbush', N'XL', N'Turquoise', N'76', 292.1200)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (13, 1, N'Ribbed False Pennyroyal', N'XS', N'Green', N'84', 83.0200)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (14, 1, N'Lava Lobelia', N'M', N'Crimson', N'68', 212.2500)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (15, 1, N'Woodvine', N'L', N'Orange', N'85', 252.6000)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (16, 1, N'Cup Lichen', N'2XL', N'Green', N'13', 238.0800)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (17, 1, N'Mexican Blueberry', N'M', N'Goldenrod', N'96', 154.4400)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (18, 1, N'Britton''s Spikerush', N'2XL', N'Goldenrod', N'78', 279.3100)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (19, 1, N'Oakfern', N'S', N'Blue', N'6', 202.0600)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (20, 1, N'High-climbing Jointfir', N'3XL', N'Khaki', N'9', 210.4000)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (21, 1, N'Wart Lichen', N'M', N'Green', N'33', 285.9600)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (22, 1, N'Limewater Brookweed', N'2XL', N'Khaki', N'38', 160.3800)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (23, 1, N'Shrubby Bedstraw', N'XL', N'Goldenrod', N'14', 127.5600)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (24, 1, N'Deam''s Goldenrod', N'M', N'Fuscia', N'3', 261.8900)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (25, 1, N'Neobrackenridge''s Spleenwort', N'XL', N'Crimson', N'15', 86.7200)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (26, 1, N'Hairyfruit Valerian', N'XS', N'Turquoise', N'77', 241.2800)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (27, 1, N'Albaida', N'S', N'Crimson', N'46', 97.2700)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (28, 1, N'Texas Townsend Daisy', N'XL', N'Pink', N'53', 75.2700)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (29, 1, N'Mt. Kahili Phyllostegia', N'S', N'Khaki', N'93', 251.0500)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (30, 1, N'Olopu', N'3XL', N'Aquamarine', N'62', 171.8400)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (31, 1, N'Chiricahua Mountain Alumroot', N'XS', N'Yellow', N'58', 79.4500)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (32, 1, N'Giant Chinquapin', N'XS', N'Fuscia', N'2', 137.8300)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (33, 1, N'Cutleaf Balsamroot', N'XS', N'Orange', N'55', 186.0600)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (34, 1, N'Foldedleaf Grass', N'XS', N'Red', N'46', 128.3800)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (35, 1, N'Pili Uka', N'XL', N'Blue', N'68', 123.2700)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (36, 1, N'Mt. Davis Brickellbush', N'L', N'Indigo', N'34', 292.4800)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (37, 1, N'California Tortula Moss', N'2XL', N'Khaki', N'17', 262.5900)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (38, 1, N'Trailing Windmills', N'M', N'Fuscia', N'56', 111.1900)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (39, 1, N'Adonis Blazingstar', N'2XL', N'Orange', N'20', 258.8200)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (40, 1, N'Asian Ticktrefoil', N'M', N'Puce', N'54', 92.8400)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (41, 1, N'Sensitive Partridge Pea', N'XS', N'Violet', N'95', 162.6700)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (42, 1, N'Doubleform Snoutbean', N'L', N'Aquamarine', N'50', 256.3400)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (43, 1, N'Dominican Staggerbush', N'S', N'Turquoise', N'58', 109.1400)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (44, 1, N'Bishop''s Goutweed', N'3XL', N'Mauv', N'71', 102.0900)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (45, 1, N'Cleftleaf Wildheliotrope', N'M', N'Khaki', N'7', 270.1200)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (46, 1, N'California Bastard Toadflax', N'M', N'Puce', N'65', 117.5600)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (47, 1, N'Halecania Lichen', N'2XL', N'Mauv', N'79', 67.3500)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (48, 1, N'Prickly Currant', N'3XL', N'Fuscia', N'38', 121.5000)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (49, 1, N'Kauai Clermontia', N'S', N'Indigo', N'63', 285.8100)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (50, 1, N'Red Hills Vervain', N'M', N'Teal', N'39', 288.1700)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (51, 1, N'Ciruelas', N'3XL', N'Turquoise', N'99', 153.0200)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (52, 1, N'Arctic Sweet Coltsfoot', N'2XL', N'Blue', N'46', 198.9900)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (53, 1, N'Shrubby Jointvetch', N'3XL', N'Purple', N'9', 181.8400)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (54, 1, N'Stillman''s Needlegrass', N'2XL', N'Aquamarine', N'49', 295.5300)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (55, 1, N'Kahuaha Forest Peperomia', N'XS', N'Turquoise', N'75', 62.5500)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (56, 1, N'New Mexico Starviolet', N'2XL', N'Crimson', N'91', 100.1300)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (57, 1, N'Barrelier''s Woodsorrel', N'XL', N'Maroon', N'47', 229.0500)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (58, 1, N'Roof''s Manzanita', N'S', N'Mauv', N'48', 278.9300)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (59, 1, N'Gila River Waterhyssop', N'S', N'Red', N'11', 77.6500)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (60, 1, N'Edrudia Lichen', N'2XL', N'Crimson', N'67', 285.4200)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (61, 1, N'Slender Milkvetch', N'3XL', N'Aquamarine', N'66', 146.1100)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (62, 1, N'Cracked Lichen', N'2XL', N'Fuscia', N'33', 249.9100)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (63, 1, N'Pallid Flatsedge', N'L', N'Turquoise', N'91', 195.4500)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (64, 1, N'Waxberry', N'L', N'Teal', N'85', 102.1000)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (65, 1, N'Carrotleaf Biscuitroot', N'M', N'Pink', N'74', 72.0300)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (66, 1, N'Rice Bean', N'S', N'Goldenrod', N'45', 152.6000)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (67, 1, N'Callingcard Vine', N'S', N'Indigo', N'37', 188.2300)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (68, 1, N'Bluebell Bellflower', N'XS', N'Mauv', N'90', 74.6800)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (69, 1, N'Chaffweed', N'2XL', N'Purple', N'92', 91.5800)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (70, 1, N'California Broomrape', N'2XL', N'Mauv', N'7', 174.9300)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (71, 1, N'Singleleaf Pinyon', N'3XL', N'Crimson', N'58', 92.7100)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (72, 1, N'Bract Gumweed', N'3XL', N'Maroon', N'76', 59.4500)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (73, 1, N'Doncella', N'XS', N'Purple', N'12', 286.1400)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (74, 1, N'Yellow Evening Primrose', N'XL', N'Aquamarine', N'41', 161.5200)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (75, 1, N'Grassleaf Pea', N'XL', N'Maroon', N'55', 92.4700)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (76, 1, N'Clappertonia', N'L', N'Orange', N'64', 233.0900)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (77, 1, N'Inyo Princesplume', N'3XL', N'Red', N'49', 269.9500)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (78, 1, N'Pyrenothrix Lichen', N'S', N'Puce', N'26', 98.3700)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (79, 1, N'Johnny Reb Hawthorn', N'2XL', N'Goldenrod', N'13', 223.0900)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (80, 1, N'Fourvalve Mimosa', N'L', N'Orange', N'29', 84.1900)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (81, 1, N'Coastal Hedgenettle', N'3XL', N'Teal', N'29', 148.5600)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (82, 1, N'Woodreed', N'2XL', N'Purple', N'71', 219.0900)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (83, 1, N'Bejuco De Miel', N'L', N'Maroon', N'94', 238.0800)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (84, 1, N'Allen''s Pentachaeta', N'S', N'Puce', N'93', 174.9900)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (85, 1, N'Oregon Checkerbloom', N'L', N'Turquoise', N'63', 192.7300)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (86, 1, N'Pioneer Violet', N'2XL', N'Indigo', N'50', 109.2300)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (87, 1, N'Sibbaldia', N'S', N'Orange', N'60', 214.7200)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (88, 1, N'Parmotrema Lichen', N'S', N'Turquoise', N'67', 223.7500)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (89, 1, N'Lungwort', N'3XL', N'Crimson', N'7', 175.3400)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (90, 1, N'Norwegian Whitlowgrass', N'XS', N'Pink', N'30', 241.1700)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (91, 1, N'Dwarf Blue-eyed Grass', N'XL', N'Puce', N'73', 124.5300)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (92, 1, N'Sierra Woolly Indian Paintbrush', N'L', N'Green', N'46', 84.4000)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (93, 1, N'Rim Lichen', N'XS', N'Teal', N'81', 277.6400)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (94, 1, N'Payson''s Draba', N'S', N'Violet', N'49', 229.0000)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (95, 1, N'Oahu Wild Coffee', N'XL', N'Turquoise', N'64', 41.5100)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (96, 1, N'Wart Lichen', N'2XL', N'Goldenrod', N'27', 56.1000)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (97, 1, N'Eastern Fox Sedge', N'3XL', N'Mauv', N'29', 150.1900)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (98, 1, N'Wedge Sandmat', N'XS', N'Aquamarine', N'41', 156.1900)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (99, 1, N'Florida Speargrass', N'S', N'Puce', N'68', 52.6600)
GO
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (100, 1, N'Woollygrass', N'S', N'Fuscia', N'12', 170.0500)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (101, 1, N'Island Orange Lichen', N'L', N'Purple', N'8', 91.7000)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (102, 1, N'Branched Draba', N'3XL', N'Purple', N'55', 60.0200)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (103, 1, N'Itchgrass', N'L', N'Red', N'96', 166.0900)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (104, 1, N'Cana Gorda Girdlepod', N'XL', N'Crimson', N'15', 239.0400)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (105, 1, N'Piedmont False Pimpernel', N'S', N'Indigo', N'8', 206.4300)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (106, 1, N'Missouri Sedge', N'2XL', N'Crimson', N'15', 159.8700)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (107, 1, N'Verde Four-nerve Daisy', N'M', N'Teal', N'63', 51.4400)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (108, 1, N'Parmotrema Lichen', N'3XL', N'Blue', N'89', 246.1200)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (109, 1, N'Purple Speargrass', N'S', N'Blue', N'56', 291.1800)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (110, 1, N'Dentnut Cryptantha', N'M', N'Blue', N'37', 176.6900)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (111, 1, N'Wart Lichen', N'M', N'Aquamarine', N'99', 295.8800)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (112, 1, N'Alternate-leaf Golden Saxifrage', N'3XL', N'Aquamarine', N'78', 71.1200)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (113, 1, N'Mueller''s Isopterygiopsis Moss', N'M', N'Blue', N'40', 54.9100)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (114, 1, N'Mathis'' Spiderling', N'3XL', N'Yellow', N'92', 126.4100)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (115, 1, N'Dwarf Erythrina', N'3XL', N'Puce', N'90', 202.8900)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (116, 1, N'Evergreen Everlasting', N'S', N'Orange', N'59', 109.3600)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (117, 1, N'Mearns'' Bird''s-foot Trefoil', N'M', N'Orange', N'21', 218.4500)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (118, 1, N'Rosy Malanga', N'XL', N'Fuscia', N'12', 183.0400)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (119, 1, N'Cracked Lichen', N'2XL', N'Puce', N'96', 71.0100)
INSERT [dbo].[Odziez] ([OdziezID], [KategoriaID], [Nazwa_odziezy], [Rozmiar_odziezy], [Kolor_odziezy], [Ilosc_w_magazynie], [Cena]) VALUES (120, 1, N'Red Rosemallow', N'XS', N'Indigo', N'47', 213.0200)
SET IDENTITY_INSERT [dbo].[Odziez] OFF
GO
SET IDENTITY_INSERT [dbo].[Opinia] ON 

INSERT [dbo].[Opinia] ([OpiniaID], [Tresc_opinii]) VALUES (1, N'POLECAM')
INSERT [dbo].[Opinia] ([OpiniaID], [Tresc_opinii]) VALUES (2, N'NIE POLECAM')
SET IDENTITY_INSERT [dbo].[Opinia] OFF
GO
SET IDENTITY_INSERT [dbo].[Pracownicy] ON 

INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (1, N'Rodolph', N'Bibey', N'Kierownik', N'819-624-0702', CAST(N'1994-12-03T00:00:00.000' AS DateTime), N'5945882844', CAST(3669 AS Decimal(18, 0)), 22)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (2, N'Karly', N'Melladew', N'Sprzedawca', N'767-228-7336', CAST(N'1972-09-02T00:00:00.000' AS DateTime), N'5284252128', CAST(3358 AS Decimal(18, 0)), 23)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (3, N'Julio', N'Atkinson', N'Sprzedawca', N'868-809-8681', CAST(N'1995-12-26T00:00:00.000' AS DateTime), N'6482601464', CAST(3346 AS Decimal(18, 0)), 245)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (4, N'Doris', N'Buntin', N'Menedzer', N'865-260-4378', CAST(N'1992-01-16T00:00:00.000' AS DateTime), N'8064623405', CAST(5787 AS Decimal(18, 0)), 324)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (5, N'Parker', N'Belford', N'Kierownik', N'947-909-2121', CAST(N'1984-05-25T00:00:00.000' AS DateTime), N'6224090327', CAST(3704 AS Decimal(18, 0)), 213)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (6, N'Theodora', N'Denzey', N'Sprzedawca', N'868-315-5537', CAST(N'1983-07-12T00:00:00.000' AS DateTime), N'6505669116', CAST(5135 AS Decimal(18, 0)), 564)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (7, N'Ivan', N'Hayes', N'Sprzedawca', N'380-885-2506', CAST(N'1984-12-28T00:00:00.000' AS DateTime), N'5465100850', CAST(5160 AS Decimal(18, 0)), 765)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (8, N'Aurthur', N'Newbatt', N'Kierownik', N'650-416-7248', CAST(N'1977-11-19T00:00:00.000' AS DateTime), N'1654325341', CAST(4972 AS Decimal(18, 0)), 42)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (9, N'Gena', N'Tearney', N'Kierownik', N'432-432-9078', CAST(N'1995-06-04T00:00:00.000' AS DateTime), N'9115687937', CAST(3772 AS Decimal(18, 0)), 455)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (10, N'Boonie', N'Dykas', N'Sprzedawca', N'736-690-5092', CAST(N'1973-10-03T00:00:00.000' AS DateTime), N'8523187731', CAST(3850 AS Decimal(18, 0)), 800)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (11, N'Keen', N'Nissle', N'Kierownik', N'924-758-1320', CAST(N'1977-10-04T00:00:00.000' AS DateTime), N'2549297547', CAST(3723 AS Decimal(18, 0)), 654)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (12, N'Lauree', N'Long', N'Kierownik', N'780-735-2955', CAST(N'1997-07-06T00:00:00.000' AS DateTime), N'8113472894', CAST(2736 AS Decimal(18, 0)), 432)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (13, N'Ardeen', N'Covet', N'Sprzedawca', N'792-694-1748', CAST(N'1979-03-24T00:00:00.000' AS DateTime), N'8029134304', CAST(2835 AS Decimal(18, 0)), 413)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (14, N'Merrie', N'Jewers', N'Kierownik', N'583-826-5124', CAST(N'1975-04-23T00:00:00.000' AS DateTime), N'0005244366', CAST(3023 AS Decimal(18, 0)), 122)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (15, N'Mireille', N'McGuane', N'Sprzedawca', N'789-181-7853', CAST(N'1983-04-16T00:00:00.000' AS DateTime), N'7197174147', CAST(5261 AS Decimal(18, 0)), 111)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (16, N'Hope', N'Wollen', N'Sprzedawca', N'366-866-4891', CAST(N'1994-05-29T00:00:00.000' AS DateTime), N'1534206868', CAST(3710 AS Decimal(18, 0)), 222)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (17, N'Konstantine', N'Louw', N'Sprzedawca', N'997-737-0866', CAST(N'1970-05-10T00:00:00.000' AS DateTime), N'9634156886', CAST(4039 AS Decimal(18, 0)), 444)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (18, N'Wilona', N'Purnell', N'Sprzedawca', N'908-389-9979', CAST(N'1985-02-24T00:00:00.000' AS DateTime), N'6903934383', CAST(2662 AS Decimal(18, 0)), 335)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (19, N'Kennan', N'Basketfield', N'Sprzedawca', N'634-375-7146', CAST(N'1994-02-16T00:00:00.000' AS DateTime), N'4784781129', CAST(3175 AS Decimal(18, 0)), 777)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (20, N'Joel', N'Paschek', N'Sprzedawca', N'240-513-6285', CAST(N'1974-02-07T00:00:00.000' AS DateTime), N'1830680633', CAST(3065 AS Decimal(18, 0)), 443)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (21, N'Laryssa', N'Morriss', N'Sprzedawca', N'541-429-7951', CAST(N'1973-08-25T00:00:00.000' AS DateTime), N'2872126619', CAST(3457 AS Decimal(18, 0)), 444)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (22, N'Dorelia', N'Seven', N'Sprzedawca', N'476-731-5978', CAST(N'1991-08-11T00:00:00.000' AS DateTime), N'5211093682', CAST(3979 AS Decimal(18, 0)), 331)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (23, N'Stanwood', N'Jones', N'Sprzedawca', N'290-923-9349', CAST(N'1972-11-27T00:00:00.000' AS DateTime), N'3454677165', CAST(3962 AS Decimal(18, 0)), 765)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (24, N'Casie', N'McIlenna', N'Sprzedawca', N'754-325-0426', CAST(N'1993-05-05T00:00:00.000' AS DateTime), N'2717714782', CAST(5119 AS Decimal(18, 0)), 444)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (25, N'Ranique', N'Goolding', N'Sprzedawca', N'748-650-7740', CAST(N'1991-01-26T00:00:00.000' AS DateTime), N'5958571427', CAST(4830 AS Decimal(18, 0)), 33)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (26, N'Solly', N'Vannet', N'Kierownik', N'685-642-7931', CAST(N'1973-08-09T00:00:00.000' AS DateTime), N'6796200616', CAST(3900 AS Decimal(18, 0)), 222)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (27, N'Anetta', N'Taleworth', N'Sprzedawca', N'148-322-5560', CAST(N'1978-02-07T00:00:00.000' AS DateTime), N'0863971504', CAST(4702 AS Decimal(18, 0)), 345)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (28, N'Melita', N'Jakubczyk', N'Sprzedawca', N'907-174-2940', CAST(N'1981-03-03T00:00:00.000' AS DateTime), N'5772328360', CAST(5228 AS Decimal(18, 0)), 567)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (29, N'Corliss', N'Vannuccinii', N'Sprzedawca', N'639-115-5878', CAST(N'1970-12-31T00:00:00.000' AS DateTime), N'6626863819', CAST(3755 AS Decimal(18, 0)), 654)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (30, N'Elnora', N'Revans', N'Sprzedawca', N'957-606-3956', CAST(N'1973-06-22T00:00:00.000' AS DateTime), N'8955967055', CAST(3302 AS Decimal(18, 0)), 356)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (31, N'Aurea', N'Heintsch', N'Sprzedawca', N'697-138-5236', CAST(N'1978-08-05T00:00:00.000' AS DateTime), N'2449792147', CAST(2612 AS Decimal(18, 0)), 779)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (32, N'Delmar', N'Behnke', N'Sprzedawca', N'170-879-3474', CAST(N'1973-03-29T00:00:00.000' AS DateTime), N'7438295397', CAST(4182 AS Decimal(18, 0)), 776)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (33, N'Hadleigh', N'Roels', N'Sprzedawca', N'904-309-1631', CAST(N'1988-09-22T00:00:00.000' AS DateTime), N'4744191835', CAST(2887 AS Decimal(18, 0)), 666)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (34, N'Demetria', N'Riddiough', N'Sprzedawca', N'596-185-6688', CAST(N'1995-03-31T00:00:00.000' AS DateTime), N'1009290649', CAST(3598 AS Decimal(18, 0)), 778)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (35, N'Klara', N'Burfitt', N'Sprzedawca', N'225-986-1346', CAST(N'1971-08-27T00:00:00.000' AS DateTime), N'7879957383', CAST(5188 AS Decimal(18, 0)), 773)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (36, N'Eugenio', N'Fylan', N'Kierownik', N'812-692-1656', CAST(N'1978-01-04T00:00:00.000' AS DateTime), N'0327554584', CAST(4439 AS Decimal(18, 0)), 775)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (37, N'Chrissie', N'Mawne', N'Sprzedawca', N'215-209-0595', CAST(N'1998-04-28T00:00:00.000' AS DateTime), N'5442438502', CAST(4826 AS Decimal(18, 0)), 774)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (38, N'Norah', N'Bubear', N'Sprzedawca', N'736-511-4871', CAST(N'1979-07-05T00:00:00.000' AS DateTime), N'0102455899', CAST(3690 AS Decimal(18, 0)), 773)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (39, N'Irvin', N'Ellerby', N'Sprzedawca', N'303-694-8192', CAST(N'1997-09-12T00:00:00.000' AS DateTime), N'8690347259', CAST(4211 AS Decimal(18, 0)), 324)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (40, N'Stormi', N'Pohling', N'Sprzedawca', N'891-111-2784', CAST(N'1997-04-29T00:00:00.000' AS DateTime), N'1311943218', CAST(5121 AS Decimal(18, 0)), 553)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (41, N'Caralie', N'Devons', N'Sprzedawca', N'490-303-4181', CAST(N'1977-08-31T00:00:00.000' AS DateTime), N'1532674104', CAST(5040 AS Decimal(18, 0)), 432)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (42, N'Jilly', N'Wiskar', N'Sprzedawca', N'634-777-5090', CAST(N'1995-09-17T00:00:00.000' AS DateTime), N'7832604069', CAST(4747 AS Decimal(18, 0)), 423)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (43, N'Feliks', N'Edeson', N'Sprzedawca', N'473-730-8951', CAST(N'1984-12-15T00:00:00.000' AS DateTime), N'2109951745', CAST(4091 AS Decimal(18, 0)), 42)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (44, N'Jillian', N'Celez', N'Sprzedawca', N'339-817-6567', CAST(N'1985-12-24T00:00:00.000' AS DateTime), N'5647384242', CAST(4494 AS Decimal(18, 0)), 78)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (45, N'Page', N'Paladini', N'Sprzedawca', N'423-441-3277', CAST(N'1972-02-06T00:00:00.000' AS DateTime), N'1786976862', CAST(3591 AS Decimal(18, 0)), 77)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (46, N'Cathe', N'Cud', N'Sprzedawca', N'609-461-7947', CAST(N'1992-09-21T00:00:00.000' AS DateTime), N'5589526795', CAST(4652 AS Decimal(18, 0)), 124)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (47, N'Kissee', N'McPhelim', N'Sprzedawca', N'906-855-0892', CAST(N'1978-09-05T00:00:00.000' AS DateTime), N'3593139340', CAST(4460 AS Decimal(18, 0)), 78)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (48, N'Broddie', N'Knoles', N'Sprzedawca', N'854-866-8132', CAST(N'1994-11-05T00:00:00.000' AS DateTime), N'9218978772', CAST(2813 AS Decimal(18, 0)), 665)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (49, N'Rosamund', N'Sigart', N'Sprzedawca', N'727-215-2958', CAST(N'1978-08-15T00:00:00.000' AS DateTime), N'5826776803', CAST(4538 AS Decimal(18, 0)), 100)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (50, N'Rowe', N'Heaker', N'Sprzedawca', N'231-217-3226', CAST(N'1988-02-20T00:00:00.000' AS DateTime), N'8902720942', CAST(4623 AS Decimal(18, 0)), 102)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (51, N'Norris', N'Portingale', N'Sprzedawca', N'901-138-2110', CAST(N'1973-10-08T00:00:00.000' AS DateTime), N'8539888653', CAST(4570 AS Decimal(18, 0)), 12)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (52, N'Jackie', N'Leathers', N'Sprzedawca', N'472-529-8877', CAST(N'1991-12-08T00:00:00.000' AS DateTime), N'3979585921', CAST(4242 AS Decimal(18, 0)), 105)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (53, N'Yetta', N'Sowte', N'Sprzedawca', N'363-810-2018', CAST(N'1978-08-16T00:00:00.000' AS DateTime), N'9042245654', CAST(2835 AS Decimal(18, 0)), 107)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (54, N'Georgia', N'Hylands', N'Sprzedawca', N'647-334-5451', CAST(N'1970-09-27T00:00:00.000' AS DateTime), N'2972167155', CAST(3761 AS Decimal(18, 0)), 108)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (55, N'Juditha', N'Kittman', N'Sprzedawca', N'976-180-9863', CAST(N'1992-07-15T00:00:00.000' AS DateTime), N'3277004600', CAST(3149 AS Decimal(18, 0)), 675)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (56, N'Wendie', N'Crowhurst', N'Sprzedawca', N'740-661-7878', CAST(N'1974-11-14T00:00:00.000' AS DateTime), N'6821252335', CAST(3535 AS Decimal(18, 0)), 109)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (57, N'Erin', N'Stollard', N'Kierownik', N'648-778-4039', CAST(N'1999-04-19T00:00:00.000' AS DateTime), N'4113407347', CAST(3240 AS Decimal(18, 0)), 110)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (58, N'Fleurette', N'Duffree', N'Kierownik', N'525-766-4408', CAST(N'1983-01-20T00:00:00.000' AS DateTime), N'5939655726', CAST(4386 AS Decimal(18, 0)), 443)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (59, N'Chucho', N'Blundon', N'Sprzedawca', N'186-308-4081', CAST(N'1976-12-18T00:00:00.000' AS DateTime), N'5402922195', CAST(5329 AS Decimal(18, 0)), 123)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (60, N'Ursala', N'Bubbear', N'Sprzedawca', N'915-754-3864', CAST(N'1998-11-20T00:00:00.000' AS DateTime), N'3967088863', CAST(3451 AS Decimal(18, 0)), 435)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (61, N'Lelah', N'Raddan', N'Sprzedawca', N'946-324-2433', CAST(N'1978-10-06T00:00:00.000' AS DateTime), N'3004242044', CAST(5264 AS Decimal(18, 0)), 654)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (62, N'Catharina', N'Stell', N'Sprzedawca', N'514-293-3391', CAST(N'1974-04-17T00:00:00.000' AS DateTime), N'1199877212', CAST(2838 AS Decimal(18, 0)), 456)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (63, N'Kerry', N'MacMaykin', N'Sprzedawca', N'441-148-2463', CAST(N'1994-08-31T00:00:00.000' AS DateTime), N'0590988395', CAST(4988 AS Decimal(18, 0)), 754)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (64, N'Lizzie', N'Hilliam', N'Sprzedawca', N'268-188-1185', CAST(N'1995-08-18T00:00:00.000' AS DateTime), N'1193234328', CAST(3338 AS Decimal(18, 0)), 489)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (65, N'Tine', N'Blackmore', N'Sprzedawca', N'687-299-1741', CAST(N'1978-09-17T00:00:00.000' AS DateTime), N'6885084891', CAST(4284 AS Decimal(18, 0)), 499)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (66, N'Jewel', N'Domsalla', N'Kierownik', N'641-716-3584', CAST(N'1989-04-17T00:00:00.000' AS DateTime), N'5166621107', CAST(4244 AS Decimal(18, 0)), 478)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (67, N'Fayth', N'Speeks', N'Kierownik', N'580-485-6536', CAST(N'1988-05-18T00:00:00.000' AS DateTime), N'8016607195', CAST(4804 AS Decimal(18, 0)), 498)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (68, N'Corty', N'Krikorian', N'Sprzedawca', N'169-441-9539', CAST(N'1975-06-11T00:00:00.000' AS DateTime), N'5961502902', CAST(4792 AS Decimal(18, 0)), 789)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (69, N'Madella', N'Kendell', N'Kierownik', N'590-265-4960', CAST(N'1984-08-16T00:00:00.000' AS DateTime), N'6223647298', CAST(5224 AS Decimal(18, 0)), 23)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (70, N'Roldan', N'McGreil', N'Sprzedawca', N'587-471-3358', CAST(N'1972-11-14T00:00:00.000' AS DateTime), N'1939991846', CAST(3316 AS Decimal(18, 0)), 64)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (71, N'Dael', N'Martel', N'Sprzedawca', N'539-117-1461', CAST(N'1983-01-11T00:00:00.000' AS DateTime), N'0863257445', CAST(5297 AS Decimal(18, 0)), 52)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (72, N'Merry', N'Vinnick', N'Kierownik', N'881-806-7719', CAST(N'1981-07-27T00:00:00.000' AS DateTime), N'3880069808', CAST(3457 AS Decimal(18, 0)), 432)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (73, N'Daven', N'Allerton', N'Sprzedawca', N'454-818-7484', CAST(N'1981-12-28T00:00:00.000' AS DateTime), N'6351958415', CAST(5662 AS Decimal(18, 0)), 54)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (74, N'Diana', N'Cogdon', N'Sprzedawca', N'138-967-2094', CAST(N'1990-01-21T00:00:00.000' AS DateTime), N'8022787809', CAST(5512 AS Decimal(18, 0)), 234)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (75, N'Katya', N'Sivyour', N'Kierownik', N'794-881-0939', CAST(N'1987-02-01T00:00:00.000' AS DateTime), N'7334129431', CAST(5709 AS Decimal(18, 0)), 342)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (76, N'Darill', N'Filimore', N'Sprzedawca', N'998-671-5591', CAST(N'1979-03-11T00:00:00.000' AS DateTime), N'4422529595', CAST(4920 AS Decimal(18, 0)), 449)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (77, N'Kassi', N'McMoyer', N'Sprzedawca', N'843-116-9932', CAST(N'1983-01-11T00:00:00.000' AS DateTime), N'9141556615', CAST(4385 AS Decimal(18, 0)), 440)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (78, N'Kendre', N'Aikin', N'Sprzedawca', N'941-102-7540', CAST(N'1972-08-18T00:00:00.000' AS DateTime), N'9293038730', CAST(4101 AS Decimal(18, 0)), 500)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (79, N'Nye', N'Barrat', N'Sprzedawca', N'901-963-0483', CAST(N'1984-05-04T00:00:00.000' AS DateTime), N'6608887299', CAST(2632 AS Decimal(18, 0)), 700)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (80, N'Neils', N'Rasher', N'Sprzedawca', N'590-417-5667', CAST(N'1980-10-16T00:00:00.000' AS DateTime), N'7652306132', CAST(5145 AS Decimal(18, 0)), 675)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (81, N'Ronnie', N'Ferguson', N'Sprzedawca', N'370-999-4263', CAST(N'1989-11-07T00:00:00.000' AS DateTime), N'1033476293', CAST(4254 AS Decimal(18, 0)), 499)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (82, N'Arney', N'Samwell', N'Sprzedawca', N'951-467-9692', CAST(N'1998-08-30T00:00:00.000' AS DateTime), N'3148737954', CAST(3138 AS Decimal(18, 0)), 499)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (83, N'Sallyanne', N'Richfield', N'Sprzedawca', N'997-614-6370', CAST(N'1994-06-02T00:00:00.000' AS DateTime), N'1062660056', CAST(5080 AS Decimal(18, 0)), 539)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (84, N'Harvey', N'Baggallay', N'Ksiegowy', N'251-209-9761', CAST(N'1986-04-23T00:00:00.000' AS DateTime), N'8192862909', CAST(2779 AS Decimal(18, 0)), 90)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (85, N'Nye', N'Scohier', N'Sprzedawca', N'444-437-6253', CAST(N'1972-07-06T00:00:00.000' AS DateTime), N'5391519446', CAST(3331 AS Decimal(18, 0)), 770)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (86, N'Lancelot', N'Tapson', N'Sprzedawca', N'513-850-9021', CAST(N'1975-05-27T00:00:00.000' AS DateTime), N'0801187303', CAST(4770 AS Decimal(18, 0)), 76)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (87, N'Noak', N'Tyzack', N'Sprzedawca', N'219-608-7883', CAST(N'1991-11-06T00:00:00.000' AS DateTime), N'2642041395', CAST(4764 AS Decimal(18, 0)), 65)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (88, N'Les', N'Keary', N'Sprzedawca', N'160-285-0888', CAST(N'1974-03-11T00:00:00.000' AS DateTime), N'9316723310', CAST(2735 AS Decimal(18, 0)), 678)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (89, N'Nedi', N'Shoebrook', N'Kierownik', N'114-413-7219', CAST(N'1993-03-01T00:00:00.000' AS DateTime), N'3258785910', CAST(4657 AS Decimal(18, 0)), 80)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (90, N'Tonia', N'Tallow', N'Sprzedawca', N'215-734-7584', CAST(N'1974-08-15T00:00:00.000' AS DateTime), N'5271080730', CAST(2960 AS Decimal(18, 0)), 87)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (91, N'Shannon', N'Knightsbridge', N'Sprzedawca', N'162-174-6346', CAST(N'1982-08-21T00:00:00.000' AS DateTime), N'0192207660', CAST(3129 AS Decimal(18, 0)), 87)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (92, N'Brandie', N'Bickerstasse', N'Sprzedawca', N'249-328-1868', CAST(N'1986-12-08T00:00:00.000' AS DateTime), N'3885628465', CAST(5571 AS Decimal(18, 0)), 5)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (93, N'Papagena', N'Garces', N'Sprzedawca', N'266-748-3319', CAST(N'1973-02-02T00:00:00.000' AS DateTime), N'2634346999', CAST(3088 AS Decimal(18, 0)), 6)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (94, N'Darcie', N'Warbey', N'Sprzedawca', N'222-515-0334', CAST(N'1992-08-04T00:00:00.000' AS DateTime), N'6551236790', CAST(3080 AS Decimal(18, 0)), 44)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (95, N'Wilma', N'Leacock', N'Sprzedawca', N'519-100-7695', CAST(N'1980-06-30T00:00:00.000' AS DateTime), N'8557316097', CAST(3782 AS Decimal(18, 0)), 43)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (96, N'Hallie', N'Sherington', N'Sprzedawca', N'723-104-2187', CAST(N'1977-07-23T00:00:00.000' AS DateTime), N'7577755311', CAST(4132 AS Decimal(18, 0)), 234)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (97, N'Christophe', N'Daldan', N'Sprzedawca', N'547-395-0302', CAST(N'1990-12-04T00:00:00.000' AS DateTime), N'0847108538', CAST(2819 AS Decimal(18, 0)), 87)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (98, N'Bunny', N'McArte', N'Ksiegowy', N'558-985-7623', CAST(N'1997-04-08T00:00:00.000' AS DateTime), N'5578603793', CAST(3611 AS Decimal(18, 0)), 426)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (99, N'Burgess', N'Sleith', N'Sprzedawca', N'978-547-2332', CAST(N'1979-01-12T00:00:00.000' AS DateTime), N'8575487884', CAST(5519 AS Decimal(18, 0)), 4)
GO
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (100, N'Kory', N'Coogan', N'Ksiegowy', N'376-817-7573', CAST(N'1991-11-17T00:00:00.000' AS DateTime), N'9682924308', CAST(4743 AS Decimal(18, 0)), 640)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (101, N'Liana', N'Critcher', N'Ksiegowy', N'662-753-1120', CAST(N'1979-05-08T00:00:00.000' AS DateTime), N'6049579261', CAST(5327 AS Decimal(18, 0)), 641)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (102, N'Roxie', N'Sedman', N'Sprzedawca', N'179-982-8660', CAST(N'1970-05-26T00:00:00.000' AS DateTime), N'6944399733', CAST(4379 AS Decimal(18, 0)), 441)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (103, N'Tracy', N'Vakhrushin', N'Sprzedawca', N'661-621-2504', CAST(N'1976-03-24T00:00:00.000' AS DateTime), N'0069046735', CAST(2983 AS Decimal(18, 0)), 423)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (104, N'Allyn', N'Gallard', N'Kierownik', N'712-159-1272', CAST(N'1981-04-01T00:00:00.000' AS DateTime), N'1112243542', CAST(5718 AS Decimal(18, 0)), 12)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (105, N'Geralda', N'Wilcher', N'Menedzer', N'805-687-2235', CAST(N'1981-01-28T00:00:00.000' AS DateTime), N'1277637296', CAST(5688 AS Decimal(18, 0)), 432)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (106, N'Paola', N'Ginglell', N'Sprzedawca', N'178-349-0197', CAST(N'1991-09-05T00:00:00.000' AS DateTime), N'7677243878', CAST(3812 AS Decimal(18, 0)), 43)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (107, N'Husein', N'Ruxton', N'Menedzer', N'649-684-3879', CAST(N'1987-01-17T00:00:00.000' AS DateTime), N'6392444246', CAST(4268 AS Decimal(18, 0)), 321)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (108, N'Dominic', N'Fattorini', N'Sprzedawca', N'234-879-5254', CAST(N'1986-01-28T00:00:00.000' AS DateTime), N'6092095947', CAST(5554 AS Decimal(18, 0)), 432)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (109, N'Jorie', N'Capnerhurst', N'Menedzer', N'809-288-1651', CAST(N'1971-01-21T00:00:00.000' AS DateTime), N'9912633466', CAST(3465 AS Decimal(18, 0)), 432)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (110, N'Gil', N'Carn', N'Sprzedawca', N'616-406-1828', CAST(N'1987-12-02T00:00:00.000' AS DateTime), N'9046518000', CAST(5106 AS Decimal(18, 0)), 144)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (111, N'Gweneth', N'Fetter', N'Marketing', N'740-407-4156', CAST(N'1979-01-03T00:00:00.000' AS DateTime), N'4100845170', CAST(3563 AS Decimal(18, 0)), 432)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (112, N'Jamaal', N'Poleye', N'Sprzedawca', N'644-683-9369', CAST(N'1982-08-22T00:00:00.000' AS DateTime), N'0477598250', CAST(3388 AS Decimal(18, 0)), 116)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (113, N'Pooh', N'Clinton', N'Menedzer', N'154-213-9573', CAST(N'1991-10-21T00:00:00.000' AS DateTime), N'3486200801', CAST(4842 AS Decimal(18, 0)), 118)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (114, N'Jennie', N'Rosengren', N'Menedzer', N'479-140-1057', CAST(N'1996-02-08T00:00:00.000' AS DateTime), N'8863868360', CAST(4965 AS Decimal(18, 0)), 117)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (115, N'Jenn', N'Cicerone', N'Sprzedawca', N'616-766-5229', CAST(N'1985-07-01T00:00:00.000' AS DateTime), N'0784669139', CAST(5682 AS Decimal(18, 0)), 469)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (116, N'Marcelia', N'Norwell', N'Kierownik', N'766-360-9565', CAST(N'1998-05-21T00:00:00.000' AS DateTime), N'1285012143', CAST(2659 AS Decimal(18, 0)), 116)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (117, N'Orella', N'True', N'Menedzer', N'149-497-0508', CAST(N'1974-12-15T00:00:00.000' AS DateTime), N'2617945553', CAST(4596 AS Decimal(18, 0)), 446)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (118, N'Kimmi', N'Ledger', N'Menedzer', N'678-676-9059', CAST(N'1980-12-03T00:00:00.000' AS DateTime), N'6734372383', CAST(5777 AS Decimal(18, 0)), 44)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (119, N'Debera', N'Gumb', N'Menedzer', N'551-986-4779', CAST(N'1989-07-18T00:00:00.000' AS DateTime), N'5442399140', CAST(5538 AS Decimal(18, 0)), 466)
INSERT [dbo].[Pracownicy] ([PracownikID], [Imie], [Nazwisko], [Stanowisko], [Telefon], [Data_urodzenia], [Pesel], [Pensja], [AdresID]) VALUES (120, N'Renault', N'Dorton', N'Sprzedawca', N'126-309-2261', CAST(N'1988-02-03T00:00:00.000' AS DateTime), N'1727579151', CAST(3498 AS Decimal(18, 0)), 198)
SET IDENTITY_INSERT [dbo].[Pracownicy] OFF
GO
SET IDENTITY_INSERT [dbo].[Producenci] ON 

INSERT [dbo].[Producenci] ([ProducentID], [Nazwa_producenta], [Kontakt], [AdresID]) VALUES (1, N'RESERVED', N'321-312-3123', 699)
INSERT [dbo].[Producenci] ([ProducentID], [Nazwa_producenta], [Kontakt], [AdresID]) VALUES (2, N'ZARA', N'312-321-3122', 698)
INSERT [dbo].[Producenci] ([ProducentID], [Nazwa_producenta], [Kontakt], [AdresID]) VALUES (3, N'GUCCI', N'554-621-3142', 697)
INSERT [dbo].[Producenci] ([ProducentID], [Nazwa_producenta], [Kontakt], [AdresID]) VALUES (4, N'LEVIS', N'865-523-4234', 10)
SET IDENTITY_INSERT [dbo].[Producenci] OFF
GO
SET IDENTITY_INSERT [dbo].[Produkty] ON 

INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (1, 2, 22, 1, 2, 2)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (2, 1, 62, 4, 1, 3)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (3, 1, 17, 1, 2, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (4, 2, 84, 4, 1, 2)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (5, 1, 120, 1, 2, 3)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (6, 2, 78, 2, 1, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (7, 2, 66, 3, 2, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (8, 1, 1, 1, 2, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (9, 2, 79, 1, 2, 2)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (10, 1, 41, 4, 1, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (11, 2, 82, 2, 2, 2)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (12, 2, 18, 1, 2, 2)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (13, 2, 6, 3, 1, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (14, 1, 84, 4, 2, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (15, 1, 31, 1, 1, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (16, 1, 61, 1, 1, 2)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (17, 1, 66, 2, 2, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (18, 2, 94, 4, 1, 2)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (19, 2, 26, 1, 1, 2)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (20, 2, 13, 4, 1, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (21, 2, 83, 2, 2, 3)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (22, 1, 116, 2, 2, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (23, 1, 87, 2, 1, 2)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (24, 2, 68, 2, 1, 2)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (25, 2, 90, 2, 1, 2)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (26, 2, 28, 3, 2, 2)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (27, 1, 97, 3, 2, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (28, 2, 119, 3, 1, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (29, 2, 99, 2, 1, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (30, 1, 81, 3, 2, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (31, 2, 41, 4, 1, 3)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (32, 2, 106, 2, 2, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (33, 2, 54, 4, 2, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (34, 2, 80, 2, 1, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (35, 2, 43, 1, 1, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (36, 2, 50, 2, 1, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (37, 2, 108, 3, 2, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (38, 1, 76, 4, 2, 2)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (39, 1, 41, 2, 2, 3)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (40, 1, 89, 2, 2, 2)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (41, 2, 4, 3, 2, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (42, 2, 29, 1, 1, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (43, 1, 45, 2, 1, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (44, 1, 120, 1, 1, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (45, 2, 108, 2, 2, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (46, 1, 17, 2, 1, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (47, 1, 87, 1, 2, 2)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (48, 2, 94, 4, 1, 3)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (49, 1, 102, 1, 1, 3)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (50, 2, 29, 3, 2, 2)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (51, 1, 115, 2, 1, 2)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (52, 2, 64, 3, 2, 2)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (53, 1, 33, 4, 1, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (54, 1, 40, 1, 2, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (55, 2, 49, 4, 2, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (56, 1, 96, 2, 1, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (57, 1, 113, 4, 2, 2)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (58, 1, 16, 3, 1, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (59, 1, 91, 3, 1, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (60, 2, 77, 4, 2, 2)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (61, 1, 60, 1, 2, 2)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (62, 1, 4, 3, 2, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (63, 1, 50, 4, 2, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (64, 2, 7, 3, 2, 2)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (65, 2, 18, 4, 2, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (66, 1, 53, 1, 2, 2)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (67, 2, 119, 1, 2, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (68, 1, 65, 1, 1, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (69, 2, 96, 2, 1, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (70, 1, 95, 1, 2, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (71, 2, 98, 1, 1, 2)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (72, 2, 54, 4, 1, 2)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (73, 2, 88, 1, 1, 2)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (74, 2, 104, 3, 2, 2)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (75, 1, 67, 4, 2, 3)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (76, 1, 49, 4, 2, 2)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (77, 1, 35, 4, 1, 3)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (78, 2, 18, 3, 2, 2)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (79, 1, 32, 4, 1, 3)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (80, 1, 54, 1, 1, 2)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (81, 1, 5, 2, 1, 3)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (82, 1, 61, 3, 2, 3)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (83, 2, 94, 1, 1, 2)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (84, 1, 59, 1, 1, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (85, 2, 75, 3, 1, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (86, 2, 4, 1, 1, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (87, 2, 49, 2, 2, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (88, 1, 4, 2, 2, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (89, 2, 94, 3, 1, 2)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (90, 2, 104, 4, 2, 2)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (91, 1, 107, 3, 2, 2)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (92, 1, 112, 3, 1, 2)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (93, 1, 41, 4, 1, 2)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (94, 1, 94, 1, 2, 2)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (95, 1, 94, 2, 1, 2)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (96, 1, 15, 2, 1, 2)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (97, 2, 20, 3, 1, 2)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (98, 2, 98, 2, 1, 2)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (99, 1, 10, 3, 2, 2)
GO
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (100, 2, 29, 2, 2, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (101, 1, 70, 1, 1, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (102, 2, 39, 4, 2, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (103, 2, 43, 2, 1, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (104, 1, 23, 2, 2, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (105, 2, 43, 1, 2, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (106, 1, 69, 1, 1, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (107, 1, 47, 1, 2, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (108, 2, 52, 1, 2, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (109, 2, 43, 4, 1, 2)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (110, 1, 71, 3, 1, 3)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (111, 2, 12, 3, 1, 2)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (112, 1, 22, 1, 1, 3)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (113, 2, 24, 1, 1, 2)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (114, 1, 67, 4, 2, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (115, 2, 53, 3, 2, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (116, 2, 30, 4, 1, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (117, 2, 85, 4, 2, 2)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (118, 2, 112, 3, 1, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (119, 1, 7, 3, 1, 1)
INSERT [dbo].[Produkty] ([ProduktID], [KategoriaID], [DostawcaID], [ProducentID], [OpiniaID], [GwarancjaID]) VALUES (120, 2, 109, 4, 2, 1)
SET IDENTITY_INSERT [dbo].[Produkty] OFF
GO
SET IDENTITY_INSERT [dbo].[Rabat] ON 

INSERT [dbo].[Rabat] ([RabatID], [Kod_rabatu], [Ile_rabatu]) VALUES (1, N'rabat5', 5)
INSERT [dbo].[Rabat] ([RabatID], [Kod_rabatu], [Ile_rabatu]) VALUES (2, N'rabat7', 7)
INSERT [dbo].[Rabat] ([RabatID], [Kod_rabatu], [Ile_rabatu]) VALUES (3, N'rabat0', 0)
SET IDENTITY_INSERT [dbo].[Rabat] OFF
GO
SET IDENTITY_INSERT [dbo].[Reklamacje] ON 

INSERT [dbo].[Reklamacje] ([ReklamacjaID], [ZamowienieID], [Nazwa_reklamacji], [Opis_reklamacji], [Nazwa_produktu], [Data_przjecia_reklamacji]) VALUES (101, 1, N'rozmiar', N'Zly rozmiar', N'Sedge', CAST(N'2020-03-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Reklamacje] ([ReklamacjaID], [ZamowienieID], [Nazwa_reklamacji], [Opis_reklamacji], [Nazwa_produktu], [Data_przjecia_reklamacji]) VALUES (102, 4, N'Brak produktu', N'BRAK', N'Licaria', CAST(N'2021-03-06T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Reklamacje] OFF
GO
SET IDENTITY_INSERT [dbo].[Rodzaj_faktury] ON 

INSERT [dbo].[Rodzaj_faktury] ([Typ_fakturyID], [Typ_faktury]) VALUES (1, N'VAT')
INSERT [dbo].[Rodzaj_faktury] ([Typ_fakturyID], [Typ_faktury]) VALUES (2, N'VAT_MARZA')
INSERT [dbo].[Rodzaj_faktury] ([Typ_fakturyID], [Typ_faktury]) VALUES (3, N'VAT_RR')
INSERT [dbo].[Rodzaj_faktury] ([Typ_fakturyID], [Typ_faktury]) VALUES (4, N'UPROSZCZONA')
SET IDENTITY_INSERT [dbo].[Rodzaj_faktury] OFF
GO
SET IDENTITY_INSERT [dbo].[Sposoby_platnosci] ON 

INSERT [dbo].[Sposoby_platnosci] ([Sposoby_platnosciID], [Sposob_platnosci]) VALUES (1, N'BLIK')
INSERT [dbo].[Sposoby_platnosci] ([Sposoby_platnosciID], [Sposob_platnosci]) VALUES (2, N'TPAY')
INSERT [dbo].[Sposoby_platnosci] ([Sposoby_platnosciID], [Sposob_platnosci]) VALUES (3, N'PRZELEWY_24')
SET IDENTITY_INSERT [dbo].[Sposoby_platnosci] OFF
GO
SET IDENTITY_INSERT [dbo].[Sposoby_wysylki] ON 

INSERT [dbo].[Sposoby_wysylki] ([Sposoby_wysylkiID], [Sposob_wysylki], [Cena_wysylki]) VALUES (1, N'INPOST', 15.0000)
INSERT [dbo].[Sposoby_wysylki] ([Sposoby_wysylkiID], [Sposob_wysylki], [Cena_wysylki]) VALUES (2, N'POCZTA_POLSKA', 16.0000)
INSERT [dbo].[Sposoby_wysylki] ([Sposoby_wysylkiID], [Sposob_wysylki], [Cena_wysylki]) VALUES (3, N'DHL', 14.0000)
INSERT [dbo].[Sposoby_wysylki] ([Sposoby_wysylkiID], [Sposob_wysylki], [Cena_wysylki]) VALUES (4, N'UPS', 19.0000)
INSERT [dbo].[Sposoby_wysylki] ([Sposoby_wysylkiID], [Sposob_wysylki], [Cena_wysylki]) VALUES (5, N'DPD', 13.0000)
SET IDENTITY_INSERT [dbo].[Sposoby_wysylki] OFF
GO
SET IDENTITY_INSERT [dbo].[Stawka_vat] ON 

INSERT [dbo].[Stawka_vat] ([Stawka_vat_ID], [Stawka_vat]) VALUES (1, 7)
INSERT [dbo].[Stawka_vat] ([Stawka_vat_ID], [Stawka_vat]) VALUES (2, 22)
INSERT [dbo].[Stawka_vat] ([Stawka_vat_ID], [Stawka_vat]) VALUES (3, 23)
SET IDENTITY_INSERT [dbo].[Stawka_vat] OFF
GO
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (1, 22, 109.1100, N'3')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (2, 33, 266.4400, N'15')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (3, 103, 206.3000, N'5')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (4, 21, 138.9700, N'11')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (9, 52, 118.6600, N'8')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (13, 113, 184.0300, N'5')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (14, 7, 198.3800, N'8')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (14, 35, 147.1400, N'11')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (15, 18, 186.6700, N'12')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (15, 34, 122.1200, N'3')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (16, 55, 268.8200, N'13')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (17, 47, 265.5200, N'12')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (18, 49, 197.1400, N'5')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (19, 31, 269.1400, N'10')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (21, 17, 81.8200, N'1')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (22, 117, 112.5900, N'11')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (23, 4, 100.4500, N'9')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (23, 26, 158.8700, N'13')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (25, 2, 61.1200, N'6')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (25, 110, 290.5400, N'14')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (26, 60, 256.7400, N'5')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (28, 56, 116.0700, N'8')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (30, 63, 174.9800, N'11')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (32, 13, 221.7500, N'2')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (32, 33, 273.3200, N'13')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (33, 90, 141.8500, N'13')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (34, 97, 141.1200, N'9')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (35, 28, 257.6500, N'7')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (35, 67, 121.6900, N'3')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (38, 53, 200.5100, N'2')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (40, 4, 276.7500, N'11')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (41, 5, 80.4200, N'5')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (43, 54, 94.5600, N'6')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (43, 74, 52.5200, N'5')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (46, 108, 189.6700, N'10')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (47, 36, 163.7800, N'8')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (47, 70, 93.9100, N'10')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (48, 35, 101.4700, N'15')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (48, 72, 131.6900, N'4')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (50, 12, 201.7700, N'1')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (51, 33, 198.6800, N'11')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (51, 95, 164.6500, N'11')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (52, 3, 139.8300, N'13')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (52, 15, 74.0500, N'5')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (52, 31, 148.2300, N'2')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (53, 58, 219.9000, N'15')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (53, 77, 143.1200, N'1')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (54, 83, 166.2100, N'7')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (54, 85, 81.7200, N'13')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (55, 5, 236.9500, N'11')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (55, 73, 220.9800, N'10')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (56, 92, 219.9700, N'14')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (57, 46, 172.4300, N'14')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (59, 16, 265.5600, N'5')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (59, 76, 157.8900, N'3')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (59, 86, 95.0800, N'6')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (61, 26, 241.0000, N'2')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (61, 64, 230.6100, N'10')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (62, 77, 256.3700, N'9')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (63, 46, 255.0300, N'11')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (66, 53, 235.4200, N'3')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (66, 64, 113.2500, N'3')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (67, 8, 200.3100, N'4')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (68, 34, 124.0700, N'4')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (68, 41, 212.2600, N'15')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (68, 91, 225.8300, N'14')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (68, 112, 266.6700, N'10')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (69, 81, 131.8900, N'10')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (70, 72, 75.2800, N'8')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (71, 23, 199.0800, N'12')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (71, 57, 282.6200, N'12')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (72, 32, 183.8600, N'14')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (73, 41, 112.5800, N'15')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (73, 90, 103.7200, N'14')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (74, 25, 88.5500, N'8')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (75, 58, 249.0700, N'4')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (76, 89, 197.4700, N'3')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (77, 112, 83.1500, N'7')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (82, 44, 184.1700, N'7')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (83, 39, 297.7500, N'3')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (84, 101, 57.7200, N'8')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (84, 116, 152.8500, N'6')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (85, 39, 189.2300, N'9')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (85, 96, 54.2100, N'4')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (86, 9, 99.9600, N'4')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (86, 10, 191.8100, N'14')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (87, 51, 109.4200, N'2')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (87, 81, 170.3100, N'7')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (88, 19, 168.6000, N'13')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (88, 71, 189.1200, N'1')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (88, 110, 172.4700, N'3')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (89, 18, 224.0100, N'2')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (89, 68, 288.6800, N'6')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (89, 114, 127.1700, N'3')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (93, 118, 192.3800, N'3')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (95, 47, 93.4900, N'4')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (97, 6, 173.4700, N'6')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (97, 101, 248.6400, N'11')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (99, 115, 202.4700, N'4')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (100, 22, 202.7400, N'10')
GO
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (100, 94, 192.4600, N'7')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (101, 18, 73.4300, N'1')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (101, 73, 111.0900, N'15')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (103, 104, 263.7400, N'7')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (104, 85, 102.0000, N'15')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (105, 70, 248.6600, N'15')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (106, 89, 263.0400, N'6')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (107, 1, 229.1900, N'14')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (108, 95, 230.6400, N'9')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (109, 117, 210.4800, N'2')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (111, 13, 106.9800, N'9')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (111, 48, 159.6600, N'1')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (112, 80, 244.0700, N'2')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (116, 34, 78.4200, N'9')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (116, 54, 188.8900, N'12')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (116, 106, 231.7700, N'6')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (118, 119, 230.0000, N'5')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (119, 39, 280.8400, N'8')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (119, 78, 132.5400, N'11')
INSERT [dbo].[Szczegoly_zamowienia] ([ZamowienieID], [ProduktID], [Cena_jednostkowa], [Ilosc]) VALUES (120, 33, 178.1400, N'3')
GO
SET IDENTITY_INSERT [dbo].[Zamowienia] ON 

INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (1, 2, 67, CAST(N'2020-03-08T00:00:00.000' AS DateTime), 1, 1, 11, 3, 101)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (2, 101, 25, CAST(N'2021-03-25T00:00:00.000' AS DateTime), 1, 4, 90, 3, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (3, 6, 30, CAST(N'2021-03-01T00:00:00.000' AS DateTime), 2, 3, 20, 2, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (4, 37, 26, CAST(N'2021-08-24T00:00:00.000' AS DateTime), 3, 1, 80, 3, 102)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (5, 30, 17, CAST(N'2019-06-28T00:00:00.000' AS DateTime), 3, 1, 92, 3, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (6, 109, 60, CAST(N'2021-07-04T00:00:00.000' AS DateTime), 3, 2, 32, 1, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (7, 80, 106, CAST(N'2019-02-16T00:00:00.000' AS DateTime), 3, 5, 116, 2, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (8, 57, 110, CAST(N'2019-06-19T00:00:00.000' AS DateTime), 2, 3, 109, 2, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (9, 21, 20, CAST(N'2021-06-28T00:00:00.000' AS DateTime), 1, 5, 118, 3, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (10, 10, 70, CAST(N'2021-01-02T00:00:00.000' AS DateTime), 3, 4, 30, 2, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (11, 120, 28, CAST(N'2021-08-18T00:00:00.000' AS DateTime), 3, 2, 61, 2, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (12, 19, 107, CAST(N'2021-04-30T00:00:00.000' AS DateTime), 2, 1, 29, 1, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (13, 83, 80, CAST(N'2019-02-21T00:00:00.000' AS DateTime), 2, 4, 69, 3, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (14, 46, 97, CAST(N'2020-02-18T00:00:00.000' AS DateTime), 1, 3, 111, 2, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (15, 100, 18, CAST(N'2021-04-20T00:00:00.000' AS DateTime), 2, 1, 73, 2, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (16, 86, 45, CAST(N'2019-07-30T00:00:00.000' AS DateTime), 2, 1, 69, 1, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (17, 14, 4, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 2, 1, 99, 3, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (18, 87, 109, CAST(N'2021-05-29T00:00:00.000' AS DateTime), 2, 5, 40, 3, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (19, 64, 110, CAST(N'2021-07-24T00:00:00.000' AS DateTime), 3, 4, 86, 2, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (20, 91, 3, CAST(N'2020-03-02T00:00:00.000' AS DateTime), 3, 1, 28, 1, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (21, 76, 27, CAST(N'2019-07-14T00:00:00.000' AS DateTime), 1, 5, 41, 1, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (22, 17, 108, CAST(N'2021-07-06T00:00:00.000' AS DateTime), 2, 4, 84, 3, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (23, 70, 31, CAST(N'2019-05-31T00:00:00.000' AS DateTime), 3, 3, 76, 2, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (24, 25, 79, CAST(N'2020-09-04T00:00:00.000' AS DateTime), 3, 3, 87, 3, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (25, 43, 34, CAST(N'2020-09-20T00:00:00.000' AS DateTime), 2, 2, 58, 1, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (26, 113, 24, CAST(N'2021-12-09T00:00:00.000' AS DateTime), 1, 3, 93, 1, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (27, 18, 63, CAST(N'2019-04-30T00:00:00.000' AS DateTime), 3, 3, 5, 1, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (28, 20, 20, CAST(N'2021-04-12T00:00:00.000' AS DateTime), 3, 4, 54, 1, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (29, 58, 106, CAST(N'2019-06-09T00:00:00.000' AS DateTime), 3, 2, 74, 1, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (30, 81, 37, CAST(N'2020-12-23T00:00:00.000' AS DateTime), 1, 5, 115, 2, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (31, 36, 55, CAST(N'2021-06-29T00:00:00.000' AS DateTime), 2, 3, 28, 3, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (32, 47, 92, CAST(N'2021-10-24T00:00:00.000' AS DateTime), 3, 3, 7, 1, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (33, 49, 108, CAST(N'2021-02-10T00:00:00.000' AS DateTime), 3, 2, 88, 1, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (34, 70, 56, CAST(N'2021-10-01T00:00:00.000' AS DateTime), 2, 4, 108, 1, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (35, 42, 95, CAST(N'2020-07-21T00:00:00.000' AS DateTime), 3, 4, 98, 3, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (36, 14, 16, CAST(N'2021-01-26T00:00:00.000' AS DateTime), 1, 5, 64, 1, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (37, 24, 33, CAST(N'2020-11-22T00:00:00.000' AS DateTime), 1, 3, 62, 3, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (38, 77, 94, CAST(N'2020-05-04T00:00:00.000' AS DateTime), 3, 3, 45, 3, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (39, 31, 56, CAST(N'2021-10-24T00:00:00.000' AS DateTime), 3, 4, 70, 3, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (40, 75, 23, CAST(N'2020-04-27T00:00:00.000' AS DateTime), 3, 1, 112, 2, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (41, 10, 26, CAST(N'2019-11-29T00:00:00.000' AS DateTime), 1, 2, 68, 2, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (42, 80, 111, CAST(N'2021-06-23T00:00:00.000' AS DateTime), 1, 5, 101, 3, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (43, 74, 31, CAST(N'2021-06-08T00:00:00.000' AS DateTime), 2, 1, 62, 3, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (44, 1, 77, CAST(N'2019-06-12T00:00:00.000' AS DateTime), 1, 2, 72, 2, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (45, 110, 107, CAST(N'2021-06-29T00:00:00.000' AS DateTime), 2, 2, 74, 3, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (46, 75, 65, CAST(N'2021-07-13T00:00:00.000' AS DateTime), 2, 5, 53, 3, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (47, 35, 54, CAST(N'2019-02-15T00:00:00.000' AS DateTime), 2, 3, 51, 3, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (48, 1, 34, CAST(N'2019-08-15T00:00:00.000' AS DateTime), 2, 5, 68, 1, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (49, 98, 28, CAST(N'2021-03-12T00:00:00.000' AS DateTime), 3, 3, 96, 2, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (50, 91, 112, CAST(N'2020-07-18T00:00:00.000' AS DateTime), 2, 1, 17, 2, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (51, 108, 3, CAST(N'2020-04-18T00:00:00.000' AS DateTime), 1, 2, 8, 3, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (52, 83, 32, CAST(N'2019-09-20T00:00:00.000' AS DateTime), 1, 4, 8, 1, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (53, 6, 59, CAST(N'2021-03-13T00:00:00.000' AS DateTime), 2, 4, 44, 1, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (54, 41, 79, CAST(N'2020-09-15T00:00:00.000' AS DateTime), 3, 1, 46, 2, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (55, 76, 64, CAST(N'2020-09-07T00:00:00.000' AS DateTime), 2, 4, 26, 1, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (56, 83, 82, CAST(N'2020-05-10T00:00:00.000' AS DateTime), 3, 4, 23, 1, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (57, 62, 14, CAST(N'2021-07-12T00:00:00.000' AS DateTime), 1, 5, 2, 3, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (58, 88, 62, CAST(N'2020-01-04T00:00:00.000' AS DateTime), 3, 5, 76, 2, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (59, 92, 96, CAST(N'2021-10-09T00:00:00.000' AS DateTime), 2, 5, 64, 3, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (60, 60, 11, CAST(N'2021-04-02T00:00:00.000' AS DateTime), 1, 2, 92, 2, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (61, 109, 92, CAST(N'2021-03-28T00:00:00.000' AS DateTime), 3, 2, 74, 1, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (62, 108, 25, CAST(N'2020-10-01T00:00:00.000' AS DateTime), 2, 2, 100, 3, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (63, 73, 74, CAST(N'2020-06-07T00:00:00.000' AS DateTime), 1, 4, 15, 3, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (64, 89, 9, CAST(N'2019-12-04T00:00:00.000' AS DateTime), 3, 4, 67, 1, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (65, 98, 109, CAST(N'2019-12-20T00:00:00.000' AS DateTime), 1, 2, 108, 3, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (66, 69, 118, CAST(N'2020-06-01T00:00:00.000' AS DateTime), 3, 3, 7, 3, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (67, 3, 43, CAST(N'2019-10-04T00:00:00.000' AS DateTime), 1, 2, 50, 1, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (68, 16, 36, CAST(N'2019-07-20T00:00:00.000' AS DateTime), 3, 1, 101, 2, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (69, 105, 49, CAST(N'2019-03-09T00:00:00.000' AS DateTime), 2, 1, 12, 1, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (70, 105, 101, CAST(N'2021-04-30T00:00:00.000' AS DateTime), 2, 4, 59, 3, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (71, 31, 71, CAST(N'2021-09-14T00:00:00.000' AS DateTime), 2, 1, 41, 2, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (72, 47, 60, CAST(N'2019-08-16T00:00:00.000' AS DateTime), 3, 1, 8, 1, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (73, 50, 43, CAST(N'2020-10-26T00:00:00.000' AS DateTime), 1, 1, 20, 1, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (74, 37, 56, CAST(N'2019-09-28T00:00:00.000' AS DateTime), 1, 3, 48, 3, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (75, 16, 40, CAST(N'2021-10-06T00:00:00.000' AS DateTime), 2, 2, 63, 3, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (76, 51, 106, CAST(N'2019-02-05T00:00:00.000' AS DateTime), 1, 5, 15, 2, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (77, 8, 35, CAST(N'2019-01-08T00:00:00.000' AS DateTime), 2, 4, 33, 2, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (78, 111, 67, CAST(N'2020-08-13T00:00:00.000' AS DateTime), 3, 1, 67, 2, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (79, 49, 73, CAST(N'2020-11-27T00:00:00.000' AS DateTime), 2, 3, 60, 1, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (80, 91, 84, CAST(N'2021-04-03T00:00:00.000' AS DateTime), 3, 3, 70, 2, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (81, 28, 43, CAST(N'2021-04-04T00:00:00.000' AS DateTime), 3, 1, 25, 3, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (82, 100, 102, CAST(N'2021-04-10T00:00:00.000' AS DateTime), 1, 3, 97, 3, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (83, 118, 98, CAST(N'2021-12-02T00:00:00.000' AS DateTime), 3, 2, 13, 2, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (84, 110, 78, CAST(N'2021-08-03T00:00:00.000' AS DateTime), 2, 2, 78, 2, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (85, 13, 55, CAST(N'2021-10-27T00:00:00.000' AS DateTime), 3, 1, 45, 2, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (86, 118, 38, CAST(N'2019-06-27T00:00:00.000' AS DateTime), 1, 2, 23, 3, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (87, 15, 65, CAST(N'2020-11-06T00:00:00.000' AS DateTime), 2, 3, 104, 2, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (88, 71, 91, CAST(N'2019-06-01T00:00:00.000' AS DateTime), 1, 2, 66, 1, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (89, 87, 73, CAST(N'2019-11-29T00:00:00.000' AS DateTime), 3, 2, 25, 2, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (90, 103, 118, CAST(N'2021-07-02T00:00:00.000' AS DateTime), 3, 5, 69, 2, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (91, 13, 35, CAST(N'2020-01-08T00:00:00.000' AS DateTime), 1, 1, 58, 3, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (92, 66, 45, CAST(N'2019-05-15T00:00:00.000' AS DateTime), 2, 4, 39, 2, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (93, 47, 94, CAST(N'2021-11-15T00:00:00.000' AS DateTime), 3, 5, 28, 2, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (94, 72, 40, CAST(N'2020-06-07T00:00:00.000' AS DateTime), 1, 2, 46, 2, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (95, 113, 86, CAST(N'2020-09-25T00:00:00.000' AS DateTime), 2, 3, 100, 1, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (96, 63, 7, CAST(N'2019-08-04T00:00:00.000' AS DateTime), 1, 4, 48, 2, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (97, 45, 65, CAST(N'2020-09-18T00:00:00.000' AS DateTime), 3, 3, 102, 1, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (98, 58, 57, CAST(N'2019-06-30T00:00:00.000' AS DateTime), 2, 1, 19, 2, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (99, 114, 53, CAST(N'2019-07-22T00:00:00.000' AS DateTime), 1, 2, 29, 2, NULL)
GO
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (100, 48, 63, CAST(N'2019-06-18T00:00:00.000' AS DateTime), 3, 4, 30, 3, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (101, 25, 106, CAST(N'2020-11-16T00:00:00.000' AS DateTime), 2, 2, 38, 2, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (102, 77, 6, CAST(N'2019-12-16T00:00:00.000' AS DateTime), 1, 5, 20, 3, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (103, 94, 9, CAST(N'2021-08-07T00:00:00.000' AS DateTime), 2, 4, 89, 1, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (104, 50, 83, CAST(N'2020-03-02T00:00:00.000' AS DateTime), 3, 5, 64, 2, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (105, 23, 80, CAST(N'2021-06-23T00:00:00.000' AS DateTime), 3, 3, 118, 2, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (106, 96, 37, CAST(N'2019-10-11T00:00:00.000' AS DateTime), 3, 5, 66, 1, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (107, 31, 99, CAST(N'2021-06-04T00:00:00.000' AS DateTime), 2, 1, 84, 2, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (108, 119, 1, CAST(N'2019-07-13T00:00:00.000' AS DateTime), 3, 5, 103, 2, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (109, 75, 105, CAST(N'2020-03-01T00:00:00.000' AS DateTime), 3, 4, 92, 2, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (110, 98, 11, CAST(N'2020-03-31T00:00:00.000' AS DateTime), 1, 5, 103, 3, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (111, 36, 53, CAST(N'2021-10-30T00:00:00.000' AS DateTime), 2, 2, 95, 3, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (112, 61, 81, CAST(N'2020-03-10T00:00:00.000' AS DateTime), 1, 3, 46, 3, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (113, 55, 56, CAST(N'2020-11-28T00:00:00.000' AS DateTime), 3, 1, 51, 2, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (114, 113, 15, CAST(N'2020-12-24T00:00:00.000' AS DateTime), 2, 1, 44, 3, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (115, 6, 11, CAST(N'2020-12-22T00:00:00.000' AS DateTime), 2, 3, 13, 1, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (116, 28, 75, CAST(N'2020-10-26T00:00:00.000' AS DateTime), 3, 4, 48, 3, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (117, 116, 62, CAST(N'2019-11-16T00:00:00.000' AS DateTime), 1, 2, 118, 1, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (118, 38, 105, CAST(N'2019-01-21T00:00:00.000' AS DateTime), 1, 1, 102, 1, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (119, 71, 70, CAST(N'2021-08-05T00:00:00.000' AS DateTime), 2, 1, 63, 2, NULL)
INSERT [dbo].[Zamowienia] ([ZamowienieID], [PracownikID], [KlientID], [Data_wysylki_zamowienia], [Sposoby_platnosciID], [Sposoby_wysylkiID], [FakturaID], [RabatID], [ReklamacjaID]) VALUES (120, 69, 52, CAST(N'2019-08-23T00:00:00.000' AS DateTime), 2, 5, 64, 1, NULL)
SET IDENTITY_INSERT [dbo].[Zamowienia] OFF
GO
ALTER TABLE [dbo].[Dostawcy]  WITH CHECK ADD  CONSTRAINT [FK_Dostawcy_Adres] FOREIGN KEY([AdresID])
REFERENCES [dbo].[Adres] ([AdresID])
GO
ALTER TABLE [dbo].[Dostawcy] CHECK CONSTRAINT [FK_Dostawcy_Adres]
GO
ALTER TABLE [dbo].[Faktury]  WITH CHECK ADD  CONSTRAINT [FK_Faktury_Adres] FOREIGN KEY([AdresID])
REFERENCES [dbo].[Adres] ([AdresID])
GO
ALTER TABLE [dbo].[Faktury] CHECK CONSTRAINT [FK_Faktury_Adres]
GO
ALTER TABLE [dbo].[Faktury]  WITH CHECK ADD  CONSTRAINT [FK_Faktury_Rodzaj_faktury] FOREIGN KEY([Typ_fakturyID])
REFERENCES [dbo].[Rodzaj_faktury] ([Typ_fakturyID])
GO
ALTER TABLE [dbo].[Faktury] CHECK CONSTRAINT [FK_Faktury_Rodzaj_faktury]
GO
ALTER TABLE [dbo].[Faktury]  WITH CHECK ADD  CONSTRAINT [FK_Faktury_Stawka_vat] FOREIGN KEY([Stawka_vat_ID])
REFERENCES [dbo].[Stawka_vat] ([Stawka_vat_ID])
GO
ALTER TABLE [dbo].[Faktury] CHECK CONSTRAINT [FK_Faktury_Stawka_vat]
GO
ALTER TABLE [dbo].[Klient]  WITH CHECK ADD  CONSTRAINT [FK_Klient_Adres] FOREIGN KEY([AdresID])
REFERENCES [dbo].[Adres] ([AdresID])
GO
ALTER TABLE [dbo].[Klient] CHECK CONSTRAINT [FK_Klient_Adres]
GO
ALTER TABLE [dbo].[Kontrahenci]  WITH CHECK ADD  CONSTRAINT [FK_Kontrahenci_Adres] FOREIGN KEY([AdresID])
REFERENCES [dbo].[Adres] ([AdresID])
GO
ALTER TABLE [dbo].[Kontrahenci] CHECK CONSTRAINT [FK_Kontrahenci_Adres]
GO
ALTER TABLE [dbo].[Kontrahenci]  WITH CHECK ADD  CONSTRAINT [FK_Kontrahenci_Klient] FOREIGN KEY([KlientID])
REFERENCES [dbo].[Klient] ([KlientID])
GO
ALTER TABLE [dbo].[Kontrahenci] CHECK CONSTRAINT [FK_Kontrahenci_Klient]
GO
ALTER TABLE [dbo].[Obuwie]  WITH CHECK ADD  CONSTRAINT [FK_Obuwie_Kategorie] FOREIGN KEY([KategoriaID])
REFERENCES [dbo].[Kategorie] ([KategoriaID])
GO
ALTER TABLE [dbo].[Obuwie] CHECK CONSTRAINT [FK_Obuwie_Kategorie]
GO
ALTER TABLE [dbo].[Odziez]  WITH CHECK ADD  CONSTRAINT [FK_Odziez_Kategorie] FOREIGN KEY([KategoriaID])
REFERENCES [dbo].[Kategorie] ([KategoriaID])
GO
ALTER TABLE [dbo].[Odziez] CHECK CONSTRAINT [FK_Odziez_Kategorie]
GO
ALTER TABLE [dbo].[Pracownicy]  WITH CHECK ADD  CONSTRAINT [FK_Pracownicy_Adres] FOREIGN KEY([AdresID])
REFERENCES [dbo].[Adres] ([AdresID])
GO
ALTER TABLE [dbo].[Pracownicy] CHECK CONSTRAINT [FK_Pracownicy_Adres]
GO
ALTER TABLE [dbo].[Producenci]  WITH CHECK ADD  CONSTRAINT [FK_Producenci_Adres] FOREIGN KEY([AdresID])
REFERENCES [dbo].[Adres] ([AdresID])
GO
ALTER TABLE [dbo].[Producenci] CHECK CONSTRAINT [FK_Producenci_Adres]
GO
ALTER TABLE [dbo].[Produkty]  WITH CHECK ADD  CONSTRAINT [FK_Produkty_Dostawcy] FOREIGN KEY([DostawcaID])
REFERENCES [dbo].[Dostawcy] ([DostawcaID])
GO
ALTER TABLE [dbo].[Produkty] CHECK CONSTRAINT [FK_Produkty_Dostawcy]
GO
ALTER TABLE [dbo].[Produkty]  WITH CHECK ADD  CONSTRAINT [FK_Produkty_Gwarancja] FOREIGN KEY([GwarancjaID])
REFERENCES [dbo].[Gwarancja] ([GwarancjaID])
GO
ALTER TABLE [dbo].[Produkty] CHECK CONSTRAINT [FK_Produkty_Gwarancja]
GO
ALTER TABLE [dbo].[Produkty]  WITH CHECK ADD  CONSTRAINT [FK_Produkty_Kategorie] FOREIGN KEY([KategoriaID])
REFERENCES [dbo].[Kategorie] ([KategoriaID])
GO
ALTER TABLE [dbo].[Produkty] CHECK CONSTRAINT [FK_Produkty_Kategorie]
GO
ALTER TABLE [dbo].[Produkty]  WITH CHECK ADD  CONSTRAINT [FK_Produkty_Opinia] FOREIGN KEY([OpiniaID])
REFERENCES [dbo].[Opinia] ([OpiniaID])
GO
ALTER TABLE [dbo].[Produkty] CHECK CONSTRAINT [FK_Produkty_Opinia]
GO
ALTER TABLE [dbo].[Produkty]  WITH CHECK ADD  CONSTRAINT [FK_Produkty_Producenci] FOREIGN KEY([ProducentID])
REFERENCES [dbo].[Producenci] ([ProducentID])
GO
ALTER TABLE [dbo].[Produkty] CHECK CONSTRAINT [FK_Produkty_Producenci]
GO
ALTER TABLE [dbo].[Szczegoly_zamowienia]  WITH CHECK ADD  CONSTRAINT [FK_Szczegoly_zamowienia_Produkty] FOREIGN KEY([ProduktID])
REFERENCES [dbo].[Produkty] ([ProduktID])
GO
ALTER TABLE [dbo].[Szczegoly_zamowienia] CHECK CONSTRAINT [FK_Szczegoly_zamowienia_Produkty]
GO
ALTER TABLE [dbo].[Szczegoly_zamowienia]  WITH CHECK ADD  CONSTRAINT [FK_Szczegoly_zamowienia_Zamowienia] FOREIGN KEY([ZamowienieID])
REFERENCES [dbo].[Zamowienia] ([ZamowienieID])
GO
ALTER TABLE [dbo].[Szczegoly_zamowienia] CHECK CONSTRAINT [FK_Szczegoly_zamowienia_Zamowienia]
GO
ALTER TABLE [dbo].[Zamowienia]  WITH CHECK ADD  CONSTRAINT [FK_Zamowienia_Faktury] FOREIGN KEY([FakturaID])
REFERENCES [dbo].[Faktury] ([FakturaID])
GO
ALTER TABLE [dbo].[Zamowienia] CHECK CONSTRAINT [FK_Zamowienia_Faktury]
GO
ALTER TABLE [dbo].[Zamowienia]  WITH CHECK ADD  CONSTRAINT [FK_Zamowienia_Klient] FOREIGN KEY([KlientID])
REFERENCES [dbo].[Klient] ([KlientID])
GO
ALTER TABLE [dbo].[Zamowienia] CHECK CONSTRAINT [FK_Zamowienia_Klient]
GO
ALTER TABLE [dbo].[Zamowienia]  WITH CHECK ADD  CONSTRAINT [FK_Zamowienia_Pracownicy] FOREIGN KEY([PracownikID])
REFERENCES [dbo].[Pracownicy] ([PracownikID])
GO
ALTER TABLE [dbo].[Zamowienia] CHECK CONSTRAINT [FK_Zamowienia_Pracownicy]
GO
ALTER TABLE [dbo].[Zamowienia]  WITH CHECK ADD  CONSTRAINT [FK_Zamowienia_Rabat] FOREIGN KEY([RabatID])
REFERENCES [dbo].[Rabat] ([RabatID])
GO
ALTER TABLE [dbo].[Zamowienia] CHECK CONSTRAINT [FK_Zamowienia_Rabat]
GO
ALTER TABLE [dbo].[Zamowienia]  WITH CHECK ADD  CONSTRAINT [FK_Zamowienia_Reklamacje] FOREIGN KEY([ReklamacjaID])
REFERENCES [dbo].[Reklamacje] ([ReklamacjaID])
GO
ALTER TABLE [dbo].[Zamowienia] CHECK CONSTRAINT [FK_Zamowienia_Reklamacje]
GO
ALTER TABLE [dbo].[Zamowienia]  WITH CHECK ADD  CONSTRAINT [FK_Zamowienia_Sposoby_platnosci] FOREIGN KEY([Sposoby_platnosciID])
REFERENCES [dbo].[Sposoby_platnosci] ([Sposoby_platnosciID])
GO
ALTER TABLE [dbo].[Zamowienia] CHECK CONSTRAINT [FK_Zamowienia_Sposoby_platnosci]
GO
ALTER TABLE [dbo].[Zamowienia]  WITH CHECK ADD  CONSTRAINT [FK_Zamowienia_Sposoby_wysylki] FOREIGN KEY([Sposoby_wysylkiID])
REFERENCES [dbo].[Sposoby_wysylki] ([Sposoby_wysylkiID])
GO
ALTER TABLE [dbo].[Zamowienia] CHECK CONSTRAINT [FK_Zamowienia_Sposoby_wysylki]
GO
USE [master]
GO
ALTER DATABASE [w64152_Sklep_internetowy01] SET  READ_WRITE 
GO
