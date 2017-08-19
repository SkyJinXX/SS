<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="web_style/Register.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
        <div  id="top">
            <p id="top_p_r">
                <font id="font_1">Welcome to register!</font>
            </p>
        </div>
        <div id="middle">
            <div id="d_message">
                <table id="T_1">
                    <tr>
                        <th style="width: 70px;">&nbsp;
                        </th>
                        <th style="width: 70px;">&nbsp;
                        </th>
                        <th>
                            <asp:Label ID="Label11" runat="server" Text="注册用户名" Font-Size="X-Large"></asp:Label>
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
                            <asp:Label ID="Label4" runat="server" Text="用户名"></asp:Label>
                        </th>
                        <th>
                            <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                        </th>
                        <th>&nbsp;
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Label ID="Label3" runat="server" Text="密码"></asp:Label>
                        </th>
                        <th>
                            <asp:TextBox ID="TextBox2" runat="server" OnTextChanged="TextBox2_TextChanged" TextMode="Password"></asp:TextBox>
                        </th>
                        <th>
                            <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged" Text="可见" />
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Label ID="Label5" runat="server" Text="确认密码"></asp:Label>
                        </th>
                        <th>
                            <asp:TextBox ID="TextBox3" runat="server" OnTextChanged="TextBox3_TextChanged" TextMode="Password"></asp:TextBox>
                        </th>
                        <th>&nbsp;
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Label ID="Label1" runat="server" Text="注册身份"></asp:Label>
                        </th>
                        <th>
                            <asp:RadioButtonList ID="Identity" runat="server" RepeatDirection="Horizontal"
                                Height="20px " Width="160px" Style="margin: auto"
                                OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                                <asp:ListItem Value="T">老师</asp:ListItem>
                                <asp:ListItem Value="S">学生</asp:ListItem>
                            </asp:RadioButtonList>
                        </th>
                        <th>&nbsp;
                        </th>
                    </tr>
                </table>
                <table id="T_3">
                    <tr>
                        <th>&nbsp;&nbsp;&nbsp;&nbsp&nbsp;
                        </th>
                        <th>
                            <asp:Button ID="Button2" runat="server" Width="60px" Height="30px" OnClick="Button2_Click" Text=" 返回 " />
                        </th>
                        <th>&nbsp;
                        </th>
                        <th>
                            <asp:Button ID="Button1" runat="server" Width="60px" Height="30px" OnClick="Button1_Click1" Text="下一步" Style="height: 27px" />
                        </th>
                        <th>&nbsp;
                        </th>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</body>
</html>
