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
        <div id="globllink">
            <ul>
                <li class="li_1"><a><asp:Button ID="Button1" runat="server" Width="100px" Text="操作管理" OnClick="Button1_Click" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" /></a></li>
                <li class="li_1"><a><asp:Button ID="Button2" runat="server" Width="100px" Text="新管理员注册" OnClick="Button2_Click" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" /></a></li>
                <li class="li_1"><a><asp:Button ID="Button3" runat="server" Width="100px" Text="用户信息管理" OnClick="Button3_Click" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" /></a></li>
                <li class="li_1"><a><asp:Button ID="Button4" runat="server" Width="100px" Text="课程信息管理" OnClick="Button4_Click" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" /></a></li>
                <li class="li_1"><a><asp:Button ID="Button5" runat="server" Width="100px" Text="成绩系统管理" OnClick="Button5_Click" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" /></a></li>
                <li class="li_1"><a><asp:Button ID="Button7" runat="server" Width="100px" Text="个人信息修改" OnClick="Button7_Click" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" /></a></li>
                <!---填充导航菜单栏>
                <li><a></a></li>
                <li><a></a></li>
                <li><a></a></li>
                <--->
            </ul>
        </div>
        <div id="d_body">
            <div id="menu">
                <ul>
                <li><a><asp:Button ID="Button9" runat="server" Width="100px" OnClick="Button9_Click" Text="权限修改" /></a></li>
                <li><a><asp:Button ID="Button10" runat="server" Width="100px" OnClick="Button10_Click" Text="回复留言" /></a></li>
                <li><a><asp:Button ID="Button13" runat="server" Width="100px" OnClick="Button13_Click" Text="返回主界面" /></a></li>
            </ul>
            </div>
            <div id="view">
                <div id="d_title">
                    <asp:Label ID="Label6" runat="server" Text="管理" Font-Size="X-Large"></asp:Label>
                </div>
                <div id="d_message">
                    <asp:GridView ID="GridView1" runat="server" Width="500px" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="Aid" HeaderText="管理员编号" />
                            <asp:BoundField DataField="Aname" HeaderText="管理员姓名" />
                            <asp:BoundField DataField="Asex" HeaderText="性别" />
                            <asp:BoundField DataField="Abirthday" HeaderText="生日" />
                            <asp:BoundField DataField="Aage" HeaderText="年龄" />
                            <asp:BoundField DataField="Alevel" HeaderText="权限" />
                        </Columns>
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
            </div>
        </div>
    </form>
</body>
</html>
