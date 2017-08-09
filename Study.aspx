<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Study.aspx.cs" Inherits="Study" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        p.normal {font-weight: normal}
        p.thick {font-weight: bold}
        p.thicker {font-weight: 900}
        .abc{ color:red; font-size:30px; font-weight:bold;}
        .a {font-weight: 900;font-size:20px }
        .h {background-color:lightgoldenrodyellow}
    </style>
</head>
<body class="h">
    <form id="form1" runat="server">
    <div>
        <asp:Image ID="Image1" runat="server" Height="117px" Width="200px"  ImageUrl="~/image/1.jpg" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <asp:Button ID="Button1" runat="server" Height="70px" style="margin-left: 0px" Text="公告" Width="200px" OnClick="Button1_Click1" cssclass="a" />
        <br />
        <asp:Button ID="Button2" runat="server" Height="70px" Text="课件学习" Width="200px" OnClick="Button2_Click1" cssclass="a"/>
        <br />
        <asp:Button ID="Button3" runat="server" Height="70px" Text="作业与测验" Width="200px" OnClick="Button3_Click" cssclass="a"/>
        <br />
        <asp:Button ID="Button4" runat="server" Height="70px" Text="考试" Width="200px" OnClick="Button4_Click" cssclass="a"/>
        <br />
        <asp:Button ID="Button5" runat="server"  Height="70px" Text="讨论区"  Width="200px" cssclass="a" OnClick="Button5_Click"/>
        <br />
        <asp:Button ID="Button6" runat="server" Text="返回"  Height="70px"  Width="200px" OnClick="Button6_Click" cssclass="a" />
        <br />
    
    </div>
    </form>
</body>
</html>
