<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="web_style/Register.css" rel="stylesheet" type="text/css" />
    <script src="JavaScript/jquery-2.1.1.min.js" type="text/javascript"></script>

</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div id="d_header">
                <h2>注册用户名</h2>
            </div>
            <div class="input-element">
                <label for="input">________________________用户名</label>
                <asp:TextBox ID="input" runat="server" name="input"></asp:TextBox>
            </div>
            <div class="input-element">
                <label for="input1">________________________密码</label>
                <asp:TextBox ID="input1" runat="server" name="input" type="password"></asp:TextBox>
                
            </div>
            <div class="input-element bottom">
                <label for="input3">______________________确认密码</label>
                <asp:TextBox ID="input3" runat="server" name="input" type="password"></asp:TextBox>
            </div>
            <div class="input-element1">
                <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged" Text="可见密码" ForeColor="#fff" />
            </div>
            <div class="Select_identity">
                <asp:RadioButtonList ID="Identity" runat="server" RepeatDirection="Horizontal"
                    Height="32px " Width="140px" Style="color: #fff;margin: auto"
                    OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                    <asp:ListItem Value="T">老师</asp:ListItem>
                    <asp:ListItem Value="S">学生</asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <div class="input-element1">
            </div>
            <div id="button_next">
                <asp:Button ID="Button1" runat="server" Text="下一步" OnClick="Button1_Click" />
            </div>
            <div id="button_back">
                <asp:Button ID="Button2" runat="server" Text="返回" OnClick="Button2_Click" />
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
