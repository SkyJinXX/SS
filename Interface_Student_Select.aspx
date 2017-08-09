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
        <div id="top">
            <p id="top_p_r">
                <asp:Label ID="Label1" runat="server" Text="用户名:" ForeColor="#FF9900"></asp:Label>
                <asp:Label ID="Label2" runat="server" ForeColor="#FF9900"></asp:Label>
                <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text=" 注销 " />
            </p>
        </div>
        <div id="d_menu">
            <table>
                <tr>
                    <td>
                        <asp:Button ID="Button1" runat="server" Width="80px" OnClick="Button1_Click" Text="选课" />
                    </td>
                    <td>
                        <asp:Button ID="Button2" runat="server" Width="80px" OnClick="Button2_Click" Text="查询成绩" />
                    </td>
                    <td>
                        <asp:Button ID="Button3" runat="server" Width="80px" OnClick="Button3_Click" Text="信息修改" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="d_select">
            <p class="p2_1"></p>
            <table class="T">
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="请输入需要查询的课程" Font-Size="X-Large"></asp:Label>
                    </td>
                </tr>
            </table>
            <p class="p2_1"></p>
            <table class="T">
                <tr>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" Width="235px"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <p class="p2_1"></p>
            <table class="T">
                <tr>
                    <td>
                        <asp:Button ID="Button4" runat="server" Text="查询" OnClick="Button4_Click" Width="60px" Height="30px" Font-Size="Medium" />
                    </td>
                </tr>
            </table>
            <p class="p2_1"></p>
            <table class="T">
                <tr>
                    <td>
                        <asp:Button ID="Button5" runat="server" Text="返回选课" OnClick="Button5_Click" Width="90px" Height="30px" Font-Size="Medium" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="d_result">
            <table class="T">
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="查询结果" Font-Size="X-Large"></asp:Label>
                    </td>
                </tr>
            </table>
            <table class="T">
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Font-Size="X-Large">
                            <Columns>
                                <asp:BoundField DataField="Cid" HeaderText="课程编号" />
                                <asp:BoundField DataField="Cname" HeaderText="课程名称" />
                                <asp:BoundField DataField="Ccategory" HeaderText="课程类别" />
                                <asp:BoundField DataField="Ccredit" HeaderText="学分" />
                                <asp:BoundField DataField="Cpersonnumber" HeaderText="课程人数" />
                                <asp:BoundField DataField="Tscore" HeaderText="分数" />
                            </Columns>
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
