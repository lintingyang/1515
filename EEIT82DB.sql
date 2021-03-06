USE [master]
GO
/****** Object:  Database [EEIT82DB]    Script Date: 2016/1/24 上午 10:57:07 ******/
CREATE DATABASE [EEIT82DB] ON  PRIMARY 
( NAME = N'EEIT82DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\DATA\EEIT82DB.mdf' , SIZE = 3072KB , MAXSIZE = 102400KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EEIT82DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\DATA\EEIT82DB_log.ldf' , SIZE = 3072KB , MAXSIZE = 102400KB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EEIT82DB] SET COMPATIBILITY_LEVEL = 90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EEIT82DB].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [EEIT82DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EEIT82DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EEIT82DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EEIT82DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EEIT82DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [EEIT82DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EEIT82DB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [EEIT82DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EEIT82DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EEIT82DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EEIT82DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EEIT82DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EEIT82DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EEIT82DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EEIT82DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EEIT82DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EEIT82DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EEIT82DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EEIT82DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EEIT82DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EEIT82DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EEIT82DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EEIT82DB] SET RECOVERY FULL 
GO
ALTER DATABASE [EEIT82DB] SET  MULTI_USER 
GO
ALTER DATABASE [EEIT82DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EEIT82DB] SET DB_CHAINING OFF 
GO
USE [EEIT82DB]
GO
/****** Object:  User [EEIT82]    Script Date: 2016/1/24 上午 10:57:08 ******/
CREATE USER [EEIT82] FOR LOGIN [EEIT82] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [EEIT82]
GO
/****** Object:  Table [dbo].[advertisement]    Script Date: 2016/1/24 上午 10:57:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[advertisement](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[article] [varchar](100) NULL,
	[link] [varchar](50) NULL,
	[picture] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[board]    Script Date: 2016/1/24 上午 10:57:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[board](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created_date] [datetime] NULL,
	[name] [varchar](20) NOT NULL,
	[description] [varchar](50) NULL,
	[thread_count] [int] NULL,
	[reply_count] [int] NULL,
	[is_cream] [char](1) NULL,
	[category_id] [int] NULL,
	[picture] [varchar](255) NULL,
	[is_hide] [char](1) NULL,
 CONSTRAINT [PK__boards__164452B1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[board_categoria]    Script Date: 2016/1/24 上午 10:57:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[board_categoria](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](10) NOT NULL,
	[created_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[board_category]    Script Date: 2016/1/24 上午 10:57:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[board_category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created_date] [datetime] NULL,
	[description] [varchar](255) NULL,
	[name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[broadcast]    Script Date: 2016/1/24 上午 10:57:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[broadcast](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[broadcast_description] [varchar](255) NULL,
	[picture] [varchar](255) NULL,
	[post_time] [datetime] NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[chat]    Script Date: 2016/1/24 上午 10:57:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[chat](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[messages] [varchar](200) NULL,
	[picture] [varchar](255) NULL,
	[send_time] [datetime] NULL,
	[show_user_info] [char](1) NULL,
	[user_id] [int] NULL,
	[created_by] [varchar](255) NULL,
	[created_date] [datetime] NULL,
	[modified_by] [varchar](255) NULL,
	[modified_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[exchange]    Script Date: 2016/1/24 上午 10:57:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[exchange](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[exchange_time] [datetime] NULL,
	[grade] [varchar](255) NULL,
	[grade_time] [datetime] NULL,
	[trade_finished_time] [datetime] NULL,
	[trade_status] [char](10) NULL,
	[producta_id] [int] NULL,
	[productb_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[focus_user_list]    Script Date: 2016/1/24 上午 10:57:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[focus_user_list](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_a_id] [int] NULL,
	[user_b_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[forum_picture]    Script Date: 2016/1/24 上午 10:57:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[forum_picture](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[picture] [varchar](255) NULL,
	[reply_id] [int] NULL,
	[thread_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[log_mail]    Script Date: 2016/1/24 上午 10:57:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[log_mail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sender_id] [int] NOT NULL,
	[receiver_id] [int] NULL,
	[title] [varchar](50) NULL,
	[article] [varchar](1000) NULL,
	[draft_time] [datetime] NULL,
	[is_draft] [char](10) NOT NULL DEFAULT ('FALSE'),
	[send_time] [datetime] NULL,
	[is_backup] [char](10) NOT NULL DEFAULT ('FALSE'),
	[is_trash] [char](10) NOT NULL DEFAULT ('FALSE'),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mail]    Script Date: 2016/1/24 上午 10:57:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sender_id] [int] NOT NULL,
	[receiver_id] [int] NOT NULL,
	[send_time] [datetime] NOT NULL,
	[title] [varchar](50) NOT NULL,
	[article] [varchar](1000) NULL,
	[is_important] [char](10) NOT NULL DEFAULT ('FALSE'),
	[is_trash] [char](10) NOT NULL DEFAULT ('FALSE'),
	[is_read] [char](10) NOT NULL DEFAULT ('FALSE'),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[messages]    Script Date: 2016/1/24 上午 10:57:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[messages](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[article] [varchar](255) NULL,
	[deliver_time] [datetime] NULL,
	[read_time] [datetime] NULL,
	[receiver_id] [int] NULL,
	[sender_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[product]    Script Date: 2016/1/24 上午 10:57:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[click_times] [int] NULL,
	[deadline] [datetime] NULL,
	[location] [varchar](50) NULL,
	[name] [varchar](30) NULL,
	[post_status] [char](10) NULL,
	[post_time] [datetime] NULL,
	[trade_way] [varchar](20) NULL,
	[video] [varbinary](255) NULL,
	[wish_item] [varchar](200) NULL,
	[category_id] [int] NULL,
	[user_id] [int] NULL,
	[description] [varchar](200) NULL,
	[status] [varchar](50) NULL,
	[transaction_time] [varchar](10) NULL,
	[start_time] [datetime] NULL,
	[grade] [varchar](10) NULL,
	[grade_time] [datetime] NULL,
	[trade_status] [varchar](10) NULL,
	[primary_picture] [varchar](255) NULL,
 CONSTRAINT [PK__product__049AA3C2] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[product_category]    Script Date: 2016/1/24 上午 10:57:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[product_category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[product_picture]    Script Date: 2016/1/24 上午 10:57:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[product_picture](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[picture] [varchar](255) NULL,
	[product_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[question_and_answer]    Script Date: 2016/1/24 上午 10:57:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[question_and_answer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[question] [varchar](200) NOT NULL,
	[questioner_id] [int] NOT NULL,
	[answer] [varchar](200) NULL,
	[question_time] [datetime] NOT NULL,
	[answer_time] [datetime] NULL,
	[is_public] [char](10) NULL,
	[edit_time] [datetime] NULL,
 CONSTRAINT [PK__question_and_ans__3EE740E8] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[reply]    Script Date: 2016/1/24 上午 10:57:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[reply](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created_date] [datetime] NULL,
	[floor] [int] NULL,
	[is_hide] [char](1) NULL,
	[reply_content] [varchar](3000) NULL,
	[title] [varchar](20) NOT NULL,
	[thread_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[report]    Script Date: 2016/1/24 上午 10:57:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[report](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[article] [varchar](200) NULL,
	[is_passed] [char](10) NULL,
	[report_time] [datetime] NULL,
	[product_id] [int] NULL,
	[reporter_id] [int] NULL,
	[role] [int] NULL,
	[finish_time] [datetime] NULL,
 CONSTRAINT [PK__report__0E240DFC] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sec_role]    Script Date: 2016/1/24 上午 10:57:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sec_role](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[created_by] [varchar](255) NULL,
	[created_date] [datetime] NULL,
	[modified_by] [varchar](255) NULL,
	[modified_date] [datetime] NULL,
	[code] [varchar](255) NULL,
	[name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sec_user]    Script Date: 2016/1/24 上午 10:57:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sec_user](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[created_by] [varchar](255) NULL,
	[created_date] [datetime] NULL,
	[modified_by] [varchar](255) NULL,
	[modified_date] [datetime] NULL,
	[password] [varchar](255) NULL,
	[username] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sec_user_role_map]    Script Date: 2016/1/24 上午 10:57:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sec_user_role_map](
	[user_id] [bigint] NOT NULL,
	[role_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sysdiagrams]    Script Date: 2016/1/24 上午 10:57:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sysdiagrams](
	[diagram_id] [int] IDENTITY(1,1) NOT NULL,
	[definition] [varbinary](255) NULL,
	[name] [varbinary](255) NOT NULL,
	[principal_id] [int] NOT NULL,
	[version] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[diagram_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tag]    Script Date: 2016/1/24 上午 10:57:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tag](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[thread]    Script Date: 2016/1/24 上午 10:57:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[thread](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created_date] [datetime] NULL,
	[hit] [int] NULL,
	[is_cream] [char](1) NULL,
	[is_hide] [char](1) NULL,
	[is_readonly] [char](1) NULL,
	[last_reply_date] [datetime] NULL,
	[replay_count] [int] NULL,
	[thread_content] [varchar](255) NOT NULL,
	[title] [varchar](20) NOT NULL,
	[topped] [char](1) NULL,
	[board_id] [int] NOT NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[thread_tag]    Script Date: 2016/1/24 上午 10:57:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[thread_tag](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tag_id] [int] NULL,
	[thread_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[user]    Script Date: 2016/1/24 上午 10:57:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[password] [varchar](20) NULL,
	[name] [varchar](30) NULL,
	[nickname] [varchar](30) NULL,
	[account] [varchar](25) NULL,
	[age] [int] NULL,
	[sex] [char](10) NULL,
	[birthday] [datetime] NULL,
	[address] [varchar](50) NULL,
	[phone] [varchar](20) NULL,
	[cellphone] [varchar](30) NULL,
	[email] [varchar](50) NULL,
	[picture] [varchar](255) NULL,
	[school_email] [varchar](50) NULL,
	[focus_item_list] [varchar](30) NULL,
	[ecoin] [int] NULL,
	[online_datetime] [int] NULL,
	[school_name] [varchar](30) NULL,
	[email_check] [char](10) NULL,
	[isolated] [char](10) NULL,
	[role] [varchar](10) NULL,
	[subject] [varchar](255) NULL,
	[about_me] [varchar](255) NULL,
	[verification_code] [int] NULL,
 CONSTRAINT [PK__users__00551192] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[user_ban_list]    Script Date: 2016/1/24 上午 10:57:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_ban_list](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_a_id] [int] NULL,
	[user_b_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[user_like]    Script Date: 2016/1/24 上午 10:57:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_like](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_category_id] [int] NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[user_owner]    Script Date: 2016/1/24 上午 10:57:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_owner](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[board_id] [int] NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[board] ON 

INSERT [dbo].[board] ([id], [created_date], [name], [description], [thread_count], [reply_count], [is_cream], [category_id], [picture], [is_hide]) VALUES (5, CAST(N'1970-10-21 00:00:00.000' AS DateTime), N'ccc', N'test3', NULL, NULL, N'F', NULL, NULL, N'F')
INSERT [dbo].[board] ([id], [created_date], [name], [description], [thread_count], [reply_count], [is_cream], [category_id], [picture], [is_hide]) VALUES (6, CAST(N'1988-03-21 00:00:00.000' AS DateTime), N'ddd', N'test4', NULL, NULL, N'F', NULL, NULL, N'F')
INSERT [dbo].[board] ([id], [created_date], [name], [description], [thread_count], [reply_count], [is_cream], [category_id], [picture], [is_hide]) VALUES (8, CAST(N'2015-12-07 13:28:38.473' AS DateTime), N'淡江大學', NULL, NULL, NULL, N'F', NULL, NULL, N'F')
INSERT [dbo].[board] ([id], [created_date], [name], [description], [thread_count], [reply_count], [is_cream], [category_id], [picture], [is_hide]) VALUES (9, CAST(N'2015-12-07 18:25:18.187' AS DateTime), N'台灣大學', N'taiwan number one!', NULL, NULL, N'F', NULL, NULL, N'F')
INSERT [dbo].[board] ([id], [created_date], [name], [description], [thread_count], [reply_count], [is_cream], [category_id], [picture], [is_hide]) VALUES (10, CAST(N'2015-12-07 18:27:53.850' AS DateTime), N'台灣大學', N'taiwan number one!', NULL, NULL, N'F', NULL, NULL, N'F')
INSERT [dbo].[board] ([id], [created_date], [name], [description], [thread_count], [reply_count], [is_cream], [category_id], [picture], [is_hide]) VALUES (11, CAST(N'2015-12-07 18:47:25.183' AS DateTime), N'台灣大學', N'taiwan number one!', NULL, NULL, N'F', NULL, NULL, N'F')
INSERT [dbo].[board] ([id], [created_date], [name], [description], [thread_count], [reply_count], [is_cream], [category_id], [picture], [is_hide]) VALUES (12, CAST(N'2015-12-07 18:47:50.693' AS DateTime), N'台灣大學', N'taiwan number one!', NULL, NULL, N'F', NULL, NULL, N'F')
INSERT [dbo].[board] ([id], [created_date], [name], [description], [thread_count], [reply_count], [is_cream], [category_id], [picture], [is_hide]) VALUES (13, CAST(N'2015-12-07 19:15:17.777' AS DateTime), N'政治大學', N'taiwan number one!', NULL, NULL, N'F', NULL, NULL, N'F')
INSERT [dbo].[board] ([id], [created_date], [name], [description], [thread_count], [reply_count], [is_cream], [category_id], [picture], [is_hide]) VALUES (14, CAST(N'2015-12-07 19:17:21.513' AS DateTime), N'政治大學', N'taiwan number one!', NULL, NULL, N'F', NULL, NULL, N'F')
INSERT [dbo].[board] ([id], [created_date], [name], [description], [thread_count], [reply_count], [is_cream], [category_id], [picture], [is_hide]) VALUES (15, CAST(N'2015-12-07 19:18:18.303' AS DateTime), N'政治大學', N'taiwan number one!', NULL, NULL, N'F', NULL, NULL, N'F')
INSERT [dbo].[board] ([id], [created_date], [name], [description], [thread_count], [reply_count], [is_cream], [category_id], [picture], [is_hide]) VALUES (22, NULL, N'台灣大學', N'test', NULL, NULL, N'F', 4, NULL, N'F')
INSERT [dbo].[board] ([id], [created_date], [name], [description], [thread_count], [reply_count], [is_cream], [category_id], [picture], [is_hide]) VALUES (23, NULL, N'政治大學', N'test', NULL, NULL, N'F', 4, NULL, N'F')
INSERT [dbo].[board] ([id], [created_date], [name], [description], [thread_count], [reply_count], [is_cream], [category_id], [picture], [is_hide]) VALUES (24, CAST(N'2015-12-23 10:42:19.577' AS DateTime), N'12', N'1', 0, 0, N'F', NULL, NULL, N'F')
INSERT [dbo].[board] ([id], [created_date], [name], [description], [thread_count], [reply_count], [is_cream], [category_id], [picture], [is_hide]) VALUES (25, CAST(N'2015-12-23 11:02:00.590' AS DateTime), N'ewew', N'', 0, 0, N'F', NULL, NULL, N'F')
INSERT [dbo].[board] ([id], [created_date], [name], [description], [thread_count], [reply_count], [is_cream], [category_id], [picture], [is_hide]) VALUES (26, CAST(N'2015-12-23 13:48:08.600' AS DateTime), N'test5', N'test5', 0, 0, N'F', NULL, NULL, N'F')
SET IDENTITY_INSERT [dbo].[board] OFF
SET IDENTITY_INSERT [dbo].[board_categoria] ON 

INSERT [dbo].[board_categoria] ([id], [name], [created_date]) VALUES (1, N'Test', NULL)
INSERT [dbo].[board_categoria] ([id], [name], [created_date]) VALUES (4, N'North-area', CAST(N'2015-12-07 16:55:08.647' AS DateTime))
INSERT [dbo].[board_categoria] ([id], [name], [created_date]) VALUES (5, N'South-area', CAST(N'2015-12-07 17:02:56.943' AS DateTime))
INSERT [dbo].[board_categoria] ([id], [name], [created_date]) VALUES (6, N'South-area', CAST(N'2015-12-07 17:05:58.717' AS DateTime))
INSERT [dbo].[board_categoria] ([id], [name], [created_date]) VALUES (7, N'East-area', CAST(N'2015-12-08 14:59:48.057' AS DateTime))
INSERT [dbo].[board_categoria] ([id], [name], [created_date]) VALUES (8, N'West-area', CAST(N'2015-12-08 15:06:16.887' AS DateTime))
INSERT [dbo].[board_categoria] ([id], [name], [created_date]) VALUES (9, N'Test4', CAST(N'2015-12-21 20:46:44.907' AS DateTime))
INSERT [dbo].[board_categoria] ([id], [name], [created_date]) VALUES (10, N'chat', CAST(N'2015-12-22 07:29:43.523' AS DateTime))
INSERT [dbo].[board_categoria] ([id], [name], [created_date]) VALUES (11, N'sell', CAST(N'2015-12-22 23:02:40.327' AS DateTime))
INSERT [dbo].[board_categoria] ([id], [name], [created_date]) VALUES (12, N'buy', CAST(N'2015-12-23 09:04:24.810' AS DateTime))
INSERT [dbo].[board_categoria] ([id], [name], [created_date]) VALUES (13, N'furniture', CAST(N'2015-12-23 13:43:51.377' AS DateTime))
SET IDENTITY_INSERT [dbo].[board_categoria] OFF
SET IDENTITY_INSERT [dbo].[broadcast] ON 

INSERT [dbo].[broadcast] ([id], [broadcast_description], [picture], [post_time], [user_id]) VALUES (1, N'桌子', NULL, CAST(N'2015-12-31 14:36:25.470' AS DateTime), 1)
INSERT [dbo].[broadcast] ([id], [broadcast_description], [picture], [post_time], [user_id]) VALUES (2, N'桌子', NULL, CAST(N'2015-12-31 14:37:13.807' AS DateTime), 2)
INSERT [dbo].[broadcast] ([id], [broadcast_description], [picture], [post_time], [user_id]) VALUES (3, N'桌子', NULL, CAST(N'2015-12-31 14:37:18.220' AS DateTime), 2)
INSERT [dbo].[broadcast] ([id], [broadcast_description], [picture], [post_time], [user_id]) VALUES (4, N'桌子', N'/resources/userimgs/test.jpg', CAST(N'2015-12-31 14:38:39.493' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[broadcast] OFF
SET IDENTITY_INSERT [dbo].[chat] ON 

INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (1, NULL, NULL, NULL, N'T', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (2, N'fvgdrfgd', NULL, NULL, N'T', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (4, N'werewrew', NULL, CAST(N'2015-12-31 13:42:57.950' AS DateTime), N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (7, N'qqqqqq', NULL, NULL, N'T', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (8, N'kkkkkkokokokokokokkok', NULL, NULL, N'T', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (9, N'aaa bbbb', NULL, CAST(N'2016-01-04 11:02:33.957' AS DateTime), N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (10, N'5555564', NULL, NULL, N'T', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (12, N'kkksjdeaoiuedrfoewpdrfoeswuirfew', NULL, NULL, N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (13, N'testestestestestest', NULL, NULL, N'T', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (14, N'uiuiuiuiuiuiuiuiuiuiui', NULL, NULL, N'T', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (17, N'測試測試測試測試測試測試測試AAABBBBBB', NULL, NULL, N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (18, N'DDDDDD', NULL, NULL, N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (19, N'xsaxsa', NULL, NULL, N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (20, N'1', NULL, NULL, N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (21, N'aads', NULL, CAST(N'2016-01-06 11:32:10.177' AS DateTime), N'T', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (23, N'測測', NULL, CAST(N'2016-01-06 11:58:40.863' AS DateTime), N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (24, N'測試', NULL, CAST(N'2016-01-06 17:52:49.613' AS DateTime), N'T', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (25, N'1', NULL, CAST(N'2016-01-07 20:08:32.577' AS DateTime), N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (26, N'1', NULL, CAST(N'2016-01-13 18:04:22.520' AS DateTime), N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (27, N'gsf', NULL, CAST(N'2016-01-14 10:45:30.593' AS DateTime), N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (28, N' faw3r', NULL, CAST(N'2016-01-14 11:12:57.557' AS DateTime), N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (29, N' jaja', NULL, CAST(N'2016-01-14 11:18:45.287' AS DateTime), N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (30, N' jaja', NULL, CAST(N'2016-01-14 11:18:47.870' AS DateTime), N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (31, N' jaja', NULL, CAST(N'2016-01-14 11:18:50.557' AS DateTime), N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (32, N' jaja', NULL, CAST(N'2016-01-14 11:18:51.933' AS DateTime), N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (33, N' jaja', NULL, CAST(N'2016-01-14 11:18:52.320' AS DateTime), N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (34, N' fdasf', NULL, NULL, N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (35, N' dfaf', NULL, CAST(N'2016-01-14 11:21:23.593' AS DateTime), N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (40, N'  freddasaaaaaaaaaddffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff', NULL, CAST(N'2016-01-14 11:46:14.457' AS DateTime), N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (41, N' dsfdsdf', NULL, CAST(N'2016-01-14 11:55:49.270' AS DateTime), N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (42, NULL, N'/E715/resources/chatimgs/2_p.png', CAST(N'2016-01-14 12:05:05.033' AS DateTime), N'T', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (43, NULL, N'/E715/resources/chatimgs/3_nameBasedOnSomeId.png', CAST(N'2016-01-14 12:07:47.270' AS DateTime), N'T', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (44, N' bvgesgr', NULL, CAST(N'2016-01-14 12:11:39.797' AS DateTime), N'T', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (45, N' bvgesgrdfsfdzsfdaesdf', NULL, CAST(N'2016-01-14 13:37:37.257' AS DateTime), N'T', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (46, N' 3ewrwer', NULL, CAST(N'2016-01-14 13:38:05.853' AS DateTime), N'T', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (47, N' 3ewrwer', NULL, CAST(N'2016-01-14 13:38:08.847' AS DateTime), N'T', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (48, N' 3ewrwer', NULL, CAST(N'2016-01-14 13:38:09.607' AS DateTime), N'T', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (49, N' 3ewrwer', NULL, CAST(N'2016-01-14 13:38:10.427' AS DateTime), N'T', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (50, NULL, N'/E715/resources/chatimgs/3_1_nameBasedOnSomeId.png', CAST(N'2016-01-14 13:43:42.570' AS DateTime), N'T', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (51, N' fdsfaew', NULL, CAST(N'2016-01-14 13:51:03.920' AS DateTime), N'T', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (52, N' fdsfaew3', NULL, CAST(N'2016-01-14 13:51:07.017' AS DateTime), N'T', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (53, N' fdsfaew3qa', NULL, CAST(N'2016-01-14 13:51:09.800' AS DateTime), N'T', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (54, N'王五上傳了一張圖片', N'/E715/resources/chatimgs/3_2_nameBasedOnSomeId.png', CAST(N'2016-01-14 13:52:05.333' AS DateTime), N'T', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (55, N' 45svffvz', NULL, CAST(N'2016-01-14 14:13:29.647' AS DateTime), N'T', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (56, N'王五上傳了一張圖片', N'/E715/resources/chatimgs/3_p.png', CAST(N'2016-01-14 14:13:52.707' AS DateTime), N'T', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (57, N' fgsfgds', NULL, CAST(N'2016-01-14 14:31:14.557' AS DateTime), N'T', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (58, N' fgsfgds', NULL, CAST(N'2016-01-14 14:31:17.057' AS DateTime), N'T', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (59, N' fgsfgds', NULL, CAST(N'2016-01-14 14:31:22.680' AS DateTime), N'T', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (60, N' nxcgn', NULL, CAST(N'2016-01-14 14:31:46.330' AS DateTime), N'T', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (61, N' vbsrf', NULL, CAST(N'2016-01-14 14:32:12.930' AS DateTime), N'T', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (62, N' b dxb', NULL, CAST(N'2016-01-14 14:33:11.227' AS DateTime), N'T', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (63, N' estre', NULL, CAST(N'2016-01-14 14:33:32.033' AS DateTime), N'T', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (64, N' estreku', NULL, CAST(N'2016-01-14 14:33:40.270' AS DateTime), N'T', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (65, N' ,t44', NULL, CAST(N'2016-01-14 14:34:20.103' AS DateTime), N'T', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (66, N' ,t44', NULL, CAST(N'2016-01-14 14:34:21.917' AS DateTime), N'T', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (67, N' 23q4q23', NULL, CAST(N'2016-01-14 14:34:30.253' AS DateTime), N'T', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (68, N'王五上傳了一張圖片', N'/E715/resources/chatimgs/3_3_nameBasedOnSomeId.png', CAST(N'2016-01-14 14:34:37.007' AS DateTime), N'T', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (69, N' 34wa3', NULL, CAST(N'2016-01-14 14:34:40.747' AS DateTime), N'T', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (70, N'王五上傳了一張圖片', N'/E715/resources/chatimgs/3_1_p.png', CAST(N'2016-01-14 14:44:49.053' AS DateTime), N'T', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (71, N' zdfdzf', NULL, CAST(N'2016-01-14 14:45:37.720' AS DateTime), N'T', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (72, N' gvdfsgsatfawr', NULL, CAST(N'2016-01-14 16:10:23.803' AS DateTime), N'T', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (73, N'王五上傳了一張圖片', N'/E715/resources/chatimgs/3_2_p.png', CAST(N'2016-01-14 16:11:13.197' AS DateTime), N'T', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (74, N'王五上傳了一張圖片', N'/E715/resources/chatimgs/3_4_nameBasedOnSomeId.png', CAST(N'2016-01-14 16:11:31.390' AS DateTime), N'T', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (75, N'12313', NULL, NULL, N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (76, N'王五上傳了一張圖片', N'/E715/resources/chatimgs/3_3_p.png', CAST(N'2016-01-14 17:02:58.657' AS DateTime), N'T', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (77, N'王五上傳了一張圖片', N'/E715/resources/chatimgs/3_5_nameBasedOnSomeId.png', CAST(N'2016-01-14 17:03:11.930' AS DateTime), N'T', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (78, N' xzdefd', NULL, CAST(N'2016-01-15 10:03:44.453' AS DateTime), N'T', 11, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (79, N' xzdefd', NULL, CAST(N'2016-01-15 10:03:48.877' AS DateTime), N'T', 11, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (80, N' xzdefd', NULL, CAST(N'2016-01-15 10:03:55.840' AS DateTime), N'T', 11, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (81, N' xzdefd', NULL, CAST(N'2016-01-15 10:03:57.253' AS DateTime), N'T', 11, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (82, N' xzdefd', NULL, CAST(N'2016-01-15 10:03:58.100' AS DateTime), N'T', 11, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (83, N' zsfg', NULL, CAST(N'2016-01-15 10:04:06.620' AS DateTime), N'T', 11, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (84, N' 123', NULL, CAST(N'2016-01-15 10:04:37.333' AS DateTime), N'T', 11, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (85, N' gesrt', NULL, CAST(N'2016-01-15 10:04:57.337' AS DateTime), N'T', 11, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (86, N' gfsgr', NULL, CAST(N'2016-01-15 10:07:33.927' AS DateTime), N'T', 11, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (87, N' bcfb', NULL, CAST(N'2016-01-15 10:07:39.937' AS DateTime), N'T', 11, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (88, N'人人人上傳了一張圖片', N'/E715/resources/chatimgs/11_Class Diagram0.png', CAST(N'2016-01-15 10:08:41.340' AS DateTime), N'T', 11, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (89, N'@王五 hi', NULL, CAST(N'2016-01-15 10:08:56.257' AS DateTime), N'T', 11, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (90, N' gsgfezasvgf', NULL, CAST(N'2016-01-15 10:09:59.330' AS DateTime), N'T', 11, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (91, N' gsgfezasvgf', NULL, CAST(N'2016-01-15 10:12:09.487' AS DateTime), N'T', 11, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (92, N' gsgfezasvgfere', NULL, CAST(N'2016-01-15 10:12:40.560' AS DateTime), N'T', 11, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (93, N' rfas', NULL, CAST(N'2016-01-15 10:16:49.847' AS DateTime), N'T', 11, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (94, N' rfastr', NULL, CAST(N'2016-01-15 10:16:54.917' AS DateTime), N'T', 11, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (95, N' htry', NULL, CAST(N'2016-01-15 10:17:44.363' AS DateTime), N'T', 11, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (96, N'@王五 rt', NULL, CAST(N'2016-01-15 10:17:50.193' AS DateTime), N'T', 11, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (97, N' fsafdsf', NULL, CAST(N'2016-01-15 10:41:52.627' AS DateTime), N'T', 11, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (98, N' fsafdsf', NULL, CAST(N'2016-01-15 10:42:54.063' AS DateTime), N'T', 11, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (99, N' gsgfs', NULL, CAST(N'2016-01-15 10:50:21.747' AS DateTime), N'T', 11, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (100, N'@匿名', NULL, CAST(N'2016-01-15 10:50:25.320' AS DateTime), N'T', 11, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (101, N'人人人上傳了一張圖片', N'/E715/resources/chatimgs/11_nameBasedOnSomeId.png', CAST(N'2016-01-15 10:54:55.060' AS DateTime), N'T', 11, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (102, N'李四上傳了一張圖片', N'/E715/resources/chatimgs/2_1_p.png', CAST(N'2016-01-15 10:59:40.527' AS DateTime), N'T', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (103, N'人人人上傳了一張圖片', N'/E715/resources/chatimgs/11_1_nameBasedOnSomeId.png', CAST(N'2016-01-15 11:06:19.900' AS DateTime), N'T', 11, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (104, N' dfasdzasd', NULL, CAST(N'2016-01-15 11:06:26.137' AS DateTime), N'T', 11, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (105, N' dfasdzasd', NULL, CAST(N'2016-01-15 11:06:29.717' AS DateTime), N'F', 11, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (106, N' efadsfds', NULL, CAST(N'2016-01-15 11:28:46.040' AS DateTime), N'F', 11, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (107, N' efadsfds', NULL, CAST(N'2016-01-15 11:28:48.937' AS DateTime), N'T', 11, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (108, N' 你在做甚麼?', NULL, CAST(N'2016-01-15 11:38:46.900' AS DateTime), N'F', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (109, N' 沒幹嘛', NULL, CAST(N'2016-01-15 11:39:11.307' AS DateTime), N'T', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (110, N'按下Enter後欄位沒清空阿', NULL, CAST(N'2016-01-15 11:39:06.627' AS DateTime), N'F', 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (111, N'@匿名 誰啊你', NULL, CAST(N'2016-01-15 11:39:21.717' AS DateTime), N'T', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (112, N'0123', NULL, CAST(N'2016-01-15 11:40:37.600' AS DateTime), N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (113, N'0123', NULL, CAST(N'2016-01-15 11:40:47.377' AS DateTime), N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (114, N'0123', NULL, CAST(N'2016-01-15 11:40:52.230' AS DateTime), N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (115, N'張三上傳了一張圖片', N'/E715/resources/chatimgs/1_DSC_0025.JPG', CAST(N'2016-01-15 11:41:29.503' AS DateTime), N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (116, N' sdfdfds', NULL, CAST(N'2016-01-15 11:45:45.340' AS DateTime), N'T', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (117, N'ewaweaw', NULL, CAST(N'2016-01-15 11:45:48.793' AS DateTime), N'T', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (118, N' xv', NULL, CAST(N'2016-01-15 11:55:48.573' AS DateTime), N'T', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (119, N'', NULL, CAST(N'2016-01-15 11:55:51.620' AS DateTime), N'F', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (120, N'@李四', NULL, CAST(N'2016-01-15 11:55:57.617' AS DateTime), N'T', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (121, N'聽說你做完了?', NULL, CAST(N'2016-01-15 14:12:21.687' AS DateTime), N'F', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (122, N' ihiuhiui', NULL, CAST(N'2016-01-15 14:12:33.723' AS DateTime), N'T', 11, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (123, N'喔喔喔', NULL, CAST(N'2016-01-15 14:12:27.447' AS DateTime), N'F', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (124, N'@匿名 ', NULL, CAST(N'2016-01-15 14:12:44.400' AS DateTime), N'T', 11, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (125, N'yes', NULL, CAST(N'2016-01-15 14:12:48.850' AS DateTime), N'T', 11, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (126, N'張三上傳了一張圖片', N'/E715/resources/chatimgs/1_DSC_0203.JPG', CAST(N'2016-01-15 14:12:44.880' AS DateTime), N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (127, N'人人人上傳了一張圖片', N'/E715/resources/chatimgs/11_p.png', CAST(N'2016-01-15 14:12:57.723' AS DateTime), N'T', 11, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (128, N'我無敵啦啦啦啦', NULL, CAST(N'2016-01-15 15:01:54.210' AS DateTime), N'T', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (129, N'yao上傳了一張圖片', N'/E715/resources/chatimgs/31_82.png', CAST(N'2016-01-15 15:42:30.193' AS DateTime), N'T', 31, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (130, N' hello E715', NULL, CAST(N'2016-01-15 15:43:36.323' AS DateTime), N'F', 31, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (131, N' 麵線~~~', NULL, CAST(N'2016-01-15 15:59:53.367' AS DateTime), N'F', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (132, N' 喔耶~~~~~~~~~~~', NULL, CAST(N'2016-01-15 15:59:35.657' AS DateTime), N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (133, N'專屬聊天室', NULL, CAST(N'2016-01-15 15:59:47.533' AS DateTime), N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (134, N'爽', NULL, CAST(N'2016-01-15 15:59:48.757' AS DateTime), N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (135, N'爽R', NULL, CAST(N'2016-01-15 16:00:23.617' AS DateTime), N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (136, N'有好多張三', NULL, CAST(N'2016-01-15 16:00:12.627' AS DateTime), N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (137, N'上傳圖片的提示', NULL, CAST(N'2016-01-15 16:01:02.703' AS DateTime), N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (138, N'改成mouseover比較好吧?', NULL, CAST(N'2016-01-15 16:01:21.227' AS DateTime), N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (139, N'認真看我的發言啊~~~~~~', NULL, CAST(N'2016-01-15 16:01:41.153' AS DateTime), N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (140, N' 喔喔', NULL, CAST(N'2016-01-15 16:02:00.243' AS DateTime), N'T', 5, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (141, N'我馬上改', NULL, CAST(N'2016-01-15 16:02:29.090' AS DateTime), N'T', 5, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (142, N'黃七上傳了一張圖片', N'/E715/resources/chatimgs/5_p.png', CAST(N'2016-01-15 16:07:25.620' AS DateTime), N'T', 5, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (143, N'黃七上傳了一張圖片', N'/E715/resources/chatimgs/5_nameBasedOnSomeId.png', CAST(N'2016-01-15 16:36:48.383' AS DateTime), N'T', 5, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (144, N'匿名了了了了了了了了了了了了了了了了了了了了了了了了了', NULL, CAST(N'2016-01-15 16:44:59.863' AS DateTime), N'F', 22, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (145, N' fghhdtfgh', NULL, CAST(N'2016-01-15 16:55:04.497' AS DateTime), N'T', 22, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (146, N'u', NULL, CAST(N'2016-01-15 16:55:08.413' AS DateTime), N'T', 22, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (147, N'what the hell', NULL, CAST(N'2016-01-15 16:55:12.417' AS DateTime), N'T', 22, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (148, N' ', NULL, CAST(N'2016-01-15 17:12:22.833' AS DateTime), N'T', 22, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (149, N'', NULL, CAST(N'2016-01-15 17:12:24.557' AS DateTime), N'T', 22, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (150, N'', NULL, CAST(N'2016-01-15 17:12:25.630' AS DateTime), N'T', 22, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (151, N'', NULL, CAST(N'2016-01-15 17:12:26.693' AS DateTime), N'T', 22, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (152, N'', NULL, CAST(N'2016-01-15 17:12:27.560' AS DateTime), N'T', 22, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (153, N'', NULL, CAST(N'2016-01-15 17:12:30.217' AS DateTime), N'T', 22, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (154, N'', NULL, CAST(N'2016-01-15 17:12:41.553' AS DateTime), N'F', 22, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (155, N' ryryryryryryryryryr', NULL, CAST(N'2016-01-15 17:55:45.863' AS DateTime), N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (156, N' 哭哭喔一點半了', NULL, CAST(N'2016-01-17 01:28:51.527' AS DateTime), N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (157, N' 哈囉', NULL, CAST(N'2016-01-17 16:23:43.983' AS DateTime), N'T', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (158, N' 嗨李四', NULL, CAST(N'2016-01-17 18:39:07.843' AS DateTime), N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (159, N'近來可好', NULL, CAST(N'2016-01-17 18:39:11.860' AS DateTime), N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (160, N'@張三 還OK啦', NULL, CAST(N'2016-01-18 10:14:23.407' AS DateTime), N'T', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (161, N' 安安', NULL, CAST(N'2016-01-18 17:41:10.807' AS DateTime), N'T', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (162, N'李四上傳了一張圖片', N'/E715/resources/chatimgs/2_4072897_01_thumb.gif', CAST(N'2016-01-18 17:41:32.177' AS DateTime), N'T', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (163, N' 哇哈哈哈哈哈', NULL, CAST(N'2016-01-19 14:44:38.767' AS DateTime), N'F', 11, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (164, N'何方妖孽!?', NULL, CAST(N'2016-01-19 14:44:58.923' AS DateTime), N'T', 11, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (165, N'@人人人 肚子餓了，雞肉味!', NULL, CAST(N'2016-01-19 14:45:25.383' AS DateTime), N'F', 11, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (166, N' 我可以發', NULL, CAST(N'2016-01-20 16:39:25.660' AS DateTime), N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (167, N'LOLOLLL', NULL, CAST(N'2016-01-20 16:39:31.313' AS DateTime), N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (168, N' 雞肉啊啊啊啊啊啊啊啊', NULL, CAST(N'2016-01-21 11:30:40.607' AS DateTime), N'T', 11, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (169, N' gfdgdg', NULL, CAST(N'2016-01-22 20:59:58.380' AS DateTime), N'T', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (170, N'王五上傳了一張圖片', N'/E715/resources/chatimgs/3_test.jpg', CAST(N'2016-01-22 21:19:50.930' AS DateTime), N'T', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (171, N' 0.0', NULL, CAST(N'2016-01-23 14:05:15.260' AS DateTime), N'T', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (172, N'黃七上傳了一張圖片', N'/E715/resources/chatimgs5_8ced2fd8-ff96-4891-92b4-3a33b644ab98.jpg', CAST(N'2016-01-23 14:13:08.983' AS DateTime), N'T', 5, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (173, N'李四上傳了一張圖片', N'/E715/resources/chatimgs/2_5353_P_1399866353758.jpg', CAST(N'2016-01-23 16:28:15.707' AS DateTime), N'T', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (174, N' 23456789548', NULL, CAST(N'2016-01-23 16:28:39.490' AS DateTime), N'T', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (175, N' sdfadsfasd', NULL, CAST(N'2016-01-23 16:31:49.603' AS DateTime), N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (176, N'測試by尻尻', NULL, CAST(N'2016-01-23 16:32:03.653' AS DateTime), N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (177, N' 搞毛', NULL, CAST(N'2016-01-23 16:34:16.253' AS DateTime), N'T', 5, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (178, N'創帳號被我玩爆了', NULL, CAST(N'2016-01-23 16:34:47.000' AS DateTime), N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (179, N' test001', NULL, CAST(N'2016-01-23 16:37:06.000' AS DateTime), N'T', 4, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (180, N'test002', NULL, CAST(N'2016-01-23 16:37:10.943' AS DateTime), N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (181, N' test009', NULL, CAST(N'2016-01-23 16:37:37.793' AS DateTime), N'T', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (182, N'text003', NULL, CAST(N'2016-01-23 16:37:48.393' AS DateTime), N'T', 4, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (183, N'test004', NULL, CAST(N'2016-01-23 16:37:56.230' AS DateTime), N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (184, N' 99', NULL, CAST(N'2016-01-23 16:38:29.440' AS DateTime), N'T', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (185, N' 12132132123', NULL, CAST(N'2016-01-23 16:39:07.633' AS DateTime), N'T', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (186, N'456465', NULL, CAST(N'2016-01-23 16:39:23.827' AS DateTime), N'T', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (187, N' 嗨嗨你好', NULL, CAST(N'2016-01-23 17:20:05.900' AS DateTime), N'T', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (188, N' 安安', NULL, CAST(N'2016-01-23 17:20:14.197' AS DateTime), N'T', 4, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (189, N' 嗨老六', NULL, CAST(N'2016-01-23 17:20:29.227' AS DateTime), N'T', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (190, N'幾歲 住哪', NULL, CAST(N'2016-01-23 17:20:32.073' AS DateTime), N'T', 4, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (191, N'李四上傳了一張圖片', N'/E715/resources/chatimgs/2_images.jpg', CAST(N'2016-01-23 17:20:42.790' AS DateTime), N'T', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[chat] ([id], [messages], [picture], [send_time], [show_user_info], [user_id], [created_by], [created_date], [modified_by], [modified_date]) VALUES (192, N'李四上傳了一張圖片', N'/E715/resources/chatimgs/2_137466027306621208_374x269.jpg', CAST(N'2016-01-23 17:21:07.187' AS DateTime), N'T', 2, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[chat] OFF
SET IDENTITY_INSERT [dbo].[exchange] ON 

INSERT [dbo].[exchange] ([id], [exchange_time], [grade], [grade_time], [trade_finished_time], [trade_status], [producta_id], [productb_id]) VALUES (108, CAST(N'2016-01-23 14:46:44.020' AS DateTime), NULL, NULL, CAST(N'2016-01-23 15:00:45.677' AS DateTime), N'TRUE      ', 195, 31)
INSERT [dbo].[exchange] ([id], [exchange_time], [grade], [grade_time], [trade_finished_time], [trade_status], [producta_id], [productb_id]) VALUES (109, CAST(N'2016-01-23 15:10:22.730' AS DateTime), NULL, NULL, CAST(N'2016-01-23 15:14:25.517' AS DateTime), N'TRUE      ', 26, 39)
INSERT [dbo].[exchange] ([id], [exchange_time], [grade], [grade_time], [trade_finished_time], [trade_status], [producta_id], [productb_id]) VALUES (110, CAST(N'2016-01-23 15:10:47.047' AS DateTime), NULL, NULL, NULL, N'FALSE     ', 38, 19)
INSERT [dbo].[exchange] ([id], [exchange_time], [grade], [grade_time], [trade_finished_time], [trade_status], [producta_id], [productb_id]) VALUES (111, CAST(N'2016-01-23 17:07:16.790' AS DateTime), NULL, NULL, NULL, N'FALSE     ', 38, 17)
INSERT [dbo].[exchange] ([id], [exchange_time], [grade], [grade_time], [trade_finished_time], [trade_status], [producta_id], [productb_id]) VALUES (112, CAST(N'2016-01-23 17:07:31.577' AS DateTime), NULL, NULL, NULL, N'FALSE     ', 38, 15)
INSERT [dbo].[exchange] ([id], [exchange_time], [grade], [grade_time], [trade_finished_time], [trade_status], [producta_id], [productb_id]) VALUES (113, CAST(N'2016-01-23 17:10:32.487' AS DateTime), NULL, NULL, NULL, N'FALSE     ', 42, 16)
INSERT [dbo].[exchange] ([id], [exchange_time], [grade], [grade_time], [trade_finished_time], [trade_status], [producta_id], [productb_id]) VALUES (114, CAST(N'2016-01-23 17:10:39.630' AS DateTime), NULL, NULL, CAST(N'2016-01-23 17:15:57.193' AS DateTime), N'TRUE      ', 233, 47)
INSERT [dbo].[exchange] ([id], [exchange_time], [grade], [grade_time], [trade_finished_time], [trade_status], [producta_id], [productb_id]) VALUES (115, CAST(N'2016-01-23 17:11:50.887' AS DateTime), NULL, NULL, NULL, N'FALSE     ', 233, 46)
INSERT [dbo].[exchange] ([id], [exchange_time], [grade], [grade_time], [trade_finished_time], [trade_status], [producta_id], [productb_id]) VALUES (116, CAST(N'2016-01-23 17:12:25.277' AS DateTime), NULL, NULL, NULL, N'FALSE     ', 233, 42)
INSERT [dbo].[exchange] ([id], [exchange_time], [grade], [grade_time], [trade_finished_time], [trade_status], [producta_id], [productb_id]) VALUES (117, CAST(N'2016-01-23 17:12:51.303' AS DateTime), NULL, NULL, NULL, N'FALSE     ', 233, 44)
INSERT [dbo].[exchange] ([id], [exchange_time], [grade], [grade_time], [trade_finished_time], [trade_status], [producta_id], [productb_id]) VALUES (118, CAST(N'2016-01-23 17:17:06.990' AS DateTime), NULL, NULL, CAST(N'2016-01-23 17:19:05.193' AS DateTime), N'TRUE      ', 15, 48)
INSERT [dbo].[exchange] ([id], [exchange_time], [grade], [grade_time], [trade_finished_time], [trade_status], [producta_id], [productb_id]) VALUES (119, CAST(N'2016-01-23 17:50:21.227' AS DateTime), NULL, NULL, NULL, N'FALSE     ', 4, 18)
INSERT [dbo].[exchange] ([id], [exchange_time], [grade], [grade_time], [trade_finished_time], [trade_status], [producta_id], [productb_id]) VALUES (120, CAST(N'2016-01-23 17:58:03.947' AS DateTime), NULL, NULL, NULL, N'FALSE     ', 222, 17)
SET IDENTITY_INSERT [dbo].[exchange] OFF
SET IDENTITY_INSERT [dbo].[focus_user_list] ON 

INSERT [dbo].[focus_user_list] ([id], [user_a_id], [user_b_id]) VALUES (24, 11, 1)
INSERT [dbo].[focus_user_list] ([id], [user_a_id], [user_b_id]) VALUES (29, 4, 1)
INSERT [dbo].[focus_user_list] ([id], [user_a_id], [user_b_id]) VALUES (30, 3, 1)
INSERT [dbo].[focus_user_list] ([id], [user_a_id], [user_b_id]) VALUES (31, 22, 20)
INSERT [dbo].[focus_user_list] ([id], [user_a_id], [user_b_id]) VALUES (36, 3, 2)
INSERT [dbo].[focus_user_list] ([id], [user_a_id], [user_b_id]) VALUES (37, 3, 5)
INSERT [dbo].[focus_user_list] ([id], [user_a_id], [user_b_id]) VALUES (38, 1, 2)
INSERT [dbo].[focus_user_list] ([id], [user_a_id], [user_b_id]) VALUES (39, 1, 5)
INSERT [dbo].[focus_user_list] ([id], [user_a_id], [user_b_id]) VALUES (40, 2, 4)
INSERT [dbo].[focus_user_list] ([id], [user_a_id], [user_b_id]) VALUES (43, 3, 22)
INSERT [dbo].[focus_user_list] ([id], [user_a_id], [user_b_id]) VALUES (44, 35, 2)
INSERT [dbo].[focus_user_list] ([id], [user_a_id], [user_b_id]) VALUES (45, 1, 4)
INSERT [dbo].[focus_user_list] ([id], [user_a_id], [user_b_id]) VALUES (46, 11, 5)
INSERT [dbo].[focus_user_list] ([id], [user_a_id], [user_b_id]) VALUES (47, 3, 4)
INSERT [dbo].[focus_user_list] ([id], [user_a_id], [user_b_id]) VALUES (48, 2, 1)
SET IDENTITY_INSERT [dbo].[focus_user_list] OFF
SET IDENTITY_INSERT [dbo].[log_mail] ON 

INSERT [dbo].[log_mail] ([id], [sender_id], [receiver_id], [title], [article], [draft_time], [is_draft], [send_time], [is_backup], [is_trash]) VALUES (1, 3, 4, N'王五的信', N'老六，你欠我的一百大洋何時還?', CAST(N'2016-01-11 07:32:10.000' AS DateTime), N'TRUE      ', NULL, N'FALSE     ', N'FALSE     ')
INSERT [dbo].[log_mail] ([id], [sender_id], [receiver_id], [title], [article], [draft_time], [is_draft], [send_time], [is_backup], [is_trash]) VALUES (20, 4, 1, N'嗨張三你好', N'我想要跟你交換你的化妝水可是我沒有星巴克,請問我可以用IKEA的馬克杯跟你交換嗎??=DDDD', NULL, N'FALSE     ', CAST(N'2016-01-15 16:24:13.850' AS DateTime), N'TRUE      ', N'FALSE     ')
INSERT [dbo].[log_mail] ([id], [sender_id], [receiver_id], [title], [article], [draft_time], [is_draft], [send_time], [is_backup], [is_trash]) VALUES (28, 4, 1, N'hahaha', N'hi ~~~~~~~~~~', NULL, N'FALSE     ', CAST(N'2016-01-16 18:30:56.460' AS DateTime), N'TRUE      ', N'FALSE     ')
INSERT [dbo].[log_mail] ([id], [sender_id], [receiver_id], [title], [article], [draft_time], [is_draft], [send_time], [is_backup], [is_trash]) VALUES (29, 4, 1, N'測試儲存草稿', N'！！！！！！！', CAST(N'2016-01-16 18:31:36.590' AS DateTime), N'TRUE      ', NULL, N'FALSE     ', N'FALSE     ')
INSERT [dbo].[log_mail] ([id], [sender_id], [receiver_id], [title], [article], [draft_time], [is_draft], [send_time], [is_backup], [is_trash]) VALUES (30, 4, 1, N'測試儲存草稿', N'！！！！！！！', NULL, N'FALSE     ', CAST(N'2016-01-16 18:31:45.570' AS DateTime), N'TRUE      ', N'FALSE     ')
INSERT [dbo].[log_mail] ([id], [sender_id], [receiver_id], [title], [article], [draft_time], [is_draft], [send_time], [is_backup], [is_trash]) VALUES (45, 4, 1, N'張三這是一封測試信', N'哈囉我是老六妳是張三嗎', NULL, N'FALSE     ', CAST(N'2016-01-18 15:51:01.907' AS DateTime), N'TRUE      ', N'FALSE     ')
INSERT [dbo].[log_mail] ([id], [sender_id], [receiver_id], [title], [article], [draft_time], [is_draft], [send_time], [is_backup], [is_trash]) VALUES (49, 4, 1, N'Re:&nbsp;Re:&nbsp;嗨張三你好', N'再回給張三看看', NULL, N'FALSE     ', CAST(N'2016-01-18 21:35:34.150' AS DateTime), N'TRUE      ', N'FALSE     ')
INSERT [dbo].[log_mail] ([id], [sender_id], [receiver_id], [title], [article], [draft_time], [is_draft], [send_time], [is_backup], [is_trash]) VALUES (50, 4, 1, N'Re:&nbsp;Re:&nbsp;嗨張三你好', N'再回給張三看看', NULL, N'FALSE     ', CAST(N'2016-01-18 21:35:34.190' AS DateTime), N'TRUE      ', N'FALSE     ')
INSERT [dbo].[log_mail] ([id], [sender_id], [receiver_id], [title], [article], [draft_time], [is_draft], [send_time], [is_backup], [is_trash]) VALUES (51, 4, 1, N'test', N'asedfewrew', NULL, N'FALSE     ', CAST(N'2016-01-18 21:38:34.493' AS DateTime), N'TRUE      ', N'FALSE     ')
INSERT [dbo].[log_mail] ([id], [sender_id], [receiver_id], [title], [article], [draft_time], [is_draft], [send_time], [is_backup], [is_trash]) VALUES (52, 4, 1, N'Re:&nbsp;Re:&nbsp;嗨張三你好', N'testtttttttt', NULL, N'FALSE     ', CAST(N'2016-01-18 21:38:57.620' AS DateTime), N'TRUE      ', N'FALSE     ')
INSERT [dbo].[log_mail] ([id], [sender_id], [receiver_id], [title], [article], [draft_time], [is_draft], [send_time], [is_backup], [is_trash]) VALUES (53, 1, 4, N'Re:&nbsp;Re:&nbsp;Re:&nbsp;嗨張三你好', N'回信給老六rarararareawraweraewresw', CAST(N'2016-01-18 21:46:25.097' AS DateTime), N'TRUE      ', NULL, N'FALSE     ', N'FALSE     ')
INSERT [dbo].[log_mail] ([id], [sender_id], [receiver_id], [title], [article], [draft_time], [is_draft], [send_time], [is_backup], [is_trash]) VALUES (57, 4, 2, N'c9', N'安安我是草稿', CAST(N'2016-01-19 14:43:14.197' AS DateTime), N'TRUE      ', NULL, N'FALSE     ', N'FALSE     ')
INSERT [dbo].[log_mail] ([id], [sender_id], [receiver_id], [title], [article], [draft_time], [is_draft], [send_time], [is_backup], [is_trash]) VALUES (58, 2, 4, N'更新', N'更新', NULL, N'FALSE     ', CAST(N'2016-01-22 20:57:16.123' AS DateTime), N'TRUE      ', N'FALSE     ')
INSERT [dbo].[log_mail] ([id], [sender_id], [receiver_id], [title], [article], [draft_time], [is_draft], [send_time], [is_backup], [is_trash]) VALUES (59, 2, 36, N'Re:&nbsp;系統:您的物品已被交易!', N'I love you too', CAST(N'2016-01-22 20:57:53.833' AS DateTime), N'TRUE      ', NULL, N'FALSE     ', N'FALSE     ')
INSERT [dbo].[log_mail] ([id], [sender_id], [receiver_id], [title], [article], [draft_time], [is_draft], [send_time], [is_backup], [is_trash]) VALUES (60, 2, 1, N'Re:&nbsp;i love you', N'I love you too', CAST(N'2016-01-22 20:57:53.837' AS DateTime), N'TRUE      ', NULL, N'FALSE     ', N'FALSE     ')
INSERT [dbo].[log_mail] ([id], [sender_id], [receiver_id], [title], [article], [draft_time], [is_draft], [send_time], [is_backup], [is_trash]) VALUES (61, 2, 4, N'嗨嗨', N'123', NULL, N'FALSE     ', CAST(N'2016-01-23 14:55:50.417' AS DateTime), N'TRUE      ', N'FALSE     ')
INSERT [dbo].[log_mail] ([id], [sender_id], [receiver_id], [title], [article], [draft_time], [is_draft], [send_time], [is_backup], [is_trash]) VALUES (62, 2, 36, N'Re:&nbsp;系統:您的物品已被交易!', N'嗨嗨嗨嗨嗨嗨', NULL, N'FALSE     ', CAST(N'2016-01-23 15:17:52.877' AS DateTime), N'TRUE      ', N'FALSE     ')
INSERT [dbo].[log_mail] ([id], [sender_id], [receiver_id], [title], [article], [draft_time], [is_draft], [send_time], [is_backup], [is_trash]) VALUES (63, 2, 36, N'Re:&nbsp;系統:您的物品已被交易!', N'嗨嗨嗨嗨嗨嗨', NULL, N'FALSE     ', CAST(N'2016-01-23 15:17:52.893' AS DateTime), N'TRUE      ', N'FALSE     ')
INSERT [dbo].[log_mail] ([id], [sender_id], [receiver_id], [title], [article], [draft_time], [is_draft], [send_time], [is_backup], [is_trash]) VALUES (64, 2, 36, N'Re:&nbsp;系統:您的物品已被交易!', N'嗨嗨嗨嗨嗨嗨', NULL, N'FALSE     ', CAST(N'2016-01-23 15:17:52.893' AS DateTime), N'TRUE      ', N'FALSE     ')
INSERT [dbo].[log_mail] ([id], [sender_id], [receiver_id], [title], [article], [draft_time], [is_draft], [send_time], [is_backup], [is_trash]) VALUES (65, 2, 36, N'Re:&nbsp;系統:您的物品已被交易!', N'嗨嗨嗨嗨嗨嗨', NULL, N'FALSE     ', CAST(N'2016-01-23 15:17:52.893' AS DateTime), N'TRUE      ', N'FALSE     ')
INSERT [dbo].[log_mail] ([id], [sender_id], [receiver_id], [title], [article], [draft_time], [is_draft], [send_time], [is_backup], [is_trash]) VALUES (66, 2, 36, N'Re:&nbsp;系統:您的物品已被交易!', N'嗨嗨嗨嗨嗨嗨', NULL, N'FALSE     ', CAST(N'2016-01-23 15:17:52.893' AS DateTime), N'TRUE      ', N'FALSE     ')
INSERT [dbo].[log_mail] ([id], [sender_id], [receiver_id], [title], [article], [draft_time], [is_draft], [send_time], [is_backup], [is_trash]) VALUES (67, 2, 36, N'Re:&nbsp;系統:您的物品已被交易!', N'嗨嗨嗨嗨嗨嗨', NULL, N'FALSE     ', CAST(N'2016-01-23 15:17:52.893' AS DateTime), N'TRUE      ', N'FALSE     ')
INSERT [dbo].[log_mail] ([id], [sender_id], [receiver_id], [title], [article], [draft_time], [is_draft], [send_time], [is_backup], [is_trash]) VALUES (68, 2, 36, N'Re:&nbsp;系統:您的物品已被交易!', N'嗨嗨嗨嗨嗨嗨', NULL, N'FALSE     ', CAST(N'2016-01-23 15:17:52.897' AS DateTime), N'TRUE      ', N'FALSE     ')
INSERT [dbo].[log_mail] ([id], [sender_id], [receiver_id], [title], [article], [draft_time], [is_draft], [send_time], [is_backup], [is_trash]) VALUES (69, 2, 1, N'Re:&nbsp;test', N'嗨嗨嗨嗨嗨嗨嗨嗨嗨', NULL, N'FALSE     ', CAST(N'2016-01-23 15:18:13.137' AS DateTime), N'TRUE      ', N'FALSE     ')
INSERT [dbo].[log_mail] ([id], [sender_id], [receiver_id], [title], [article], [draft_time], [is_draft], [send_time], [is_backup], [is_trash]) VALUES (70, 2, 1, N'Re:&nbsp;test', N'哈囉哈囉', CAST(N'2016-01-23 15:18:29.187' AS DateTime), N'TRUE      ', NULL, N'FALSE     ', N'FALSE     ')
INSERT [dbo].[log_mail] ([id], [sender_id], [receiver_id], [title], [article], [draft_time], [is_draft], [send_time], [is_backup], [is_trash]) VALUES (73, 2, 36, N'Re:&nbsp;系統:您的物品已被交易!', N'i love u too', NULL, N'FALSE     ', CAST(N'2016-01-23 15:39:39.750' AS DateTime), N'TRUE      ', N'FALSE     ')
INSERT [dbo].[log_mail] ([id], [sender_id], [receiver_id], [title], [article], [draft_time], [is_draft], [send_time], [is_backup], [is_trash]) VALUES (77, 4, 1, N'Re:&nbsp;嗨', N'再回一次看看', NULL, N'FALSE     ', CAST(N'2016-01-23 15:39:21.637' AS DateTime), N'TRUE      ', N'FALSE     ')
INSERT [dbo].[log_mail] ([id], [sender_id], [receiver_id], [title], [article], [draft_time], [is_draft], [send_time], [is_backup], [is_trash]) VALUES (79, 4, 1, N'Re:&nbsp;嗨', N'到底有沒有寄錯人???', NULL, N'FALSE     ', CAST(N'2016-01-23 15:40:49.243' AS DateTime), N'TRUE      ', N'FALSE     ')
INSERT [dbo].[log_mail] ([id], [sender_id], [receiver_id], [title], [article], [draft_time], [is_draft], [send_time], [is_backup], [is_trash]) VALUES (80, 4, 2, N'Re:&nbsp;嗨嗨', N'LOLOLOLOLLLLL', NULL, N'FALSE     ', CAST(N'2016-01-23 15:42:46.693' AS DateTime), N'TRUE      ', N'FALSE     ')
INSERT [dbo].[log_mail] ([id], [sender_id], [receiver_id], [title], [article], [draft_time], [is_draft], [send_time], [is_backup], [is_trash]) VALUES (81, 4, 2, N'Re:&nbsp;更新', N'LOLOLOLOLLLLL', NULL, N'FALSE     ', CAST(N'2016-01-23 15:42:46.700' AS DateTime), N'TRUE      ', N'FALSE     ')
INSERT [dbo].[log_mail] ([id], [sender_id], [receiver_id], [title], [article], [draft_time], [is_draft], [send_time], [is_backup], [is_trash]) VALUES (82, 4, 2, N'Re:&nbsp;更新', N'LOLOLOLOLLLLL', NULL, N'FALSE     ', CAST(N'2016-01-23 15:42:46.707' AS DateTime), N'TRUE      ', N'FALSE     ')
INSERT [dbo].[log_mail] ([id], [sender_id], [receiver_id], [title], [article], [draft_time], [is_draft], [send_time], [is_backup], [is_trash]) VALUES (107, 2, 4, N'你的商品很爛', N'圖文不符', NULL, N'FALSE     ', CAST(N'2016-01-23 17:18:30.553' AS DateTime), N'TRUE      ', N'FALSE     ')
INSERT [dbo].[log_mail] ([id], [sender_id], [receiver_id], [title], [article], [draft_time], [is_draft], [send_time], [is_backup], [is_trash]) VALUES (108, 4, 2, N'Re:&nbsp;你的商品很爛', N'你的也很爛', NULL, N'FALSE     ', CAST(N'2016-01-23 17:24:14.637' AS DateTime), N'TRUE      ', N'FALSE     ')
INSERT [dbo].[log_mail] ([id], [sender_id], [receiver_id], [title], [article], [draft_time], [is_draft], [send_time], [is_backup], [is_trash]) VALUES (109, 2, 4, N'Re:&nbsp;Re:&nbsp;你的商品很爛', N'你才爛勒', NULL, N'FALSE     ', CAST(N'2016-01-23 17:24:32.480' AS DateTime), N'TRUE      ', N'FALSE     ')
INSERT [dbo].[log_mail] ([id], [sender_id], [receiver_id], [title], [article], [draft_time], [is_draft], [send_time], [is_backup], [is_trash]) VALUES (110, 4, 2, N'Re:&nbsp;Re:&nbsp;Re:&nbsp;你的商品很爛', N'我要叫管理員把你封鎖
', NULL, N'FALSE     ', CAST(N'2016-01-23 17:25:01.813' AS DateTime), N'TRUE      ', N'FALSE     ')
INSERT [dbo].[log_mail] ([id], [sender_id], [receiver_id], [title], [article], [draft_time], [is_draft], [send_time], [is_backup], [is_trash]) VALUES (111, 4, 2, N'嗨李四', N'嗨嗨李四哈哈哈', NULL, N'FALSE     ', CAST(N'2016-01-23 17:25:41.047' AS DateTime), N'TRUE      ', N'FALSE     ')
INSERT [dbo].[log_mail] ([id], [sender_id], [receiver_id], [title], [article], [draft_time], [is_draft], [send_time], [is_backup], [is_trash]) VALUES (112, 2, 4, N'123', N'嗨', CAST(N'2016-01-23 17:25:50.970' AS DateTime), N'TRUE      ', NULL, N'FALSE     ', N'FALSE     ')
INSERT [dbo].[log_mail] ([id], [sender_id], [receiver_id], [title], [article], [draft_time], [is_draft], [send_time], [is_backup], [is_trash]) VALUES (113, 4, 1, N'', N'好', CAST(N'2016-01-23 17:26:17.987' AS DateTime), N'TRUE      ', NULL, N'FALSE     ', N'FALSE     ')
SET IDENTITY_INSERT [dbo].[log_mail] OFF
SET IDENTITY_INSERT [dbo].[mail] ON 

INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (4, 6, 8, CAST(N'2016-01-13 04:04:44.000' AS DateTime), N'給趙高', N'趙兄，地板冷嗎?', N'FALSE     ', N'TRUE      ', N'TRUE      ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (5, 4, 6, CAST(N'2016-01-10 17:05:18.000' AS DateTime), N'江湖救急', N'親愛的天天，借我錢好嗎?再不還錢，王五那個畜生要催了', N'TRUE      ', N'FALSE     ', N'TRUE      ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (40, 1, 5, CAST(N'2016-01-16 17:58:11.057' AS DateTime), N'123', N'123', N'FALSE     ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (45, 1, 5, CAST(N'2016-01-17 01:25:34.417' AS DateTime), N'我是測試草稿寄出', N'嗨嗨嗨', N'FALSE     ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (48, 1, 5, CAST(N'2016-01-17 16:01:46.397' AS DateTime), N'草稿測試更新喔', N'我是草稿!!!', N'FALSE     ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (49, 1, 5, CAST(N'2016-01-18 15:26:05.777' AS DateTime), N'測試刪除', N'測試刪除', N'TRUE      ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (61, 1, 5, CAST(N'2016-01-18 17:38:05.160' AS DateTime), N'asdasd', N'asdasds', N'FALSE     ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (71, 36, 5, CAST(N'2016-01-18 21:49:53.313' AS DateTime), N'系統:您的物品已被交易!', N'您好,親愛的用戶黃七有人想要使用台北高雄國光客運交換您刊登的手提音響,請盡速前往物品頁面察看確認是否想要交換喔!=D', N'FALSE     ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (147, 36, 3, CAST(N'2016-01-21 09:30:21.627' AS DateTime), N'系統:您的物品已被交易!', N'您好,親愛的用戶王五<br>有人想要使用手機記憶卡32GB交換您刊登的沐浴球,請盡速前往物品頁面察看確認是否想要交換喔!=D<br><br><br>E715管理員初號機敬上', N'FALSE     ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (154, 36, 5, CAST(N'2016-01-23 14:46:44.293' AS DateTime), N'系統:您的物品已被交易!', N'您好,親愛的用戶黃七<br>有人想要使用小狗T-shirt(全新S號)交換您刊登的五月花衛生紙,請盡速前往物品頁面察看確認是否想要交換喔!=D<br><br><br>E715管理員初號機敬上', N'FALSE     ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (156, 36, 3, CAST(N'2016-01-23 14:55:54.177' AS DateTime), N'系統:您的物品已被交易!', N'您好,親愛的用戶王五您好:<br>您的物品小狗T-shirt(全新S號)已經與五月花衛生紙配對成功,請盡速與交易者取得聯繫完成交易,並給予對方評分唷!=)<br><br><br>E715管理員初號機敬上', N'FALSE     ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (157, 36, 3, CAST(N'2016-01-23 15:00:46.007' AS DateTime), N'系統:您的物品已被交易!', N'您好,親愛的用戶王五您好:<br>您的物品小狗T-shirt(全新S號)已經與五月花衛生紙配對成功,請盡速與交易者取得聯繫完成交易,並給予對方評分唷!=)<br><br><br>E715管理員初號機敬上', N'FALSE     ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (159, 36, 3, CAST(N'2016-01-23 15:10:47.257' AS DateTime), N'系統:您的物品已被交易!', N'您好,親愛的用戶王五<br>有人想要使用史努比記帳本交換您刊登的肉乾,請盡速前往物品頁面察看確認是否想要交換喔!=D<br><br><br>E715管理員初號機敬上', N'FALSE     ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (160, 36, 3, CAST(N'2016-01-23 15:11:46.323' AS DateTime), N'系統:您的物品已被交易!', N'您好,親愛的用戶王五您好:<br>您的物品名偵探柯南展覽已經與和室椅配對成功,請盡速與交易者取得聯繫完成交易,並給予對方評分唷!=)<br><br><br>E715管理員初號機敬上', N'FALSE     ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (161, 36, 3, CAST(N'2016-01-23 15:13:51.847' AS DateTime), N'系統:您的物品已被交易!', N'您好,親愛的用戶王五您好:<br>您的物品名偵探柯南展覽已經與和室椅配對成功,請盡速與交易者取得聯繫完成交易,並給予對方評分唷!=)<br><br><br>E715管理員初號機敬上', N'FALSE     ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (162, 36, 3, CAST(N'2016-01-23 15:14:25.730' AS DateTime), N'系統:您的物品已被交易!', N'您好,親愛的用戶王五您好:<br>您的物品名偵探柯南展覽已經與和室椅配對成功,請盡速與交易者取得聯繫完成交易,並給予對方評分唷!=)<br><br><br>E715管理員初號機敬上', N'FALSE     ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (163, 2, 36, CAST(N'2016-01-23 15:17:52.820' AS DateTime), N'Re:&nbsp;系統:您的物品已被交易!', N'嗨嗨嗨嗨嗨嗨', N'FALSE     ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (164, 2, 36, CAST(N'2016-01-23 15:17:52.847' AS DateTime), N'Re:&nbsp;系統:您的物品已被交易!', N'嗨嗨嗨嗨嗨嗨', N'FALSE     ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (165, 2, 36, CAST(N'2016-01-23 15:17:52.847' AS DateTime), N'Re:&nbsp;系統:您的物品已被交易!', N'嗨嗨嗨嗨嗨嗨', N'FALSE     ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (166, 2, 36, CAST(N'2016-01-23 15:17:52.847' AS DateTime), N'Re:&nbsp;系統:您的物品已被交易!', N'嗨嗨嗨嗨嗨嗨', N'FALSE     ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (167, 2, 36, CAST(N'2016-01-23 15:17:52.847' AS DateTime), N'Re:&nbsp;系統:您的物品已被交易!', N'嗨嗨嗨嗨嗨嗨', N'FALSE     ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (168, 2, 36, CAST(N'2016-01-23 15:17:52.850' AS DateTime), N'Re:&nbsp;系統:您的物品已被交易!', N'嗨嗨嗨嗨嗨嗨', N'FALSE     ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (169, 2, 36, CAST(N'2016-01-23 15:17:52.850' AS DateTime), N'Re:&nbsp;系統:您的物品已被交易!', N'嗨嗨嗨嗨嗨嗨', N'FALSE     ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (171, 2, 36, CAST(N'2016-01-23 15:39:39.677' AS DateTime), N'Re:&nbsp;系統:您的物品已被交易!', N'i love u too', N'FALSE     ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (174, 2, 36, CAST(N'2016-01-23 15:39:39.703' AS DateTime), N'Re:&nbsp;系統:您的物品已被交易!', N'i love u too', N'FALSE     ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (175, 2, 36, CAST(N'2016-01-23 15:39:39.707' AS DateTime), N'Re:&nbsp;系統:您的物品已被交易!', N'i love u too', N'FALSE     ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (176, 2, 36, CAST(N'2016-01-23 15:39:39.707' AS DateTime), N'Re:&nbsp;系統:您的物品已被交易!', N'i love u too', N'FALSE     ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (177, 4, 36, CAST(N'2016-01-23 15:39:04.477' AS DateTime), N'Re:&nbsp;系統:您的物品已被交易!', N'看看能不能回', N'FALSE     ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (183, 4, 36, CAST(N'2016-01-23 15:39:04.627' AS DateTime), N'Re:&nbsp;系統:您的物品已被交易!', N'看看能不能回', N'FALSE     ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (218, 36, 3, CAST(N'2016-01-23 17:07:17.537' AS DateTime), N'系統:您的物品已被交易!', N'您好,親愛的用戶王五<br>有人想要使用沐浴球交換您刊登的肉乾,請盡速前往物品頁面察看確認是否想要交換喔!=D<br><br><br>E715管理員初號機敬上', N'FALSE     ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (219, 36, 3, CAST(N'2016-01-23 17:07:32.213' AS DateTime), N'系統:您的物品已被交易!', N'您好,親愛的用戶王五<br>有人想要使用高露潔牙膏交換您刊登的肉乾,請盡速前往物品頁面察看確認是否想要交換喔!=D<br><br><br>E715管理員初號機敬上', N'FALSE     ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (220, 36, 4, CAST(N'2016-01-23 17:10:33.123' AS DateTime), N'系統:您的物品已被交易!', N'您好,親愛的用戶老六<br>有人想要使用沐浴乳交換您刊登的台北彰化回數票2張,請盡速前往物品頁面察看確認是否想要交換喔!=D<br><br><br>E715管理員初號機敬上', N'FALSE     ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (221, 36, 2, CAST(N'2016-01-23 17:10:40.290' AS DateTime), N'系統:您的物品已被交易!', N'您好,親愛的用戶李四<br>有人想要使用妙鼻貼交換您刊登的球拍,請盡速前往物品頁面察看確認是否想要交換喔!=D<br><br><br>E715管理員初號機敬上', N'FALSE     ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (222, 36, 2, CAST(N'2016-01-23 17:11:51.523' AS DateTime), N'系統:您的物品已被交易!', N'您好,親愛的用戶李四<br>有人想要使用乳液交換您刊登的球拍,請盡速前往物品頁面察看確認是否想要交換喔!=D<br><br><br>E715管理員初號機敬上', N'FALSE     ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (223, 36, 2, CAST(N'2016-01-23 17:12:25.907' AS DateTime), N'系統:您的物品已被交易!', N'您好,親愛的用戶李四<br>有人想要使用台北彰化回數票2張交換您刊登的球拍,請盡速前往物品頁面察看確認是否想要交換喔!=D<br><br><br>E715管理員初號機敬上', N'FALSE     ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (224, 36, 2, CAST(N'2016-01-23 17:12:51.940' AS DateTime), N'系統:您的物品已被交易!', N'您好,親愛的用戶李四<br>有人想要使用菜瓜水交換您刊登的球拍,請盡速前往物品頁面察看確認是否想要交換喔!=D<br><br><br>E715管理員初號機敬上', N'FALSE     ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (225, 36, 4, CAST(N'2016-01-23 17:15:24.407' AS DateTime), N'系統:您的物品已被交易!', N'您好,親愛的用戶老六您好:<br>您的物品妙鼻貼已經與球拍配對成功,請盡速與交易者取得聯繫完成交易,並給予對方評分唷!=)<br><br><br>E715管理員初號機敬上', N'FALSE     ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (226, 36, 4, CAST(N'2016-01-23 17:15:57.923' AS DateTime), N'系統:您的物品已被交易!', N'您好,親愛的用戶老六您好:<br>您的物品妙鼻貼已經與球拍配對成功,請盡速與交易者取得聯繫完成交易,並給予對方評分唷!=)<br><br><br>E715管理員初號機敬上', N'FALSE     ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (227, 36, 2, CAST(N'2016-01-23 17:17:07.590' AS DateTime), N'系統:您的物品已被交易!', N'您好,親愛的用戶李四<br>有人想要使用厲害的眼霜交換您刊登的高露潔牙膏,請盡速前往物品頁面察看確認是否想要交換喔!=D<br><br><br>E715管理員初號機敬上', N'FALSE     ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (228, 36, 4, CAST(N'2016-01-23 17:17:52.367' AS DateTime), N'系統:您的物品已被交易!', N'您好,親愛的用戶老六您好:<br>您的物品厲害的眼霜已經與高露潔牙膏配對成功,請盡速與交易者取得聯繫完成交易,並給予對方評分唷!=)<br><br><br>E715管理員初號機敬上', N'FALSE     ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (229, 36, 4, CAST(N'2016-01-23 17:18:21.223' AS DateTime), N'系統:您的物品已被交易!', N'您好,親愛的用戶老六您好:<br>您的物品厲害的眼霜已經與高露潔牙膏配對成功,請盡速與交易者取得聯繫完成交易,並給予對方評分唷!=)<br><br><br>E715管理員初號機敬上', N'FALSE     ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (230, 2, 4, CAST(N'2016-01-23 17:18:30.397' AS DateTime), N'你的商品很爛', N'圖文不符', N'FALSE     ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (231, 36, 4, CAST(N'2016-01-23 17:19:06.010' AS DateTime), N'系統:您的物品已被交易!', N'您好,親愛的用戶老六您好:<br>您的物品厲害的眼霜已經與高露潔牙膏配對成功,請盡速與交易者取得聯繫完成交易,並給予對方評分唷!=)<br><br><br>E715管理員初號機敬上', N'FALSE     ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (232, 4, 2, CAST(N'2016-01-23 17:24:14.497' AS DateTime), N'Re:&nbsp;你的商品很爛', N'你的也很爛', N'FALSE     ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (233, 2, 4, CAST(N'2016-01-23 17:24:32.330' AS DateTime), N'Re:&nbsp;Re:&nbsp;你的商品很爛', N'你才爛勒', N'FALSE     ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (234, 4, 2, CAST(N'2016-01-23 17:25:01.667' AS DateTime), N'Re:&nbsp;Re:&nbsp;Re:&nbsp;你的商品很爛', N'我要叫管理員把你封鎖
', N'FALSE     ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (235, 4, 2, CAST(N'2016-01-23 17:25:40.903' AS DateTime), N'嗨李四', N'嗨嗨李四哈哈哈', N'FALSE     ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (236, 36, 1, CAST(N'2016-01-23 17:50:22.097' AS DateTime), N'系統:有人想要交換您的物品!', N'您好,親愛的用戶張三<br>有人想要使用butterfly 桌球拍交換您刊登的手機記憶卡32GB,請盡速前往物品頁面察看確認是否想要交換喔!=D<br><br><br>E715管理員初號機敬上', N'FALSE     ', N'FALSE     ', N'FALSE     ')
INSERT [dbo].[mail] ([id], [sender_id], [receiver_id], [send_time], [title], [article], [is_important], [is_trash], [is_read]) VALUES (237, 36, 5, CAST(N'2016-01-23 17:58:04.583' AS DateTime), N'系統:有人想要交換您的物品!', N'您好,親愛的用戶黃七<br>有人想要使用沐浴球交換您刊登的ADIDAS 足球鞋,請盡速前往物品頁面察看確認是否想要交換喔!=D<br><br><br>E715管理員初號機敬上', N'FALSE     ', N'FALSE     ', N'FALSE     ')
SET IDENTITY_INSERT [dbo].[mail] OFF
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (2, 3, CAST(N'2016-07-26 00:00:00.000' AS DateTime), N'總統府', N'自拍神器', N'TRUE      ', CAST(N'2015-12-31 00:00:00.000' AS DateTime), N'面交', NULL, N'手機殼(皮的)', 1, 1, N'iphone5以上的都可以用喔~', N'九成新', N'上午', CAST(N'2016-01-21 14:29:51.557' AS DateTime), NULL, NULL, N'FALSE', N'/E715/resources/userimgs/1.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (3, 3, CAST(N'2016-08-27 00:00:00.000' AS DateTime), N'台北車站', N'白色行動電源', N'TRUE      ', CAST(N'2015-12-30 00:00:00.000' AS DateTime), N'面交', NULL, N'隨機', 1, 1, N'應該可以充2次', N'九成新', N'下午', CAST(N'2016-01-21 14:35:28.597' AS DateTime), NULL, NULL, N'FALSE', N'/E715/resources/userimgs/p003143609810-item-7471xf1x0300x0300-m.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (4, 54, CAST(N'2016-07-30 00:00:00.000' AS DateTime), N'市政府捷運站', N'手機記憶卡32GB', N'TRUE      ', CAST(N'2015-12-31 00:00:00.000' AS DateTime), N'面交', NULL, N'麵線', 1, 1, N'才買不到一年!!!!', N'九成新', N'上午', CAST(N'2016-01-21 14:28:57.437' AS DateTime), NULL, NULL, N'FALSE', N'/E715/resources/productPictures/4_下載 (1).jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (5, 3, CAST(N'2016-11-12 00:00:00.000' AS DateTime), N'大安捷運站', N'電競滑鼠', N'TRUE      ', CAST(N'2015-12-31 00:00:00.000' AS DateTime), N'面交', NULL, N'登山水壺，背包', 1, 1, N'好用，打game必備', N'九成新', N'晚上', CAST(N'2016-01-21 14:33:26.960' AS DateTime), NULL, NULL, N'FALSE', N'/E715/resources/productPictures/5_MCB43704_RAT_TE_001_MB_lg.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (6, 4, NULL, NULL, N'財務報表分析', N'FALSE     ', CAST(N'2015-02-22 00:00:00.000' AS DateTime), NULL, NULL, NULL, 2, 1, N'有看過的痕跡，但裡面全沒書寫紀錄', N'九成新', NULL, NULL, NULL, NULL, N'FALSE', N'/E715/resources/productPictures/6_1434472778-539053480_n.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (7, 3, CAST(N'2016-01-31 00:00:00.000' AS DateTime), N'台灣大學', N'工程統計學', N'TRUE      ', CAST(N'2015-02-23 00:00:00.000' AS DateTime), N'面交', NULL, N'免費', 2, 1, N'有螢光筆畫過的紀錄，保存良好', N'九成新', N'晚上', CAST(N'2016-01-21 14:37:30.817' AS DateTime), NULL, NULL, N'FALSE', N'/E715/resources/productPictures/7_9789571184128.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (8, 33, NULL, NULL, N'海賊王1~10集', N'FALSE     ', CAST(N'2015-01-02 00:00:00.000' AS DateTime), NULL, NULL, NULL, 2, 1, N'有包書套喔，保存優良', N'九成新', NULL, NULL, NULL, NULL, N'FALSE', N'/E715/resources/productPictures/8_下載.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (9, 22, NULL, NULL, N'小住宅格局大改造', N'FALSE     ', CAST(N'2015-01-04 00:00:00.000' AS DateTime), NULL, NULL, NULL, 2, 1, N'對市內設計有興趣的可以來交換喔', N'九成新', NULL, NULL, NULL, NULL, N'FALSE', N'/E715/resources/productPictures/9_1GQ703.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (10, 11, CAST(N'2016-05-07 00:00:00.000' AS DateTime), N'大安捷運站', N'總統遊戲DVD', N'TRUE      ', CAST(N'2015-01-05 00:00:00.000' AS DateTime), N'面交', NULL, N'總統遊戲藍光', 3, 1, N'DVD DVD喔', N'九成新', N'晚上', CAST(N'2016-01-21 15:22:14.467' AS DateTime), NULL, NULL, N'FALSE', N'/E715/resources/productPictures/10_21549232330273_788_m.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (11, 4, NULL, NULL, N'飢餓遊戲電影原聲帶', N'FALSE     ', CAST(N'2015-01-06 00:00:00.000' AS DateTime), NULL, NULL, NULL, 3, 1, N'還不錯聽喔，有完整包裝', N'九成新', NULL, NULL, NULL, NULL, N'FALSE', N'/E715/resources/productPictures/11_295527.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (12, 34, NULL, NULL, N'Wii的FIFA15', N'FALSE     ', CAST(N'2015-01-07 00:00:00.000' AS DateTime), NULL, NULL, NULL, 3, 1, N'適合多人一起玩', N'九成新', NULL, NULL, NULL, NULL, N'FALSE', N'/E715/resources/productPictures/12_下載 (1).jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (13, 4, NULL, NULL, N'PS2NBA2K10', N'FALSE     ', CAST(N'2016-01-23 17:12:30.147' AS DateTime), NULL, NULL, NULL, 3, 1, N'有點老，但是還不錯完', N'九成新', NULL, NULL, NULL, NULL, N'FALSE', N'/E715/resources/productPictures/13_下載 (2).jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (14, 55, NULL, NULL, N'一匙靈濃縮洗衣精', N'FALSE     ', CAST(N'2015-02-09 00:00:00.000' AS DateTime), NULL, NULL, NULL, 4, 1, N'有用過幾次，沒有結塊喔', N'九成新', NULL, NULL, NULL, NULL, N'FALSE', N'/E715/resources/productPictures/14_images.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (15, 65, CAST(N'2016-01-30 00:00:00.000' AS DateTime), N'中山國中站', N'高露潔牙膏', N'FALSE     ', CAST(N'2015-02-10 00:00:00.000' AS DateTime), N'面交', NULL, N'黑人牙膏全新的
24小時配方或是抗敏感配方', 4, 2, N'高露潔的喔', N'九成新', N'下午', CAST(N'2016-01-21 15:51:01.477' AS DateTime), NULL, NULL, N'TRUE', N'/E715/resources/productPictures/15_1318168781-779101833.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (16, 21, CAST(N'2016-02-28 00:00:00.000' AS DateTime), N'捷運芝山站', N'沐浴乳', N'TRUE      ', CAST(N'2015-02-11 00:00:00.000' AS DateTime), N'面交/郵寄', NULL, N'免費', 4, 2, N'還蠻香的', N'九成新', N'下午', CAST(N'2016-01-21 00:00:00.000' AS DateTime), NULL, NULL, N'FALSE', N'/E715/resources/productPictures/16_015.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (17, 5, CAST(N'2016-02-01 00:00:00.000' AS DateTime), N'成功大學', N'沐浴球', N'TRUE      ', CAST(N'2015-03-21 00:00:00.000' AS DateTime), N'面交/郵寄', NULL, N'洗髮精、洗面乳', 4, 2, N'刷起來舒服喔', N'九成新', N'上午', CAST(N'2016-01-21 00:00:00.000' AS DateTime), NULL, NULL, N'FALSE', N'/E715/resources/productPictures/17_016.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (18, 4, CAST(N'2016-03-03 00:00:00.000' AS DateTime), N'台大體育館', N'butterfly 桌球拍', N'TRUE      ', CAST(N'2016-01-22 14:00:54.790' AS DateTime), N'面交', NULL, N'愛迪達 adidas Vacuum V1.5桌球拍', 12, 2, N'有使用過但是保存良好沒有任何瑕資', N'使用過', N'上午', CAST(N'2016-01-22 14:00:54.700' AS DateTime), NULL, NULL, N'FALSE', N'/E715/resources/productPictures/18_5353_P_1399866353758.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (19, 5, CAST(N'2016-01-28 00:00:00.000' AS DateTime), N'中山國中站', N'史努比記帳本', N'TRUE      ', CAST(N'2016-01-21 16:13:52.060' AS DateTime), N'面交', NULL, N'隨機', 5, 2, N'2016的~沒有任何書寫紀錄全新的喔!', N'全新', N'上午', CAST(N'2016-01-21 16:13:51.973' AS DateTime), NULL, NULL, N'FALSE', N'/E715/resources/productPictures/19__sE_9779353732.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (20, 6, CAST(N'2017-02-01 00:00:00.000' AS DateTime), N'淡江', N'玩具總動員筆記本', N'TRUE      ', CAST(N'2015-11-03 00:00:00.000' AS DateTime), N'面交', NULL, N'海賊王海報、7-11點數', 5, 2, N'玩具總動員迷可考慮收藏', N'九成新', N'上午', CAST(N'2016-01-21 00:00:00.000' AS DateTime), NULL, NULL, N'FALSE', N'/E715/resources/productPictures/P1130013.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (21, 6, CAST(N'2017-02-01 00:00:00.000' AS DateTime), N'輔仁大學', N'黃色便條貼紙', N'TRUE      ', CAST(N'2015-10-01 00:00:00.000' AS DateTime), N'面交', NULL, N'筆記本、桌曆', 5, 2, N'買太多用不完', N'九成新', N'下午', CAST(N'2016-01-21 00:00:00.000' AS DateTime), NULL, NULL, N'FALSE', N'/E715/resources/productPictures/5319740-1.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (22, 54, CAST(N'2016-02-28 00:00:00.000' AS DateTime), N'捷運劍潭站', N'小卡', N'TRUE      ', CAST(N'2015-10-01 00:00:00.000' AS DateTime), N'面交/郵寄', NULL, N'床墊、小椅子、巧拼', 5, 2, N'每張都有可愛圖片', N'九成新', N'下午', CAST(N'2016-01-21 00:00:00.000' AS DateTime), NULL, NULL, N'FALSE', N'/E715/resources/productPictures/item_pic.jpg_400x400.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (23, 2, CAST(N'2016-03-04 00:00:00.000' AS DateTime), N'市政府捷運站', N'三層鞋架', N'TRUE      ', CAST(N'2016-01-22 14:07:39.307' AS DateTime), N'面交', NULL, N'隨機', 6, 2, N'普通高統也放得下喔', N'九成新', N'晚上', CAST(N'2016-01-22 14:07:39.227' AS DateTime), NULL, NULL, N'FALSE', N'/E715/resources/productPictures/23_137466027306621208_374x269.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (24, 3, CAST(N'2016-04-08 00:00:00.000' AS DateTime), N'港墘站', N'收納櫃', N'TRUE      ', CAST(N'2016-01-22 14:09:14.837' AS DateTime), N'面交', NULL, N'塑膠收納櫃', 6, 2, N'方便收納4*8規格的IKEA收納櫃!', N'九成新', N'晚上', CAST(N'2016-01-22 14:09:14.767' AS DateTime), NULL, NULL, N'FALSE', N'/E715/resources/productPictures/24_1408085703-3124253303_l.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (25, 36, CAST(N'2016-02-28 00:00:00.000' AS DateTime), N'動物園', N'時鐘', N'TRUE      ', CAST(N'2015-06-11 00:00:00.000' AS DateTime), N'面交/郵寄', NULL, N'筆記本、桌曆', 6, 2, N'附送電池喔', N'九成新', N'下午', CAST(N'2016-01-21 00:00:00.000' AS DateTime), NULL, NULL, N'FALSE', N'/E715/resources/productPictures/25_1.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (26, 41, CAST(N'2016-02-28 00:00:00.000' AS DateTime), N'內灣', N'和室椅', N'FALSE     ', CAST(N'2015-03-31 00:00:00.000' AS DateTime), N'面交/郵寄', NULL, N'衣物柔軟精、漱口水', 6, 2, N'蠻特殊的，坐起來舒服', N'九成新', N'下午', CAST(N'2016-01-21 00:00:00.000' AS DateTime), N'GOOD', CAST(N'2016-01-23 15:13:58.523' AS DateTime), N'TRUE', N'/E715/resources/productPictures/531896_3_1.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (27, 9, CAST(N'2016-02-01 00:00:00.000' AS DateTime), N'台北轉運站', N'吹風機', N'TRUE      ', CAST(N'2015-04-20 00:00:00.000' AS DateTime), N'郵寄', NULL, N'電池、濾水器', 7, 2, N'蠻新的，三段風速，有冷熱風', N'九成新', N'下午', CAST(N'2016-01-21 00:00:00.000' AS DateTime), NULL, NULL, N'FALSE', N'/E715/resources/productPictures/27_1.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (28, 9, NULL, NULL, N'手提音響', N'FALSE     ', CAST(N'2015-01-31 00:00:00.000' AS DateTime), NULL, NULL, NULL, 7, 2, N'有意者願上勾', N'九成新', NULL, NULL, NULL, NULL, N'FALSE', N'/E715/resources/productPictures/asdad.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (29, 31, CAST(N'2016-01-31 00:00:00.000' AS DateTime), N'捷運新埔站', N'手電筒', N'TRUE      ', CAST(N'2016-01-23 14:27:40.177' AS DateTime), N'面交', NULL, N'出外旅遊必需品', 7, 2, N'多功能鋁鎂合金強光防水LED手電筒', N'九成新', N'下午', CAST(N'2016-01-23 14:27:40.077' AS DateTime), NULL, NULL, N'FALSE', N'/E715/resources/productPictures/29_a.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (30, 22, CAST(N'2016-01-31 00:00:00.000' AS DateTime), N'台北車站', N'轉接頭', N'TRUE      ', CAST(N'2015-09-04 00:00:00.000' AS DateTime), N'面交', NULL, N'免費', 7, 3, N'出國必備小物', N'九成新', N'晚上', CAST(N'2016-01-21 15:18:24.987' AS DateTime), NULL, NULL, N'FALSE', N'/E715/resources/productPictures/30_bbbb.gif')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (31, 7, CAST(N'2016-01-29 00:00:00.000' AS DateTime), N'捷運新店站', N'小狗T-shirt(全新S號)', N'FALSE     ', CAST(N'2015-08-08 00:00:00.000' AS DateTime), N'超商', NULL, N'看有沒有什麼可愛的裝飾品、或是辦公室小物。', 8, 3, N'S號', N'九成新', N'上午', CAST(N'2016-01-21 15:24:27.563' AS DateTime), N'SOSO', CAST(N'2016-01-23 15:01:02.400' AS DateTime), N'TRUE', N'/E715/resources/productPictures/31_c')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (32, 7, CAST(N'2016-01-29 00:00:00.000' AS DateTime), N'政治大學', N'藍色裙', N'TRUE      ', CAST(N'2015-07-18 00:00:00.000' AS DateTime), N'面交', NULL, N'輕薄外套、短裙、背心', 8, 3, N'M號，過膝蓋喔，只有"藍色"!!!!', N'九成新', N'上午', CAST(N'2016-01-21 15:31:05.553' AS DateTime), NULL, NULL, N'FALSE', N'/E715/resources/productPictures/32_d.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (33, 33, CAST(N'2016-01-30 00:00:00.000' AS DateTime), N'新竹廟口', N'後背包', N'TRUE      ', CAST(N'2015-06-18 00:00:00.000' AS DateTime), N'面交', NULL, N'小背包、後背包、斜背包', 8, 3, N'還蠻好背的、裝電腦實用。', N'九成新', N'下午', CAST(N'2016-01-21 15:41:57.817' AS DateTime), NULL, NULL, N'FALSE', N'/E715/resources/productPictures/33_e.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (34, 5, CAST(N'2016-02-29 00:00:00.000' AS DateTime), N'新竹廟口', N'球鞋袋', N'TRUE      ', CAST(N'2015-05-21 00:00:00.000' AS DateTime), N'面交', NULL, N'後背包、斜背包、小背包', 12, 3, N'有打籃球者可考慮，Nike的~~', N'九成新', N'下午', CAST(N'2016-01-21 15:40:24.720' AS DateTime), NULL, NULL, N'FALSE', N'/E715/resources/productPictures/34_f.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (35, 3, CAST(N'2016-01-31 00:00:00.000' AS DateTime), N'板橋車站', N'黑色潮帽', N'TRUE      ', CAST(N'2015-04-23 00:00:00.000' AS DateTime), N'面交', NULL, N'裝飾品、辦公小物', 8, 3, N'潮潮潮潮潮潮潮潮潮潮潮潮潮', N'九成新', N'下午', CAST(N'2016-01-21 15:45:47.093' AS DateTime), NULL, NULL, N'FALSE', N'/E715/resources/productPictures/35_g.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (36, 1, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'天母SOGO', N'超好喝可可粉', N'TRUE      ', CAST(N'2015-03-22 00:00:00.000' AS DateTime), N'面交', NULL, N'咖啡、麥片、奶茶', 9, 3, N'好喝，稍微比較甜，有30小包', N'九成新', N'下午', CAST(N'2016-01-21 15:51:25.827' AS DateTime), NULL, NULL, N'FALSE', N'/E715/resources/productPictures/36_h.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (37, 6, CAST(N'2016-01-31 00:00:00.000' AS DateTime), N'捷運南勢角站', N'一罐餅乾', N'TRUE      ', CAST(N'2015-12-03 00:00:00.000' AS DateTime), N'面交', NULL, N'鋁箔包飲料、罐裝飲料、啤酒', 9, 3, N'有密封好，只被我吃一片，有效日期到6月', N'九成新', N'下午', CAST(N'2016-01-21 15:54:21.583' AS DateTime), NULL, NULL, N'FALSE', N'/E715/resources/productPictures/37_i.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (38, 63, NULL, NULL, N'肉乾', N'FALSE     ', CAST(N'2015-12-01 00:00:00.000' AS DateTime), NULL, NULL, NULL, 9, 3, N'好吃肉乾!!好吃肉乾!!好吃肉乾!!', N'全新', NULL, NULL, NULL, NULL, N'FALSE', N'/E715/resources/productPictures/38_j.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (39, 26, NULL, NULL, N'名偵探柯南展覽', N'FALSE     ', CAST(N'2015-12-02 00:00:00.000' AS DateTime), NULL, NULL, NULL, 10, 3, N'名偵探迷快來', N'全新', NULL, NULL, N'GOOD', CAST(N'2016-01-23 15:11:59.423' AS DateTime), N'TRUE', N'/E715/resources/productPictures/39_kkkk.JPG')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (40, 3, CAST(N'2016-01-31 00:00:00.000' AS DateTime), N'宜蘭', N'蘭陽博物館套票', N'TRUE      ', CAST(N'2015-11-22 00:00:00.000' AS DateTime), N'面交', NULL, N'吃的、喝的', 10, 3, N'宜蘭必備行程', N'九成新', N'上午', CAST(N'2016-01-21 16:09:17.403' AS DateTime), NULL, NULL, N'FALSE', N'/E715/resources/productPictures/40_1.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (41, 4, CAST(N'2016-12-31 00:00:00.000' AS DateTime), N'九份', N'威秀影城套票', N'TRUE      ', CAST(N'2015-08-31 00:00:00.000' AS DateTime), N'面交', NULL, N'乾糧、罐裝飲料、洗碗精', 10, 3, N'2D電影都可，3D要加價', N'九成新', N'晚上', CAST(N'2016-01-21 00:00:00.000' AS DateTime), NULL, NULL, N'FALSE', N'/E715/resources/productPictures/41_1.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (42, 2, CAST(N'2016-02-03 00:00:00.000' AS DateTime), N'基隆廟口', N'台北彰化回數票2張', N'TRUE      ', CAST(N'2015-08-31 00:00:00.000' AS DateTime), N'郵寄', NULL, N'CD片、遊戲片、垃圾袋', 10, 4, N'台北彰化來回方便', N'九成新', N'晚上', CAST(N'2016-01-21 00:00:00.000' AS DateTime), NULL, NULL, N'FALSE', N'/E715/resources/productPictures/42_1.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (43, 21, CAST(N'2016-02-28 00:00:00.000' AS DateTime), N'新竹廟口', N'台北高雄國光客運', N'TRUE      ', CAST(N'2015-08-22 00:00:00.000' AS DateTime), N'面交/郵寄', NULL, N'束口袋、滑鼠、鍵盤', 10, 4, N'國光客運喔，在北車旁上車', N'九成新', N'下午', CAST(N'2016-01-21 00:00:00.000' AS DateTime), NULL, NULL, N'FALSE', N'/E715/resources/productPictures/224cee2a92e7402fa925a137d4acf90c.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (44, 9, CAST(N'2016-01-31 00:00:00.000' AS DateTime), N'桃園客運總站', N'菜瓜水', N'TRUE      ', CAST(N'2015-08-12 00:00:00.000' AS DateTime), N'郵寄', NULL, N'束口袋、滑鼠、鍵盤', 11, 4, N'保濕保濕', N'九成新', N'晚上', CAST(N'2016-01-21 00:00:00.000' AS DateTime), NULL, NULL, N'FALSE', N'/E715/resources/productPictures/p038620778953-item-7174xf1x0500x0500-m.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (45, 24, CAST(N'2016-02-28 00:00:00.000' AS DateTime), N'清大', N'化妝水', N'TRUE      ', CAST(N'2015-08-21 00:00:00.000' AS DateTime), N'面交/郵寄', NULL, N'束口袋、滑鼠、鍵盤', 11, 4, N'保濕，用過兩次', N'九成新', N'下午', CAST(N'2016-01-21 00:00:00.000' AS DateTime), NULL, NULL, N'FALSE', N'/E715/resources/productPictures/F2004800_Z.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (46, 5, CAST(N'2016-01-31 00:00:00.000' AS DateTime), N'高鐵台中站', N'乳液', N'TRUE      ', CAST(N'2015-10-01 00:00:00.000' AS DateTime), N'郵寄', NULL, N'化妝棉、食物、飲料', 11, 4, N'好用~~~', N'九成新', N'晚上', CAST(N'2016-01-21 00:00:00.000' AS DateTime), NULL, NULL, N'FALSE', N'/E715/resources/productPictures/46_1.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (47, 4, CAST(N'2016-01-31 00:00:00.000' AS DateTime), N'捷運小碧潭站', N'妙鼻貼', N'FALSE     ', CAST(N'2015-10-04 00:00:00.000' AS DateTime), N'面交', NULL, N'收斂水、球袋、衣架', 11, 4, N'還有9張', N'九成新', N'晚上', CAST(N'2016-01-21 00:00:00.000' AS DateTime), N'GOOD', CAST(N'2016-01-23 17:16:01.083' AS DateTime), N'TRUE', N'/E715/resources/productPictures/47_1.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (48, 16, CAST(N'2016-12-31 00:00:00.000' AS DateTime), N'新北投', N'厲害的眼霜', N'FALSE     ', CAST(N'2015-10-05 00:00:00.000' AS DateTime), N'郵寄', NULL, N'電影票、療育小物', 11, 4, N'黑眼圈掰', N'九成新', N'晚上', CAST(N'2016-01-21 00:00:00.000' AS DateTime), N'BAD', CAST(N'2016-01-23 17:17:57.470' AS DateTime), N'TRUE', N'/E715/resources/productPictures/1425962544-2794990325.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (49, 16, CAST(N'2016-12-31 00:00:00.000' AS DateTime), N'捷運紅樹林站', N'美麗華電影票2張', N'TRUE      ', CAST(N'2015-01-31 00:00:00.000' AS DateTime), N'面交', NULL, N'義美食品、可以泡的粉', 10, 4, N'要看電影的快來', N'九成新', N'晚上', CAST(N'2016-01-21 00:00:00.000' AS DateTime), NULL, NULL, N'FALSE', N'/E715/resources/productPictures/miramar cinemas movie saver x2pcs.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (50, 3, CAST(N'2016-02-28 00:00:00.000' AS DateTime), N'交大', N'韓國泡麵', N'TRUE      ', CAST(N'2015-01-03 00:00:00.000' AS DateTime), N'面交/郵寄', NULL, N'床墊、小椅子、巧拼', 9, 4, N'好吃好吃，但買太多><', N'九成新', N'下午', CAST(N'2016-01-21 00:00:00.000' AS DateTime), NULL, NULL, N'FALSE', N'/E715/resources/productPictures/sfsfdsfsdf.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (51, 4, CAST(N'2016-02-28 00:00:00.000' AS DateTime), N'北市教育大學', N'阿舍乾麵', N'TRUE      ', CAST(N'2015-01-31 00:00:00.000' AS DateTime), N'面交/郵寄', NULL, N'束口袋、滑鼠、鍵盤', 9, 4, N'原味', N'九成新', N'下午', CAST(N'2016-01-21 00:00:00.000' AS DateTime), NULL, NULL, N'FALSE', N'/E715/resources/productPictures/big_1358818332.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (130, 5, CAST(N'2016-02-28 00:00:00.000' AS DateTime), N'大安站', N'削鉛筆機', N'TRUE      ', CAST(N'2016-01-08 16:42:45.390' AS DateTime), N'面交', NULL, N'隨機', 5, 4, N'輕巧好用', N'全新', N'上午', CAST(N'2016-01-21 00:00:00.000' AS DateTime), NULL, NULL, N'FALSE', N'/E715/resources/productPictures/130_4bcac50a7b9af.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (132, 6, NULL, NULL, N'吹風機1支', N'FALSE     ', CAST(N'2016-01-23 17:15:26.077' AS DateTime), NULL, NULL, NULL, 7, 4, N'吹風機1支喔喔喔喔喔喔', N'使用過', NULL, NULL, NULL, NULL, N'FALSE', N'/E715/resources/productPictures/132_MN02_006_1433247343846_244240_ver1.0.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (149, 7, CAST(N'2016-02-26 00:00:00.000' AS DateTime), N'淡江大學', N'wii日版 第一次接觸', N'TRUE      ', CAST(N'2016-01-21 17:55:07.973' AS DateTime), N'面交', NULL, N'交換到其他wii的遊戲片', 3, 5, N'9成新，讀取使用一切正常', N'九成新', N'下午', CAST(N'2016-01-21 17:55:07.907' AS DateTime), NULL, NULL, N'FALSE', N'/E715/resources/productPictures/149_14c45f3a-f4c7-4175-b240-580e17378276.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (163, 8, NULL, NULL, N'SDI修正帶', N'FALSE     ', CAST(N'2016-01-23 14:48:29.913' AS DateTime), NULL, NULL, NULL, 5, 5, N'我爸爸買給我的', N'使用過', NULL, NULL, NULL, NULL, N'FALSE', N'/E715/resources/productPictures/163_114684085211_n.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (195, 91, CAST(N'2016-02-27 00:00:00.000' AS DateTime), N'淡江大學', N'五月花衛生紙', N'FALSE     ', CAST(N'2016-01-21 18:10:07.770' AS DateTime), N'面交', NULL, N'免費', 4, 5, N'不小心買太多，退宿帶不回家。', N'全新', N'下午', CAST(N'2016-01-21 18:10:07.700' AS DateTime), NULL, NULL, N'TRUE', N'/E715/resources/productPictures/195_1292226191_1.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (196, 23, CAST(N'2016-02-25 00:00:00.000' AS DateTime), N'中央大學', N'離散數學 筆記', N'TRUE      ', CAST(N'2016-01-21 17:57:57.183' AS DateTime), N'面交', NULL, N'免費', 2, 5, N'最近剛從研究所畢業，整理了一下筆記，發現放著也是浪費，不如拿出來幫助一些有需要的資工所考生們。', N'使用過', N'下午', CAST(N'2016-01-21 17:57:57.110' AS DateTime), NULL, NULL, N'FALSE', N'/E715/resources/productPictures/196_7774044f-8680-4834-980e-23480bcb0c13.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (197, 32, NULL, NULL, N'白色巨塔│侯文詠│皇冠', N'FALSE     ', CAST(N'2016-01-21 18:07:19.763' AS DateTime), NULL, NULL, NULL, 2, 5, N'書況大致良好，並不影響閱讀。', N'使用過', NULL, NULL, NULL, NULL, N'FALSE', N'/E715/resources/productPictures/197_8ced2fd8-ff96-4891-92b4-3a33b644ab98.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (222, 43, CAST(N'2016-01-31 00:00:00.000' AS DateTime), N'中央大學', N'ADIDAS 足球鞋', N'TRUE      ', CAST(N'2016-01-21 17:41:32.713' AS DateTime), N'面交', NULL, N'我需要交換一個可以心靈撫慰的故事嗚嗚', 12, 5, N'我腳受傷，退出足球隊了，大家加油～', N'九成新', N'下午', CAST(N'2016-01-21 17:41:32.640' AS DateTime), NULL, NULL, N'FALSE', N'/E715/resources/productPictures/222_29b5ea56-88ed-4691-b99b-1972810d1264.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (223, 56, CAST(N'2016-02-27 00:00:00.000' AS DateTime), N'中央大學', N'山居筆記 余秋雨', N'TRUE      ', CAST(N'2016-01-21 18:05:03.810' AS DateTime), N'面交', NULL, N'其他推薦好看的二手書籍', 2, 5, N'有髒污、書斑, 不介意才交換,謝謝!', N'破損(髒汙、書斑)', N'下午', CAST(N'2016-01-21 18:05:03.733' AS DateTime), NULL, NULL, N'FALSE', N'/E715/resources/productPictures/223_d039c18f-321c-409f-aa3a-70f22b153a2d.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (224, 21, CAST(N'2016-01-31 00:00:00.000' AS DateTime), N'中央大學', N'calculus 9th', N'TRUE      ', CAST(N'2016-01-21 17:43:33.480' AS DateTime), N'面交', NULL, N'大二資工系需要的必修課本', 2, 5, N'(Larson Edwards) ，完整但外觀有使用過痕跡', N'使用過', N'下午', CAST(N'2016-01-21 17:43:33.413' AS DateTime), NULL, NULL, N'FALSE', N'/E715/resources/productPictures/224_21442501349735_820_m.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (226, 11, CAST(N'2016-02-12 00:00:00.000' AS DateTime), N'台灣大學', N'HTC M9', N'TRUE      ', CAST(N'2016-01-21 17:05:42.197' AS DateTime), N'面交', NULL, N'隨機', 1, 5, N'外表看起來全新，因為抽到iphone所以割愛', N'九成新', N'下午', CAST(N'2016-01-21 17:05:42.023' AS DateTime), NULL, NULL, N'FALSE', N'/E715/resources/productPictures/226_1430626935-2780836262.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (227, 12, CAST(N'2016-01-22 00:00:00.000' AS DateTime), N'台北藝術大學', N'T-60 動力裝甲', N'TRUE      ', CAST(N'2016-01-21 17:01:42.910' AS DateTime), N'面交', NULL, N'徵裝置藝術合作夥伴', 8, 5, N'廢土科技，值得你擁有！', N'使用過', N'下午', CAST(N'2016-01-21 17:01:42.843' AS DateTime), NULL, NULL, N'FALSE', N'/E715/resources/productPictures/227_bd2fe22fb614115a1af07615c2e75431.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (228, 32, NULL, NULL, N'AirForce', N'FALSE     ', CAST(N'2016-01-19 10:07:06.423' AS DateTime), NULL, NULL, NULL, 12, 5, N'全新未開男用球鞋', N'全新', NULL, NULL, NULL, NULL, N'FALSE', N'/E715/resources/productPictures/228_lg488298419.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (230, NULL, NULL, NULL, N'飛利浦吹風機', N'FALSE     ', CAST(N'2016-01-23 16:31:20.057' AS DateTime), NULL, NULL, NULL, 7, 2, N'全新未使用', N'全新', NULL, NULL, NULL, NULL, N'FALSE', N'/E715/resources/productPictures/230_images (1).jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (231, NULL, NULL, NULL, N'卡斯伯款自動鉛筆', N'FALSE     ', CAST(N'2016-01-23 17:16:37.440' AS DateTime), NULL, NULL, NULL, 5, 5, N'從日本帶回', N'全新', NULL, NULL, NULL, NULL, N'FALSE', N'/E715/resources/productPictures/231__sE_5064323836.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (232, NULL, NULL, NULL, N'兒童電腦椅', N'FALSE     ', CAST(N'2016-01-23 17:10:25.117' AS DateTime), NULL, NULL, NULL, 6, 2, N'斑馬圖紋網布/抗菌/防水/防污 ', N'使用過', NULL, NULL, NULL, NULL, N'FALSE', N'/E715/resources/productPictures/232_6101.jpg')
INSERT [dbo].[product] ([id], [click_times], [deadline], [location], [name], [post_status], [post_time], [trade_way], [video], [wish_item], [category_id], [user_id], [description], [status], [transaction_time], [start_time], [grade], [grade_time], [trade_status], [primary_picture]) VALUES (233, NULL, CAST(N'2016-03-03 00:00:00.000' AS DateTime), N'大安站', N'球拍', N'FALSE     ', CAST(N'2016-01-23 17:06:42.433' AS DateTime), N'面交', NULL, N'羽毛球', 6, 2, N'商品描述', N'全新', N'下午', CAST(N'2016-01-23 17:06:42.187' AS DateTime), N'GOOD', CAST(N'2016-01-23 17:16:03.567' AS DateTime), N'TRUE', N'/E715/resources/productPictures/233_e196c0bf-d816-4465-954e-05282148e29c.jpg')
SET IDENTITY_INSERT [dbo].[product] OFF
SET IDENTITY_INSERT [dbo].[product_category] ON 

INSERT [dbo].[product_category] ([id], [name]) VALUES (1, N'3C產品')
INSERT [dbo].[product_category] ([id], [name]) VALUES (2, N'課本書籍')
INSERT [dbo].[product_category] ([id], [name]) VALUES (3, N'遊戲影音')
INSERT [dbo].[product_category] ([id], [name]) VALUES (4, N'日常用品')
INSERT [dbo].[product_category] ([id], [name]) VALUES (5, N'文具用品')
INSERT [dbo].[product_category] ([id], [name]) VALUES (6, N'傢俱')
INSERT [dbo].[product_category] ([id], [name]) VALUES (7, N'家電')
INSERT [dbo].[product_category] ([id], [name]) VALUES (8, N'服飾')
INSERT [dbo].[product_category] ([id], [name]) VALUES (9, N'食品')
INSERT [dbo].[product_category] ([id], [name]) VALUES (10, N'票券')
INSERT [dbo].[product_category] ([id], [name]) VALUES (11, N'化妝保養用品')
INSERT [dbo].[product_category] ([id], [name]) VALUES (12, N'運動用品')
INSERT [dbo].[product_category] ([id], [name]) VALUES (13, N'女生')
INSERT [dbo].[product_category] ([id], [name]) VALUES (14, N'男生')
INSERT [dbo].[product_category] ([id], [name]) VALUES (15, N'裝飾品')
INSERT [dbo].[product_category] ([id], [name]) VALUES (16, N'其他')
SET IDENTITY_INSERT [dbo].[product_category] OFF
SET IDENTITY_INSERT [dbo].[product_picture] ON 

INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (6, N'/E715/resources/userimgs/2.jpg', 2)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (7, N'/E715/resources/userimgs/3.jpg', 2)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (8, N'/E715/resources/userimgs/4.jpg', 2)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (35, N'/E715/resources/productPictures/1425962544-2794990325.jpg', 48)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (36, N'/E715/resources/productPictures/miramar cinemas movie saver x2pcs.jpg', 49)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (37, N'/E715/resources/productPictures/224cee2a92e7402fa925a137d4acf90c.jpg', 43)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (38, N'/E715/resources/productPictures/p038620778953-item-7174xf1x0500x0500-m.jpg', 44)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (39, N'/E715/resources/productPictures/asdad.jpg', 28)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (42, N'/E715/resources/productPictures/F2004800_Z.jpg', 45)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (43, N'/E715/resources/productPictures/sfsfdsfsdf.jpg', 50)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (49, N'/E715/resources/productPictures/big_1358818332.jpg', 51)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (54, N'/E715/resources/productPictures/531896_3_1.jpg', 26)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (56, N'/E715/resources/productPictures/P1130013.jpg', 20)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (57, N'/E715/resources/productPictures/5319740-1.jpg', 21)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (58, N'/E715/resources/productPictures/item_pic.jpg_400x400.jpg', 22)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (96, N'/E715/resources/productPictures/10_1.jpg', 10)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (101, N'/E715/resources/productPictures/15_014.jpg', 15)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (102, N'/E715/resources/productPictures/16_015.jpg', 16)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (103, N'/E715/resources/productPictures/17_016.jpg', 17)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (106, N'/E715/resources/productPictures/20_019.jpg', 20)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (107, N'/E715/resources/productPictures/21_20.jpg', 21)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (108, N'/E715/resources/productPictures/22_21.jpg', 22)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (111, N'/E715/resources/productPictures/25_1.jpg', 25)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (112, N'/E715/resources/productPictures/26_1.jpg', 26)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (113, N'/E715/resources/productPictures/27_1.jpg', 27)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (114, N'/E715/resources/productPictures/28_1.jpg', 28)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (118, N'/E715/resources/productPictures/31_1.jpg', 31)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (119, N'/E715/resources/productPictures/32_1.jpg', 32)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (125, N'/E715/resources/productPictures/39_1.jpg', 39)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (127, N'/E715/resources/productPictures/41_1.jpg', 41)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (128, N'/E715/resources/productPictures/42_1.jpg', 42)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (129, N'/E715/resources/productPictures/43_1.jpg', 43)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (130, N'/E715/resources/productPictures/44_1.jpg', 44)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (131, N'/E715/resources/productPictures/45_1.jpg', 45)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (132, N'/E715/resources/productPictures/46_1.jpg', 46)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (133, N'/E715/resources/productPictures/47_1.jpg', 47)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (134, N'/E715/resources/productPictures/4_2.jpg', 4)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (135, N'/E715/resources/productPictures/6_1.jpg', 6)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (136, N'/E715/resources/productPictures/7_1.jpg', 7)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (137, N'/E715/resources/productPictures/8_1.jpg', 8)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (138, N'/E715/resources/productPictures/9_1.jpg', 9)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (158, N'/E715/resources/productPictures/223_snoopy-peanut.jpg', 223)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (165, N'/E715/resources/productPictures/227_600px-Af47.jpg', 227)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (166, N'/E715/resources/productPictures/228_下載.jpg', 228)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (168, N'/E715/resources/productPictures/4_下載 (3).jpg', 4)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (169, N'/E715/resources/productPictures/4_下載.jpg', 4)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (170, N'/E715/resources/productPictures/5_MCB43704_RAT_TE_002_MB_sm.png', 5)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (171, N'/E715/resources/productPictures/5_rat-te-matte-003.jpg', 5)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (172, N'/E715/resources/productPictures/5_下載.jpg', 5)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (173, N'/E715/resources/productPictures/3_images (1).jpg', 3)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (174, N'/E715/resources/productPictures/3_images.jpg', 3)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (175, N'/E715/resources/productPictures/3_下載 (1).jpg', 3)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (177, N'/E715/resources/productPictures/7_DJAP47-A9006Q8P2000_5677c5c174d4e.gif', 7)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (179, N'/E715/resources/productPictures/8_17ebda1a-dee7-4fd8-88bc-f424dfc81169.jpg', 8)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (180, N'/E715/resources/productPictures/12_images.jpg', 12)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (181, N'/E715/resources/productPictures/12_下載.jpg', 12)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (182, N'/E715/resources/productPictures/12_68966-fifa-15-legacy-edition.jpg', 12)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (184, N'/E715/resources/productPictures/29_aaa.jpg', 29)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (187, N'/E715/resources/productPictures/30_bb.jpg', 30)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (188, N'/E715/resources/productPictures/30_b.jpg', 30)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (190, N'/E715/resources/productPictures/10_p023693323901-item-0057xf3x0750x1083-m.jpg', 10)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (191, N'/E715/resources/productPictures/11_下載.jpg', 11)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (192, N'/E715/resources/productPictures/11_14ecc838-6a63-48e5-821a-a95b724148fe.jpg', 11)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (193, N'/E715/resources/productPictures/11_6571d9c4-2f63-4827-9d70-cac042a5729d.jpg', 11)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (195, N'/E715/resources/productPictures/31_cccc', 31)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (197, N'/E715/resources/productPictures/32_ddd.jpg', 32)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (198, N'/E715/resources/productPictures/32_dddd.jpg', 32)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (200, N'/E715/resources/productPictures/33_eee.jpg', 33)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (202, N'/E715/resources/productPictures/33_ee.jpg', 33)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (204, N'/E715/resources/productPictures/33_eeee.jpg', 33)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (205, N'/E715/resources/productPictures/34_ff.jpg', 34)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (206, N'/E715/resources/productPictures/34_fff.jpg', 34)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (208, N'/E715/resources/productPictures/9_18.jpg', 9)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (209, N'/E715/resources/productPictures/9_DJAH0H-A72961513000_50ecede068873.jpg', 9)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (210, N'/E715/resources/productPictures/35_gg.jpg', 35)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (211, N'/E715/resources/productPictures/35_ggg.jpg', 35)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (212, N'/E715/resources/productPictures/35_gggg.jpg', 35)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (213, N'/E715/resources/productPictures/15_1411358855357.jpg', 15)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (214, N'/E715/resources/productPictures/36_hh.jpg', 36)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (215, N'/E715/resources/productPictures/36_hhh.jpg', 36)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (216, N'/E715/resources/productPictures/14_atk_antibacterial_liquid_00_img_l.jpg', 14)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (217, N'/E715/resources/productPictures/14_238665_700.jpg', 14)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (218, N'/E715/resources/productPictures/37_ii.jpg', 37)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (219, N'/E715/resources/productPictures/37_iii.jpg', 37)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (220, N'/E715/resources/productPictures/37_iiii.jpg', 37)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (221, N'/E715/resources/productPictures/19_2081100091066Abs2.JPG', 19)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (222, N'/E715/resources/productPictures/38_jj.jpg', 38)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (223, N'/E715/resources/productPictures/38_jjj.jpg', 38)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (224, N'/E715/resources/productPictures/38_jjjj.jpg', 38)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (225, N'/E715/resources/productPictures/19__sE_5262353839.jpg', 19)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (227, N'/E715/resources/productPictures/39_kkk.jpg', 39)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (228, N'/E715/resources/productPictures/39_k', 39)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (229, N'/E715/resources/productPictures/40_x.jpg', 40)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (230, N'/E715/resources/productPictures/40_xx.jpg', 40)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (231, N'/E715/resources/productPictures/226_1430626935-2985294603.jpg', 226)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (232, N'/E715/resources/productPictures/224_ec799c17-9b62-4fd1-bca7-cb9a2603f60f.jpg', 224)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (233, N'/E715/resources/productPictures/222_64f8135a-ecd3-4693-b71f-15300ac5c58c.jpg', 222)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (234, N'/E715/resources/productPictures/222_a2904f60-1c32-4819-8a59-5e5adb5b7796.jpg', 222)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (235, N'/E715/resources/productPictures/163_sdi3.jpg', 163)
GO
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (236, N'/E715/resources/productPictures/149_2b47796c-ab27-4d96-a778-a5b34eda5b43.jpg', 149)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (237, N'/E715/resources/productPictures/196_387e96e3-b85e-4fa4-befc-61ecf47a136e.jpg', 196)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (238, N'/E715/resources/productPictures/196_ddd30bd3-8880-430c-ad95-fa016a2eb251.jpg', 196)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (239, N'/E715/resources/productPictures/223_ed9b1f57-9e27-4282-a13a-1ee61049507a.jpg', 223)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (241, N'/E715/resources/productPictures/223_b0a11f85-1346-4719-b39b-6d63ffa9f6db.jpg', 223)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (242, N'/E715/resources/productPictures/197_f873d765-cf9a-4cbd-9fc9-f8bce6a9eab8.jpg', 197)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (243, N'/E715/resources/productPictures/195_00301.jpg', 195)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (244, N'/E715/resources/productPictures/195_6E62E45220CC4F76868DF0A828504458D9F12CD6.jpg', 195)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (246, N'/E715/resources/productPictures/18_e196c0bf-d816-4465-954e-05282148e29c.jpg', 18)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (247, N'/E715/resources/productPictures/18_201111011749423878.jpg', 18)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (248, N'/E715/resources/productPictures/23_4025945696_4594a4bb60.jpg', 23)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (249, N'/E715/resources/productPictures/24_1392108973.jpg', 24)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (256, N'/E715/resources/productPictures/29_aa.jpg', 29)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (257, N'/E715/resources/productPictures/29_aaaa.jpg', 29)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (261, N'/E715/resources/productPictures/231_23655.jpg', 231)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (264, N'/E715/resources/productPictures/230_images.jpg', 230)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (265, N'/E715/resources/productPictures/233_201111011749423878.jpg', 233)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (266, N'/E715/resources/productPictures/233_137466027306621208_374x269.jpg', 233)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (267, N'/E715/resources/productPictures/233_4025945696_4594a4bb60.jpg', 233)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (269, N'/E715/resources/productPictures/232_下載.jpg', 232)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (270, N'/E715/resources/productPictures/232_M10069013_big.jpg', 232)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (271, N'/E715/resources/productPictures/13_下載 (1).jpg', 13)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (272, N'/E715/resources/productPictures/132_images.jpg', 132)
INSERT [dbo].[product_picture] ([id], [picture], [product_id]) VALUES (274, N'/E715/resources/productPictures/231_下載.jpg', 231)
SET IDENTITY_INSERT [dbo].[product_picture] OFF
SET IDENTITY_INSERT [dbo].[question_and_answer] ON 

INSERT [dbo].[question_and_answer] ([id], [product_id], [question], [questioner_id], [answer], [question_time], [answer_time], [is_public], [edit_time]) VALUES (3, 49, N'全台都可用嗎?', 2, N'都可以哦～', CAST(N'2016-01-18 11:14:37.713' AS DateTime), CAST(N'2016-01-18 11:39:55.217' AS DateTime), N'TRUE      ', NULL)
INSERT [dbo].[question_and_answer] ([id], [product_id], [question], [questioner_id], [answer], [question_time], [answer_time], [is_public], [edit_time]) VALUES (5, 44, N'有幾瓶?', 1, NULL, CAST(N'2016-01-18 12:23:21.427' AS DateTime), NULL, N'TRUE      ', NULL)
INSERT [dbo].[question_and_answer] ([id], [product_id], [question], [questioner_id], [answer], [question_time], [answer_time], [is_public], [edit_time]) VALUES (11, 195, N'五月花好用嗎', 3, N'還不錯喔', CAST(N'2016-01-23 14:48:00.710' AS DateTime), CAST(N'2016-01-23 14:48:22.903' AS DateTime), N'TRUE      ', NULL)
INSERT [dbo].[question_and_answer] ([id], [product_id], [question], [questioner_id], [answer], [question_time], [answer_time], [is_public], [edit_time]) VALUES (12, 26, N'HI 李四
', 3, N'好久不見', CAST(N'2016-01-23 15:09:54.707' AS DateTime), CAST(N'2016-01-23 15:11:26.783' AS DateTime), N'FALSE     ', NULL)
INSERT [dbo].[question_and_answer] ([id], [product_id], [question], [questioner_id], [answer], [question_time], [answer_time], [is_public], [edit_time]) VALUES (13, 233, N'哪一個牌子?', 4, N'蝴蝶排', CAST(N'2016-01-23 17:07:31.460' AS DateTime), CAST(N'2016-01-23 17:08:12.897' AS DateTime), N'TRUE      ', NULL)
SET IDENTITY_INSERT [dbo].[question_and_answer] OFF
SET IDENTITY_INSERT [dbo].[report] ON 

INSERT [dbo].[report] ([id], [article], [is_passed], [report_time], [product_id], [reporter_id], [role], [finish_time]) VALUES (5, N'太爛', N'FALSE     ', CAST(N'2015-01-01 00:00:00.000' AS DateTime), 2, 5, NULL, CAST(N'2016-01-17 13:04:08.850' AS DateTime))
INSERT [dbo].[report] ([id], [article], [is_passed], [report_time], [product_id], [reporter_id], [role], [finish_time]) VALUES (6, N'圖文不符', NULL, CAST(N'2015-12-12 00:00:00.000' AS DateTime), 3, 5, NULL, NULL)
INSERT [dbo].[report] ([id], [article], [is_passed], [report_time], [product_id], [reporter_id], [role], [finish_time]) VALUES (7, N'太爛太爛', N'TRUE      ', CAST(N'2015-12-31 00:00:00.000' AS DateTime), 4, 5, NULL, CAST(N'2016-01-17 13:04:15.227' AS DateTime))
INSERT [dbo].[report] ([id], [article], [is_passed], [report_time], [product_id], [reporter_id], [role], [finish_time]) VALUES (9, N'圖文不符', N'FALSE     ', CAST(N'2016-01-17 16:06:41.807' AS DateTime), 39, 1, NULL, CAST(N'2016-01-17 16:13:55.250' AS DateTime))
INSERT [dbo].[report] ([id], [article], [is_passed], [report_time], [product_id], [reporter_id], [role], [finish_time]) VALUES (10, N'敘述不實', NULL, CAST(N'2016-01-17 16:10:13.263' AS DateTime), 39, 1, NULL, NULL)
INSERT [dbo].[report] ([id], [article], [is_passed], [report_time], [product_id], [reporter_id], [role], [finish_time]) VALUES (11, N'這是假的', N'FALSE     ', CAST(N'2016-01-17 16:12:13.117' AS DateTime), 39, 1, NULL, CAST(N'2016-01-23 15:12:41.363' AS DateTime))
INSERT [dbo].[report] ([id], [article], [is_passed], [report_time], [product_id], [reporter_id], [role], [finish_time]) VALUES (12, N'對方口出惡言', NULL, CAST(N'2016-01-17 16:21:57.087' AS DateTime), 49, 2, NULL, NULL)
INSERT [dbo].[report] ([id], [article], [is_passed], [report_time], [product_id], [reporter_id], [role], [finish_time]) VALUES (13, N'aaaaaaa', N'FALSE     ', CAST(N'2016-01-18 09:43:05.453' AS DateTime), 39, 1, NULL, CAST(N'2016-01-18 09:43:54.190' AS DateTime))
INSERT [dbo].[report] ([id], [article], [is_passed], [report_time], [product_id], [reporter_id], [role], [finish_time]) VALUES (14, N'圖太騙', N'TRUE      ', CAST(N'2016-01-18 17:20:18.640' AS DateTime), 5, 2, NULL, CAST(N'2016-01-18 17:31:14.587' AS DateTime))
INSERT [dbo].[report] ([id], [article], [is_passed], [report_time], [product_id], [reporter_id], [role], [finish_time]) VALUES (15, N'嗚嗚嗚', NULL, CAST(N'2016-01-23 15:10:14.193' AS DateTime), 26, 3, NULL, NULL)
INSERT [dbo].[report] ([id], [article], [is_passed], [report_time], [product_id], [reporter_id], [role], [finish_time]) VALUES (16, N'產品不實', NULL, CAST(N'2016-01-23 15:10:32.933' AS DateTime), 38, 2, NULL, NULL)
INSERT [dbo].[report] ([id], [article], [is_passed], [report_time], [product_id], [reporter_id], [role], [finish_time]) VALUES (17, N'擁有者回文態度不佳', NULL, CAST(N'2016-01-23 16:24:35.253' AS DateTime), 48, 2, NULL, NULL)
INSERT [dbo].[report] ([id], [article], [is_passed], [report_time], [product_id], [reporter_id], [role], [finish_time]) VALUES (18, N'過期了', N'TRUE      ', CAST(N'2016-01-23 17:56:26.653' AS DateTime), 38, 1, NULL, CAST(N'2016-01-23 17:56:58.147' AS DateTime))
SET IDENTITY_INSERT [dbo].[report] OFF
SET IDENTITY_INSERT [dbo].[sec_role] ON 

INSERT [dbo].[sec_role] ([id], [created_by], [created_date], [modified_by], [modified_date], [code], [name]) VALUES (2, NULL, NULL, NULL, NULL, N'2', N'2')
INSERT [dbo].[sec_role] ([id], [created_by], [created_date], [modified_by], [modified_date], [code], [name]) VALUES (3, NULL, NULL, NULL, NULL, N'3', N'wrwr')
INSERT [dbo].[sec_role] ([id], [created_by], [created_date], [modified_by], [modified_date], [code], [name]) VALUES (4, NULL, NULL, NULL, NULL, N'1', N'1')
INSERT [dbo].[sec_role] ([id], [created_by], [created_date], [modified_by], [modified_date], [code], [name]) VALUES (5, NULL, NULL, NULL, NULL, N'2', N'2')
INSERT [dbo].[sec_role] ([id], [created_by], [created_date], [modified_by], [modified_date], [code], [name]) VALUES (6, NULL, NULL, NULL, NULL, N'3', N'3')
INSERT [dbo].[sec_role] ([id], [created_by], [created_date], [modified_by], [modified_date], [code], [name]) VALUES (7, NULL, NULL, NULL, NULL, N'4', N'4')
INSERT [dbo].[sec_role] ([id], [created_by], [created_date], [modified_by], [modified_date], [code], [name]) VALUES (8, NULL, NULL, NULL, NULL, N'5', N'5')
INSERT [dbo].[sec_role] ([id], [created_by], [created_date], [modified_by], [modified_date], [code], [name]) VALUES (9, NULL, NULL, NULL, NULL, N'6', N'6')
INSERT [dbo].[sec_role] ([id], [created_by], [created_date], [modified_by], [modified_date], [code], [name]) VALUES (10, NULL, NULL, NULL, NULL, N'7', N'7')
INSERT [dbo].[sec_role] ([id], [created_by], [created_date], [modified_by], [modified_date], [code], [name]) VALUES (11, NULL, NULL, NULL, NULL, N'8', N'8')
SET IDENTITY_INSERT [dbo].[sec_role] OFF
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([id], [password], [name], [nickname], [account], [age], [sex], [birthday], [address], [phone], [cellphone], [email], [picture], [school_email], [focus_item_list], [ecoin], [online_datetime], [school_name], [email_check], [isolated], [role], [subject], [about_me], [verification_code]) VALUES (1, N'aaa', N'張三', N'小三', N'changthree', 32, N'MALE      ', CAST(N'2012-01-03 00:00:00.000' AS DateTime), N'台北市信義區', N'02-2311-1111', N'0965-774-891', N'111@hotmail.com', N'/E715/resources/userimgs/1_4_wallpaper.jpg', N'e715number01@gmail.com', NULL, 51, 1, N'台灣大學', N'TRUE      ', N'FALSE     ', N'ADMIN', N'生命科學系', N'今天是2016/1/23
', 1367)
INSERT [dbo].[user] ([id], [password], [name], [nickname], [account], [age], [sex], [birthday], [address], [phone], [cellphone], [email], [picture], [school_email], [focus_item_list], [ecoin], [online_datetime], [school_name], [email_check], [isolated], [role], [subject], [about_me], [verification_code]) VALUES (2, N'bbb', N'李四', N'小四子', N'leefour', 24, N'MALE      ', CAST(N'2000-03-04 00:00:00.000' AS DateTime), N'台北市大安區', N'02-2451-3212', N'0912-345-678', N'222@hotmail.com', N'/E715/resources/userimgs/2_leefour.jpg', N'497136548@@s97.tku.edu.tw', NULL, 35000, 2, N'中華大學', N'TRUE      ', N'FALSE     ', N'USER', N'大氣科學學系', N'各位好~初次使用請多指教', NULL)
INSERT [dbo].[user] ([id], [password], [name], [nickname], [account], [age], [sex], [birthday], [address], [phone], [cellphone], [email], [picture], [school_email], [focus_item_list], [ecoin], [online_datetime], [school_name], [email_check], [isolated], [role], [subject], [about_me], [verification_code]) VALUES (3, N'ccc', N'王五', N'小五', N'wangfive', 50, N'MALE      ', CAST(N'2013-11-30 00:00:00.000' AS DateTime), N'台北市松山區', N'02-8654-6631', N'0933-652-321', N'333@hotmail.com', N'/E715/resources/userimgs/3_wangfive.jpg', N'497236510@@s97.tku.edu.tw', NULL, 3000, 3, N'政治大學', N'TRUE      ', N'FALSE     ', N'USER', N'生命科學系', N'', NULL)
INSERT [dbo].[user] ([id], [password], [name], [nickname], [account], [age], [sex], [birthday], [address], [phone], [cellphone], [email], [picture], [school_email], [focus_item_list], [ecoin], [online_datetime], [school_name], [email_check], [isolated], [role], [subject], [about_me], [verification_code]) VALUES (4, N'ddd', N'老六', N'老六', N'laosix', 28, N'MALE      ', CAST(N'2015-12-04 00:00:00.000' AS DateTime), N'台北市大安區', N'02-3321-5151', N'0911-111-111', N'444@hotmail.com', N'/E715/resources/userimgs/4_laosix.jpg', N'497136237@@s97.tku.edu.tw', NULL, 320, 4, N'清華大學', N'TRUE      ', N'FALSE     ', N'USER', N'', N'', NULL)
INSERT [dbo].[user] ([id], [password], [name], [nickname], [account], [age], [sex], [birthday], [address], [phone], [cellphone], [email], [picture], [school_email], [focus_item_list], [ecoin], [online_datetime], [school_name], [email_check], [isolated], [role], [subject], [about_me], [verification_code]) VALUES (5, N'eee', N'黃七', N'小曾', N'fantsen', 30, N'MALE      ', CAST(N'2012-11-30 00:00:00.000' AS DateTime), N'台北市南港區', N'02-1111-5182', N'0933-771-824', N'555@hotmail.com', N'/E715/resources/userimgs/5_s2_53ff336bdb537.jpg', N'497136277@@s97.tku.edu.tw', NULL, 2000, 5, N'交通大學', N'TRUE      ', N'FALSE     ', N'USER', N'天然', N'', NULL)
INSERT [dbo].[user] ([id], [password], [name], [nickname], [account], [age], [sex], [birthday], [address], [phone], [cellphone], [email], [picture], [school_email], [focus_item_list], [ecoin], [online_datetime], [school_name], [email_check], [isolated], [role], [subject], [about_me], [verification_code]) VALUES (6, N'fff', N'天天', N'小天', N'tiantian', 28, N'MALE      ', CAST(N'2015-12-05 22:32:14.770' AS DateTime), N'台北市大安區', N'02-3210-3310', N'0911-111-111', N'666@hotmail.com', N'/E715/resources/userimgs/1_2_wallpaper.jpg', N'497184747@@s97.tku.edu.tw', NULL, 30000, 6, N'信義大學', N'TRUE      ', N'FALSE     ', N'USER', NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [password], [name], [nickname], [account], [age], [sex], [birthday], [address], [phone], [cellphone], [email], [picture], [school_email], [focus_item_list], [ecoin], [online_datetime], [school_name], [email_check], [isolated], [role], [subject], [about_me], [verification_code]) VALUES (8, N'ggg', N'趙高', N'太', N'chaogao', 28, N'MALE      ', CAST(N'2015-12-13 15:12:59.920' AS DateTime), N'台北市大安區', N'02-5698-7742', N'0911-111-111', N'888@hotmail.com', N'/E715/resources/userimgs/2.jpg', N'497136874@@s97.tku.edu.tw', NULL, 30000, 8, N'中央大學', N'TRUE      ', N'FALSE     ', N'USER', NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [password], [name], [nickname], [account], [age], [sex], [birthday], [address], [phone], [cellphone], [email], [picture], [school_email], [focus_item_list], [ecoin], [online_datetime], [school_name], [email_check], [isolated], [role], [subject], [about_me], [verification_code]) VALUES (9, N'era', N'yoming', NULL, N'ar', 28, N'MALE      ', CAST(N'2016-01-05 10:33:44.560' AS DateTime), N'台北市大安區', N'03-4217-3158', N'0911-111-111', N'999@hotmail.com', N'/E715/resources/userimgs/2.jpg', N'497136968@@s97.tku.edu.tw', NULL, 30000, 9, N'中央大學', N'TRUE      ', N'FALSE     ', N'USER', NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [password], [name], [nickname], [account], [age], [sex], [birthday], [address], [phone], [cellphone], [email], [picture], [school_email], [focus_item_list], [ecoin], [online_datetime], [school_name], [email_check], [isolated], [role], [subject], [about_me], [verification_code]) VALUES (10, N'password', N'yoming2', N'yo', N'a', 28, N'MALE      ', CAST(N'2016-01-05 10:49:15.883' AS DateTime), N'台北市大安區', N'02-2224-3158', N'0911-111-111', N'aaa@hotmail.com', N'/E715/resources/userimgs/2.jpg', N'497256547@@s97.tku.edu.tw', NULL, 30000, 10, N'中央大學', N'TRUE      ', N'FALSE     ', N'USER', NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [password], [name], [nickname], [account], [age], [sex], [birthday], [address], [phone], [cellphone], [email], [picture], [school_email], [focus_item_list], [ecoin], [online_datetime], [school_name], [email_check], [isolated], [role], [subject], [about_me], [verification_code]) VALUES (11, N'test', N'人人人', N'神神神', N'test', NULL, N'MALE      ', CAST(N'2000-03-01 00:00:00.000' AS DateTime), N'fas', N'2342424', NULL, N'rwrqr', N'/E715/resources/userimgs/11_1_p.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'dfsad', N'　fdsf', NULL)
INSERT [dbo].[user] ([id], [password], [name], [nickname], [account], [age], [sex], [birthday], [address], [phone], [cellphone], [email], [picture], [school_email], [focus_item_list], [ecoin], [online_datetime], [school_name], [email_check], [isolated], [role], [subject], [about_me], [verification_code]) VALUES (12, N'test', N'Nancy', N'daf', N'fea', NULL, N'MALE      ', CAST(N'1998-10-01 00:00:00.000' AS DateTime), NULL, N'fdaf', NULL, N'sdfa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [password], [name], [nickname], [account], [age], [sex], [birthday], [address], [phone], [cellphone], [email], [picture], [school_email], [focus_item_list], [ecoin], [online_datetime], [school_name], [email_check], [isolated], [role], [subject], [about_me], [verification_code]) VALUES (13, N'test', N'Nancy', N'daf', N'teadst', NULL, N'MALE      ', CAST(N'2000-02-01 00:00:00.000' AS DateTime), NULL, N'fdaf', NULL, N'sdfa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [password], [name], [nickname], [account], [age], [sex], [birthday], [address], [phone], [cellphone], [email], [picture], [school_email], [focus_item_list], [ecoin], [online_datetime], [school_name], [email_check], [isolated], [role], [subject], [about_me], [verification_code]) VALUES (14, N'test', N'dfa', N'dsf', N'testrew', NULL, N'MALE      ', CAST(N'1998-03-01 00:00:00.000' AS DateTime), NULL, N'dsf', NULL, N'sdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [password], [name], [nickname], [account], [age], [sex], [birthday], [address], [phone], [cellphone], [email], [picture], [school_email], [focus_item_list], [ecoin], [online_datetime], [school_name], [email_check], [isolated], [role], [subject], [about_me], [verification_code]) VALUES (15, N'test', N'fsad', N'dsf', N'ghasrga', NULL, N'MALE      ', CAST(N'2006-09-01 00:00:00.000' AS DateTime), NULL, N'dsfa', NULL, N'sfadf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [password], [name], [nickname], [account], [age], [sex], [birthday], [address], [phone], [cellphone], [email], [picture], [school_email], [focus_item_list], [ecoin], [online_datetime], [school_name], [email_check], [isolated], [role], [subject], [about_me], [verification_code]) VALUES (16, N'era', N'11111', N'dsf', N'ghasrgarerer', NULL, N'MALE      ', CAST(N'1998-01-01 00:00:00.000' AS DateTime), NULL, N'dsfa', NULL, N'sfadf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [password], [name], [nickname], [account], [age], [sex], [birthday], [address], [phone], [cellphone], [email], [picture], [school_email], [focus_item_list], [ecoin], [online_datetime], [school_name], [email_check], [isolated], [role], [subject], [about_me], [verification_code]) VALUES (17, N'test', N'fdsf', N'sdaf', N'testsfsdafds', NULL, N'MALE      ', CAST(N'1998-02-01 00:00:00.000' AS DateTime), NULL, N'sdafdsa', NULL, N'dfsaf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [password], [name], [nickname], [account], [age], [sex], [birthday], [address], [phone], [cellphone], [email], [picture], [school_email], [focus_item_list], [ecoin], [online_datetime], [school_name], [email_check], [isolated], [role], [subject], [about_me], [verification_code]) VALUES (18, N'222', N'234', N'123', N'b', NULL, N'MALE      ', NULL, NULL, N'123', NULL, N'123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [password], [name], [nickname], [account], [age], [sex], [birthday], [address], [phone], [cellphone], [email], [picture], [school_email], [focus_item_list], [ecoin], [online_datetime], [school_name], [email_check], [isolated], [role], [subject], [about_me], [verification_code]) VALUES (19, N'shuang', N'shuang', N'shuang', N'shuang', NULL, N'FEMALE    ', CAST(N'1992-11-14 00:00:00.000' AS DateTime), NULL, N'0987654321', NULL, N'aa@bbb', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [password], [name], [nickname], [account], [age], [sex], [birthday], [address], [phone], [cellphone], [email], [picture], [school_email], [focus_item_list], [ecoin], [online_datetime], [school_name], [email_check], [isolated], [role], [subject], [about_me], [verification_code]) VALUES (20, N'123456', N'55', N'', N'525566', NULL, N'MALE      ', NULL, NULL, N'', NULL, N'elisyaoyj@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [password], [name], [nickname], [account], [age], [sex], [birthday], [address], [phone], [cellphone], [email], [picture], [school_email], [focus_item_list], [ecoin], [online_datetime], [school_name], [email_check], [isolated], [role], [subject], [about_me], [verification_code]) VALUES (21, N'527788', N'527788', N'527788', N'527788', NULL, N'MALE      ', CAST(N'1932-10-28 00:00:00.000' AS DateTime), N'台北市衡陽路100號', N'0912345678', NULL, N'elisyaoyj@gmail.com', N'/E715/resources/userimgs/21_下載.jpg', NULL, NULL, NULL, NULL, NULL, NULL, N'TRUE      ', NULL, N'數學系', N'我愛7788 556674', NULL)
INSERT [dbo].[user] ([id], [password], [name], [nickname], [account], [age], [sex], [birthday], [address], [phone], [cellphone], [email], [picture], [school_email], [focus_item_list], [ecoin], [online_datetime], [school_name], [email_check], [isolated], [role], [subject], [about_me], [verification_code]) VALUES (22, N'snoopy', N'snoopy', N'麵線', N'snoopy', NULL, N'MALE      ', CAST(N'1932-03-04 00:00:00.000' AS DateTime), N'瑞芳', N'0912345678', NULL, N'elisyaoyj@gmail.com', N'/E715/resources/userimgs/22_sl_52.jpg', NULL, NULL, NULL, NULL, NULL, NULL, N'TRUE      ', NULL, N'淡江大學數學系', N'我愛吃麵線是有原因的', NULL)
INSERT [dbo].[user] ([id], [password], [name], [nickname], [account], [age], [sex], [birthday], [address], [phone], [cellphone], [email], [picture], [school_email], [focus_item_list], [ecoin], [online_datetime], [school_name], [email_check], [isolated], [role], [subject], [about_me], [verification_code]) VALUES (23, N'test', N'fdadsf', N'dsafsf', N'testsdfa', NULL, N'MALE      ', CAST(N'2000-01-01 00:00:00.000' AS DateTime), NULL, N'3424314', NULL, N'dsfa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [password], [name], [nickname], [account], [age], [sex], [birthday], [address], [phone], [cellphone], [email], [picture], [school_email], [focus_item_list], [ecoin], [online_datetime], [school_name], [email_check], [isolated], [role], [subject], [about_me], [verification_code]) VALUES (25, N'as', N'rqwr', N'wrq', N'test2343ss', NULL, N'MALE      ', CAST(N'2000-01-01 00:00:00.000' AS DateTime), NULL, N'werwq', NULL, N'erqewr', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'TRUE      ', NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [password], [name], [nickname], [account], [age], [sex], [birthday], [address], [phone], [cellphone], [email], [picture], [school_email], [focus_item_list], [ecoin], [online_datetime], [school_name], [email_check], [isolated], [role], [subject], [about_me], [verification_code]) VALUES (31, N'yao123456', N'yao', N'yao', N'yao', NULL, N'FEMALE    ', CAST(N'2000-01-01 00:00:00.000' AS DateTime), NULL, N'0912345678', NULL, N'eliasyaoyj@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [password], [name], [nickname], [account], [age], [sex], [birthday], [address], [phone], [cellphone], [email], [picture], [school_email], [focus_item_list], [ecoin], [online_datetime], [school_name], [email_check], [isolated], [role], [subject], [about_me], [verification_code]) VALUES (35, N'azsxdc01', N'古河渚', N'小渚', N'FurukawaNagisa', NULL, N'MALE      ', CAST(N'1987-10-01 00:00:00.000' AS DateTime), N'台北市大安區', NULL, N'0933256514', N'slaverbread@yahoo.com.tw', N'/E715/resources/userimgs/35_3_s2_53ff336bdb537.jpg', N's110013064@stu.ntue.edu.tw', NULL, NULL, NULL, NULL, NULL, N'FALSE     ', NULL, N'生命科學系', N'TEST
<script>alert("hahahahahahaha");</script>', 9977)
INSERT [dbo].[user] ([id], [password], [name], [nickname], [account], [age], [sex], [birthday], [address], [phone], [cellphone], [email], [picture], [school_email], [focus_item_list], [ecoin], [online_datetime], [school_name], [email_check], [isolated], [role], [subject], [about_me], [verification_code]) VALUES (36, N'super', N'管理員初號機', N'管理員初號機', N'supperadmin', 100, N'OTHER     ', CAST(N'1991-11-11 00:00:00.000' AS DateTime), N'台北市大安區', N'02-2500321654', N'0987654321', N'super@gmail.com', NULL, N'123@edu.tw', NULL, NULL, NULL, NULL, NULL, N'FALSE     ', N'ADMIN', NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [password], [name], [nickname], [account], [age], [sex], [birthday], [address], [phone], [cellphone], [email], [picture], [school_email], [focus_item_list], [ecoin], [online_datetime], [school_name], [email_check], [isolated], [role], [subject], [about_me], [verification_code]) VALUES (38, N'hellokitty12', N'hellokitty1', N'hellokitty1', N'hellokitty1', NULL, N'FEMALE    ', CAST(N'1980-08-15 00:00:00.000' AS DateTime), N'', NULL, N'0912345678', N'elisyaoyj@gmail.com', N'/E715/resources/userimgs/38_s2_53ff336bdb537.jpg', N'slaverbread@gmail.com', NULL, NULL, NULL, NULL, NULL, N'FALSE     ', NULL, N'', N'', 2954)
INSERT [dbo].[user] ([id], [password], [name], [nickname], [account], [age], [sex], [birthday], [address], [phone], [cellphone], [email], [picture], [school_email], [focus_item_list], [ecoin], [online_datetime], [school_name], [email_check], [isolated], [role], [subject], [about_me], [verification_code]) VALUES (39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'asd312315@ntu.edu.tw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1574)
INSERT [dbo].[user] ([id], [password], [name], [nickname], [account], [age], [sex], [birthday], [address], [phone], [cellphone], [email], [picture], [school_email], [focus_item_list], [ecoin], [online_datetime], [school_name], [email_check], [isolated], [role], [subject], [about_me], [verification_code]) VALUES (40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N's1011027@stu.ntue.edu.tw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7113)
SET IDENTITY_INSERT [dbo].[user] OFF
SET IDENTITY_INSERT [dbo].[user_ban_list] ON 

INSERT [dbo].[user_ban_list] ([id], [user_a_id], [user_b_id]) VALUES (29, 1, 2)
INSERT [dbo].[user_ban_list] ([id], [user_a_id], [user_b_id]) VALUES (30, 1, 3)
INSERT [dbo].[user_ban_list] ([id], [user_a_id], [user_b_id]) VALUES (31, 1, 5)
SET IDENTITY_INSERT [dbo].[user_ban_list] OFF
SET IDENTITY_INSERT [dbo].[user_like] ON 

INSERT [dbo].[user_like] ([id], [product_category_id], [user_id]) VALUES (5, 1, 2)
INSERT [dbo].[user_like] ([id], [product_category_id], [user_id]) VALUES (6, 3, 2)
INSERT [dbo].[user_like] ([id], [product_category_id], [user_id]) VALUES (7, 4, 2)
INSERT [dbo].[user_like] ([id], [product_category_id], [user_id]) VALUES (8, 1, 3)
INSERT [dbo].[user_like] ([id], [product_category_id], [user_id]) VALUES (9, 2, 3)
INSERT [dbo].[user_like] ([id], [product_category_id], [user_id]) VALUES (10, 4, 3)
INSERT [dbo].[user_like] ([id], [product_category_id], [user_id]) VALUES (11, 2, 4)
INSERT [dbo].[user_like] ([id], [product_category_id], [user_id]) VALUES (12, 3, 4)
INSERT [dbo].[user_like] ([id], [product_category_id], [user_id]) VALUES (13, 5, 5)
INSERT [dbo].[user_like] ([id], [product_category_id], [user_id]) VALUES (23, 7, 1)
INSERT [dbo].[user_like] ([id], [product_category_id], [user_id]) VALUES (25, 1, 11)
SET IDENTITY_INSERT [dbo].[user_like] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_opn34hbe2gvffvr6t3p5pu5vc]    Script Date: 2016/1/24 上午 10:57:09 ******/
ALTER TABLE [dbo].[sysdiagrams] ADD  CONSTRAINT [UK_opn34hbe2gvffvr6t3p5pu5vc] UNIQUE NONCLUSTERED 
(
	[principal_id] ASC,
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[board]  WITH CHECK ADD  CONSTRAINT [FK__boards__category__173876EA] FOREIGN KEY([category_id])
REFERENCES [dbo].[board_categoria] ([id])
GO
ALTER TABLE [dbo].[board] CHECK CONSTRAINT [FK__boards__category__173876EA]
GO
ALTER TABLE [dbo].[broadcast]  WITH CHECK ADD  CONSTRAINT [FK_fgqoi9qr93tidoulrn8ckgdvy] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[broadcast] CHECK CONSTRAINT [FK_fgqoi9qr93tidoulrn8ckgdvy]
GO
ALTER TABLE [dbo].[chat]  WITH CHECK ADD  CONSTRAINT [FK_r74vhb7mllkvsanthmu8cfbmh] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[chat] CHECK CONSTRAINT [FK_r74vhb7mllkvsanthmu8cfbmh]
GO
ALTER TABLE [dbo].[exchange]  WITH CHECK ADD FOREIGN KEY([producta_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[exchange]  WITH CHECK ADD FOREIGN KEY([productb_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[exchange]  WITH CHECK ADD FOREIGN KEY([producta_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[exchange]  WITH CHECK ADD FOREIGN KEY([productb_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[exchange]  WITH CHECK ADD FOREIGN KEY([producta_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[exchange]  WITH CHECK ADD FOREIGN KEY([productb_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[focus_user_list]  WITH CHECK ADD  CONSTRAINT [FK_6qv5dw13pg4vro57yrevlaua8] FOREIGN KEY([user_b_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[focus_user_list] CHECK CONSTRAINT [FK_6qv5dw13pg4vro57yrevlaua8]
GO
ALTER TABLE [dbo].[focus_user_list]  WITH CHECK ADD  CONSTRAINT [FK_caqecoy116tapn6xplrfq51ry] FOREIGN KEY([user_a_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[focus_user_list] CHECK CONSTRAINT [FK_caqecoy116tapn6xplrfq51ry]
GO
ALTER TABLE [dbo].[forum_picture]  WITH CHECK ADD  CONSTRAINT [FK_171r1s2w19hiu21njc8xgl3qi] FOREIGN KEY([thread_id])
REFERENCES [dbo].[thread] ([id])
GO
ALTER TABLE [dbo].[forum_picture] CHECK CONSTRAINT [FK_171r1s2w19hiu21njc8xgl3qi]
GO
ALTER TABLE [dbo].[forum_picture]  WITH CHECK ADD  CONSTRAINT [FK_6b0r6vo73x8fh1bmp33iu6m2f] FOREIGN KEY([reply_id])
REFERENCES [dbo].[reply] ([id])
GO
ALTER TABLE [dbo].[forum_picture] CHECK CONSTRAINT [FK_6b0r6vo73x8fh1bmp33iu6m2f]
GO
ALTER TABLE [dbo].[log_mail]  WITH CHECK ADD FOREIGN KEY([receiver_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[log_mail]  WITH CHECK ADD FOREIGN KEY([receiver_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[log_mail]  WITH CHECK ADD FOREIGN KEY([receiver_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[log_mail]  WITH CHECK ADD FOREIGN KEY([sender_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[log_mail]  WITH CHECK ADD FOREIGN KEY([sender_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[log_mail]  WITH CHECK ADD FOREIGN KEY([sender_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[mail]  WITH CHECK ADD FOREIGN KEY([receiver_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[mail]  WITH CHECK ADD FOREIGN KEY([receiver_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[mail]  WITH CHECK ADD FOREIGN KEY([receiver_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[mail]  WITH CHECK ADD FOREIGN KEY([sender_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[mail]  WITH CHECK ADD FOREIGN KEY([sender_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[mail]  WITH CHECK ADD FOREIGN KEY([sender_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[messages]  WITH CHECK ADD  CONSTRAINT [FK_2tgrsfo79pwvrwk6lbdy32701] FOREIGN KEY([sender_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[messages] CHECK CONSTRAINT [FK_2tgrsfo79pwvrwk6lbdy32701]
GO
ALTER TABLE [dbo].[messages]  WITH CHECK ADD  CONSTRAINT [FK_n6etueqjx4sscap8ji01eq224] FOREIGN KEY([receiver_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[messages] CHECK CONSTRAINT [FK_n6etueqjx4sscap8ji01eq224]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_miislg5rujgruv45l3hv00cn2] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_miislg5rujgruv45l3hv00cn2]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_rlaghtegr0yx2c1q1s6nkqjlh] FOREIGN KEY([category_id])
REFERENCES [dbo].[product_category] ([id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_rlaghtegr0yx2c1q1s6nkqjlh]
GO
ALTER TABLE [dbo].[product_picture]  WITH CHECK ADD  CONSTRAINT [FK_11i5d1m4v5p54k12cvla6ckei] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[product_picture] CHECK CONSTRAINT [FK_11i5d1m4v5p54k12cvla6ckei]
GO
ALTER TABLE [dbo].[question_and_answer]  WITH CHECK ADD  CONSTRAINT [FK__question___produ__3FDB6521] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[question_and_answer] CHECK CONSTRAINT [FK__question___produ__3FDB6521]
GO
ALTER TABLE [dbo].[question_and_answer]  WITH CHECK ADD  CONSTRAINT [FK__question___quest__40CF895A] FOREIGN KEY([questioner_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[question_and_answer] CHECK CONSTRAINT [FK__question___quest__40CF895A]
GO
ALTER TABLE [dbo].[reply]  WITH CHECK ADD  CONSTRAINT [FK_8ryub6a0ixwisqgwt4ltg7yjw] FOREIGN KEY([thread_id])
REFERENCES [dbo].[thread] ([id])
GO
ALTER TABLE [dbo].[reply] CHECK CONSTRAINT [FK_8ryub6a0ixwisqgwt4ltg7yjw]
GO
ALTER TABLE [dbo].[report]  WITH CHECK ADD  CONSTRAINT [FK_oxy74m7bhlikdpajhcxrcesco] FOREIGN KEY([reporter_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[report] CHECK CONSTRAINT [FK_oxy74m7bhlikdpajhcxrcesco]
GO
ALTER TABLE [dbo].[report]  WITH CHECK ADD  CONSTRAINT [FK_sob5owl48n3ayqtkubosgp369] FOREIGN KEY([role])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[report] CHECK CONSTRAINT [FK_sob5owl48n3ayqtkubosgp369]
GO
ALTER TABLE [dbo].[report]  WITH CHECK ADD  CONSTRAINT [FK_svob72mbt1nvvu6dn9tpr329e] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[report] CHECK CONSTRAINT [FK_svob72mbt1nvvu6dn9tpr329e]
GO
ALTER TABLE [dbo].[sec_user_role_map]  WITH CHECK ADD  CONSTRAINT [FK_ays3ryb4naxm1fev0pe1r07ic] FOREIGN KEY([role_id])
REFERENCES [dbo].[sec_role] ([id])
GO
ALTER TABLE [dbo].[sec_user_role_map] CHECK CONSTRAINT [FK_ays3ryb4naxm1fev0pe1r07ic]
GO
ALTER TABLE [dbo].[sec_user_role_map]  WITH CHECK ADD  CONSTRAINT [FK_hrgb4vivar31p9749jvbkjfa9] FOREIGN KEY([user_id])
REFERENCES [dbo].[sec_user] ([id])
GO
ALTER TABLE [dbo].[sec_user_role_map] CHECK CONSTRAINT [FK_hrgb4vivar31p9749jvbkjfa9]
GO
ALTER TABLE [dbo].[thread]  WITH CHECK ADD  CONSTRAINT [FK_979cq0kryuidamlp1c7v1tn09] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[thread] CHECK CONSTRAINT [FK_979cq0kryuidamlp1c7v1tn09]
GO
ALTER TABLE [dbo].[thread]  WITH CHECK ADD  CONSTRAINT [FK_bhvw9g6ku2iw742tsfv3nohn3] FOREIGN KEY([board_id])
REFERENCES [dbo].[board] ([id])
GO
ALTER TABLE [dbo].[thread] CHECK CONSTRAINT [FK_bhvw9g6ku2iw742tsfv3nohn3]
GO
ALTER TABLE [dbo].[thread_tag]  WITH CHECK ADD  CONSTRAINT [FK_5wcjuqcofqvxq2fkrmkmjflse] FOREIGN KEY([tag_id])
REFERENCES [dbo].[tag] ([id])
GO
ALTER TABLE [dbo].[thread_tag] CHECK CONSTRAINT [FK_5wcjuqcofqvxq2fkrmkmjflse]
GO
ALTER TABLE [dbo].[thread_tag]  WITH CHECK ADD  CONSTRAINT [FK_90mrc1y6wk8l6y8ecsd6khdll] FOREIGN KEY([thread_id])
REFERENCES [dbo].[thread] ([id])
GO
ALTER TABLE [dbo].[thread_tag] CHECK CONSTRAINT [FK_90mrc1y6wk8l6y8ecsd6khdll]
GO
ALTER TABLE [dbo].[user_ban_list]  WITH CHECK ADD  CONSTRAINT [FK_gg4w6ic4gyh2neocovy7lh4yq] FOREIGN KEY([user_b_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[user_ban_list] CHECK CONSTRAINT [FK_gg4w6ic4gyh2neocovy7lh4yq]
GO
ALTER TABLE [dbo].[user_ban_list]  WITH CHECK ADD  CONSTRAINT [FK_j4nhaddv3qevbcjx7bixsmqar] FOREIGN KEY([user_a_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[user_ban_list] CHECK CONSTRAINT [FK_j4nhaddv3qevbcjx7bixsmqar]
GO
ALTER TABLE [dbo].[user_like]  WITH CHECK ADD  CONSTRAINT [FK_47ce5pjw3740rd9nlyfok7y3y] FOREIGN KEY([product_category_id])
REFERENCES [dbo].[product_category] ([id])
GO
ALTER TABLE [dbo].[user_like] CHECK CONSTRAINT [FK_47ce5pjw3740rd9nlyfok7y3y]
GO
ALTER TABLE [dbo].[user_like]  WITH CHECK ADD  CONSTRAINT [FK_aogee3ui5aqrce7ae6jop2552] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[user_like] CHECK CONSTRAINT [FK_aogee3ui5aqrce7ae6jop2552]
GO
ALTER TABLE [dbo].[user_owner]  WITH CHECK ADD  CONSTRAINT [FK_4pa2cpu5h5fkcni5mdl416p05] FOREIGN KEY([board_id])
REFERENCES [dbo].[board] ([id])
GO
ALTER TABLE [dbo].[user_owner] CHECK CONSTRAINT [FK_4pa2cpu5h5fkcni5mdl416p05]
GO
ALTER TABLE [dbo].[user_owner]  WITH CHECK ADD  CONSTRAINT [FK_d24uk2nd29f6rqfqtsosljf2x] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[user_owner] CHECK CONSTRAINT [FK_d24uk2nd29f6rqfqtsosljf2x]
GO
USE [master]
GO
ALTER DATABASE [EEIT82DB] SET  READ_WRITE 
GO
