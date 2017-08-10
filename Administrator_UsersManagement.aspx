<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Administrator_UsersManagement.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="web_style/Administrator_UsersManagement.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
        <div id="top">
            <p id="top_p_r">
                <font id="font_1">Welcome !</font>
                <asp:Label ID="Label1" ForeColor="#FF9900" runat="server"></asp:Label>
                <asp:Button ID="Button13" runat="server" OnClick="Button13_Click" Text=" 注销 " />
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
                        <asp:Button ID="Button6" runat="server" Width="100px" Text="个人信息修改" OnClick="Button7_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="d_menu_2">
            <table>
                <tr>
                    <td>
                        <asp:Button ID="Button7" runat="server" OnClick="Button7_Click" Text="学生表" />
                    </td>
                    <td>
                        <asp:Button ID="Button8" runat="server" OnClick="Button8_Click" Text="教师表" />
                    </td>
                    <td>
                        <asp:Button ID="Button9" runat="server" OnClick="Button9_Click" Text="管理员表" />
                    </td>
                    <td>
                        <asp:Button ID="Button11" runat="server" OnClick="Button11_Click" Text="返回主界面" />
                    </td>
                    <td>
                        <asp:Label ID="Label3" runat="server" Enabled="False" Visible="False"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <div id="search">
            <asp:Label ID="Label2" runat="server" Text="工号 "></asp:Label>
            <asp:TextBox ID="TextBox1" Width="500px" Height="17px" runat="server"></asp:TextBox>
            <asp:Button ID="Button10" runat="server" OnClick="Button10_Click" Text="搜索" />
        </div>
        <div id="d_body">
            <div id="T_U">
                <asp:GridView ID="GridView1" runat="server" Width="300px" AutoGenerateColumns="False" Style="margin-right: 0px">
                    <Columns>
                        <asp:BoundField DataField="Uusername" HeaderText="用户名" />
                        <asp:BoundField DataField="Upassword" HeaderText="密码" Visible="False" />
                        <asp:BoundField DataField="Uidentity" HeaderText="身份" />
                    </Columns>
                    <RowStyle HorizontalAlign="Center" />
                </asp:GridView>
            </div>
            <div id="T_S">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" Width="1000px">
                    <Columns>
                        <asp:BoundField DataField="Sid" HeaderText="学生工号" />
                        <asp:BoundField DataField="Sname" HeaderText="姓名" />
                        <asp:BoundField DataField="Ssex" HeaderText="性别" />
                        <asp:BoundField DataField="Sbirthday" HeaderText="生日" />
                        <asp:BoundField DataField="Sage" HeaderText="年龄" />
                        <asp:BoundField DataField="Sschool" HeaderText="所在学校" />
                        <asp:BoundField DataField="Scollege" HeaderText="隶属学院" />
                        <asp:BoundField DataField="Smajor" HeaderText="专业" />
                        <asp:BoundField DataField="Sphone" HeaderText="联系电话" />
                        <asp:BoundField DataField="Uusername" HeaderText="用户名" />
                        <asp:BoundField DataField="Upassword" HeaderText="密码" Visible="False" />
                        <asp:BoundField DataField="Uidentity" HeaderText="身份" />
                    </Columns>
                    <RowStyle HorizontalAlign="Center" />
                </asp:GridView>
            </div>
        </div>
        <div id="T_T">
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" Width="800px">
                <Columns>
                    <asp:BoundField DataField="Tid" HeaderText="教师工号" />
                    <asp:BoundField DataField="Tname" HeaderText="姓名" />
                    <asp:BoundField DataField="Tsex" HeaderText="性别" />
                    <asp:BoundField DataField="Tbirthday" HeaderText="生日" />
                    <asp:BoundField DataField="Tprofession" HeaderText="专业" />
                    <asp:BoundField DataField="Tphone" HeaderText="联系电话" />
                    <asp:BoundField DataField="Uusername" HeaderText="用户名" />
                    <asp:BoundField DataField="Upassword" HeaderText="密码" Visible="False" />
                    <asp:BoundField DataField="Uidentity" HeaderText="身份" />
                </Columns>
                <RowStyle HorizontalAlign="Center" />
            </asp:GridView>
        </div>
        <div id="T_A">
            <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="Aid" HeaderText="管理员工号" />
                <asp:BoundField DataField="Aname" HeaderText="姓名" />
                <asp:BoundField DataField="Asex" HeaderText="性别" />
                <asp:BoundField DataField="Abirthday" HeaderText="生日" />
                <asp:BoundField DataField="Aage" HeaderText="年龄" />
                <asp:BoundField DataField="Alevel" HeaderText="权限等级" />
                <asp:BoundField DataField="Uusername" HeaderText="用户名" />
                <asp:BoundField DataField="Upassword" HeaderText="密码" Visible="False" />
                <asp:BoundField DataField="Uidentity" HeaderText="身份" />
            </Columns>
            <RowStyle HorizontalAlign="Center" />
        </asp:GridView>
        </div>
        <div id="reset_password">
            <asp:Button ID="Button12" runat="server" OnClick="Button12_Click" Text="重置密码" />
        </div>
    </form>
</body>
</html>
