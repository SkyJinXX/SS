<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Interface_Student_Menu.aspx.cs" Inherits="Interface_Student_Menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="web_style/Interface_Student_Menu.css" type="text/css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
        <div id="top_menu">
            <div id="user_box">
                <asp:Label ID="Label1" runat="server"></asp:Label>
                <asp:Button ID="Button5" runat="server" Text="注销" />
            </div>
        </div>
        <div id="c_background">
            <canvas id="c"></canvas>
            <script src="JavaScript/geometry.js" type="text/javascript"></script>
        </div>

        <div class="wrapper">
            <div class="holder">
                <div id="menu1">
                    <a href="#" class="animBtn themeA">
                        <asp:Button ID="Button1" runat="server" Text="公告" CssClass="button" OnClick="Button1_Click" /></a>
                </div>
                <div id="menu2">
                    <a href="#" class="animBtn themeB">
                        <asp:Button ID="Button2" runat="server" Text="选课" CssClass="button" OnClick="Button2_Click" /></a>
                </div>
                <div id="menu3">
                    <a href="#" class="animBtn themeC">
                        <asp:Button ID="Button3" runat="server" Text="查询成绩" CssClass="button" OnClick="Button3_Click" /></a>
                </div>
                <div id="menu4">
                    <a href="#" class="animBtn themeD">
                        <asp:Button ID="Button4" runat="server" Text="信息修改" CssClass="button" OnClick="Button4_Click" /></a>
                </div>
            </div>
        </div>
        <div id="d_body">
        </div>
        <div id="footer">
        </div>
    </form>
</body>
</html>
