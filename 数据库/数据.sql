USE [注册报名系统]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 08/30/2017 15:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Questions](
	[Qid] [varchar](11) NOT NULL,
	[Question] [text] NOT NULL,
	[Qanswer] [varchar](255) NOT NULL,
	[Cid] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Qid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Questions] ([Qid], [Question], [Qanswer], [Cid]) VALUES (N'1-1', N'一加一等于 A 1  B 2  C  3  D  4', N'B', N'1')
INSERT [dbo].[Questions] ([Qid], [Question], [Qanswer], [Cid]) VALUES (N'1-2', N'谁发明了电灯 A  爱迪生  B  开开  C  伟哲  D  欢欢', N'A', N'1')
INSERT [dbo].[Questions] ([Qid], [Question], [Qanswer], [Cid]) VALUES (N'1-3', N'二加二等于 A  1  B  2  C  3  D  4', N'D', N'1')
INSERT [dbo].[Questions] ([Qid], [Question], [Qanswer], [Cid]) VALUES (N'1-4', N'四加四等于  A 1  B  3  C  8  D  10', N'C', N'1')
INSERT [dbo].[Questions] ([Qid], [Question], [Qanswer], [Cid]) VALUES (N'1-5', N'六除以二等于  A  1  B  2  C  3  D  4', N'C', N'1')
INSERT [dbo].[Questions] ([Qid], [Question], [Qanswer], [Cid]) VALUES (N'2-1', N'一乘以五等于  A  1  B  5  C  10  D 9', N'B', N'2')
INSERT [dbo].[Questions] ([Qid], [Question], [Qanswer], [Cid]) VALUES (N'2-2', N'二加三等于  A  1  B  2  C  3  D  5', N'D', N'2')
INSERT [dbo].[Questions] ([Qid], [Question], [Qanswer], [Cid]) VALUES (N'2-3', N'四加五等于  A  9  B  10  C  2  D  5', N'A', N'2')
INSERT [dbo].[Questions] ([Qid], [Question], [Qanswer], [Cid]) VALUES (N'2-4', N'一加二等于  A  1  B  3  C  5  D  6', N'B', N'2')
INSERT [dbo].[Questions] ([Qid], [Question], [Qanswer], [Cid]) VALUES (N'2-5', N'四乘以二等于  A  1  B  2  C  4  D  8', N'D', N'2')
/****** Object:  Table [dbo].[Ctesttime]    Script Date: 08/30/2017 15:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ctesttime](
	[Cid] [varchar](10) NOT NULL,
	[Cstarttime] [date] NOT NULL,
	[Cendtime] [datetime] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Ctesttime] ([Cid], [Cstarttime], [Cendtime]) VALUES (N'1', CAST(0x2F3D0B00 AS Date), CAST(0x0000A7D5018B80D4 AS DateTime))
INSERT [dbo].[Ctesttime] ([Cid], [Cstarttime], [Cendtime]) VALUES (N'1', CAST(0x2F3D0B00 AS Date), CAST(0x0000A7D5018B80D4 AS DateTime))
/****** Object:  Table [dbo].[Ctest]    Script Date: 08/30/2017 15:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ctest](
	[Cid] [varchar](10) NOT NULL,
	[Ctestname] [varchar](100) NOT NULL,
	[Ctesturl] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Ctest] ([Cid], [Ctestname], [Ctesturl]) VALUES (N'1', N'新建 Microsoft Word 文档.docx', N'C:\Users\as\Documents\GitHub\SS\test\新建 Microsoft Word 文档.docx')
/****** Object:  Table [dbo].[Course]    Script Date: 08/30/2017 15:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Course](
	[Cid] [varchar](10) NOT NULL,
	[Cname] [varchar](15) NOT NULL,
	[Ccredit] [int] NOT NULL,
	[Cpersonnumber] [int] NOT NULL,
	[Ccategory] [varchar](10) NOT NULL,
	[Cintroduction] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[Cid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Course] ([Cid], [Cname], [Ccredit], [Cpersonnumber], [Ccategory], [Cintroduction]) VALUES (N'1', N'java', 2, 55, N'1', N'这是一个课程')
INSERT [dbo].[Course] ([Cid], [Cname], [Ccredit], [Cpersonnumber], [Ccategory], [Cintroduction]) VALUES (N'2', N'计网', 5, 3, N'办公效率', N'计算机网络')
INSERT [dbo].[Course] ([Cid], [Cname], [Ccredit], [Cpersonnumber], [Ccategory], [Cintroduction]) VALUES (N'3', N'c', 3, 50, N'编程开发', N'c是最基础的语言之一')
INSERT [dbo].[Course] ([Cid], [Cname], [Ccredit], [Cpersonnumber], [Ccategory], [Cintroduction]) VALUES (N'4', N'javascript', 4, 30, N'技能特长', N'前端页面的语言处理基础')
/****** Object:  Table [dbo].[A_T_Announcement]    Script Date: 08/30/2017 15:59:15 ******/
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
	[A_T_Annou] [text] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[A_S_Announcement]    Script Date: 08/30/2017 15:59:15 ******/
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
	[A_S_Annou] [text] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[A_A_Management]    Script Date: 08/30/2017 15:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[A_A_Management](
	[Aname1] [varchar](10) NOT NULL,
	[Aname2] [varchar](10) NOT NULL,
	[A2A_Message] [text] NULL,
	[A2A_Action] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[A_A_Management] ([Aname1], [Aname2], [A2A_Message], [A2A_Action]) VALUES (N'laog', N'', N'22', N'')
INSERT [dbo].[A_A_Management] ([Aname1], [Aname2], [A2A_Message], [A2A_Action]) VALUES (N'laog', N'', N'1212', N'')
INSERT [dbo].[A_A_Management] ([Aname1], [Aname2], [A2A_Message], [A2A_Action]) VALUES (N'laog', N'laog', N'11', N'')
INSERT [dbo].[A_A_Management] ([Aname1], [Aname2], [A2A_Message], [A2A_Action]) VALUES (N'laog', N'laog', N'11', N'')
INSERT [dbo].[A_A_Management] ([Aname1], [Aname2], [A2A_Message], [A2A_Action]) VALUES (N'阿欢', N'狗洋', N'菜比', N'')
INSERT [dbo].[A_A_Management] ([Aname1], [Aname2], [A2A_Message], [A2A_Action]) VALUES (N'阿欢', N'狗洋', N'', N'阿欢 let  the level of 狗洋 be down and the level become 2 .')
/****** Object:  Table [dbo].[A_A_Announcement]    Script Date: 08/30/2017 15:59:15 ******/
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
INSERT [dbo].[A_A_Announcement] ([Aid1], [Aname1], [Aid2], [Aname2], [A_A_Message], [A_A_Action]) VALUES (N'005', N'老管', N'002', N'阿欢', N'', N'laog let  the level of 阿欢 be up and the level become 5 .')
INSERT [dbo].[A_A_Announcement] ([Aid1], [Aname1], [Aid2], [Aname2], [A_A_Message], [A_A_Action]) VALUES (N'005', N'老管', N'003', N'狗洋', N'你皮任你皮', N'')
INSERT [dbo].[A_A_Announcement] ([Aid1], [Aname1], [Aid2], [Aname2], [A_A_Message], [A_A_Action]) VALUES (N'005', N'老管', N'002', N'阿欢', N'在座的垃圾你们好', N'')
INSERT [dbo].[A_A_Announcement] ([Aid1], [Aname1], [Aid2], [Aname2], [A_A_Message], [A_A_Action]) VALUES (N'005', N'老管', N'003', N'狗洋', N'在座的垃圾你们好', N'')
/****** Object:  Table [dbo].[Student]    Script Date: 08/30/2017 15:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[Sid] [varchar](10) NOT NULL,
	[Sname] [varchar](8) NOT NULL,
	[Ssex] [varchar](2) NULL,
	[Sbirthday] [varchar](10) NULL,
	[Sage] [varchar](5) NULL,
	[Sschool] [varchar](15) NULL,
	[Scollege] [varchar](15) NULL,
	[Smajor] [varchar](15) NULL,
	[Sclass] [varchar](10) NOT NULL,
	[Sphone] [varchar](11) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Student] ([Sid], [Sname], [Ssex], [Sbirthday], [Sage], [Sschool], [Scollege], [Smajor], [Sclass], [Sphone]) VALUES (N'006', N'位置', N'男', N'1977', N'99', N'打阿达啊 ', N'打打', N'阿达', N'2', N'18878')
INSERT [dbo].[Student] ([Sid], [Sname], [Ssex], [Sbirthday], [Sage], [Sschool], [Scollege], [Smajor], [Sclass], [Sphone]) VALUES (N'46446', N'ggg', N'男', N'1111', N'11', N'下大学', N'医技', N'电脑', N'1班', N'4545454545')
INSERT [dbo].[Student] ([Sid], [Sname], [Ssex], [Sbirthday], [Sage], [Sschool], [Scollege], [Smajor], [Sclass], [Sphone]) VALUES (N'65656', N'4545', N'男', N'454545', N'10', N'打打', N'阿达', N'阿达', N'1', N'484546')
/****** Object:  Table [dbo].[Vedio]    Script Date: 08/30/2017 15:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Vedio](
	[Cid] [varchar](100) NULL,
	[ChapterName] [varchar](100) NULL,
	[SChapter] [int] NULL,
	[EChapter] [int] NULL,
	[SectionName] [varchar](100) NULL,
	[SSection] [int] NULL,
	[ESection] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Vedio] ([Cid], [ChapterName], [SChapter], [EChapter], [SectionName], [SSection], [ESection]) VALUES (N'1', N'ff', 1, 2, N'ddf', 1, 2)
INSERT [dbo].[Vedio] ([Cid], [ChapterName], [SChapter], [EChapter], [SectionName], [SSection], [ESection]) VALUES (N'2', N'链表', 1, 2, N'基本', 1, 2)
INSERT [dbo].[Vedio] ([Cid], [ChapterName], [SChapter], [EChapter], [SectionName], [SSection], [ESection]) VALUES (N'2', N'指针', 3, 3, N'小知识', 1, 1)
INSERT [dbo].[Vedio] ([Cid], [ChapterName], [SChapter], [EChapter], [SectionName], [SSection], [ESection]) VALUES (N'1', N'ff', 1, 2, N'ddfaa', 0, 0)
/****** Object:  Table [dbo].[Users]    Script Date: 08/30/2017 15:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[Uusername] [varchar](12) NOT NULL,
	[Upassword] [varchar](16) NOT NULL,
	[Uidentity] [varchar](2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Uusername] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Users] ([Uusername], [Upassword], [Uidentity]) VALUES (N'110', N'123', N'A')
INSERT [dbo].[Users] ([Uusername], [Upassword], [Uidentity]) VALUES (N'111', N'123', N'S')
INSERT [dbo].[Users] ([Uusername], [Upassword], [Uidentity]) VALUES (N'1111', N'123', N'A')
INSERT [dbo].[Users] ([Uusername], [Upassword], [Uidentity]) VALUES (N'123', N'123', N'A')
INSERT [dbo].[Users] ([Uusername], [Upassword], [Uidentity]) VALUES (N'123456', N'123', N'S')
INSERT [dbo].[Users] ([Uusername], [Upassword], [Uidentity]) VALUES (N'16', N'123', N'T')
INSERT [dbo].[Users] ([Uusername], [Upassword], [Uidentity]) VALUES (N'666', N'123', N'T')
INSERT [dbo].[Users] ([Uusername], [Upassword], [Uidentity]) VALUES (N'899', N'123', N'S')
/****** Object:  Table [dbo].[Ureply]    Script Date: 08/30/2017 15:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ureply](
	[Uname1] [varchar](20) NULL,
	[Uname2] [varchar](20) NULL,
	[Ureply] [varchar](40) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Ureply] ([Uname1], [Uname2], [Ureply]) VALUES (N'111', N'899', N'哈哈哈哈')
INSERT [dbo].[Ureply] ([Uname1], [Uname2], [Ureply]) VALUES (N'899', N'899', N'1212')
INSERT [dbo].[Ureply] ([Uname1], [Uname2], [Ureply]) VALUES (N'899', N'899', N'呵呵呵')
INSERT [dbo].[Ureply] ([Uname1], [Uname2], [Ureply]) VALUES (N'899', N'899', N'呵呵呵')
INSERT [dbo].[Ureply] ([Uname1], [Uname2], [Ureply]) VALUES (N'111', N'899', N'你妹')
INSERT [dbo].[Ureply] ([Uname1], [Uname2], [Ureply]) VALUES (N'899', N'899', N'尼玛')
INSERT [dbo].[Ureply] ([Uname1], [Uname2], [Ureply]) VALUES (N'899', N'899', N'年末')
INSERT [dbo].[Ureply] ([Uname1], [Uname2], [Ureply]) VALUES (N'899', N'899', N'1')
INSERT [dbo].[Ureply] ([Uname1], [Uname2], [Ureply]) VALUES (N'899', N'111', N'笑死了')
/****** Object:  Table [dbo].[Umessage]    Script Date: 08/30/2017 15:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Umessage](
	[Uusername] [varchar](10) NULL,
	[Umessage] [nchar](30) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Umessage] ([Uusername], [Umessage]) VALUES (N'899', N'你好啊                           ')
INSERT [dbo].[Umessage] ([Uusername], [Umessage]) VALUES (N'899', N'111                           ')
INSERT [dbo].[Umessage] ([Uusername], [Umessage]) VALUES (N'899', N'222                           ')
INSERT [dbo].[Umessage] ([Uusername], [Umessage]) VALUES (N'899', N'333                           ')
INSERT [dbo].[Umessage] ([Uusername], [Umessage]) VALUES (N'899', N'是单杀                           ')
INSERT [dbo].[Umessage] ([Uusername], [Umessage]) VALUES (N'899', N'大的                            ')
INSERT [dbo].[Umessage] ([Uusername], [Umessage]) VALUES (N'899', N'22                            ')
INSERT [dbo].[Umessage] ([Uusername], [Umessage]) VALUES (N'899', N'1122                          ')
INSERT [dbo].[Umessage] ([Uusername], [Umessage]) VALUES (N'899', N'22                            ')
INSERT [dbo].[Umessage] ([Uusername], [Umessage]) VALUES (N'111', N'哈哈哈哈                          ')
/****** Object:  Table [dbo].[Trelease]    Script Date: 08/30/2017 15:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Trelease](
	[Cid] [varchar](10) NOT NULL,
	[Crelease] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Trelease] ([Cid], [Crelease]) VALUES (N'1', N'java考试快要开始了，请同学们注意开考时间')
INSERT [dbo].[Trelease] ([Cid], [Crelease]) VALUES (N'1', N'同学们注意')
INSERT [dbo].[Trelease] ([Cid], [Crelease]) VALUES (N'1', N'123')
INSERT [dbo].[Trelease] ([Cid], [Crelease]) VALUES (N'1', N'45')
/****** Object:  Table [dbo].[Tmessage]    Script Date: 08/30/2017 15:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tmessage](
	[Tmessage] [varchar](100) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 08/30/2017 15:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teacher](
	[Tid] [varchar](10) NOT NULL,
	[Tname] [varchar](20) NOT NULL,
	[Tsex] [varchar](2) NULL,
	[Tbirthday] [varchar](10) NULL,
	[Tprofession] [varchar](15) NULL,
	[Tphone] [varchar](15) NOT NULL,
	[Tintroduction] [text] NULL,
	[Tlevel] [int] NOT NULL,
 CONSTRAINT [PK__Teacher__C451DB3115502E78] PRIMARY KEY CLUSTERED 
(
	[Tid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Teacher] ([Tid], [Tname], [Tsex], [Tbirthday], [Tprofession], [Tphone], [Tintroduction], [Tlevel]) VALUES (N'131', N'管', N'男', N'199606', N'计算机', N'1815814', N'大师答 ', 2)
/****** Object:  Table [dbo].[Administrator]    Script Date: 08/30/2017 15:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Administrator](
	[Aid] [varchar](10) NOT NULL,
	[Aname] [varchar](10) NOT NULL,
	[Asex] [varchar](2) NULL,
	[Abirthday] [varchar](10) NULL,
	[Aage] [varchar](5) NULL,
	[Alevel] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Aid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Administrator] ([Aid], [Aname], [Asex], [Abirthday], [Aage], [Alevel]) VALUES (N'002', N'阿欢', N'男', N'19961201', N'22', N'4')
INSERT [dbo].[Administrator] ([Aid], [Aname], [Asex], [Abirthday], [Aage], [Alevel]) VALUES (N'003', N'狗洋', N'男', N'19950608', N'23', N'2')
INSERT [dbo].[Administrator] ([Aid], [Aname], [Asex], [Abirthday], [Aage], [Alevel]) VALUES (N'005', N'laog', N'女', N'199606', N'20', N'6')
/****** Object:  Table [dbo].[A_U]    Script Date: 08/30/2017 15:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[A_U](
	[Aid] [varchar](10) NOT NULL,
	[Uusername] [varchar](12) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[A_U] ([Aid], [Uusername]) VALUES (N'005', N'123')
INSERT [dbo].[A_U] ([Aid], [Uusername]) VALUES (N'002', N'110')
INSERT [dbo].[A_U] ([Aid], [Uusername]) VALUES (N'003', N'1111')
/****** Object:  Table [dbo].[T_U]    Script Date: 08/30/2017 15:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_U](
	[Tid] [varchar](10) NOT NULL,
	[Uusername] [varchar](12) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[T_U] ([Tid], [Uusername]) VALUES (N'131', N'16')
/****** Object:  Table [dbo].[T_C]    Script Date: 08/30/2017 15:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_C](
	[Tid] [varchar](10) NOT NULL,
	[Cid] [varchar](10) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[T_C] ([Tid], [Cid]) VALUES (N'131', N'1')
INSERT [dbo].[T_C] ([Tid], [Cid]) VALUES (N'131', N'2')
INSERT [dbo].[T_C] ([Tid], [Cid]) VALUES (N'131', N'3')
INSERT [dbo].[T_C] ([Tid], [Cid]) VALUES (N'131', N'4')
/****** Object:  Table [dbo].[S_U]    Script Date: 08/30/2017 15:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[S_U](
	[Sid] [varchar](10) NOT NULL,
	[Uusername] [varchar](12) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[S_U] ([Sid], [Uusername]) VALUES (N'006', N'123456')
INSERT [dbo].[S_U] ([Sid], [Uusername]) VALUES (N'65656', N'899')
INSERT [dbo].[S_U] ([Sid], [Uusername]) VALUES (N'46446', N'111')
/****** Object:  Table [dbo].[S_T_Communication]    Script Date: 08/30/2017 15:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[S_T_Communication](
	[Sid] [varchar](10) NOT NULL,
	[Tid] [varchar](10) NOT NULL,
	[Cmessage] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[S_C_Transcript]    Script Date: 08/30/2017 15:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[S_C_Transcript](
	[Sid] [varchar](10) NOT NULL,
	[Cid] [varchar](10) NOT NULL,
	[PScore] [int] NULL,
	[MScore] [int] NULL,
	[FScore] [int] NULL,
	[Tscore] [int] NULL,
	[Progress] [float] NULL,
	[Watched] [int] NULL,
	[Did] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[S_C_Transcript] ([Sid], [Cid], [PScore], [MScore], [FScore], [Tscore], [Progress], [Watched], [Did]) VALUES (N'006', N'2', 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[S_C_Transcript] ([Sid], [Cid], [PScore], [MScore], [FScore], [Tscore], [Progress], [Watched], [Did]) VALUES (N'65656', N'1', 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[S_C_Transcript] ([Sid], [Cid], [PScore], [MScore], [FScore], [Tscore], [Progress], [Watched], [Did]) VALUES (N'65656', N'2', 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[S_C_Transcript] ([Sid], [Cid], [PScore], [MScore], [FScore], [Tscore], [Progress], [Watched], [Did]) VALUES (N'006', N'4', 6, 6, 6, 18, 0, 0, 0)
INSERT [dbo].[S_C_Transcript] ([Sid], [Cid], [PScore], [MScore], [FScore], [Tscore], [Progress], [Watched], [Did]) VALUES (N'006', N'3', 20, 20, 18, 58, 0, 0, 0)
/****** Object:  Table [dbo].[C_Time]    Script Date: 08/30/2017 15:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[C_Time](
	[Cid] [varchar](10) NULL,
	[CourseIn_Time_Begin] [date] NOT NULL,
	[CourseIn_Time_End] [date] NOT NULL,
	[CourseOut_Time_Begin] [date] NOT NULL,
	[CourseOut_Time_End] [date] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[C_Chapter]    Script Date: 08/30/2017 15:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[C_Chapter](
	[Cid] [varchar](10) NOT NULL,
	[Cchapter] [varchar](10) NOT NULL,
	[Csection] [varchar](10) NOT NULL,
	[Cchapter_section_name] [varchar](30) NOT NULL,
	[Cvideo_name] [varchar](30) NOT NULL,
	[Cvideo_url] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[C_Chapter] ([Cid], [Cchapter], [Csection], [Cchapter_section_name], [Cvideo_name], [Cvideo_url]) VALUES (N'1', N'1', N'1', N'你阿妈', N'哈哈哈', N'1111')
/****** Object:  Check [CK__Administra__Asex__25869641]    Script Date: 08/30/2017 15:59:15 ******/
ALTER TABLE [dbo].[Administrator]  WITH CHECK ADD CHECK  (([Asex]='女' OR [Asex]='男'))
GO
/****** Object:  Check [CK__Student__Ssex__239E4DCF]    Script Date: 08/30/2017 15:59:15 ******/
ALTER TABLE [dbo].[Student]  WITH CHECK ADD CHECK  (([Ssex]='女' OR [Ssex]='男'))
GO
/****** Object:  Check [CK__Teacher__Tsex__1ED998B2]    Script Date: 08/30/2017 15:59:15 ******/
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [CK__Teacher__Tsex__1ED998B2] CHECK  (([Tsex]='女' OR [Tsex]='男'))
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [CK__Teacher__Tsex__1ED998B2]
GO
/****** Object:  ForeignKey [FK__A_U__Aid__267ABA7A]    Script Date: 08/30/2017 15:59:15 ******/
ALTER TABLE [dbo].[A_U]  WITH CHECK ADD FOREIGN KEY([Aid])
REFERENCES [dbo].[Administrator] ([Aid])
GO
/****** Object:  ForeignKey [FK__A_U__Uusername__276EDEB3]    Script Date: 08/30/2017 15:59:15 ******/
ALTER TABLE [dbo].[A_U]  WITH CHECK ADD FOREIGN KEY([Uusername])
REFERENCES [dbo].[Users] ([Uusername])
GO
/****** Object:  ForeignKey [FK_C_Chapter_Course]    Script Date: 08/30/2017 15:59:15 ******/
ALTER TABLE [dbo].[C_Chapter]  WITH CHECK ADD  CONSTRAINT [FK_C_Chapter_Course] FOREIGN KEY([Cid])
REFERENCES [dbo].[Course] ([Cid])
GO
ALTER TABLE [dbo].[C_Chapter] CHECK CONSTRAINT [FK_C_Chapter_Course]
GO
/****** Object:  ForeignKey [FK_S_C_Time_Course]    Script Date: 08/30/2017 15:59:15 ******/
ALTER TABLE [dbo].[C_Time]  WITH CHECK ADD  CONSTRAINT [FK_S_C_Time_Course] FOREIGN KEY([Cid])
REFERENCES [dbo].[Course] ([Cid])
GO
ALTER TABLE [dbo].[C_Time] CHECK CONSTRAINT [FK_S_C_Time_Course]
GO
/****** Object:  ForeignKey [FK__S_C_Transcr__Cid__21B6055D]    Script Date: 08/30/2017 15:59:15 ******/
ALTER TABLE [dbo].[S_C_Transcript]  WITH CHECK ADD  CONSTRAINT [FK__S_C_Transcr__Cid__21B6055D] FOREIGN KEY([Cid])
REFERENCES [dbo].[Course] ([Cid])
GO
ALTER TABLE [dbo].[S_C_Transcript] CHECK CONSTRAINT [FK__S_C_Transcr__Cid__21B6055D]
GO
/****** Object:  ForeignKey [FK__S_C_Transcr__Sid__22AA2996]    Script Date: 08/30/2017 15:59:15 ******/
ALTER TABLE [dbo].[S_C_Transcript]  WITH CHECK ADD  CONSTRAINT [FK__S_C_Transcr__Sid__22AA2996] FOREIGN KEY([Sid])
REFERENCES [dbo].[Student] ([Sid])
GO
ALTER TABLE [dbo].[S_C_Transcript] CHECK CONSTRAINT [FK__S_C_Transcr__Sid__22AA2996]
GO
/****** Object:  ForeignKey [FK__S_T_Communi__Sid__2E1BDC42]    Script Date: 08/30/2017 15:59:15 ******/
ALTER TABLE [dbo].[S_T_Communication]  WITH CHECK ADD FOREIGN KEY([Sid])
REFERENCES [dbo].[Student] ([Sid])
GO
/****** Object:  ForeignKey [FK__S_T_Communi__Tid__267ABA7A]    Script Date: 08/30/2017 15:59:15 ******/
ALTER TABLE [dbo].[S_T_Communication]  WITH CHECK ADD  CONSTRAINT [FK__S_T_Communi__Tid__267ABA7A] FOREIGN KEY([Tid])
REFERENCES [dbo].[Teacher] ([Tid])
GO
ALTER TABLE [dbo].[S_T_Communication] CHECK CONSTRAINT [FK__S_T_Communi__Tid__267ABA7A]
GO
/****** Object:  ForeignKey [FK__S_U__Sid__2C3393D0]    Script Date: 08/30/2017 15:59:15 ******/
ALTER TABLE [dbo].[S_U]  WITH CHECK ADD FOREIGN KEY([Sid])
REFERENCES [dbo].[Student] ([Sid])
GO
/****** Object:  ForeignKey [FK__S_U__Uusername__2D27B809]    Script Date: 08/30/2017 15:59:15 ******/
ALTER TABLE [dbo].[S_U]  WITH CHECK ADD FOREIGN KEY([Uusername])
REFERENCES [dbo].[Users] ([Uusername])
GO
/****** Object:  ForeignKey [FK__T_C__Cid__2A4B4B5E]    Script Date: 08/30/2017 15:59:15 ******/
ALTER TABLE [dbo].[T_C]  WITH CHECK ADD FOREIGN KEY([Cid])
REFERENCES [dbo].[Course] ([Cid])
GO
/****** Object:  ForeignKey [FK__T_C__Tid__22AA2996]    Script Date: 08/30/2017 15:59:15 ******/
ALTER TABLE [dbo].[T_C]  WITH CHECK ADD  CONSTRAINT [FK__T_C__Tid__22AA2996] FOREIGN KEY([Tid])
REFERENCES [dbo].[Teacher] ([Tid])
GO
ALTER TABLE [dbo].[T_C] CHECK CONSTRAINT [FK__T_C__Tid__22AA2996]
GO
/****** Object:  ForeignKey [FK__T_U__Tid__1FCDBCEB]    Script Date: 08/30/2017 15:59:15 ******/
ALTER TABLE [dbo].[T_U]  WITH CHECK ADD  CONSTRAINT [FK__T_U__Tid__1FCDBCEB] FOREIGN KEY([Tid])
REFERENCES [dbo].[Teacher] ([Tid])
GO
ALTER TABLE [dbo].[T_U] CHECK CONSTRAINT [FK__T_U__Tid__1FCDBCEB]
GO
/****** Object:  ForeignKey [FK__T_U__Uusername__29572725]    Script Date: 08/30/2017 15:59:15 ******/
ALTER TABLE [dbo].[T_U]  WITH CHECK ADD FOREIGN KEY([Uusername])
REFERENCES [dbo].[Users] ([Uusername])
GO
