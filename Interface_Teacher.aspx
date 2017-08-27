﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Interface_Teacher.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="web_style/Interface_Teacher.css" rel="stylesheet" type="text/css" />


    <style type="text/css">
        .auto-style1 {
            width: 97px;
        }
    </style>


</head>
<body>
    <form id="form1" runat="server">
        <div  id="top">
            <p id="top_p_r">
                <font id="font_1">Welcome back!</font>
                <asp:Label ID="Label1" runat="server" ForeColor="#FF9900" float="right"></asp:Label>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text=" 注销 " BackColor="#3399FF" BorderColor="Black" BorderStyle="Dotted" BorderWidth="1px" />
            </p>
        </div>
        <div id="globllink">
            <ul>
                <li class="li_1"><a><asp:Button ID="Button2" runat="server" Width="100px" Text="公告" OnClick="Button2_Click" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" /></a></li>
                <li class="li_1"><a><asp:Button ID="Button3" runat="server" Width="100px" Text="个人信息修改" OnClick="Button3_Click" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" /></a></li>
                <li class="li_1"><a><asp:Button ID="Button4" runat="server" Width="100px" Text="课程管理" OnClick="Button4_Click" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" /></a></li>
                <!---填充导航菜单栏>
                <li><a></a></li>
                <li><a></a></li>
                <li><a></a></li>
                <li><a></a></li>
                <li><a></a></li>
                <li><a></a></li>
                <--->
            </ul>
        </div>
        <div id="middle">
            <div id="T_title">
                <asp:Label ID="Label2" runat="server" Text="系统公告" Font-Size="X-Large"></asp:Label>
            </div>
            <div id="view">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Height="145px" Width="486px">
                    <Columns>
                        <asp:BoundField DataField="Aname" HeaderText="发布人" />
                        <asp:BoundField DataField="A_T_Annou" HeaderText="发布内容" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <div id="footer">

        </div>  
    </form>
</body>
</html>
