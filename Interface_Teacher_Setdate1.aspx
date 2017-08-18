<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Interface_Teacher_Setdate1.aspx.cs" Inherits="Interface_Teacher_Setdate1" %>

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
                <asp:Button ID="Button1" runat="server"  Text=" 注销 " BackColor="#3399FF" BorderColor="Black" BorderStyle="Dotted" BorderWidth="1px" OnClick="Button1_Click" style="height: 25px" />
            </p>
        </div>
        <div id="globllink">
            <ul>
                <li class="li_1"><a><asp:Button ID="Button2" runat="server" Width="100px" Text="公告" OnClick="Button2_Click" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" /></a></li>
                <li class="li_1"><a><asp:Button ID="Button3" runat="server" Width="100px" Text="个人信息修改" OnClick="Button3_Click" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" /></a></li>
                <li class="li_1"><a><asp:Button ID="Button4" runat="server" Width="100px" Text="课程管理" OnClick="Button4_Click" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" /></a></li>
                <li class="li_1"><a><asp:Button ID="Button5" runat="server" Width="100px" Text="设置考试时间" OnClick="Button5_Click" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" /></a></li>
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
                <asp:TextBox ID="TextBox1" runat="server" Height="24px" Width="487px"></asp:TextBox>
                <br />
                <br />
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button6" runat="server"  Text="设置" OnClick="Button6_Click" />
            </div>
        </div>
    </form>
</body>
</html>