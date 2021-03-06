USE [master]
GO
/****** Object:  Database [operacionesquirurgicas]    Script Date: 02/02/2017 17:32:38 ******/
CREATE DATABASE [operacionesquirurgicas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'operacionesquirurgicas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\operacionesquirurgicas.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'operacionesquirurgicas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\operacionesquirurgicas_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [operacionesquirurgicas] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [operacionesquirurgicas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [operacionesquirurgicas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [operacionesquirurgicas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [operacionesquirurgicas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [operacionesquirurgicas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [operacionesquirurgicas] SET ARITHABORT OFF 
GO
ALTER DATABASE [operacionesquirurgicas] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [operacionesquirurgicas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [operacionesquirurgicas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [operacionesquirurgicas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [operacionesquirurgicas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [operacionesquirurgicas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [operacionesquirurgicas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [operacionesquirurgicas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [operacionesquirurgicas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [operacionesquirurgicas] SET  ENABLE_BROKER 
GO
ALTER DATABASE [operacionesquirurgicas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [operacionesquirurgicas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [operacionesquirurgicas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [operacionesquirurgicas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [operacionesquirurgicas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [operacionesquirurgicas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [operacionesquirurgicas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [operacionesquirurgicas] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [operacionesquirurgicas] SET  MULTI_USER 
GO
ALTER DATABASE [operacionesquirurgicas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [operacionesquirurgicas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [operacionesquirurgicas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [operacionesquirurgicas] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [operacionesquirurgicas] SET DELAYED_DURABILITY = DISABLED 
GO
USE [operacionesquirurgicas]
GO
/****** Object:  Table [dbo].[intervencion]    Script Date: 02/02/2017 17:32:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[intervencion](
	[idintervencion] [int] IDENTITY(1,1) NOT NULL,
	[denominaciontipo] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[idintervencion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[intervencionoperacion]    Script Date: 02/02/2017 17:32:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[intervencionoperacion](
	[idoperacion] [int] NOT NULL,
	[idintervencion] [int] NOT NULL,
	[observacion] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[idoperacion] ASC,
	[idintervencion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[material]    Script Date: 02/02/2017 17:32:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[material](
	[idmaterial] [int] IDENTITY(1,1) NOT NULL,
	[nombrematerial] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[idmaterial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[materialintervencion]    Script Date: 02/02/2017 17:32:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[materialintervencion](
	[idintervencion] [int] NOT NULL,
	[idmaterial] [int] NOT NULL,
	[cantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idintervencion] ASC,
	[idmaterial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[operacion]    Script Date: 02/02/2017 17:32:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[operacion](
	[idoperacion] [int] IDENTITY(1,1) NOT NULL,
	[fechaoperacion] [datetime] NULL,
	[DNIPaciente] [varchar](9) NULL,
PRIMARY KEY CLUSTERED 
(
	[idoperacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 02/02/2017 17:32:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Paciente](
	[DNIPaciente] [varchar](9) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[DatosCliente] [varchar](100) NULL,
	[FechaNacimiento] [datetime] NULL,
	[Telefono] [char](9) NULL,
PRIMARY KEY CLUSTERED 
(
	[DNIPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[intervencion] ON 

INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (1, N'Adenoidectomía. Operación de Vegetaciones')
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (2, N'Amigdalectomía')
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (3, N'Aneurisma de Aorta')
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (4, N'Angioplastia Coronaria')
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (5, N'Angioplastia Coronaria y Stents')
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (6, N'Apendicectomía')
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (7, N'Artroscopia. Cirugía de la Rodilla')
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (8, N'Autocontrol de la Glucosa')
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (9, N'By-Pass (derivación) de las Coronarias')
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (10, N'Cateterismo Cardíaco. Coronariografía')
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (11, N'Cesárea')
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (12, N'Cirugía de Hemorroides')
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (13, N'Cirugía de la Obesidad')
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (14, N'Cirugía de la Refracción (Operación Miopía)')
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (15, N'Cirugía para el Cáncer de Mama')
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (16, N'Cirugía Plástica de Mama')
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (17, N'Defecto Congénito del Corazón')
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (18, N'Dermoabrasión. Lifting Facial Físico')
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (19, N'Drenaje Timpánico. Drenaje de Oídos')
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (20, N'El Registro Holter')
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (21, N'Endarterectomía de la arteria carótida')
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (22, N'Estudio Isotópico')
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (23, N'Fimosis y Circuncisión')
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (24, N'Gastroscopia')
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (25, N'Hernia Discal')
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (26, N'Hernia Inguinal')
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (27, N'Hernia Umbilical')
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (28, N'Histerectomía. Operación de Matriz')
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (29, N'Intervención de Cataratas')
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (30, N'Legrado Uterino')
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (31, N'Lifting Facial por Cirugía')
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (32, N'Ligadura de trompas')
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (33, N'Liposucción')
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (34, N'Lumpectomía. Extirpación Parcial de Mama')
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (35, N'Mamografía. Rayos-X de Mama')
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (36, N'Papanicolau. Citología')
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (37, N'Prostatectomía')
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (38, N'Pruebas Básicas de Diagnóstico. Cardiología')
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (39, N'Rinoplastia. Intervención de la Nariz')
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (40, N'Test de Esfuerzo. Tolerancia al Ejercicio')
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (41, N'Trasplante de Corazón')
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (42, N'Tratamiento de la Arteriosclerosis de Extremidades')
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (43, N'Vacuna contra la varicela')
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (44, N'Vasectomía')
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (45, N'Vesícula, Intervención (Colecistectomía)')
SET IDENTITY_INSERT [dbo].[intervencion] OFF
INSERT [dbo].[intervencionoperacion] ([idoperacion], [idintervencion], [observacion]) VALUES (1, 3, N'observ 2')
INSERT [dbo].[intervencionoperacion] ([idoperacion], [idintervencion], [observacion]) VALUES (1, 9, N'observ 3')
INSERT [dbo].[intervencionoperacion] ([idoperacion], [idintervencion], [observacion]) VALUES (1, 10, N'observ 1')
INSERT [dbo].[intervencionoperacion] ([idoperacion], [idintervencion], [observacion]) VALUES (2, 9, N'observ 3')
INSERT [dbo].[intervencionoperacion] ([idoperacion], [idintervencion], [observacion]) VALUES (2, 12, N'')
INSERT [dbo].[intervencionoperacion] ([idoperacion], [idintervencion], [observacion]) VALUES (3, 13, N'')
INSERT [dbo].[intervencionoperacion] ([idoperacion], [idintervencion], [observacion]) VALUES (4, 40, N'esfuerzo 4')
INSERT [dbo].[intervencionoperacion] ([idoperacion], [idintervencion], [observacion]) VALUES (4, 43, N'esfuerzo 4')
INSERT [dbo].[intervencionoperacion] ([idoperacion], [idintervencion], [observacion]) VALUES (5, 32, N'')
INSERT [dbo].[intervencionoperacion] ([idoperacion], [idintervencion], [observacion]) VALUES (7, 18, N'')
INSERT [dbo].[intervencionoperacion] ([idoperacion], [idintervencion], [observacion]) VALUES (7, 20, N'')
INSERT [dbo].[intervencionoperacion] ([idoperacion], [idintervencion], [observacion]) VALUES (7, 21, N'')
INSERT [dbo].[intervencionoperacion] ([idoperacion], [idintervencion], [observacion]) VALUES (8, 2, N'')
INSERT [dbo].[intervencionoperacion] ([idoperacion], [idintervencion], [observacion]) VALUES (10, 15, N'')
INSERT [dbo].[intervencionoperacion] ([idoperacion], [idintervencion], [observacion]) VALUES (11, 14, N'')
INSERT [dbo].[intervencionoperacion] ([idoperacion], [idintervencion], [observacion]) VALUES (11, 19, N'')
INSERT [dbo].[intervencionoperacion] ([idoperacion], [idintervencion], [observacion]) VALUES (12, 2, N'')
INSERT [dbo].[intervencionoperacion] ([idoperacion], [idintervencion], [observacion]) VALUES (13, 2, N'')
INSERT [dbo].[intervencionoperacion] ([idoperacion], [idintervencion], [observacion]) VALUES (14, 2, N'')
INSERT [dbo].[intervencionoperacion] ([idoperacion], [idintervencion], [observacion]) VALUES (15, 13, N'')
INSERT [dbo].[intervencionoperacion] ([idoperacion], [idintervencion], [observacion]) VALUES (16, 10, N'')
SET IDENTITY_INSERT [dbo].[material] ON 

INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (1, N'Agujas Quirúrgicas.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (2, N'Material de Corte Quirúrgico.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (3, N'Separadores Quirúrgicos.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (4, N'Set de Traqueostomía.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (5, N'Set General de Cirugía.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (6, N'Set de Tiroides.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (7, N'Set de Estómago.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (8, N'Set de Vesícula.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (9, N'Set General de Vascular.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (10, N'Set de Amputación.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (11, N'Set General de Tórax.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (12, N'Set de Arco-Barra.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (13, N'Set de Osteosíntesis.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (14, N'Set de Oxodoncia.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (15, N'Set de Plastia.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (16, N'Set de Tabique.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (17, N'Set de Tejido Blando Oral.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (18, N'Set de Tejido Duro Oral.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (19, N'Abre Boca.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (20, N'Desimpactador de Maxilar Superior.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (21, N'Elevador de Malar.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (22, N'Elevadores Rectos.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (23, N'Forceps.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (24, N'Ponchador.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (25, N'Rouger o Guvia.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (26, N'Barry.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (27, N'Winter.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (28, N'Set de Craneo.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (29, N'Set de Columna Cervical.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (30, N'Set de Fijación Toracolumbar.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (31, N'Set de Hipófisis.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (32, N'Set de Microcirugía.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (33, N'Set de Microtecnia de Caspar.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (34, N'Set de Tumores.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (35, N'Set de Tunel Carpiano.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (36, N'Set de Cánulas Estereotácticas.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (37, N'Cabezal de Sugita.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (38, N'Cánulas de Aspiración.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (39, N'Mandriles.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (40, N'Marco EstereoFlex.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (41, N'Pinzas Bipolares.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (42, N'Retractores de Leyla.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (43, N'Trócares.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (44, N'Set de Histerectomía.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (45, N'Set de Legrado.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (46, N'Valvas Ginecológicas.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (47, N'Set de Catarata.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (48, N'Set de Estrabismo.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (49, N'Set de Párpados.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (50, N'Set de Retina.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (51, N'Set de transplante de Cornea.')
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (52, N'Set de cirugía refractiva')
SET IDENTITY_INSERT [dbo].[material] OFF
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (1, 2, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (1, 28, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (1, 38, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (2, 13, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (2, 31, 2)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (2, 49, 2)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (3, 12, 2)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (3, 27, 2)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (3, 39, 4)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (4, 10, 2)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (4, 36, 4)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (4, 45, 3)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (4, 49, 3)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (4, 52, 4)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (5, 9, 5)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (5, 42, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (5, 47, 4)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (6, 4, 2)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (6, 6, 5)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (6, 15, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (6, 33, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (6, 39, 5)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (6, 51, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (7, 32, 3)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (7, 37, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (7, 40, 3)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (8, 1, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (8, 12, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (8, 13, 4)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (8, 26, 3)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (8, 30, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (9, 11, 4)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (9, 18, 2)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (9, 27, 2)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (9, 29, 3)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (9, 31, 5)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (10, 1, 3)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (10, 20, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (10, 41, 5)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (10, 43, 3)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (10, 46, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (10, 51, 5)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (11, 16, 3)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (12, 11, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (12, 28, 2)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (12, 43, 3)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (13, 2, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (13, 5, 4)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (13, 6, 2)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (13, 21, 5)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (13, 27, 4)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (13, 49, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (14, 6, 3)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (14, 9, 4)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (14, 11, 3)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (14, 13, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (15, 13, 4)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (15, 26, 2)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (15, 28, 4)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (15, 36, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (15, 37, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (15, 43, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (15, 50, 2)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (16, 15, 2)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (16, 41, 4)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (16, 47, 2)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (17, 2, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (17, 3, 2)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (17, 4, 4)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (17, 19, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (17, 22, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (17, 28, 2)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (17, 36, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (17, 38, 4)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (18, 1, 3)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (18, 5, 4)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (19, 5, 2)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (19, 7, 3)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (20, 18, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (20, 25, 2)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (20, 31, 4)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (20, 40, 3)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (21, 2, 3)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (21, 16, 3)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (22, 30, 2)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (22, 51, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (23, 4, 4)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (23, 13, 2)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (23, 36, 4)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (23, 41, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (23, 51, 3)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (23, 52, 5)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (24, 8, 4)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (24, 15, 3)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (24, 23, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (25, 18, 5)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (25, 19, 4)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (25, 30, 5)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (26, 29, 3)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (26, 31, 2)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (27, 15, 5)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (28, 5, 5)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (28, 10, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (28, 16, 2)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (29, 47, 3)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (30, 8, 2)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (30, 20, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (30, 36, 4)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (31, 28, 5)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (31, 44, 3)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (31, 49, 3)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (32, 3, 5)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (32, 11, 5)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (32, 22, 3)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (32, 25, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (32, 32, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (32, 46, 4)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (32, 47, 4)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (32, 52, 3)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (33, 20, 5)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (33, 35, 5)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (33, 36, 4)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (34, 5, 2)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (34, 6, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (34, 23, 2)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (34, 37, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (34, 41, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (35, 3, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (35, 4, 3)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (35, 5, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (35, 9, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (35, 11, 4)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (35, 21, 5)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (36, 27, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (36, 44, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (36, 50, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (37, 21, 3)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (37, 33, 5)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (37, 49, 4)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (38, 4, 5)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (38, 5, 2)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (38, 25, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (38, 34, 3)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (39, 47, 5)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (39, 51, 2)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (40, 21, 5)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (40, 43, 4)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (41, 7, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (41, 27, 2)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (41, 28, 3)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (41, 36, 5)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (41, 41, 4)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (42, 22, 5)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (43, 22, 4)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (43, 25, 2)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (43, 43, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (43, 46, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (44, 17, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (44, 21, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (44, 23, 3)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (44, 28, 4)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (44, 32, 3)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (44, 49, 2)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (45, 5, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (45, 7, 5)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (45, 29, 1)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (45, 48, 3)
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (45, 51, 3)
SET IDENTITY_INSERT [dbo].[operacion] ON 

INSERT [dbo].[operacion] ([idoperacion], [fechaoperacion], [DNIPaciente]) VALUES (1, CAST(N'2015-04-13 00:00:00.000' AS DateTime), N'05679340L')
INSERT [dbo].[operacion] ([idoperacion], [fechaoperacion], [DNIPaciente]) VALUES (2, CAST(N'2015-03-16 00:00:00.000' AS DateTime), N'13455656N')
INSERT [dbo].[operacion] ([idoperacion], [fechaoperacion], [DNIPaciente]) VALUES (3, CAST(N'2015-03-18 00:00:00.000' AS DateTime), N'43554430C')
INSERT [dbo].[operacion] ([idoperacion], [fechaoperacion], [DNIPaciente]) VALUES (4, CAST(N'2015-04-22 00:00:00.000' AS DateTime), N'56321789X')
INSERT [dbo].[operacion] ([idoperacion], [fechaoperacion], [DNIPaciente]) VALUES (5, CAST(N'2015-04-14 00:00:00.000' AS DateTime), N'67655432N')
INSERT [dbo].[operacion] ([idoperacion], [fechaoperacion], [DNIPaciente]) VALUES (6, CAST(N'2015-04-16 00:00:00.000' AS DateTime), N'54377890W')
INSERT [dbo].[operacion] ([idoperacion], [fechaoperacion], [DNIPaciente]) VALUES (7, CAST(N'2015-04-16 00:00:00.000' AS DateTime), N'43566789M')
INSERT [dbo].[operacion] ([idoperacion], [fechaoperacion], [DNIPaciente]) VALUES (8, CAST(N'2015-04-16 00:00:00.000' AS DateTime), N'56999678C')
INSERT [dbo].[operacion] ([idoperacion], [fechaoperacion], [DNIPaciente]) VALUES (9, CAST(N'2015-04-01 00:00:00.000' AS DateTime), N'76523986L')
INSERT [dbo].[operacion] ([idoperacion], [fechaoperacion], [DNIPaciente]) VALUES (10, CAST(N'2015-04-01 00:00:00.000' AS DateTime), N'76523986L')
INSERT [dbo].[operacion] ([idoperacion], [fechaoperacion], [DNIPaciente]) VALUES (11, CAST(N'2015-04-02 00:00:00.000' AS DateTime), N'67544345S')
INSERT [dbo].[operacion] ([idoperacion], [fechaoperacion], [DNIPaciente]) VALUES (12, CAST(N'2015-04-02 00:00:00.000' AS DateTime), N'75655499N')
INSERT [dbo].[operacion] ([idoperacion], [fechaoperacion], [DNIPaciente]) VALUES (13, CAST(N'2015-04-02 00:00:00.000' AS DateTime), N'45678901G')
INSERT [dbo].[operacion] ([idoperacion], [fechaoperacion], [DNIPaciente]) VALUES (14, CAST(N'2015-04-02 00:00:00.000' AS DateTime), N'67655432N')
INSERT [dbo].[operacion] ([idoperacion], [fechaoperacion], [DNIPaciente]) VALUES (15, CAST(N'2015-04-11 00:00:00.000' AS DateTime), N'23432988J')
INSERT [dbo].[operacion] ([idoperacion], [fechaoperacion], [DNIPaciente]) VALUES (16, CAST(N'2015-04-11 00:00:00.000' AS DateTime), N'45567678D')
SET IDENTITY_INSERT [dbo].[operacion] OFF
INSERT [dbo].[Paciente] ([DNIPaciente], [Nombre], [DatosCliente], [FechaNacimiento], [Telefono]) VALUES (N'05679340L', N'david pérez', N'c/galicia nº 32', CAST(N'1985-01-30 00:00:00.000' AS DateTime), N'922304050')
INSERT [dbo].[Paciente] ([DNIPaciente], [Nombre], [DatosCliente], [FechaNacimiento], [Telefono]) VALUES (N'07865988B', N'pedro hernández', N'Rambla nº 7', CAST(N'1990-10-10 00:00:00.000' AS DateTime), N'822090876')
INSERT [dbo].[Paciente] ([DNIPaciente], [Nombre], [DatosCliente], [FechaNacimiento], [Telefono]) VALUES (N'13455656N', N'maría ruiz', N'c/fuerteventura nº 9', CAST(N'1980-03-21 00:00:00.000' AS DateTime), N'659030304')
INSERT [dbo].[Paciente] ([DNIPaciente], [Nombre], [DatosCliente], [FechaNacimiento], [Telefono]) VALUES (N'23432988J', N'maría ramos', N'c/lanzarote nº 99', CAST(N'1980-03-22 00:00:00.000' AS DateTime), N'822364656')
INSERT [dbo].[Paciente] ([DNIPaciente], [Nombre], [DatosCliente], [FechaNacimiento], [Telefono]) VALUES (N'23446456A', N'josé gonzález', N'c/cinco de mayo nº 7', CAST(N'1990-10-14 00:00:00.000' AS DateTime), N'922989876')
INSERT [dbo].[Paciente] ([DNIPaciente], [Nombre], [DatosCliente], [FechaNacimiento], [Telefono]) VALUES (N'43005006C', N'juan rodríguez', N'C/x nº 6', CAST(N'1960-01-02 00:00:00.000' AS DateTime), N'656959595')
INSERT [dbo].[Paciente] ([DNIPaciente], [Nombre], [DatosCliente], [FechaNacimiento], [Telefono]) VALUES (N'43554430C', N'samuel gonzález', N'c/principal nº 54', CAST(N'1985-01-30 00:00:00.000' AS DateTime), N'659030303')
INSERT [dbo].[Paciente] ([DNIPaciente], [Nombre], [DatosCliente], [FechaNacimiento], [Telefono]) VALUES (N'43566789M', N'jesús fernández', N'c/la mancha nº 8', CAST(N'1985-01-28 00:00:00.000' AS DateTime), N'922656565')
INSERT [dbo].[Paciente] ([DNIPaciente], [Nombre], [DatosCliente], [FechaNacimiento], [Telefono]) VALUES (N'45567678D', N'juana rodríguez', N'C/seis nº 8', CAST(N'1990-10-12 00:00:00.000' AS DateTime), N'633090909')
INSERT [dbo].[Paciente] ([DNIPaciente], [Nombre], [DatosCliente], [FechaNacimiento], [Telefono]) VALUES (N'45667443T', N'alberto gonzález', N'c/alborada nº 7', CAST(N'1980-03-17 00:00:00.000' AS DateTime), N'922989898')
INSERT [dbo].[Paciente] ([DNIPaciente], [Nombre], [DatosCliente], [FechaNacimiento], [Telefono]) VALUES (N'45678901G', N'ana pérez', N'C/una nº 5', CAST(N'1960-01-01 00:00:00.000' AS DateTime), N'699898989')
INSERT [dbo].[Paciente] ([DNIPaciente], [Nombre], [DatosCliente], [FechaNacimiento], [Telefono]) VALUES (N'54377890W', N'maría pérez', N'Avenida Primera nº 6', CAST(N'1990-10-11 00:00:00.000' AS DateTime), N'677090909')
INSERT [dbo].[Paciente] ([DNIPaciente], [Nombre], [DatosCliente], [FechaNacimiento], [Telefono]) VALUES (N'56008986F', N'juana pérez', N'c/el hierro nº 6', CAST(N'1980-03-18 00:00:00.000' AS DateTime), N'621090909')
INSERT [dbo].[Paciente] ([DNIPaciente], [Nombre], [DatosCliente], [FechaNacimiento], [Telefono]) VALUES (N'56321789X', N'pedro fernández', N'c/la gomera nº 8', CAST(N'1980-03-19 00:00:00.000' AS DateTime), N'645090909')
INSERT [dbo].[Paciente] ([DNIPaciente], [Nombre], [DatosCliente], [FechaNacimiento], [Telefono]) VALUES (N'56999678C', N'josefa hernández', N'c/primero de junio nº 7', CAST(N'1990-10-13 00:00:00.000' AS DateTime), N'657090909')
INSERT [dbo].[Paciente] ([DNIPaciente], [Nombre], [DatosCliente], [FechaNacimiento], [Telefono]) VALUES (N'65783450T', N'carmen ramos', N'c/madrid nº 75', CAST(N'1985-01-27 00:00:00.000' AS DateTime), N'678090909')
INSERT [dbo].[Paciente] ([DNIPaciente], [Nombre], [DatosCliente], [FechaNacimiento], [Telefono]) VALUES (N'67544345S', N'ana rojas', N'c/la palma nº 77', CAST(N'1985-01-25 00:00:00.000' AS DateTime), N'683080808')
INSERT [dbo].[Paciente] ([DNIPaciente], [Nombre], [DatosCliente], [FechaNacimiento], [Telefono]) VALUES (N'67655432N', N'fernando rojas', N'c/gran canaria nº 9', CAST(N'1980-03-20 00:00:00.000' AS DateTime), N'922030303')
INSERT [dbo].[Paciente] ([DNIPaciente], [Nombre], [DatosCliente], [FechaNacimiento], [Telefono]) VALUES (N'75655499N', N'fernando pérez', N'c/ofra nº 3', CAST(N'1985-01-29 00:00:00.000' AS DateTime), N'822030303')
INSERT [dbo].[Paciente] ([DNIPaciente], [Nombre], [DatosCliente], [FechaNacimiento], [Telefono]) VALUES (N'76523986L', N'marta ruiz', N'c/la graciosa nº 66', CAST(N'1985-01-26 00:00:00.000' AS DateTime), N'611098787')
ALTER TABLE [dbo].[intervencionoperacion]  WITH CHECK ADD  CONSTRAINT [FK_operacionintervencion1] FOREIGN KEY([idoperacion])
REFERENCES [dbo].[operacion] ([idoperacion])
GO
ALTER TABLE [dbo].[intervencionoperacion] CHECK CONSTRAINT [FK_operacionintervencion1]
GO
ALTER TABLE [dbo].[intervencionoperacion]  WITH CHECK ADD  CONSTRAINT [FK_operacionintervencion2] FOREIGN KEY([idintervencion])
REFERENCES [dbo].[intervencion] ([idintervencion])
GO
ALTER TABLE [dbo].[intervencionoperacion] CHECK CONSTRAINT [FK_operacionintervencion2]
GO
ALTER TABLE [dbo].[materialintervencion]  WITH CHECK ADD  CONSTRAINT [FK_materialintervencion1] FOREIGN KEY([idintervencion])
REFERENCES [dbo].[intervencion] ([idintervencion])
GO
ALTER TABLE [dbo].[materialintervencion] CHECK CONSTRAINT [FK_materialintervencion1]
GO
ALTER TABLE [dbo].[materialintervencion]  WITH CHECK ADD  CONSTRAINT [FK_materialintervencion2] FOREIGN KEY([idmaterial])
REFERENCES [dbo].[material] ([idmaterial])
GO
ALTER TABLE [dbo].[materialintervencion] CHECK CONSTRAINT [FK_materialintervencion2]
GO
ALTER TABLE [dbo].[operacion]  WITH CHECK ADD  CONSTRAINT [FK_operacionpaciente] FOREIGN KEY([DNIPaciente])
REFERENCES [dbo].[Paciente] ([DNIPaciente])
GO
ALTER TABLE [dbo].[operacion] CHECK CONSTRAINT [FK_operacionpaciente]
GO
USE [master]
GO
ALTER DATABASE [operacionesquirurgicas] SET  READ_WRITE 
GO
