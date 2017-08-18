<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Interface_Teacher_Test.aspx.cs" Inherits="Interface_Teacher_Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    
    <div id="top">
            <p id="top_p_r">
                <font id="font_1">Welcome back!</font>
                <asp:Label ID="Label1" ForeColor="#FF9900" runat="server"></asp:Label>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text=" 注销 " BackColor="#3399FF" BorderColor="Black" BorderStyle="Dotted" BorderWidth="1px" />
            </p>
        </div>
        <div id="globllink">
            <ul>
                <li class="li_1"><a href="Interface_Teacher.aspx">公告</a></li>
                <li class="li_1"><a href="Interface_Teacher_Change.aspx">个人信息修改</a></li>
                <li class="li_1"><a href="Interface_Teacher_Manage.aspx">课程管理</a></li>
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
    </form>
</body>
</html>
