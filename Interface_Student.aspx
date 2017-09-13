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
        <div id="top_menu">
            <div id="user_box">
                <asp:Label ID="Label1" runat="server"></asp:Label>
                <asp:Button ID="Button1" runat="server" Text="注销" OnClick="Button1_Click" />
            </div>
        </div>
        <div id="c_background">
            <canvas id="c"></canvas>
            <script src="JavaScript/geometry.js" type="text/javascript"></script>
        </div>

        <div id="d_search">
            <table id="T_1">
                <tr>
                    <td class="td_search">
                        <asp:Label ID="Label10" runat="server" Text="课程ID：" ForeColor="White"></asp:Label>
                        <asp:TextBox ID="TextBox2" runat="server" Width="150px" Height="12px" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td_search">
                        <asp:Label ID="Label6" runat="server" Text="课程名：" ForeColor="White"></asp:Label>
                        <asp:TextBox ID="TextBox1" runat="server" Width="150px" Height="12px" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td_search">
                        <asp:Label ID="Label9" runat="server" Text="课程类别:" ForeColor="White"></asp:Label>
                        <asp:DropDownList ID="DropDownList1" runat="server" Width="150px" Height="20px">
                            <asp:ListItem> </asp:ListItem>
                            <asp:ListItem Value="办公效率">办公效率</asp:ListItem>
                            <asp:ListItem Value="编程开发">编程开发</asp:ListItem>
                            <asp:ListItem Value="产品和设计">产品和设计</asp:ListItem>
                            <asp:ListItem Value="生活方式">生活方式</asp:ListItem>
                            <asp:ListItem Value="职业发展">职业发展</asp:ListItem>
                            <asp:ListItem Value="市场营销">市场营销</asp:ListItem>
                            <asp:ListItem Value="技能特长">技能特长</asp:ListItem>
                            <asp:ListItem Value="人文社会">人文社会</asp:ListItem>
                            <asp:ListItem Value="艺术发展">艺术发展</asp:ListItem>
                            <asp:ListItem>其他</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                </table>
            <table id="T_2">
                <tr>
                    <td>
                        <asp:Button ID="Button2" CssClass="button" runat="server" Text="搜索课程" OnClick="Button2_Click" Width="85px" Height="40px" Font-Size="Medium" />
                    </td>
                    <td>
                        <asp:Button ID="Button5" CssClass="button" runat="server" Text="返回主页" OnClick="Button5_Click" Width="85px" Height="40px" Font-Size="Medium" />
                    </td>
                </tr>
            </table>
        </div>
        <div class="d_course">
            <table class="T_t">
                <tr>
                    <td>
                        <asp:Label ID="Label8" runat="server" Text="已开课程" Font-Size="X-Large" ForeColor="White"></asp:Label>
                    </td>
                </tr>
            </table>
            <table class="T_view">
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" Width="600px" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" ForeColor="White">
                            <Columns>
                                <asp:BoundField DataField="Cid" HeaderText="课程编号" />
                                <asp:BoundField DataField="Cname" HeaderText="课程名称" />
                                <asp:BoundField DataField="Ccredit" HeaderText="课程学分" />
                                <asp:BoundField DataField="Ccategory" HeaderText="课程类别" />
                                <asp:BoundField DataField="Cpersonnumber" HeaderText="课程人数" />
                                <asp:BoundField DataField="Cintroduction" HeaderText="课程简介" />
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="" OnClick="LinkButton1_Click" Text="选择" ForeColor="White"></asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle BorderStyle="None" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                            <RowStyle HorizontalAlign="Center" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </div>
        <div class="d_course">
            <table class="T_t">
                <tr>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="已选课程" Font-Size="X-Large" ForeColor="White"></asp:Label>
                    </td>
                </tr>
            </table>
            <table class="T_view">
                <tr>
                    <td>
                        <asp:GridView ID="GridView2" Width="600px" runat="server" AutoGenerateColumns="False" ForeColor="White">
                            <Columns>
                                <asp:BoundField DataField="Cid" HeaderText="课程编号" />
                                <asp:BoundField DataField="Cname" HeaderText="课程名称" />
                                <asp:BoundField DataField="Ccredit" HeaderText="课程学分" />
                                <asp:BoundField DataField="Cpersonnumber" HeaderText="课程人数" />
                                <asp:BoundField DataField="Ccategory" HeaderText="课程类别" />
                                <asp:BoundField DataField="Cintroduction" HeaderText="课程简介" />
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="" OnClick="LinkButton1_Click1" Text="退选" ForeColor="White"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="false" CommandName="" OnClick="LinkButton2_Click" Text="学习" ForeColor="White"></asp:LinkButton>
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
