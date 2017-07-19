<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Study_test.aspx.cs" Inherits="Study_test" %>

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
         .p1{
            background-color:forestgreen;
            color:white;
            font-family:宋体;
        }
        .b {
            font-size:20px; font-weight:bold
        }
        .h {background-color:lightgoldenrodyellow}
       .aa{
 background-color:forestgreen;
            color:white;
            font-family:宋体;
position:absolute;
left:600px;
top:95px
}
    </style>
</head>
<body class="h">
    <form id="form1" runat="server">
    <div>
    <asp:Image ID="Image1" runat="server" Height="117px" Width="200px"  ImageUrl="~/image/1.jpg" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" Text="第一章"  cssclass="b"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="作业测试"  CssClass="aa" Height="50" Width="150" />
        &nbsp;&nbsp;
        <br />
        <asp:Button ID="Button1" runat="server" Height="70px" style="margin-left: 0px" Text="公告" Width="200px" OnClick="Button1_Click"  cssclass="a"/>
        <br />
        <asp:Button ID="Button2" runat="server" Height="70px" Text="课件学习" Width="200px" OnClick="Button2_Click" cssclass="a"/>
        <br />
        <asp:Button ID="Button3" runat="server" Height="70px" Text="测验与作业" Width="200px" OnClick="Button3_Click" cssclass="a"/>
        <br />
        <asp:Button ID="Button4" runat="server" Height="70px" Text="考试" Width="200px" OnClick="Button4_Click" cssclass="a"/>
        <br />
        <asp:Button ID="Button5" runat="server"  Height="70px" Text="讨论区" Width="200px" cssclass="a" />
        <br />
        <asp:Button ID="Button7" runat="server" Text="返回"  Height="70px"  Width="200px" OnClick="Button7_Click" cssclass="a"/>
        <br />
    </div>
    </form>
</body>
</html>
