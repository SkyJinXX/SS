<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Interface_Student_Select.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="web_style/Interface_Student_Select.css" rel="stylesheet" type="text/css" />
    
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
        <div id="d_select">
            <table class="T_t">
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="请输入需要查询的课程" Font-Size="X-Large"></asp:Label>
                    </td>
                </tr>
            </table>
            <table id="T_1">
                <tr style="height:10px"></tr>
                <tr>
                    <td class="td_search">
                        <asp:Label ID="Label5" runat="server" Text="课程ID："></asp:Label>
                        <asp:TextBox ID="TextBox2" runat="server" Width="150px" Height="12px"></asp:TextBox>
                    </td>
                </tr>
                <tr style="height:10px"></tr>
                <tr>
                    <td class="td_search">
                        <asp:Label ID="Label6" runat="server" Text="课程名："></asp:Label>
                        <asp:TextBox ID="TextBox1" runat="server" Width="150px" Height="12px"></asp:TextBox>
                    </td>
                </tr>
                <tr style="height:10px"></tr>
                <tr>
                    <td class="td_search">
                        <asp:Label ID="Label7" runat="server" Text="课程类别："></asp:Label>
                        <asp:DropDownList ID="DropDownList1" runat="server" Width="140px" Height="20px">
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
                <tr style="height:10px"></tr>
            </table>
            <table id="T_2">
                <tr>
                    <td>
                        <asp:Button ID="Button4" CssClass="button" runat="server" Text="查询成绩" OnClick="Button4_Click" Width="85px" Height="40px" Font-Size="Medium" />
                    </td>
                    <td>
                        <asp:Button ID="Button5" CssClass="button" runat="server" Text="返回选课" OnClick="Button5_Click" Width="85px" Height="40px" Font-Size="Medium" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="d_result">
            <table class="T_t">
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="查询结果" Font-Size="X-Large" ForeColor="#FFFFCC"></asp:Label>
                    </td>
                </tr>
            </table>
            <table id="T_view">
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" Width="600px" AutoGenerateColumns="False" ForeColor="White">
                            <Columns>
                                <asp:BoundField DataField="Cid" HeaderText="课程编号" />
                                <asp:BoundField DataField="Cname" HeaderText="课程名称" />
                                <asp:BoundField DataField="Ccategory" HeaderText="课程类别" />
                                <asp:BoundField DataField="Ccredit" HeaderText="学分" />
                                <asp:BoundField DataField="PScore" HeaderText="平时分" />
                                <asp:BoundField DataField="MScore" HeaderText="期中考试" />
                                <asp:BoundField DataField="FScore" HeaderText="期末考试" />
                                <asp:BoundField DataField="Tscore" HeaderText="总分" />
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
