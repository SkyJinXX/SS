<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Administrator_Register.aspx.cs" Inherits="Register_Administrator3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="web_style/Administrator_Register.css" rel="stylesheet" type="text/css" />

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
                        <asp:Label ID="Label6" runat="server" Text="用户名"></asp:Label>
                    </th>
                    <th>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </th>
                    <th>
                        &nbsp;
                    </th>
                </tr>
                <tr>
                    <th>
                        <asp:Label ID="Label7" runat="server" Text="密码"></asp:Label>
                    </th>
                    <th>
                        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                    </th>
                    <th>
                        <asp:CheckBox ID="CheckBox1" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" Text="可见" />
                    </th>
                </tr>
                <tr>
                    <th>
                        <asp:Label ID="Label8" runat="server" Text="确认密码"></asp:Label>
                    </th>
                    <th>
                        <asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox>
                    </th>
                    <th>
                        &nbsp;
                    </th>
                </tr>
                <tr>
                    <th>
                        <asp:Label ID="Label1" runat="server" Text="管理员号"></asp:Label>
                    </th>
                    <th>
                        <asp:TextBox ID="TextBox4" runat="server" OnTextChanged="TextBox4_TextChanged" Enabled="False" ReadOnly="True"></asp:TextBox>
                    </th>
                    <th>
                        &nbsp;
                    </th>
                </tr>
                <tr>
                    <th>
                        <asp:Label ID="Label2" runat="server" Text="姓名"></asp:Label>
                    </th>
                    <th>
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                    </th>
                    <th>
                        &nbsp;
                    </th>
                </tr>
                <tr>
                    <th>
                        <asp:Label ID="Label5" runat="server" Text="性别"></asp:Label>
                    </th>
                    <th>
                        <asp:RadioButtonList ID="RadioButtonList3" runat="server" OnSelectedIndexChanged="RadioButtonList3_SelectedIndexChanged" RepeatDirection="Horizontal"
                            Height="20px " Width="100px" Style="margin: auto">
                            <asp:ListItem Value="男">男</asp:ListItem>
                            <asp:ListItem Value="女">女</asp:ListItem>
                        </asp:RadioButtonList>
                    </th>
                    <th>
                        &nbsp;
                    </th>
                </tr>
                <tr>
                    <th>
                        <asp:Label ID="Label9" runat="server" Text="生日 "></asp:Label>
                    </th>
                    <th>
                        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                    </th>
                    <th>
                        &nbsp;
                    </th>
                </tr>
                <tr>
                    <th>
                        <asp:Label ID="Label10" runat="server" Text="年龄 "></asp:Label>
                    </th>
                    <th>
                        <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                    </th>
                    <th>
                        &nbsp;
                    </th>
                </tr>
                <tr>
                    <th>
                        <asp:Label ID="Label4" runat="server" Text="管理权限"></asp:Label>
                    </th>
                    <th>
                        <asp:RadioButtonList ID="RadioButtonList4" runat="server" RepeatDirection="Horizontal" Height="20px" Width="263px" Style="margin: auto" OnSelectedIndexChanged="RadioButtonList4_SelectedIndexChanged">
                            <asp:ListItem Value="5">VIP</asp:ListItem>
<asp:ListItem Value="4">高</asp:ListItem>
                            <asp:ListItem Value="3">中</asp:ListItem>
                            <asp:ListItem Value="2">低</asp:ListItem>
                            <asp:ListItem Value="1">基本</asp:ListItem>
                        </asp:RadioButtonList>
                    </th>
                    <th>
                        &nbsp;
                    </th>
                </tr>
                </table>
            <table id="T_3">
                <tr>
                    <th>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    </th>
                    <th>
                        <asp:Button ID="Button2" runat="server" Text="完成注册" OnClick="Button2_Click1" />
                    </th>
                    <th>
                        &nbsp;
                    </th>
                    <th>
                        <asp:Button ID="Button1" runat="server" Text="取消注册" OnClick="Button1_Click1" />
                    </th>
                    <th>
                        &nbsp;
                    </th>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
