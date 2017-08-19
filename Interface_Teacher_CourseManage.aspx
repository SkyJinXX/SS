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
            <div id="d_message">
                <table id="T_1">
                    <tr>
                        <th style="width: 50px;">&nbsp;
                        </th>
                        <th style="width: 50px;">&nbsp;
                        </th>
                        <th>
                            <asp:Label ID="Label8" runat="server" Text="信息修改" Font-Size="X-Large"></asp:Label>
                        </th>
                        <th style="width: 50px;">&nbsp;
                        </th>
                        <th style="width: 50px;">&nbsp;
                        </th>
                    </tr>
                </table>
                <table id="T_2">
                    <tr>
                        <th>
                            <asp:Label ID="Label2" runat="server" Text="课程号:"></asp:Label>
                        </th>
                        <th>
                            <asp:TextBox ID="TextBox1" runat="server" Enabled="False"></asp:TextBox>
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Label ID="Label3" runat="server" Text="课程名:"></asp:Label>
                        </th>
                        <th>
                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Label ID="Label4" runat="server" Text="学分:"></asp:Label>
                        </th>
                        <th>
                            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Label ID="Label5" runat="server" Text="人数:"></asp:Label>
                        </th>
                        <th>
                            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Label ID="Label6" runat="server" Text="类别:"></asp:Label>
                        </th>
                        <th>
                            <asp:DropDownList ID="DropDownList1" runat="server" Height="33px" style="margin-left: 0px" Width="109px">
                        <asp:ListItem Value="办公效率">办公效率</asp:ListItem>
                        <asp:ListItem Value="编程开发">编程开发</asp:ListItem>
                        <asp:ListItem Value="产品和设计">产品和设计</asp:ListItem>
                        <asp:ListItem Value="生活方式">生活方式</asp:ListItem>
                        <asp:ListItem Value="职业发展">职业发展</asp:ListItem>
                        <asp:ListItem Value="市场营销">市场营销</asp:ListItem>
                        <asp:ListItem Value="技能特长">技能特长</asp:ListItem>
                        <asp:ListItem Value="人文社会">人文社会</asp:ListItem>
                        <asp:ListItem Value="艺术发展">艺术发展</asp:ListItem>
                    </asp:DropDownList>
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Label ID="Label7" runat="server" Text="课程简介:"></asp:Label>
                        </th>
                        <th>
                            <asp:TextBox ID="TextBox6" runat="server" Height="170px" TextMode="MultiLine" Width="200px"></asp:TextBox>
                        </th>
                    </tr>
                </table>
                <table id="T_3">
                    <tr>
                        <th>&nbsp;
                        </th>
                        <th>
                            <asp:Button ID="Button7" runat="server" Text="完成修改" OnClick="Button7_Click" />
                        </th>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</body>
</html>
