﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Interface_Teacher_Setdate.aspx.cs" Inherits="Interface_Teacher_Setdate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="web_style/Interface_Teacher_SM.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
        <div  id="top">
            <p id="top_p_r">
                <font id="font_1">Welcome back!</font>
                <asp:Label ID="Label1" runat="server" ForeColor="#FF9900" float="right"></asp:Label>
                <asp:Button ID="Button1" runat="server"  Text=" 注销 " BackColor="#3399FF" BorderColor="Black" BorderStyle="Dotted" BorderWidth="1px" OnClick="Button1_Click" />
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
            <div id="d_message">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="496px">
                    <Columns>
                        <asp:BoundField DataField="Cid" HeaderText="课程号" />
                        <asp:BoundField DataField="Cname" HeaderText="课程名" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="Cancel" OnClick="LinkButton1_Click" Text="设置考试时间"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <br />
                <br />
                <br />
&nbsp;&nbsp;&nbsp;
                <br />
                <br />
            </div>
        </div>
    </form>
</body>
</html>