<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="web_style/StyleSheet.css" rel="stylesheet" type="text/css" />
    
    <script>
    window.onload = function () {
        var odiv = document.getElementById('thediv');
        odiv.onmouseover = function () { startmove(0, 10); }
        odiv.onmouseout = function () { startmove(-300, -10); }
    }
    var timer = null;
    function startmove(target, speed) {
        var odiv = document.getElementById('thediv');
        clearInterval(timer);
        timer = setInterval(function () {
            if (odiv.offsetLeft == target) {
                clearInterval(timer);
            }
            else {
                odiv.style.left = odiv.offsetLeft + speed + 'px';
            }
        }, 30)
    }
</script>
    
    
    
</head>
<body>
    <form id="f1" runat="server">
        <div id="middle">
            
            <div id="d_message">
                <table id="T_1">
                    <tr>
                        <th class="th_1">&nbsp;
                        </th>
                        <th class="th_1">&nbsp;
                        </th>
                        <th>LOGIN
                        </th>
                        <th class="th_1">&nbsp;
                        </th>
                        <th class="th_1">&nbsp;
                        </th>
                    </tr>
                </table>
                <table id="T_2">
                    <tr>
                        <th class="th_2">&nbsp;
                        </th>
                        <th style="width: 100px">
                            用户名:
                        </th>
                        <th style="width: 150px">
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </th>
                        <th class="th_2">&nbsp;
                        </th>
                    </tr>
                    <tr>
                        <th class="th_2">&nbsp;
                        </th>
                        <th style="width: 100px">
                            密码:
                        </th>
                        <th style="width: 150px">
                            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                        </th>
                        <th class="th_2">&nbsp;
                        </th>
                    </tr>
                    </table>
                <table>
                    <tr>
                        <th style="width: 80px">&nbsp;
                        </th>
                        <th>
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" Height="16px"
                                RepeatDirection="Horizontal" Width="250px" Style="margin: auto"
                                OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                                <asp:ListItem Value="A">管理员</asp:ListItem>
                                <asp:ListItem Value="T">老师</asp:ListItem>
                                <asp:ListItem Value="S">学生</asp:ListItem>
                            </asp:RadioButtonList>
                        </th>
                        <th>&nbsp;
                        </th>
                    </tr>
                </table>
                <table id="T_3">
                    <tr style="height: 10px"></tr>
                    <tr>
                        <th style="width: 85px">&nbsp;&nbsp;&nbsp;&nbsp;
                        </th>
                        <th style="width: 80px">
                            <asp:Button ID="Login" runat="server" OnClick="Button1_Click" Text="登陆" Width="51px" Height="25px" />
                        </th>
                        <th>&nbsp;
                        </th>
                        <th style="width: 85px">
                            <asp:Button ID="Register" runat="server" OnClick="Register_Click" Text="注册" Height="25px" Width="50px" />
                        </th>
                        <th style="width: 80px">&nbsp;
                        </th>
                    </tr>
                </table>
            </div>
        </div>
        <div id="thediv">
            <iframe src='https://webchat.botframework.com/embed/ChatBotJJK?s=KH2LA7Co09A.cwA.Vcw.OZj9ET5VWCQnI94QjesS036nChrAQubIKl1jpMqQAWg' width="296" height="450"></iframe>
            <span>咨询
            </span>
        </div>
    </form>
</body>
</html>

