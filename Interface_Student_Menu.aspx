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
                <asp:Button ID="Button5" runat="server" Text="注销" OnClick="Button5_Click" />
            </div>
        </div>
        <div id="c_background">
            <canvas id="c"></canvas>
            <script src="JavaScript/geometry.js" type="text/javascript"></script>
        </div>
        <div id="welcome">
            <asp:Label ID="Label2" runat="server" Text="Welcome" Font-Size="XX-Large" ForeColor="#ffffcc"></asp:Label>
            <div id="dowm_arrow">
            </div>
        </div>
        <div class="wrapper">
            <div id="left">
                <div class="T_title">
                    <asp:Label ID="Label3" runat="server" Text="课程公告" Font-Size="X-Large" ForeColor="#ffffcc"></asp:Label>
                </div>
                <div class="view">
                    <asp:GridView ID="GridView1" Width="380px" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="Cid" HeaderText="课程" />
                            <asp:BoundField DataField="Crelease" HeaderText="内容" HeaderStyle-Height="50px" ItemStyle-Height="70px">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <div id="right">
                <div class="T_title">
                    <asp:Label ID="Label4" runat="server" Text="系统公告" Font-Size="X-Large" ForeColor="#ffffcc"></asp:Label>
                </div>
                <div class="view">

                    <asp:GridView ID="GridView2" Width="380px" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="Aname" HeaderText="发布人" />
                            <asp:BoundField DataField="A_S_Annou" HeaderText="发布内容" HeaderStyle-Height="50px" ItemStyle-Height="70px"/>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
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
