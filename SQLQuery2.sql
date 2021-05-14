
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/14/2021 14:30:14
-- Generated from EDMX file: C:\Users\nsntr\source\repos\IsTakipYazilimi_GYG\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [IsTakipDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_KullaniciGorev]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Gorevs] DROP CONSTRAINT [FK_KullaniciGorev];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[YazilimciEntity]', 'U') IS NOT NULL
    DROP TABLE [dbo].[YazilimciEntity];
GO
IF OBJECT_ID(N'[dbo].[Gorevs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Gorevs];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'YazilimciEntity'
CREATE TABLE [dbo].[YazilimciEntity] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [kullanici_adi] nvarchar(max)  NOT NULL,
    [parola] nvarchar(max)  NOT NULL,
    [ad_soyad] nvarchar(max)  NOT NULL,
    [kullanici_turu] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Gorevs'
CREATE TABLE [dbo].[Gorevs] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [gorev_adi] nvarchar(max)  NOT NULL,
    [kullanici_id] nvarchar(max)  NOT NULL,
    [Kullanici_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'YazilimciEntity'
ALTER TABLE [dbo].[YazilimciEntity]
ADD CONSTRAINT [PK_YazilimciEntity]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Gorevs'
ALTER TABLE [dbo].[Gorevs]
ADD CONSTRAINT [PK_Gorevs]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Kullanici_Id] in table 'Gorevs'
ALTER TABLE [dbo].[Gorevs]
ADD CONSTRAINT [FK_KullaniciGorev]
    FOREIGN KEY ([Kullanici_Id])
    REFERENCES [dbo].[YazilimciEntity]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_KullaniciGorev'
CREATE INDEX [IX_FK_KullaniciGorev]
ON [dbo].[Gorevs]
    ([Kullanici_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------