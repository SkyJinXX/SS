<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Study_notice.aspx.cs" Inherits="Study_notice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="web_style/Study_notice.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
        <div id="top">
            <div id="top_image">
                <asp:Image ID="Image1" runat="server" Height="200px" Width="200px" ImageUrl="~/image/1.jpg" />
            </div>
            <div id="announcement_title">
                <asp:Label ID="Label1" runat="server" Width="100px" Text="公告" Font-Size="XX-Large"></asp:Label>
            </div>
        </div>
        <div id="d_body">
            <div id="menu">
                <table id="T_menu">
                    <tr>
                        <th>
                            <asp:Button ID="Button1" runat="server" Height="50px" Width="100px" Text="公告" OnClick="Button1_Click1" />
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Button ID="Button2" runat="server" Height="50px" Width="100px" Text="课件学习" OnClick="Button2_Click" />
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Button ID="Button3" runat="server" Height="50px" Width="100px" Text="作业与测验" OnClick="Button3_Click1" />
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Button ID="Button4" runat="server" Height="50px" Width="100px" Text="考试" OnClick="Button4_Click" />
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Button ID="Button5" runat="server" Height="50px" Width="100px" Text="讨论区" OnClick="Button5_Click" />
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Button ID="Button6" runat="server" Height="50px" Width="100px" Text="返回选课" OnClick="Button6_Click" />
                        </th>
                    </tr>
                </table>
            </div>
            <div id="announcement">
                <asp:Label ID="Label2" runat="server" Text="数据结构是计算机存储、组织数据的方式，指相互之间存在一种或多种特定关系的数据元素的集合。"></asp:Label>
                <asp:Label ID="Label3" runat="server" Text="精心选择的数据结构可以带来更高的运行或存储效率。总之，数据结构对一个好的程序员来说是必须要掌握的。"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
