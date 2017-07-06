<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Study_notice.aspx.cs" Inherits="Study_notice" %>

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
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" Text="公告"></asp:Label>
        <br />
        <asp:Button ID="Button1" runat="server" Height="36px" style="margin-left: 0px" Text="公告" Width="166px" />
        这是一个公告！！！！！！！！！！！！！！！！！！！！！！！！<br />
        <asp:Button ID="Button2" runat="server" Height="36px" Text="课件学习" Width="166px" OnClick="Button2_Click" />
        <br />
        <asp:Button ID="Button3" runat="server" Height="36px" Text="测验与作业" Width="166px" OnClick="Button3_Click1" />
        <br />
        <asp:Button ID="Button4" runat="server" Height="36px" Text="考试" Width="166px" />
        <br />
        <asp:Button ID="Button5" runat="server"  Height="36px" Text="讨论区" Width="166px" />
        <br />
        <br />
    </div>
    </form>
</body>
</html>
