﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Interface_Teacher.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="web_style/Interface_Teacher.css" rel="stylesheet" type="text/css" />


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
                <li class="li_1"><a href="Interface_Teacher.aspx">公告</a></li>
                <li class="li_1"><a href="Interface_Teacher_Change.aspx">个人信息修改</a></li>
                <li class="li_1"><a href="Interface_Teacher_Manage.aspx">课程管理</a></li>
                <li class="li_1"><a href="Interface_Teacher_Setdate.aspx">设置考试时间</a></li>
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
                <asp:Label ID="Label2" runat="server" Text="公告" Font-Size="X-Large"></asp:Label>
            </div>
            <div id="view">
                <asp:GridView ID="GridView1" runat="server" Width="500px" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
                    <Columns>
                        <asp:BoundField DataField="Tmessage" HeaderText="内容" HeaderStyle-Height="50px" ItemStyle-Height="80px" SortExpression="Tmessage">
                            <HeaderStyle Height="50px"></HeaderStyle>
                            <ItemStyle Height="80px" HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <div id="footer">

        </div>  
    </form>
</body>
</html>
