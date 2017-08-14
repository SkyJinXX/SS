USE [注册报名系统]
GO
/****** Object:  Table [dbo].[A_A_Management]    Script Date: 08/14/2017 14:24:59 ******/
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
/****** Object:  Table [dbo].[Questions]    Script Date: 08/14/2017 14:24:59 ******/
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
/****** Object:  Table [dbo].[Course]    Script Date: 08/14/2017 14:24:59 ******/
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
INSERT [dbo].[Course] ([Cid], [Cname], [Ccredit], [Cpersonnumber], [Ccategory], [Cintroduction]) VALUES (N'2', N'计网', 5, 3, N'2', N'计算机网络')
/****** Object:  Table [dbo].[Administrator]    Script Date: 08/14/2017 14:24:59 ******/
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
INSERT [dbo].[Administrator] ([Aid], [Aname], [Asex], [Abirthday], [Aage], [Alevel]) VALUES (N'005', N'laog', N'女', N'199606', N'20', N'1')
/****** Object:  Table [dbo].[Student]    Script Date: 08/14/2017 14:24:59 ******/
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
INSERT [dbo].[Student] ([Sid], [Sname], [Ssex], [Sbirthday], [Sage], [Sschool], [Scollege], [Smajor], [Sclass], [Sphone]) VALUES (N'65656', N'4545', N'男', N'454545', N'10', N'打打', N'阿达', N'阿达', N'1', N'484546')
/****** Object:  Table [dbo].[Users]    Script Date: 08/14/2017 14:24:59 ******/
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
INSERT [dbo].[Users] ([Uusername], [Upassword], [Uidentity]) VALUES (N'123', N'123', N'A')
INSERT [dbo].[Users] ([Uusername], [Upassword], [Uidentity]) VALUES (N'123456', N'123', N'S')
INSERT [dbo].[Users] ([Uusername], [Upassword], [Uidentity]) VALUES (N'16', N'123', N'T')
INSERT [dbo].[Users] ([Uusername], [Upassword], [Uidentity]) VALUES (N'899', N'123', N'S')
/****** Object:  Table [dbo].[Umessage]    Script Date: 08/14/2017 14:24:59 ******/
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
/****** Object:  Table [dbo].[Tmessage]    Script Date: 08/14/2017 14:24:59 ******/
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
/****** Object:  Table [dbo].[Teacher]    Script Date: 08/14/2017 14:24:59 ******/
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
PRIMARY KEY CLUSTERED 
(
	[Tid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Teacher] ([Tid], [Tname], [Tsex], [Tbirthday], [Tprofession], [Tphone], [Tintroduction]) VALUES (N'131', N'管', N'男', N'199606', N'计算机', N'1815814', N'大师答 ')
/****** Object:  Table [dbo].[T_U]    Script Date: 08/14/2017 14:24:59 ******/
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
/****** Object:  Table [dbo].[T_C]    Script Date: 08/14/2017 14:24:59 ******/
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
/****** Object:  Table [dbo].[S_U]    Script Date: 08/14/2017 14:24:59 ******/
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
/****** Object:  Table [dbo].[S_T_Communication]    Script Date: 08/14/2017 14:24:59 ******/
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
/****** Object:  Table [dbo].[S_C_Transcript]    Script Date: 08/14/2017 14:24:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[S_C_Transcript](
	[Sid] [varchar](10) NOT NULL,
	[Cid] [varchar](10) NOT NULL,
	[Tscore] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[S_C_Transcript] ([Sid], [Cid], [Tscore]) VALUES (N'65656', N'1', 0)
INSERT [dbo].[S_C_Transcript] ([Sid], [Cid], [Tscore]) VALUES (N'65656', N'2', 0)
/****** Object:  Table [dbo].[A_U]    Script Date: 08/14/2017 14:24:59 ******/
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
/****** Object:  Check [CK__Administra__Asex__20C1E124]    Script Date: 08/14/2017 14:24:59 ******/
ALTER TABLE [dbo].[Administrator]  WITH CHECK ADD CHECK  (([Asex]='女' OR [Asex]='男'))
GO
/****** Object:  Check [CK__Student__Ssex__09DE7BCC]    Script Date: 08/14/2017 14:24:59 ******/
ALTER TABLE [dbo].[Student]  WITH CHECK ADD CHECK  (([Ssex]='女' OR [Ssex]='男'))
GO
/****** Object:  Check [CK__Teacher__Tsex__0519C6AF]    Script Date: 08/14/2017 14:24:59 ******/
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD CHECK  (([Tsex]='女' OR [Tsex]='男'))
GO
/****** Object:  ForeignKey [FK__A_U__Aid__239E4DCF]    Script Date: 08/14/2017 14:24:59 ******/
ALTER TABLE [dbo].[A_U]  WITH CHECK ADD FOREIGN KEY([Aid])
REFERENCES [dbo].[Administrator] ([Aid])
GO
/****** Object:  ForeignKey [FK__A_U__Uusername__22AA2996]    Script Date: 08/14/2017 14:24:59 ******/
ALTER TABLE [dbo].[A_U]  WITH CHECK ADD FOREIGN KEY([Uusername])
REFERENCES [dbo].[Users] ([Uusername])
GO
/****** Object:  ForeignKey [FK__S_C_Transcr__Cid__108B795B]    Script Date: 08/14/2017 14:24:59 ******/
ALTER TABLE [dbo].[S_C_Transcript]  WITH CHECK ADD FOREIGN KEY([Cid])
REFERENCES [dbo].[Course] ([Cid])
GO
/****** Object:  ForeignKey [FK__S_C_Transcr__Sid__0F975522]    Script Date: 08/14/2017 14:24:59 ******/
ALTER TABLE [dbo].[S_C_Transcript]  WITH CHECK ADD FOREIGN KEY([Sid])
REFERENCES [dbo].[Student] ([Sid])
GO
/****** Object:  ForeignKey [FK__S_T_Communi__Sid__1273C1CD]    Script Date: 08/14/2017 14:24:59 ******/
ALTER TABLE [dbo].[S_T_Communication]  WITH CHECK ADD FOREIGN KEY([Sid])
REFERENCES [dbo].[Student] ([Sid])
GO
/****** Object:  ForeignKey [FK__S_T_Communi__Tid__1367E606]    Script Date: 08/14/2017 14:24:59 ******/
ALTER TABLE [dbo].[S_T_Communication]  WITH CHECK ADD FOREIGN KEY([Tid])
REFERENCES [dbo].[Teacher] ([Tid])
GO
/****** Object:  ForeignKey [FK__S_U__Sid__15502E78]    Script Date: 08/14/2017 14:24:59 ******/
ALTER TABLE [dbo].[S_U]  WITH CHECK ADD FOREIGN KEY([Sid])
REFERENCES [dbo].[Student] ([Sid])
GO
/****** Object:  ForeignKey [FK__S_U__Uusername__164452B1]    Script Date: 08/14/2017 14:24:59 ******/
ALTER TABLE [dbo].[S_U]  WITH CHECK ADD FOREIGN KEY([Uusername])
REFERENCES [dbo].[Users] ([Uusername])
GO
/****** Object:  ForeignKey [FK__T_C__Cid__1B0907CE]    Script Date: 08/14/2017 14:24:59 ******/
ALTER TABLE [dbo].[T_C]  WITH CHECK ADD FOREIGN KEY([Cid])
REFERENCES [dbo].[Course] ([Cid])
GO
/****** Object:  ForeignKey [FK__T_C__Tid__1BFD2C07]    Script Date: 08/14/2017 14:24:59 ******/
ALTER TABLE [dbo].[T_C]  WITH CHECK ADD FOREIGN KEY([Tid])
REFERENCES [dbo].[Teacher] ([Tid])
GO
/****** Object:  ForeignKey [FK__T_U__Tid__182C9B23]    Script Date: 08/14/2017 14:24:59 ******/
ALTER TABLE [dbo].[T_U]  WITH CHECK ADD FOREIGN KEY([Tid])
REFERENCES [dbo].[Teacher] ([Tid])
GO
/****** Object:  ForeignKey [FK__T_U__Uusername__1920BF5C]    Script Date: 08/14/2017 14:24:59 ******/
ALTER TABLE [dbo].[T_U]  WITH CHECK ADD FOREIGN KEY([Uusername])
REFERENCES [dbo].[Users] ([Uusername])
GO
