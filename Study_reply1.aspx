<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Study_reply1.aspx.cs" Inherits="Study_reply1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="web_style/Study.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
        <div id="top">
            <div id="top_image">
                <asp:Image ID="Image1" runat="server" Height="200px" Width="200px" ImageUrl="~/image/1.jpg" />
            </div>
        &nbsp;
            <br />
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox1" runat="server" Height="167px" Width="440px"></asp:TextBox>
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button7" runat="server" Text="回复" OnClick="Button7_Click" />
        </div>
        <div id="d_body">
            <div id="menu">
                <table id="T_menu">
                    <tr>
                        <th>
                            <asp:Button ID="Button1" runat="server" Height="50px" Width="100px" Text="公告" OnClick="Button1_Click"  />
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Button ID="Button2" runat="server" Height="50px" Width="100px" Text="课件学习" OnClick="Button2_Click"  />
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Button ID="Button3" runat="server" Height="50px" Width="100px" Text="作业与测验" OnClick="Button3_Click"  />
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Button ID="Button4" runat="server" Height="50px" Width="100px" Text="考试" OnClick="Button4_Click"  />
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Button ID="Button5" runat="server" Height="50px" Width="100px" Text="讨论区" OnClick="Button5_Click"  />
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Button ID="Button8" runat="server" Height="50px" Width="100px" Text="进度排行" OnClick="Button8_Click"  />
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Button ID="Button6" runat="server" Height="50px" Width="100px" Text="返回选课" OnClick="Button6_Click"  />
                        </th>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</body>
</html>
