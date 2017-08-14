<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register_Student.aspx.cs" Inherits="Register_Student1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="web_style/Register_Student.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
        <div  id="top">
            <p id="top_p_r">
                <font id="font_1">Welcome to register!</font>
            </p>
        </div>
        <div id="d_message">
            <table id="T_1">
                <tr>
                    <th style="width: 70px;">&nbsp;
                    </th>
                    <th style="width: 70px;">&nbsp;
                    </th>
                    <th>
                        <asp:Label ID="Label11" runat="server" Text="注册信息" Font-Size="X-Large"></asp:Label>
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
                        <asp:Label ID="Label1" runat="server" Text="学号"></asp:Label>
                    </th>
                    <th>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </th>
                    <th>&nbsp;
                    </th>
                </tr>
                <tr>
                    <th>
                        <asp:Label ID="Label2" runat="server" Text="姓名"></asp:Label>
                    </th>
                    <th>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </th>
                    <th>&nbsp;
                    </th>
                </tr>
                <tr>
                    <th>
                        <asp:Label ID="Label3" runat="server" Text="性别"></asp:Label>
                    </th>
                    <th>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal"
                            Height="20px " Width="100px" Style="margin: auto">
                            <asp:ListItem>男</asp:ListItem>
                            <asp:ListItem>女</asp:ListItem>
                        </asp:RadioButtonList>
                    </th>
                    <th>&nbsp;
                    </th>
                </tr>
                <tr>
                    <th>
                        <asp:Label ID="Label4" runat="server" Text="出生日期"></asp:Label>
                    </th>
                    <th>
                        <asp:TextBox ID="TextBox3" runat="server" Height="23px"></asp:TextBox>
                    </th>
                    <th>&nbsp;
                    </th>
                </tr>
                <tr>
                    <th>
                        <asp:Label ID="Label5" runat="server" Text="年龄"></asp:Label>
                    </th>
                    <th>
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    </th>
                    <th>&nbsp;
                    </th>
                </tr>
                <tr>
                    <th>
                        <asp:Label ID="Label6" runat="server" Text="隶属学校"></asp:Label>
                    </th>
                    <th>
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                    </th>
                    <th>&nbsp;
                    </th>
                </tr>
                <tr>
                    <th>
                        <asp:Label ID="Label7" runat="server" Text="学院"></asp:Label>
                    </th>
                    <th>
                        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                    </th>
                    <th>&nbsp;
                    </th>
                </tr>
                <tr>
                    <th>
                        <asp:Label ID="Label8" runat="server" Text="专业"></asp:Label>
                    </th>
                    <th>
                        <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                    </th>
                    <th>&nbsp;
                    </th>
                </tr>
                <tr>
                    <th>
                        <asp:Label ID="Label9" runat="server" Text="班级"></asp:Label>
                    </th>
                    <th>
                        <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                    </th>
                    <th>&nbsp;
                    </th>
                </tr>
                <tr>
                    <th>
                        <asp:Label ID="Label10" runat="server" Text="联系方式"></asp:Label>
                    </th>
                    <th>
                        <asp:TextBox ID="TextBox9" runat="server" Style="height: 23px"></asp:TextBox>
                    </th>
                    <th>&nbsp;
                    </th>
                </tr>
            </table>
            <table id="T_3">
                <tr>
                    <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;
                    </th>
                    <th>
                        <asp:Button ID="Button1" runat="server" Width="80px" Height="27px" OnClick="Button1_Click" Text="上一步" />
                    </th>
                    <th>&nbsp;
                    </th>
                    <th>
                        <asp:Button ID="Button2" runat="server" Width="80px" Height="27px" OnClick="Button2_Click" Text="完成注册" />
                    </th>
                    <th>&nbsp;
                    </th>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
