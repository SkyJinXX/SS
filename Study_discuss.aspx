<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Study_discuss.aspx.cs" Inherits="Study_discuss" %>

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
         .b{ color:black; font-size:20px; font-weight:bold;}
       .aa{
 background-color:forestgreen;
            color:white;
            font-family:宋体;
position:absolute;
left:600px;
top:95px
}
 .two
{
position:fixed;
top:30px;
right:5px;
}
    </style>
</head>
<body class="h">
    <form id="form1" runat="server">
    <div>
    <asp:Image ID="Image1" runat="server" Height="117px" Width="200px"  ImageUrl="~/image/1.jpg" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" Text="讨论区" style="position:absolute"  CssClass="abc" ></asp:Label>
        <br />
        <asp:Button ID="Button1" runat="server" Height="70px" style="margin-left: 0px" Text="公告" Width="200px"   cssclass="a" OnClick="Button1_Click1"/>
        <asp:Label ID="Label2" runat="server" Text="欢迎来到讨论区！本讨论区供各位同学就该课程问题进行交流学习。" CssClass="b"></asp:Label>
        <br />
        <asp:Button ID="Button2" runat="server" Height="70px" Text="课件学习" Width="200px"  cssclass="a" OnClick="Button2_Click1"/>
        <asp:TextBox ID="TextBox1" runat="server" Height="30px" Width="574px"></asp:TextBox>
        <br />
        <asp:Button ID="Button3" runat="server" Height="70px" Text="测验与作业" Width="200px"  cssclass="a" OnClick="Button3_Click"/>
        
        <asp:Button ID="Button8" runat="server" Text="发起主题" Height="50px" Width="100px" OnClick="Button8_Click"/>
        
        <br />
        <asp:Button ID="Button4" runat="server" Height="70px" Text="考试" Width="200px"  cssclass="a" OnClick="Button4_Click"/>      
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="Uusername" HeaderText="用户名" />
                <asp:BoundField DataField="Umessage" HeaderText="发言内容" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:Button ID="Button5" runat="server"  Height="70px" Text="讨论区" Width="200px" cssclass="a" />
        <br />
        <asp:Button ID="Button7" runat="server" Text="返回"  Height="70px"  Width="200px"  cssclass="a" OnClick="Button7_Click"/>
        <br />
    </div>
        <br />
        <br />
        <br />
    </form>
</body>
</html>