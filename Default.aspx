<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="web_style/login.css"/>
    <script src="JavaScript/jquery-2.1.1.min.js" type="text/javascript"></script>
    
</head>
<body>
    <form id="f1" runat="server">
        <div id="thediv">
            <iframe src='https://webchat.botframework.com/embed/ChatBotJJK?s=KH2LA7Co09A.cwA.Vcw.OZj9ET5VWCQnI94QjesS036nChrAQubIKl1jpMqQAWg' width="296" height="450"></iframe>
            <span>咨询
            </span>
        </div>
        <div class="container">
            <div id="d_header">
                <h2>登录(Login)</h2>
            </div>
            <div class="input-element">
                <label for="input">________________________用户名</label>
                <asp:TextBox ID="input" runat="server" name="input"></asp:TextBox>
            </div>
            <div class="input-element">
                <label for="input1">________________________密码</label>
                <asp:TextBox ID="input1" runat="server" name="input" type="password"></asp:TextBox>
            </div>
            <div class="input-element1">
            </div>
            <div class="Select_identity">
                <asp:RadioButtonList ID="input3" runat="server" Height="32px" name="input3"
                    RepeatDirection="Horizontal" Width="250px" Style="color: #fff;margin: auto" 
                    OnSelectedIndexChanged="input3_SelectedIndexChanged">
                    <asp:ListItem Value="A">管理员</asp:ListItem>
                    <asp:ListItem Value="T">老师</asp:ListItem>
                    <asp:ListItem Value="S">学生</asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <div class="input-element1">
            </div>
            <div id="button_login">
                <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
            </div>
            <div id="Register_box">
                <div id="Register">
                    <a href="Register.aspx">还没有注册？点我注册哦</a>
                </div>
            </div>
        </div>
        
        <script type="text/javascript">
            $('.input-element input').focusin(function () {
                $(this).parent().addClass('active');
            });

            $('.input-element input').blur(function () {
                if (!$(this).val().length > 0) {
                    $(this).parent().removeClass('active');
                }
            });
        </script>

    </form>
</body>
</html>

