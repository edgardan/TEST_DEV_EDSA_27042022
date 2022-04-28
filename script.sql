USE [master]
GO
/****** Object:  Database [TEST_DEV_EDSA_22042022]    Script Date: 27/04/2022 10:43:12 p. m. ******/
CREATE DATABASE [TEST_DEV_EDSA_22042022]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TEST_DEV_EDSA_22042022', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TEST_DEV_EDSA_22042022.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TEST_DEV_EDSA_22042022_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TEST_DEV_EDSA_22042022_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TEST_DEV_EDSA_22042022] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TEST_DEV_EDSA_22042022].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TEST_DEV_EDSA_22042022] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TEST_DEV_EDSA_22042022] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TEST_DEV_EDSA_22042022] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TEST_DEV_EDSA_22042022] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TEST_DEV_EDSA_22042022] SET ARITHABORT OFF 
GO
ALTER DATABASE [TEST_DEV_EDSA_22042022] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TEST_DEV_EDSA_22042022] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TEST_DEV_EDSA_22042022] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TEST_DEV_EDSA_22042022] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TEST_DEV_EDSA_22042022] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TEST_DEV_EDSA_22042022] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TEST_DEV_EDSA_22042022] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TEST_DEV_EDSA_22042022] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TEST_DEV_EDSA_22042022] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TEST_DEV_EDSA_22042022] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TEST_DEV_EDSA_22042022] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TEST_DEV_EDSA_22042022] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TEST_DEV_EDSA_22042022] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TEST_DEV_EDSA_22042022] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TEST_DEV_EDSA_22042022] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TEST_DEV_EDSA_22042022] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TEST_DEV_EDSA_22042022] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TEST_DEV_EDSA_22042022] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TEST_DEV_EDSA_22042022] SET  MULTI_USER 
GO
ALTER DATABASE [TEST_DEV_EDSA_22042022] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TEST_DEV_EDSA_22042022] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TEST_DEV_EDSA_22042022] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TEST_DEV_EDSA_22042022] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TEST_DEV_EDSA_22042022] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TEST_DEV_EDSA_22042022] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TEST_DEV_EDSA_22042022] SET QUERY_STORE = OFF
GO
USE [TEST_DEV_EDSA_22042022]
GO
/****** Object:  Table [dbo].[Tb_PersonasFisicas]    Script Date: 27/04/2022 10:43:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_PersonasFisicas](
	[IdPersonaFisica] [int] IDENTITY(1,1) NOT NULL,
	[FechaRegistro] [datetime] NULL,
	[FechaActualizacion] [datetime] NULL,
	[Nombre] [varchar](50) NULL,
	[ApellidoPaterno] [varchar](50) NULL,
	[ApellidoMaterno] [varchar](50) NULL,
	[RFC] [varchar](13) NULL,
	[FechaNacimiento] [date] NULL,
	[UsuarioAgrega] [int] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_Tb_PersonasFisicas] PRIMARY KEY CLUSTERED 
(
	[IdPersonaFisica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserActivation]    Script Date: 27/04/2022 10:43:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserActivation](
	[UserId] [int] NOT NULL,
	[ActivationCode] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_UserActivation] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 27/04/2022 10:43:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] NOT NULL,
	[Username] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](30) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[LastLoginDate] [datetime] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tb_PersonasFisicas] ON 
GO
INSERT [dbo].[Tb_PersonasFisicas] ([IdPersonaFisica], [FechaRegistro], [FechaActualizacion], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [RFC], [FechaNacimiento], [UsuarioAgrega], [Activo]) VALUES (1, CAST(N'2022-04-25T22:09:57.220' AS DateTime), NULL, N'EDGAR', N'SANCHEZ', N'AVILA', N'SAAE891019EGA', CAST(N'1989-10-19' AS Date), 7, 0)
GO
INSERT [dbo].[Tb_PersonasFisicas] ([IdPersonaFisica], [FechaRegistro], [FechaActualizacion], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [RFC], [FechaNacimiento], [UsuarioAgrega], [Activo]) VALUES (2, CAST(N'2022-04-25T22:12:43.240' AS DateTime), NULL, N'CAROLINA', N'EliaS', N'A', N'EAAE890527ERF', CAST(N'1989-05-27' AS Date), 7, 0)
GO
INSERT [dbo].[Tb_PersonasFisicas] ([IdPersonaFisica], [FechaRegistro], [FechaActualizacion], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [RFC], [FechaNacimiento], [UsuarioAgrega], [Activo]) VALUES (3, CAST(N'2022-04-25T23:19:06.437' AS DateTime), NULL, N'CAROLINA', N'ELIAS', N'ARENAS', N'EAAE890527ERA', CAST(N'1989-05-27' AS Date), 7, 0)
GO
INSERT [dbo].[Tb_PersonasFisicas] ([IdPersonaFisica], [FechaRegistro], [FechaActualizacion], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [RFC], [FechaNacimiento], [UsuarioAgrega], [Activo]) VALUES (4, CAST(N'2022-04-25T23:20:41.330' AS DateTime), NULL, N'NESBIT', N'S', N'E', N'JSHFTE3546RTS', CAST(N'1989-05-27' AS Date), 7, 1)
GO
INSERT [dbo].[Tb_PersonasFisicas] ([IdPersonaFisica], [FechaRegistro], [FechaActualizacion], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [RFC], [FechaNacimiento], [UsuarioAgrega], [Activo]) VALUES (5, CAST(N'2022-04-26T01:18:17.570' AS DateTime), NULL, N'JULIO', N'SANCHEZ', N'PEREZ', N'GTTS354673TEF', CAST(N'1976-10-12' AS Date), 5, 1)
GO
INSERT [dbo].[Tb_PersonasFisicas] ([IdPersonaFisica], [FechaRegistro], [FechaActualizacion], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [RFC], [FechaNacimiento], [UsuarioAgrega], [Activo]) VALUES (6, CAST(N'2022-04-26T19:41:02.283' AS DateTime), NULL, N'1975-12-01', NULL, NULL, NULL, CAST(N'0001-01-01' AS Date), 0, 0)
GO
INSERT [dbo].[Tb_PersonasFisicas] ([IdPersonaFisica], [FechaRegistro], [FechaActualizacion], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [RFC], [FechaNacimiento], [UsuarioAgrega], [Activo]) VALUES (7, CAST(N'2022-04-26T19:51:23.210' AS DateTime), NULL, N'RAQUEL', N'LOPEZ', N'HERNANDEZ', N'RAAE354657EFG', CAST(N'1964-11-20' AS Date), 0, 1)
GO
INSERT [dbo].[Tb_PersonasFisicas] ([IdPersonaFisica], [FechaRegistro], [FechaActualizacion], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [RFC], [FechaNacimiento], [UsuarioAgrega], [Activo]) VALUES (8, CAST(N'2022-04-27T10:33:19.700' AS DateTime), NULL, N'RAQUEL2', N'LOPEZ', N'ELIAS', N'EIAC890527MK2', CAST(N'1989-05-27' AS Date), 0, 1)
GO
INSERT [dbo].[Tb_PersonasFisicas] ([IdPersonaFisica], [FechaRegistro], [FechaActualizacion], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [RFC], [FechaNacimiento], [UsuarioAgrega], [Activo]) VALUES (9, CAST(N'2022-04-27T10:51:09.940' AS DateTime), NULL, N'Ofelia', N'gfg', N'ELIAS', N'EIAC890527MK4', CAST(N'1989-05-27' AS Date), 0, 0)
GO
INSERT [dbo].[Tb_PersonasFisicas] ([IdPersonaFisica], [FechaRegistro], [FechaActualizacion], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [RFC], [FechaNacimiento], [UsuarioAgrega], [Activo]) VALUES (10, CAST(N'2022-04-27T11:51:39.400' AS DateTime), NULL, N'sisi', N'prueba', N'p', N'tegka567456ps', CAST(N'1990-05-27' AS Date), 0, 0)
GO
INSERT [dbo].[Tb_PersonasFisicas] ([IdPersonaFisica], [FechaRegistro], [FechaActualizacion], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [RFC], [FechaNacimiento], [UsuarioAgrega], [Activo]) VALUES (11, CAST(N'2022-04-27T13:30:31.367' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'0001-01-01' AS Date), 0, 0)
GO
INSERT [dbo].[Tb_PersonasFisicas] ([IdPersonaFisica], [FechaRegistro], [FechaActualizacion], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [RFC], [FechaNacimiento], [UsuarioAgrega], [Activo]) VALUES (12, CAST(N'2022-04-27T13:30:48.140' AS DateTime), NULL, N'Edgar', N'gfg', N'Sanchez', N'EIAC890527MK2', CAST(N'1989-05-27' AS Date), 0, 0)
GO
INSERT [dbo].[Tb_PersonasFisicas] ([IdPersonaFisica], [FechaRegistro], [FechaActualizacion], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [RFC], [FechaNacimiento], [UsuarioAgrega], [Activo]) VALUES (24, CAST(N'2022-04-27T21:15:21.740' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'0001-01-01' AS Date), 0, 0)
GO
INSERT [dbo].[Tb_PersonasFisicas] ([IdPersonaFisica], [FechaRegistro], [FechaActualizacion], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [RFC], [FechaNacimiento], [UsuarioAgrega], [Activo]) VALUES (25, CAST(N'2022-04-27T21:20:50.453' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'0001-01-01' AS Date), 0, 1)
GO
INSERT [dbo].[Tb_PersonasFisicas] ([IdPersonaFisica], [FechaRegistro], [FechaActualizacion], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [RFC], [FechaNacimiento], [UsuarioAgrega], [Activo]) VALUES (26, CAST(N'2022-04-27T21:21:12.907' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'0001-01-01' AS Date), 0, 1)
GO
INSERT [dbo].[Tb_PersonasFisicas] ([IdPersonaFisica], [FechaRegistro], [FechaActualizacion], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [RFC], [FechaNacimiento], [UsuarioAgrega], [Activo]) VALUES (27, CAST(N'2022-04-27T21:21:54.690' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'0001-01-01' AS Date), 0, 1)
GO
INSERT [dbo].[Tb_PersonasFisicas] ([IdPersonaFisica], [FechaRegistro], [FechaActualizacion], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [RFC], [FechaNacimiento], [UsuarioAgrega], [Activo]) VALUES (28, CAST(N'2022-04-27T21:23:53.350' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'0001-01-01' AS Date), 0, 1)
GO
INSERT [dbo].[Tb_PersonasFisicas] ([IdPersonaFisica], [FechaRegistro], [FechaActualizacion], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [RFC], [FechaNacimiento], [UsuarioAgrega], [Activo]) VALUES (29, CAST(N'2022-04-27T22:13:18.300' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'0001-01-01' AS Date), 0, 1)
GO
SET IDENTITY_INSERT [dbo].[Tb_PersonasFisicas] OFF
GO
INSERT [dbo].[Users] ([UserId], [Username], [Password], [Email], [CreatedDate], [LastLoginDate]) VALUES (7, N'edgar.sanchez', N'123', N'edgar.dan.s@hotmail.com', CAST(N'2022-04-26T01:25:41.430' AS DateTime), CAST(N'2022-04-27T22:29:37.680' AS DateTime))
GO
ALTER TABLE [dbo].[Tb_PersonasFisicas] ADD  CONSTRAINT [DF_Tb_PersonasFisicas_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[Tb_PersonasFisicas] ADD  CONSTRAINT [DF_Tb_PersonasFisicas_Activo]  DEFAULT ((1)) FOR [Activo]
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarPersonaFisica]    Script Date: 27/04/2022 10:43:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ActualizarPersonaFisica]
(
    @IdPersonaFisica INT,
    @Nombre VARCHAR(50),
    @ApellidoPaterno VARCHAR(50),
    @ApellidoMaterno VARCHAR(50),
    @RFC VARCHAR(13),
    @FechaNacimiento DATE,
    @UsuarioAgrega INT
)
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @ID INT,
            @ERROR VARCHAR(500);
    BEGIN TRY
        IF NOT EXISTS
        (
            SELECT *
            FROM dbo.Tb_PersonasFisicas
            WHERE IdPersonaFisica = @IdPersonaFisica
                  AND Activo = 1
        )
        BEGIN
            SELECT @ERROR = 'La persona fisica no existe.';
            THROW 50000, @ERROR, 1;
        END;

        UPDATE dbo.Tb_PersonasFisicas
        SET Nombre = @Nombre,
            ApellidoPaterno = @ApellidoPaterno,
            ApellidoMaterno = @ApellidoMaterno,
            RFC = @RFC,
            FechaNacimiento = @FechaNacimiento
        WHERE IdPersonaFisica = @IdPersonaFisica;
        SELECT @IdPersonaFisica AS ERROR,
               'Registro exitoso' AS MENSAJEERROR;
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE();
        SELECT ERROR_NUMBER() * -1 AS ERROR,
               ISNULL(@ERROR, 'Error al actualizar el registro.') AS MENSAJEERROR;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_AgregarPersonaFisica]    Script Date: 27/04/2022 10:43:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===================================================================
CREATE PROCEDURE [dbo].[sp_AgregarPersonaFisica]
(
    @Nombre VARCHAR(50),
    @ApellidoPaterno VARCHAR(50),
    @ApellidoMaterno VARCHAR(50),
    @RFC VARCHAR(13),
    @FechaNacimiento DATE,
    @UsuarioAgrega INT
)
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @ID INT,
            @ERROR VARCHAR(500);
    BEGIN TRY
        IF LEN(@RFC) != 13
        BEGIN
            SELECT @ERROR = 'El RFC no es válido';
            THROW 50000, @ERROR, 1;
        END;
        IF EXISTS
        (
            SELECT *
            FROM dbo.Tb_PersonasFisicas
            WHERE RFC = @RFC
                  AND Activo = 1
        )
        BEGIN
            SELECT @ERROR = 'El RFC ya existe en el sistema';
            THROW 50000, @ERROR, 1;
        END;

        INSERT INTO dbo.Tb_PersonasFisicas
        (
            FechaRegistro,
            FechaActualizacion,
            Nombre,
            ApellidoPaterno,
            ApellidoMaterno,
            RFC,
            FechaNacimiento,
            UsuarioAgrega,
            Activo
        )
        VALUES
        (   GETDATE(),        -- FechaRegistro - datetime
            NULL,             -- FechaActualizacion - datetime
            @Nombre,          -- Nombre - varchar(50)
            @ApellidoPaterno, -- ApellidoPaterno - varchar(50)
            @ApellidoMaterno, -- ApellidoMaterno - varchar(50)
            @RFC,             -- RFC - varchar(13)
            @FechaNacimiento, -- FechaNacimiento - date
            @UsuarioAgrega,   -- UsuarioAgrega - int
            1                 -- Activo - bit
            );

        SELECT @ID = SCOPE_IDENTITY();
        SELECT @ID AS ERROR,
               'Registro exitoso' AS MENSAJEERROR;
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE();
        SELECT ERROR_NUMBER() * -1 AS ERROR,
               ISNULL(@ERROR, 'Error al guardar el registro.') AS MENSAJEERROR;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarPersonaFisica]    Script Date: 27/04/2022 10:43:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_EliminarPersonaFisica]
(@IdPersonaFisica INT)
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @ID INT,
            @ERROR VARCHAR(500);
    BEGIN TRY
        IF NOT EXISTS
        (
            SELECT *
            FROM dbo.Tb_PersonasFisicas
            WHERE IdPersonaFisica = @IdPersonaFisica
                  AND Activo = 1
        )
        BEGIN
            SELECT @ERROR = 'La persona fisica no existe.';
            THROW 50000, @ERROR, 1;
        END;

        UPDATE dbo.Tb_PersonasFisicas
        SET Activo = 0
        WHERE IdPersonaFisica = @IdPersonaFisica;
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE();
        SELECT ERROR_NUMBER() * -1 AS ERROR,
               ISNULL(@ERROR, 'Error al actualizar el registro.') AS MENSAJEERROR;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarPersonaFisica]    Script Date: 27/04/2022 10:43:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===================================================================
CREATE PROCEDURE [dbo].[sp_ListarPersonaFisica]
AS
BEGIN
    SET NOCOUNT ON;
	SELECT * FROM dbo.Tb_PersonasFisicas WHERE Activo = 1
END;
GO
/****** Object:  StoredProcedure [dbo].[Validate_User]    Script Date: 27/04/2022 10:43:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[Validate_User]
      @Username NVARCHAR(20),
      @Password NVARCHAR(20)
AS
BEGIN
      SET NOCOUNT ON;
      DECLARE @UserId INT, @LastLoginDate DATETIME
     
      SELECT @UserId = UserId, @LastLoginDate = LastLoginDate
      FROM Users WHERE Username = @Username AND [Password] = @Password
     
      IF @UserId IS NOT NULL
      BEGIN
            IF NOT EXISTS(SELECT UserId FROM UserActivation WHERE UserId = @UserId)
            BEGIN
                  UPDATE Users
                  SET LastLoginDate = GETDATE()
                  WHERE UserId = @UserId
                  SELECT @UserId [UserId] -- User Valid
            END
            ELSE
            BEGIN
                  SELECT -2 -- User not activated.
            END
      END
      ELSE
      BEGIN
            SELECT -1 -- User invalid.
      END
END

GO
USE [master]
GO
ALTER DATABASE [TEST_DEV_EDSA_22042022] SET  READ_WRITE 
GO
