USE [注册报名系统]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 07/07/2017 16:39:17 ******/
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
PRIMARY KEY CLUSTERED 
(
	[Qid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Questions] ([Qid], [Question], [Qanswer]) VALUES (N'1', N'一加一等于 A 1  B 2  C  3  D  4', N'B')
INSERT [dbo].[Questions] ([Qid], [Question], [Qanswer]) VALUES (N'2', N'谁发明了电灯 A  爱迪生  B  开开  C  伟哲  D  欢欢', N'A')
INSERT [dbo].[Questions] ([Qid], [Question], [Qanswer]) VALUES (N'3', N'二加二等于 A  1  B  2  C  3  D  4', N'D')
