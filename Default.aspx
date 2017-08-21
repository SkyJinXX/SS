<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="web_style/StyleSheet.css" rel="stylesheet" type="text/css" />
    
    <script>
        function $(element) {
            return element = document.getElementById(element);
        }
        function $D() {
            var d = $('class1content');
            var h = d.offsetHeight;
            var maxh = 300;
            function dmove() {
                h += 50; //设置层展开的速度
                if (h >= maxh) {
                    d.style.height = '400px';
                    clearInterval(iIntervalId);
                } else {
                    d.style.display = 'block';
                    d.style.height = h + 'px';
                }
            }
            iIntervalId = setInterval(dmove, 2);
        }
        function $D2() {
            var d = $('class1content');
            var h = d.offsetHeight;
            var maxh = 300;
            function dmove() {
                h -= 50;//设置层收缩的速度
                if (h <= 0) {
                    d.style.display = 'none';
                    clearInterval(iIntervalId);
                } else {
                    d.style.height = h + 'px';
                }
            }
            iIntervalId = setInterval(dmove, 2);
        }
        function $use() {
            var d = $('class1content');
            var sb = $('stateBut');
            if (d.style.display == 'none') {
                $D();
                sb.innerHTML = '遇到问题了？请咨询我吧!点我收起咨询对话';
            } else {
                $D2();
                sb.innerHTML = '遇到问题了？请咨询我吧!点我展开咨询对话';
            }
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
                    <tr style="height: 5px"></tr>
                    <tr>
                        <th class="th_2">&nbsp;
                        </th>
                        <th style="width: 100px">
                            <asp:Label ID="Label2" CssClass="L_font" runat="server" Text="用户名:"></asp:Label>
                        </th>
                        <th style="width: 150px">
                            <asp:TextBox ID="TextBox1" CssClass="T" runat="server"></asp:TextBox>
                        </th>
                        <th class="th_2">&nbsp;
                        </th>
                    </tr>
                    <tr style="height: 5px"></tr>
                    <tr>
                        <th class="th_2">&nbsp;
                        </th>
                        <th style="width: 100px">
                            <asp:Label ID="Label3" CssClass="L_font" runat="server" Text="密码:"></asp:Label>
                        </th>
                        <th style="width: 150px">
                            <asp:TextBox ID="TextBox2" CssClass="T" runat="server" TextMode="Password"></asp:TextBox>
                        </th>
                        <th class="th_2">&nbsp;
                        </th>
                    </tr>
                    <tr style="height: 5px"></tr>
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
        <div class="class1">
            <span id="stateBut" onclick="$use()">遇到问题了？请咨询我吧!点我收起咨询对话</span>
            <p id="class1content" style="background-color: white; padding-bottom: 0px;">
                <iframe src='https://webchat.botframework.com/embed/ChatBotJJK?s=KH2LA7Co09A.cwA.Vcw.OZj9ET5VWCQnI94QjesS036nChrAQubIKl1jpMqQAWg' width="316" height="420"></iframe>
            </p>
        </div>
    </form>
</body>
</html>

