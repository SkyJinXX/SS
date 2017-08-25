<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Administrator_announcement.aspx.cs" Inherits="Administrator_announcement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="web_style/Administrator_announcement.css" rel="stylesheet" type="text/css" />
    
    
</head>
<body>
    <form id="form1" runat="server">
        <div  id="top">
            <p id="top_p_r">
                <font id="font_1">Welcome!</font>
                <asp:Label ID="Label1" runat="server" ForeColor="#FF9900" float="right"></asp:Label>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text=" 注销 " />
            </p>
        </div>
        <div id="globllink">
            <ul>
                <li class="li_1"><a><asp:Button ID="Button8" runat="server" Width="100px" Text="操作管理" OnClick="Button8_Click" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" /></a></li>
                <li class="li_1"><a><asp:Button ID="Button9" runat="server" Width="100px" Text="新管理员注册" OnClick="Button9_Click" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" /></a></li>
                <li class="li_1"><a><asp:Button ID="Button10" runat="server" Width="100px" Text="用户信息管理" OnClick="Button10_Click" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" /></a></li>
                <li class="li_1"><a><asp:Button ID="Button11" runat="server" Width="100px" Text="课程信息管理" OnClick="Button11_Click" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" /></a></li>
                <li class="li_1"><a><asp:Button ID="Button12" runat="server" Width="100px" Text="成绩系统管理" OnClick="Button12_Click" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" /></a></li>
                <li class="li_1"><a><asp:Button ID="Button13" runat="server" Width="100px" Text="个人信息修改" OnClick="Button13_Click" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" /></a></li>
                <li class="li_1"><a><asp:Button ID="Button14" runat="server" Width="100px" Text="公告发布" OnClick="Button14_Click" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" /></a></li>
                <!---填充导航菜单栏>
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
                            <asp:Button ID="Button2" runat="server" Text="全体管理员" OnClick="Button2_Click" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" /></a></li>
                        <li><a>
                            <asp:Button ID="Button3" runat="server" Text="全体教师" OnClick="Button3_Click" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" /></a></li>
                        <li><a>
                            <asp:Button ID="Button4" runat="server" Text="全体学生" OnClick="Button4_Click" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" /></a></li>
                        <li><a>
                            <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="返回" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" /></a></li>
                    </ul>
                </div>
            </div>
            <div class="title">
                <asp:Label ID="Label2" runat="server" Visible="False"></asp:Label>
            </div>
            <div id="d_body_1">
                <div id="T_A">
                    <asp:GridView ID="GridView1" runat="server" Width="400px" AutoGenerateColumns="False" Visible="False">
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:CheckBox runat="server" ID="cbHead" Text="全选" OnCheckedChanged="GridView1_SelectAll" AutoPostBack="true" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Aid" HeaderText="工号" ReadOnly="True" />
                            <asp:BoundField DataField="Aname" HeaderText="姓名" />
                            <asp:BoundField DataField="Asex" HeaderText="性别" />
                            <asp:BoundField DataField="Abirthday" HeaderText="出生日期" />
                        </Columns>
                    </asp:GridView>
                </div>
                <div id="T_T">
                    <asp:GridView ID="GridView2" runat="server" Width="600px" Visible="False" AutoGenerateColumns="False">
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:CheckBox runat="server" ID="cbHead" Text="全选" OnCheckedChanged="GridView2_SelectAll" AutoPostBack="true" />
                                </HeaderTemplate>
                                <EditItemTemplate>
                                    <asp:CheckBox ID="CheckBox2" runat="server" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Tid" HeaderText="工号" />
                            <asp:BoundField DataField="Tname" HeaderText="姓名" />
                            <asp:BoundField DataField="Tsex" HeaderText="性别" />
                            <asp:BoundField DataField="Tbirthday" HeaderText="出生日期" />
                            <asp:BoundField DataField="Tprofession" HeaderText="授课专业" />
                            <asp:BoundField DataField="Tphone" HeaderText="联系方式" />
                        </Columns>
                    </asp:GridView>
                </div>
                <div id="T_S">
                    <asp:GridView ID="GridView3" runat="server" Width="700px" Visible="False" AutoGenerateColumns="False">
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:CheckBox runat="server" ID="cbHead" Text="全选" OnCheckedChanged="GridView3_SelectAll" AutoPostBack="true" />
                                </HeaderTemplate>
                                <EditItemTemplate>
                                    <asp:CheckBox ID="CheckBox2" runat="server" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Sid" HeaderText="学号" />
                            <asp:BoundField DataField="Sname" HeaderText="姓名" />
                            <asp:BoundField DataField="Ssex" HeaderText="性别" />
                            <asp:BoundField DataField="Sbirthday" HeaderText="出生日期" />
                            <asp:BoundField DataField="Sage" HeaderText="年龄" />
                            <asp:BoundField DataField="Sschool" HeaderText="所在学校" />
                            <asp:BoundField DataField="Scollege" HeaderText="隶属学院" />
                            <asp:BoundField DataField="Smajor" HeaderText="专业" />
                            <asp:BoundField DataField="Sphone" HeaderText="联系方式" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <div class="title">
                <asp:Label ID="Label3" runat="server" Text="公告内容：" Visible="False"></asp:Label>
            </div>
            <div id="box_1">
                <asp:TextBox ID="TextBox1" runat="server" Height="100px" Width="400px" TextMode="MultiLine" Visible="False"></asp:TextBox>
            </div>
            <div id="fabu">
                <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="发布" Width="57px" Visible="False" />
            </div>
        </div>
    </form>
</body>
</html>
