<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Study_exam.aspx.cs" Inherits="Study_exam" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <asp:Image ID="Image1" runat="server" Height="117px" Width="164px"  ImageUrl="~/image/1.jpg" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="进入考试" />
        &nbsp;&nbsp;
        <br />
        <asp:Button ID="Button1" runat="server" Height="36px" style="margin-left: 0px" Text="公告" Width="166px" OnClick="Button1_Click"  />
        <br />
        <asp:Button ID="Button2" runat="server" Height="36px" Text="课件学习" Width="166px" OnClick="Button2_Click" />
        <br />
        <asp:Button ID="Button3" runat="server" Height="36px" Text="测验与作业" Width="166px" OnClick="Button3_Click" />
        <br />
        <asp:Button ID="Button4" runat="server" Height="36px" Text="考试" Width="166px" OnClick="Button4_Click" />
        <br />
        <asp:Button ID="Button5" runat="server"  Height="36px" Text="讨论区" Width="166px" />
        <br />
        <asp:Button ID="Button7" runat="server" Text="返回"  Height="36px"  Width="166px" OnClick="Button7_Click" />
        <br />
    </div>
    </form>
</body>
</html>
