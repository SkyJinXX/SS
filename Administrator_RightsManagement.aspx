<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Administrator_RightsManagement.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="web_style/Administrator_RightsManagement.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
        <div id="top">
            <p id="top_p_r">
                <font id="font_1">Welcome !</font>
                <asp:Label ID="Label1" ForeColor="#FF9900" runat="server"></asp:Label>
                <asp:Button ID="Button8" runat="server" OnClick="Button8_Click" Text=" 注销 " />
            </p>
        </div>
        <div id="d_menu_1">
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
        <div id="d_menu_2">
            <table>
                <tr>
                    <td>
                        <asp:Button ID="Button9" runat="server" Width="100px" OnClick="Button9_Click" Text="权限修改" />
                    </td>
                    <td>
                        <asp:Button ID="Button10" runat="server" Width="100px" OnClick="Button10_Click" Text="回复留言" />
                    </td>
                    <td>
                        <asp:Button ID="Button13" runat="server" Width="100px" OnClick="Button13_Click" Text="返回主界面" />
                    </td>
                    <td>
                        <asp:Label ID="Label4" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label5" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <div id="d_title">
            <asp:Label ID="Label6" runat="server" Text="管理" Font-Size="X-Large"></asp:Label>
        </div>
        <div id="d_message">
            <asp:GridView ID="GridView1" runat="server" Width="800px">
                <RowStyle HorizontalAlign="Center" />
            </asp:GridView>
        </div>
        <div id="operating">
            <table id="T_1">
                <tr>
                    <th>
                        <asp:Label ID="Label2" runat="server" Enabled="False" Text="管理员工号:" Visible="False"></asp:Label>
                    </th>
                    <th>
                        <asp:TextBox ID="TextBox1" runat="server" Width="300px" Height="20px" Visible="False"></asp:TextBox>
                    </th>
                    <th>
                        <asp:Button ID="Button11" runat="server" Text=" 搜索 " OnClick="Button11_Click" Visible="False" />
                    </th>
                </tr>
                <tr>
                    <th>&nbsp</th>
                    <th>&nbsp</th>
                    <th>&nbsp</th>
                </tr>
                <tr>
                    <th>
                        <asp:Label ID="Label3" runat="server" Visible="False"></asp:Label>
                    </th>
                    <th>
                        <asp:TextBox ID="TextBox3" runat="server" Width="300px" Height="20px" Visible="False"></asp:TextBox>
                    </th>
                    <th>
                        <asp:Button ID="Button12" runat="server" Text=" 修改 " OnClick="Button12_Click" Visible="False" />
                    </th>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
