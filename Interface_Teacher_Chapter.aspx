<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Interface_Teacher_Chapter.aspx.cs" Inherits="Interface_Teacher_Chapter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="web_style/Interface_Teacher_Chapter.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
        <div id="top">
            <p id="top_p_r">
                <font id="font_1">Welcome back!</font>
                <asp:Label ID="Label1" runat="server" ForeColor="#FF9900" float="right"></asp:Label>
                <asp:Button ID="Button3" runat="server" Text=" 注销 " BackColor="#3399FF" BorderColor="Black" BorderStyle="Dotted" BorderWidth="1px" Style="height: 25px" />
            </p>
        </div>
        <div id="globllink">
            <ul>
                <li class="li_1"><a>
                    <asp:Button ID="Button13" runat="server" Width="100px" Text="公告" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" OnClick="Button2_Click" /></a></li>
                <li class="li_1"><a>
                    <asp:Button ID="Button14" runat="server" Width="100px" Text="个人信息修改" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" /></a></li>
                <li class="li_1"><a>
                    <asp:Button ID="Button15" runat="server" Width="100px" Text="课程管理" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" /></a></li>
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
                            <asp:Button ID="Button16" runat="server" Width="100px" Text="成绩管理" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" OnClick="Button16_Click1" /></a></li>
                        <li><a>
                            <asp:Button ID="Button17" runat="server" Width="100px" Text="公告管理" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" OnClick="Button17_Click1" /></a></li>
                        <li><a>
                            <asp:Button ID="Button18" runat="server" Width="100px" Text="考试管理" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" OnClick="Button18_Click1" /></a></li>
                        <li><a>
                            <asp:Button ID="Button19" runat="server" Width="100px" Text="章节管理" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" Style="height: 17px" OnClick="Button19_Click" /></a></li>
                    </ul>
                </div>
            </div>
            <div id="d_message">
                <table class="view_table">
                    <tr>
                        <th style="width: 100px">
                            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                        </th>
                        <th style="width: 100px">
                            <asp:Label ID="Label4" runat="server" Text="课程设置" Width="100px"></asp:Label>
                        </th>
                        <th style="width: 100px">
                            <asp:Button ID="Button12" runat="server" OnClick="Button12_Click" Text="返回课程信息修改" Width="140px" />
                        </th>
                    </tr>
                    <tr>
                        <th></th>
                        <th>
                            <asp:Label ID="Label2" runat="server" Text="C语言共有：" Width="100px"></asp:Label>
                        </th>
                        <th>
                            <asp:TextBox ID="TextBox2" runat="server" Width="75px"></asp:TextBox>
                            <asp:Label ID="Label3" runat="server" Text="章"></asp:Label>
                        </th>
                        <th></th>
                    </tr>
                    <tr>
                        <th></th>
                        <th>
                            <asp:Button ID="Button10" runat="server" OnClick="Button10_Click" Text="上一步" />
                        </th>
                        <th>
                            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="下一步" />
                        </th>
                        <th></th>
                    </tr>
                    <tr>
                        <th></th>
                        <th>
                            <asp:Label ID="Label5" runat="server" Text="第"></asp:Label>
                            <asp:Label ID="Label6" runat="server" Text="1"></asp:Label>
                            <asp:Label ID="Label7" runat="server">章</asp:Label>
                        </th>
                        <th></th>
                        <th></th>
                    </tr>
                    <tr>
                        <th></th>
                        <th>
                            <asp:Label ID="Label9" runat="server">本章共有：</asp:Label>
                        </th>
                        <th>
                            <asp:TextBox ID="TextBox3" runat="server" Width="75px"></asp:TextBox>
                            <asp:Label ID="Label10" runat="server">节</asp:Label>
                        </th>
                        <th></th>
                    </tr>
                    <tr>
                        <th></th>
                        <th>
                            <asp:Button ID="Button11" runat="server" OnClick="Button11_Click" Text="上一步" />
                        </th>
                        <th>
                            <asp:Button ID="Button7" runat="server" OnClick="Button7_Click" Text="下一步" />
                        </th>
                        <th></th>
                    </tr>
                    <tr>
                        <th></th>
                        <th>
                            <asp:Label ID="Label11" runat="server" Text="第"></asp:Label>
                            <asp:Label ID="Label12" runat="server" Text="1"></asp:Label>
                            <asp:Label ID="Label13" runat="server">节</asp:Label>
                        </th>
                        <th></th>
                        <th></th>
                    </tr>
                    <tr>
                        <th></th>
                        <th>
                            <asp:Label ID="Label8" runat="server">标题：</asp:Label>
                        </th>
                        <th>
                            <asp:TextBox ID="TextBox1" runat="server" Width="90px"></asp:TextBox>
                        </th>
                        <th></th>
                    </tr>
                </table>
                <table class="view_table">
                    <tr>
                        <th style="width: 70px"></th>
                        <th style="width: 200px">
                            <asp:FileUpload ID="FileUpload1" runat="server" Width="180px" />
                        </th>
                        <th>
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="上传" />
                        </th>
                    </tr>
                </table>
                <table class="view_table">
                    <tr>
                        <th style="width: 100px"></th>
                        <th style="width: 100px">
                            <asp:Button ID="Button8" runat="server" OnClick="Button8_Click" Text="上一节" />
                        </th>
                        <th>
                            <asp:Button ID="Button9" runat="server" OnClick="Button9_Click" Text="下一节" />
                        </th>
                        <th style="width: 100px"></th>
                    </tr>
                    <tr>
                        <th></th>
                        <th>
                            <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="上一章" />
                        </th>
                        <th>
                            <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="下一章" />
                        </th>
                        <th></th>
                    </tr>
                </table>
                <table class="view_table">
                    <tr>
                        <th></th>
                        <th></th>
                        <th>
                            <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="完成" />
                        </th>
                        <th></th>
                        <th></th>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</body>
</html>
