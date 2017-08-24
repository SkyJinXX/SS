USE [注册报名系统]
GO
/****** Object:  Table [dbo].[A_T_Announcement]    Script Date: 08/24/2017 15:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[A_T_Announcement](
	[Aid] [varchar](10) NOT NULL,
	[Aname] [varchar](10) NOT NULL,
	[Tid] [varchar](10) NOT NULL,
	[Tname] [varchar](10) NOT NULL,
	[A2T_Annou] [varchar](500) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[A_S_Announcement]    Script Date: 08/24/2017 15:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[A_S_Announcement](
	[Aid] [varchar](10) NOT NULL,
	[Aname] [varchar](10) NOT NULL,
	[Sid] [varchar](10) NOT NULL,
	[Sname] [varchar](10) NOT NULL,
	[A2S_Annou] [varchar](500) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[A_A_Announcement]    Script Date: 08/24/2017 15:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[A_A_Announcement](
	[Aid1] [varchar](10) NOT NULL,
	[Aname1] [varchar](10) NOT NULL,
	[Aid2] [varchar](10) NOT NULL,
	[Aname2] [varchar](10) NOT NULL,
	[A_A_Message] [varchar](100) NULL,
	[A_A_Action] [varchar](100) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[A_A_Announcement] ([Aid1], [Aname1], [Aid2], [Aname2], [A_A_Message], [A_A_Action]) VALUES (N'005', N'老管', N'002', N'阿欢', N'', N'laog let  the level of 阿欢 be up and the level become 5 .')
INSERT [dbo].[A_A_Announcement] ([Aid1], [Aname1], [Aid2], [Aname2], [A_A_Message], [A_A_Action]) VALUES (N'005', N'老管', N'003', N'狗洋', N'你皮任你皮', N'')
INSERT [dbo].[A_A_Announcement] ([Aid1], [Aname1], [Aid2], [Aname2], [A_A_Message], [A_A_Action]) VALUES (N'005', N'老管', N'002', N'阿欢', N'在座的垃圾你们好', N'')
INSERT [dbo].[A_A_Announcement] ([Aid1], [Aname1], [Aid2], [Aname2], [A_A_Message], [A_A_Action]) VALUES (N'005', N'老管', N'003', N'狗洋', N'在座的垃圾你们好', N'')
