<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Interface_Student.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="web_style/Interface_Student.css" rel="stylesheet" type="text/css" />

    
</head>
<body>
    <form id="form1" runat="server">
        <div id="top">
            <p id="top_p_r">
                <asp:Label ID="Label1" runat="server" Text="用户名:" ForeColor="#FF9900"></asp:Label>
                <asp:Label ID="Label2" runat="server" ForeColor="#FF9900"></asp:Label>
                <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text=" 注销 " BackColor="#3399FF" BorderColor="Black" BorderStyle="Dotted" BorderWidth="1px" />
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
        <div id="d_search">
            <table>
                <tr>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="寻找课程：" Font-Size="Large"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style11" Width="400px" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="搜索" />
                    </td>
                </tr>
            </table>
        </div>
        <p>
        </p>
        <div id="d_course">
            <table class="T">
                <tr>
                    <td>
                        <asp:Label ID="Label8" runat="server" Text="已开课程" Font-Size="X-Large"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField DataField="Cid" HeaderText="课程编号" />
                                <asp:BoundField DataField="Cname" HeaderText="课程名称" />
                                <asp:BoundField DataField="Ccredit" HeaderText="课程学分" />
                                <asp:BoundField DataField="Ccategory" HeaderText="课程类别" />
                                <asp:BoundField DataField="Cpersonnumber" HeaderText="课程人数" />
                                <asp:BoundField DataField="Cintroduction" HeaderText="课程简介" />
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="" OnClick="LinkButton1_Click" Text="选择"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <RowStyle HorizontalAlign="Center" />
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="已选课程" Font-Size="X-Large"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False">
                            <Columns>
                                <asp:BoundField DataField="Cid" HeaderText="课程编号" />
                                <asp:BoundField DataField="Cname" HeaderText="课程名称" />
                                <asp:BoundField DataField="Ccredit" HeaderText="课程学分" />
                                <asp:BoundField DataField="Cpersonnumber" HeaderText="课程人数" />
                                <asp:BoundField DataField="Ccategory" HeaderText="课程类别" />
                                <asp:BoundField DataField="Cintroduction" HeaderText="课程简介" />
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="" OnClick="LinkButton1_Click1" Text="退选"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="false" CommandName="" OnClick="LinkButton2_Click" Text="学习"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <RowStyle HorizontalAlign="Center" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </div>
        <div id="footer">
            
        </div>
    </form>
</body>
</html>
