USE [master]
GO
/****** Object:  Database [GooglePayDb]    Script Date: 2/21/2020 5:27:24 PM ******/
CREATE DATABASE [GooglePayDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GooglePayDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQL2017\MSSQL\DATA\GooglePayDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GooglePayDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQL2017\MSSQL\DATA\GooglePayDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [GooglePayDb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GooglePayDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GooglePayDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GooglePayDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GooglePayDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GooglePayDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GooglePayDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [GooglePayDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GooglePayDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GooglePayDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GooglePayDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GooglePayDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GooglePayDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GooglePayDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GooglePayDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GooglePayDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GooglePayDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GooglePayDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GooglePayDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GooglePayDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GooglePayDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GooglePayDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GooglePayDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GooglePayDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GooglePayDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GooglePayDb] SET  MULTI_USER 
GO
ALTER DATABASE [GooglePayDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GooglePayDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GooglePayDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GooglePayDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GooglePayDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GooglePayDb] SET QUERY_STORE = OFF
GO
USE [GooglePayDb]
GO
/****** Object:  Table [dbo].[Upis]    Script Date: 2/21/2020 5:27:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Upis](
	[UpiId] [bigint] IDENTITY(1,1) NOT NULL,
	[UpiName] [varchar](50) NOT NULL,
	[UpiPin] [varchar](20) NOT NULL,
	[BankDetailId] [bigint] NOT NULL,
	[UpiPriority] [bit] NOT NULL,
 CONSTRAINT [PK_Upis] PRIMARY KEY CLUSTERED 
(
	[UpiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/21/2020 5:27:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [bigint] IDENTITY(1,1) NOT NULL,
	[MobileNumber] [varchar](50) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[UserTypeId] [tinyint] NOT NULL,
	[EmailId] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserBankDetails]    Script Date: 2/21/2020 5:27:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserBankDetails](
	[BankDetailId] [bigint] IDENTITY(1,1) NOT NULL,
	[BankId] [smallint] NOT NULL,
	[AccountNumber] [bigint] NOT NULL,
	[Balance] [float] NOT NULL,
	[UserId] [bigint] NOT NULL,
	[AddedStatus] [bit] NOT NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[BankDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vBankAccountInformation]    Script Date: 2/21/2020 5:27:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vBankAccountInformation]
AS
SELECT        dbo.Upis.UpiId, dbo.Upis.UpiName, dbo.UserBankDetails.AccountNumber, dbo.UserBankDetails.AddedStatus, dbo.UserBankDetails.UserId, dbo.UserBankDetails.BankId, dbo.Users.MobileNumber, dbo.Users.UserName, 
                         dbo.Upis.UpiPriority
FROM            dbo.Upis INNER JOIN
                         dbo.UserBankDetails ON dbo.Upis.BankDetailId = dbo.UserBankDetails.BankDetailId INNER JOIN
                         dbo.Users ON dbo.UserBankDetails.UserId = dbo.Users.UserId
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 2/21/2020 5:27:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[TransactionId] [bigint] IDENTITY(1,1) NOT NULL,
	[SenderId] [bigint] NOT NULL,
	[ReciverId] [bigint] NOT NULL,
	[Amount] [float] NOT NULL,
	[SendDate] [datetime2](7) NOT NULL,
	[TransactionStatus] [tinyint] NOT NULL,
	[UPIId] [bigint] NOT NULL,
	[Remarks] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vAllTransactions]    Script Date: 2/21/2020 5:27:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vAllTransactions]
AS
SELECT        dbo.Transactions.TransactionId, dbo.Transactions.SenderId, dbo.Transactions.ReciverId, dbo.Transactions.Amount, dbo.Transactions.UpiId, dbo.Transactions.Remarks, dbo.Transactions.TransactionStatus, 
                         dbo.Transactions.SendDate, dbo.Users.MobileNumber, dbo.Users.UserName
FROM            dbo.Transactions INNER JOIN
                         dbo.Users ON dbo.Transactions.ReciverId = dbo.Users.UserId AND dbo.Transactions.SenderId = dbo.Users.UserId
GO
/****** Object:  Table [dbo].[Banks]    Script Date: 2/21/2020 5:27:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banks](
	[BankId] [smallint] IDENTITY(1,1) NOT NULL,
	[BankName] [varchar](50) NOT NULL,
	[IFSCcode] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Banks] PRIMARY KEY CLUSTERED 
(
	[BankId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cards]    Script Date: 2/21/2020 5:27:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cards](
	[CardId] [bigint] IDENTITY(1,1) NOT NULL,
	[CardNumber] [bigint] NOT NULL,
	[NameOnCard] [varchar](20) NOT NULL,
	[ExpiryDate] [varchar](5) NOT NULL,
	[CVV] [varchar](3) NOT NULL,
	[BankDetailId] [bigint] NOT NULL,
 CONSTRAINT [PK_Cards] PRIMARY KEY CLUSTERED 
(
	[CardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OTPs]    Script Date: 2/21/2020 5:27:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OTPs](
	[OTPId] [bigint] IDENTITY(1,1) NOT NULL,
	[OTPNumber] [int] NOT NULL,
	[UserId] [bigint] NOT NULL,
 CONSTRAINT [PK_OTPs] PRIMARY KEY CLUSTERED 
(
	[OTPId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rewards]    Script Date: 2/21/2020 5:27:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rewards](
	[RewardId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[Amount] [float] NULL,
	[ScratchStatus] [bit] NOT NULL,
 CONSTRAINT [PK_Rewards] PRIMARY KEY CLUSTERED 
(
	[RewardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionStatusObjects]    Script Date: 2/21/2020 5:27:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionStatusObjects](
	[TransactionStatusId] [tinyint] NOT NULL,
	[TransactionName] [varchar](10) NOT NULL,
 CONSTRAINT [PK_TransactionStatusObjects] PRIMARY KEY CLUSTERED 
(
	[TransactionStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTypeObjects]    Script Date: 2/21/2020 5:27:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTypeObjects](
	[UserTypeId] [tinyint] NOT NULL,
	[UserTypeName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_UserTypeObjects] PRIMARY KEY CLUSTERED 
(
	[UserTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cards]  WITH CHECK ADD  CONSTRAINT [FK_Cards_UserBankDetails] FOREIGN KEY([BankDetailId])
REFERENCES [dbo].[UserBankDetails] ([BankDetailId])
GO
ALTER TABLE [dbo].[Cards] CHECK CONSTRAINT [FK_Cards_UserBankDetails]
GO
ALTER TABLE [dbo].[OTPs]  WITH CHECK ADD  CONSTRAINT [FK_OTPs_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[OTPs] CHECK CONSTRAINT [FK_OTPs_Users]
GO
ALTER TABLE [dbo].[Rewards]  WITH CHECK ADD  CONSTRAINT [FK_Rewards_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Rewards] CHECK CONSTRAINT [FK_Rewards_Users]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_TransactionStatusObjects] FOREIGN KEY([TransactionStatus])
REFERENCES [dbo].[TransactionStatusObjects] ([TransactionStatusId])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_TransactionStatusObjects]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Upis] FOREIGN KEY([UPIId])
REFERENCES [dbo].[Upis] ([UpiId])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Upis]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Users] FOREIGN KEY([ReciverId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Users]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Users1] FOREIGN KEY([SenderId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Users1]
GO
ALTER TABLE [dbo].[Upis]  WITH CHECK ADD  CONSTRAINT [FK_Upis_UserBankDetails] FOREIGN KEY([BankDetailId])
REFERENCES [dbo].[UserBankDetails] ([BankDetailId])
GO
ALTER TABLE [dbo].[Upis] CHECK CONSTRAINT [FK_Upis_UserBankDetails]
GO
ALTER TABLE [dbo].[UserBankDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserDetails_UserDetails1] FOREIGN KEY([BankId])
REFERENCES [dbo].[Banks] ([BankId])
GO
ALTER TABLE [dbo].[UserBankDetails] CHECK CONSTRAINT [FK_UserDetails_UserDetails1]
GO
ALTER TABLE [dbo].[UserBankDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserDetails_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[UserBankDetails] CHECK CONSTRAINT [FK_UserDetails_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UserTypeObjects] FOREIGN KEY([UserTypeId])
REFERENCES [dbo].[UserTypeObjects] ([UserTypeId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UserTypeObjects]
GO
/****** Object:  StoredProcedure [dbo].[spTransactions]    Script Date: 2/21/2020 5:27:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spTransactions]		@amount float,
										@senderId bigint,
										@recieverId bigint,
										@sendDate datetime2(7) ,
										@transactionStatus tinyint,
										@remark varchar(max),
										@upiId bigint,
										@flag bit OUTPUT
AS
BEGIN
	
	SET NOCOUNT ON;	
		
	BEGIN TRY

	update UserBankDetails SET  Balance  = Balance-@amount  Where   UserId = @senderId and AddedStatus = 1 ;
	insert into Transactions(SenderId,ReciverId,Amount,	SendDate,TransactionStatus,UPIId,Remarks) values (@senderId,@recieverId,@amount,@sendDate,@transactionStatus,@upiId,@remark);
	update UserBankDetails SET Balance = Balance+@amount where UserId = @recieverId and AddedStatus = 1;
	
	select @flag = 1;
	
	END TRY

	Begin Catch
	select @flag = 0;

		update UserBankDetails SEt Balance = Balance+@amount where UserId = 3;
		/* if transactoin failed then inserting amount to google pay admin.. */
		insert into Transactions(SenderId,ReciverId,Amount,SendDate,TransactionStatus,UpiId,Remarks) values (@senderId,3,@amount,@sendDate,@transactionStatus,@upiId,@remark);

	Return
	END Catch

Return
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Transactions"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 220
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Users"
            Begin Extent = 
               Top = 6
               Left = 258
               Bottom = 136
               Right = 428
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vAllTransactions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vAllTransactions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Upis"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "UserBankDetails"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Users"
            Begin Extent = 
               Top = 6
               Left = 462
               Bottom = 136
               Right = 632
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vBankAccountInformation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vBankAccountInformation'
GO
USE [master]
GO
ALTER DATABASE [GooglePayDb] SET  READ_WRITE 
GO
