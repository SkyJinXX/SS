USE [注册报名系统]
GO
/****** Object:  Table [dbo].[Ctest]    Script Date: 08/24/2017 13:54:02 ******/
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
INSERT [dbo].[Ctest] ([Cid], [Ctestname], [Ctesturl]) VALUES (N'1', N'新建文本文档.txt', N'C:\Users\as\Documents\GitHub\SS\test\新建文本文档.txt')
INSERT [dbo].[Ctest] ([Cid], [Ctestname], [Ctesturl]) VALUES (N'1', N'新建文本文档 (3).txt', N'C:\Users\as\Documents\GitHub\SS\test\新建文本文档 (3).txt')
INSERT [dbo].[Ctest] ([Cid], [Ctestname], [Ctesturl]) VALUES (N'1', N'新建 Microsoft Word 文档.docx', N'C:\Users\as\Documents\GitHub\SS\test\新建 Microsoft Word 文档.docx')
