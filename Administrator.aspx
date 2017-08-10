﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Administrator.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="web_style/Administrator.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
        <div  id="top">
            <p id="top_p_r">
                <font id="font_1">Welcome!</font>
                <asp:Label ID="Label1" runat="server" ForeColor="#FF9900" float="right"></asp:Label>
                <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text=" 注销 " />
            </p>
        </div>
        <div id="d_menu">
            <table>
                <tr>
                    <td>
                        <asp:Button ID="Button1" runat="server" Width="100px" Text="操作管理" OnClick="Button1_Click" />
                    </td>
                    <td>
                        <asp:Button ID="Button2" runat="server" Width="100px" Text="新管理员注册" OnClick="Button2_Click" />
                    </td>
                    <td>
                        <asp:Button ID="Button3" runat="server" Width="100px" Text="用户信息管理" OnClick="Button3_Click" />
                    </td>
                    <td>
                        <asp:Button ID="Button4" runat="server" Width="100px" Text="课程信息管理" OnClick="Button4_Click" />
                    </td>
                    <td>
                        <asp:Button ID="Button5" runat="server" Width="100px" Text="成绩系统管理" OnClick="Button5_Click" />
                    </td>
                    <td>
                        <asp:Button ID="Button7" runat="server" Width="100px" Text="个人信息修改" OnClick="Button7_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="d_title">
            <asp:Label ID="Label2" runat="server" Text="信息公告" Font-Size="X-Large"></asp:Label>
        </div>
        <div id="d_message">
            <asp:GridView ID="GridView1" runat="server" Height="300px" Width="800px" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="Aname1" HeaderText="管理员A" />
                    <asp:BoundField DataField="Aname2" HeaderText="管理员B" />
                    <asp:BoundField DataField="A2A_Message" HeaderText="留言信息" />
                    <asp:BoundField DataField="A2A_Action" HeaderText="权限操作" />
                </Columns>
                <RowStyle HorizontalAlign="Center" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
