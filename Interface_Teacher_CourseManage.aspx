<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Interface_Teacher_CourseManage.aspx.cs" Inherits="Interface_Teacher_CourseManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="web_style/Administrator_RightsManagement.css" rel="stylesheet" type="text/css" />
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
        <div id="d_body">
            <div id="box">
                <div id="menu">
                    <ul>
                        <li><a>
                            <asp:Button ID="Button2" runat="server" Width="100px" OnClick="Button2_Click" Text="成绩管理" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" /></a></li>
                        <li><a>
                            <asp:Button ID="Button3" runat="server" Width="100px" OnClick="Button3_Click" Text="公告管理" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" /></a></li>
                        <li><a>
                            <asp:Button ID="Button4" runat="server" Width="100px" OnClick="Button4_Click" Text="考试管理" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" /></a></li>
                        <li><a>
                            <asp:Button ID="Button5" runat="server" Width="100px" OnClick="Button5_Click" Text="章节管理" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" /></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
