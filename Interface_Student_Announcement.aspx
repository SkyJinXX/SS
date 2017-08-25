﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Interface_Student_Announcement.aspx.cs" Inherits="announcement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="web_style/Interface_Student_Announcement.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
        <div id="top">
            <p id="top_p_r">
                <asp:Label ID="Label1" runat="server" Text="用户名:" ForeColor="#FF9900"></asp:Label>
                <asp:Label ID="Label2" runat="server" ForeColor="#FF9900"></asp:Label>
                <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text=" 注销 " BackColor="#3399FF" BorderColor="Black" BorderStyle="Dotted" BorderWidth="1px" Style="height: 19px" />
            </p>
        </div>
        <div id="globllink">
            <ul>
                <li class="li_1"><a href="Interface_Student_Announcement.aspx">公告</a></li>
                <li class="li_1"><a href="Interface_Student.aspx">选课</a></li>
                <li class="li_1"><a href="Interface_Student_Select.aspx">查询成绩</a></li>
                <li class="li_1"><a href="Interface_Student_Change.aspx">信息修改</a></li>
                <!---填充导航菜单栏>
                <li><a></a></li>
                <li><a></a></li>
                <li><a></a></li>
                <li><a></a></li>
                <li><a></a></li>
                <--->
            </ul>
        </div>
        <div >
            <div >
                <asp:Label ID="Label3" runat="server" Text="课程公告：" Font-Size="X-Large"></asp:Label>
            </div>
            <div >
                <asp:GridView ID="GridView1" Width="300px" runat="server" AutoGenerateColumns="False" Height="16px">
                    <Columns>
                        <asp:BoundField DataField="Cid" HeaderText="课程" />
                        <asp:BoundField DataField="Crelease" HeaderText="内容" HeaderStyle-Height="50px" ItemStyle-Height="80px">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
                <asp:Label ID="Label4" runat="server" Text="系统公告："></asp:Label>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" Height="100px" Width="400px">
                    <Columns>
                        <asp:BoundField DataField="Aname" HeaderText="发布人" />
                        <asp:BoundField DataField="A_S_Annou" HeaderText="发布内容" />
                    </Columns>
                </asp:GridView>
                <br />
                <br />
                <br />
            </div>
        </div>
        <div id="footer">

        </div>  
    </form>
</body>
</html>
