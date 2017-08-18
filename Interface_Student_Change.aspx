<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Interface_Student_Change.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="web_style/Interface_Student_Change.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="top">
            <p id="top_p_r">
                <asp:Label ID="Label1" runat="server" Text="用户名:" ForeColor="#FF9900"></asp:Label>
                <asp:Label ID="Label2" runat="server" ForeColor="#FF9900"></asp:Label>
                <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text=" 注销 " BackColor="#3399FF" BorderColor="Black" BorderStyle="Dotted" BorderWidth="1px" />
            </p>
        </div>
        <div id="globllink">
            <ul>
                <li class="li_1"><a href="Interface_Student_Announcement.aspx">公告</a></li>
                <li class="li_1"><a href="Interface_Student.aspx">选课</a></li>
                <li class="li_1"><a href="Interface_Student_Select.aspx">查询成绩</a></li>
                <li class="li_1"><a href="Interface_Student_Change.aspx">信息修改</a></li>
                <!---填充导航菜单栏>
                <li><a></a></li>
                <li><a></a></li>
                <li><a></a></li>
                <li><a></a></li>
                <li><a></a></li>
                <--->
            </ul>
        </div>
        <div id="d_body">
            <div id="d_message">
                <p class="p2_1"></p>
                <table>
                    <tr>
                        <th style="width: 100px;">&nbsp;
                        </th>
                        <th style="width: 40px;">&nbsp;
                        </th>
                        <th>
                            <asp:Label ID="Label8" runat="server" Text="个人信息" Font-Size="X-Large"></asp:Label>
                        </th>
                        <th style="width: 50px;">&nbsp;
                        </th>
                        <th style="width: 50px;">&nbsp;
                        </th>
                    </tr>
                </table>
                <p class="p2_1"></p>
                <table id="T_1">
                    <tr>
                        <th style="width: 100px;">&nbsp;
                        </th>
                        <th style="width: 100px;">
                            <asp:Label ID="Label3" runat="server" Text="姓名:"></asp:Label>
                        </th>
                        <th style="width: 100px;">
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </th>
                        <th style="width: 100px;">&nbsp;
                        </th>
                    </tr>
                    <tr>
                        <th style="width: 100px;">&nbsp;
                        </th>
                        <th style="width: 100px;">
                            <asp:Label ID="Label5" runat="server" Text="专业:"></asp:Label>
                        </th>
                        <th style="width: 100px;">
                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        </th>
                        <th style="width: 100px;">&nbsp;
                        </th>
                    </tr>
                    <tr>
                        <th style="width: 100px;">&nbsp;
                        </th>
                        <th style="width: 100px;">
                            <asp:Label ID="Label6" runat="server" Text="班级:"></asp:Label>
                        </th>
                        <th style="width: 100px;">
                            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                        </th>
                        <th style="width: 100px;">&nbsp;
                        </th>
                    </tr>
                    <tr>
                        <th style="width: 100px;">&nbsp;
                        </th>
                        <th style="width: 100px;">
                            <asp:Label ID="Label7" runat="server" Text="联系方式:"></asp:Label>
                        </th>
                        <th style="width: 100px;">
                            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        </th>
                        <th style="width: 100px;">&nbsp;
                        </th>
                    </tr>
                </table>
                <p class="p2_1"></p>
                <table id="T_2">
                    <tr>
                        <th style="width: 100px;">&nbsp;
                        </th>
                        <th style="width: 100px;">&nbsp;
                        </th>
                        <th>
                            <asp:Button ID="Button4" runat="server" Text="保存" OnClick="Button4_Click" Width="50px" Height="25px" Font-Size="Small" />
                        </th>
                        <th>
                            <asp:Button ID="Button5" runat="server" Text="返回" OnClick="Button5_Click" Width="50px" Height="25px" Font-Size="Small" />
                        </th>
                        <th style="width: 100px;">&nbsp;
                        </th>
                        <th style="width: 100px;">&nbsp;
                        </th>
                    </tr>
                </table>
            </div>
        </div>
        <div id="footer">
            
        </div>
    </form>
</body>
</html>
