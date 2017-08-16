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
                <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text=" 注销 " BackColor="#3399FF" BorderColor="Black" BorderStyle="Dotted" BorderWidth="1px" />
            </p>
        </div>
        <div id="globllink">
            <ul>
                <li class="li_1"><a href="Interface_Student.aspx">选课</a></li>
                <li class="li_1"><a href="Interface_Student_Select.aspx">查询成绩</a></li>
                <li class="li_1"><a href="Interface_Student_Change.aspx">信息修改</a></li>
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
            <div id="d_select">
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
                            <asp:Button ID="Button4" runat="server" Text="查询成绩" OnClick="Button4_Click" Width="90px" Height="30px" Font-Size="Medium" />
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
        </div> 
        <div id="footer">
            
        </div>
    </form>
</body>
</html>
