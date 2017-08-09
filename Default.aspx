<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="web_style/StyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #form1 {
            text-align: center;
        }
        .auto-style1 {
            width: 338px;
            height: 512px;
        }
    </style>
</head>
<body style="height: 560px">
    <div id="bot">
        <iframe src='https://webchat.botframework.com/embed/ChatBotJJK?s=KH2LA7Co09A.cwA.Vcw.OZj9ET5VWCQnI94QjesS036nChrAQubIKl1jpMqQAWg' class="auto-style1"></iframe>
    </div>
    <form id="f1" runat="server">
        <div id="d2">
            <p id="p2_1"></p>
            <table class="T">
                <tr>
                    <th>
                        <asp:Label ID="Label2" CssClass="L_font" runat="server" Text="用户名:"></asp:Label>
                    </th>
                    <th>
                        <asp:TextBox ID="TextBox1" CssClass="T" runat="server"></asp:TextBox>
                    </th>
                </tr>
                <tr>
                    <th>
                        <asp:Label ID="Label3" CssClass="L_font" runat="server" Text="密码:"></asp:Label>
                    </th>
                    <th>
                        <asp:TextBox ID="TextBox2" CssClass="T" runat="server" TextMode="Password"></asp:TextBox>
                    </th>
                </tr>
            </table>
            <p class="p2_2"></p>
            <table>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" Height="16px"
                    RepeatDirection="Horizontal" Width="250px" Style="margin: auto"
                    OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                    <asp:ListItem Value="A">管理员</asp:ListItem>
                    <asp:ListItem Value="T">老师</asp:ListItem>
                    <asp:ListItem Value="S">学生</asp:ListItem>
                </asp:RadioButtonList>
            </table>
            <p class="p2_2"></p>
            <p>
                &nbsp;
                <asp:Button ID="Login" runat="server" OnClick="Button1_Click" Text="登陆" Width="51px" Height="25px" />
                <asp:Button ID="Register" runat="server" OnClick="Register_Click" Text="注册" Height="25px" Width="50px" />
            </p>
        </div>
    </form>
</body>
</html>
