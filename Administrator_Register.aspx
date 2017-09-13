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
        <div id="top_menu">
            <div id="user_box">
                <asp:Label ID="Label3" runat="server" ForeColor="#FF9900" float="right"></asp:Label>
                <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text=" 注销 " />
            </div>
        </div>
        <!---动画--->
        <canvas id="canvas"></canvas>
        <script>
            "use strict";

            var canvas = document.getElementById('canvas'),
                ctx = canvas.getContext('2d'),
                w = canvas.width = window.innerWidth,
                h = canvas.height = window.innerHeight,

                hue = 217,
                stars = [],
                count = 0,
                maxStars = 1200;

            var canvas2 = document.createElement('canvas'),
                ctx2 = canvas2.getContext('2d');
            canvas2.width = 100;
            canvas2.height = 100;
            var half = canvas2.width / 2,
                gradient2 = ctx2.createRadialGradient(half, half, 0, half, half, half);
            gradient2.addColorStop(0.025, '#fff');
            gradient2.addColorStop(0.1, 'hsl(' + hue + ', 61%, 33%)');
            gradient2.addColorStop(0.25, 'hsl(' + hue + ', 64%, 6%)');
            gradient2.addColorStop(1, 'transparent');

            ctx2.fillStyle = gradient2;
            ctx2.beginPath();
            ctx2.arc(half, half, half, 0, Math.PI * 2);
            ctx2.fill();

            // End cache

            function random(min, max) {
                if (arguments.length < 2) {
                    max = min;
                    min = 0;
                }

                if (min > max) {
                    var hold = max;
                    max = min;
                    min = hold;
                }

                return Math.floor(Math.random() * (max - min + 1)) + min;
            }

            function maxOrbit(x, y) {
                var max = Math.max(x, y),
                    diameter = Math.round(Math.sqrt(max * max + max * max));
                return diameter / 2;
            }

            var Star = function () {

                this.orbitRadius = random(maxOrbit(w, h));
                this.radius = random(60, this.orbitRadius) / 12;
                this.orbitX = w / 2;
                this.orbitY = h / 2;
                this.timePassed = random(0, maxStars);
                this.speed = random(this.orbitRadius) / 900000;
                this.alpha = random(2, 10) / 10;

                count++;
                stars[count] = this;
            }

            Star.prototype.draw = function () {
                var x = Math.sin(this.timePassed) * this.orbitRadius + this.orbitX,
                    y = Math.cos(this.timePassed) * this.orbitRadius + this.orbitY,
                    twinkle = random(10);

                if (twinkle === 1 && this.alpha > 0) {
                    this.alpha -= 0.05;
                } else if (twinkle === 2 && this.alpha < 1) {
                    this.alpha += 0.05;
                }

                ctx.globalAlpha = this.alpha;
                ctx.drawImage(canvas2, x - this.radius / 2, y - this.radius / 2, this.radius, this.radius);
                this.timePassed += this.speed;
            }

            for (var i = 0; i < maxStars; i++) {
                new Star();
            }

            function animation() {
                ctx.globalCompositeOperation = 'source-over';
                ctx.globalAlpha = 0.8;
                ctx.fillStyle = 'hsla(' + hue + ', 64%, 6%, 1)';
                ctx.fillRect(0, 0, w, h)

                ctx.globalCompositeOperation = 'lighter';
                for (var i = 1, l = stars.length; i < l; i++) {
                    stars[i].draw();
                };

                window.requestAnimationFrame(animation);
            }

            animation();
        </script>
        <!---------->
        <div class="line"></div>
        <div id="middle">
            <div id="d_message">
                <table id="T_1">
                    <tr>
                        <th style="width: 80px;">
                        </th>
                        <th style="width: 80px;">
                        </th>
                        <th>
                            <asp:Label ID="Label11" runat="server" Text="注册信息" Font-Size="X-Large" ForeColor="White"></asp:Label>
                        </th>
                    </tr>
                </table>
                <table id="T_2">
                    <tr>
                        <th>
                            <asp:Label ID="Label6" runat="server" Text="用户名" ForeColor="White"></asp:Label>
                        </th>
                        <th>
                            <asp:TextBox ID="TextBox1" runat="server" Width="140px"></asp:TextBox>
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Label ID="Label7" runat="server" Text="密码" ForeColor="White"></asp:Label>
                        </th>
                        <th>
                            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" Width="140px"></asp:TextBox>
                        </th>
                        <th>
                            <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged" Text="可见" ForeColor="White" />
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Label ID="Label8" runat="server" Text="确认密码" ForeColor="White"></asp:Label>
                        </th>
                        <th>
                            <asp:TextBox ID="TextBox3" runat="server" TextMode="Password" Width="140px"></asp:TextBox>
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Label ID="Label1" runat="server" Text="管理员号" ForeColor="White"></asp:Label>
                        </th>
                        <th>
                            <asp:TextBox ID="TextBox4" runat="server" OnTextChanged="TextBox4_TextChanged" Enabled="False" ReadOnly="True" Width="140px"></asp:TextBox>
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Label ID="Label2" runat="server" Text="姓名" ForeColor="White"></asp:Label>
                        </th>
                        <th>
                            <asp:TextBox ID="TextBox5" runat="server" Width="140px"></asp:TextBox>
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Label ID="Label5" runat="server" Text="性别" ForeColor="White"></asp:Label>
                        </th>
                        <th>
                            <asp:RadioButtonList ID="RadioButtonList3" runat="server" OnSelectedIndexChanged="RadioButtonList3_SelectedIndexChanged" RepeatDirection="Horizontal"
                                Height="20px " Width="140px" Style="margin: auto" ForeColor="White">
                                <asp:ListItem Value="男">男</asp:ListItem>
                                <asp:ListItem Value="女">女</asp:ListItem>
                            </asp:RadioButtonList>
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Label ID="Label9" runat="server" Text="生日 " ForeColor="White"></asp:Label>
                        </th>
                        <th>
                            <asp:TextBox ID="TextBox6" runat="server" Width="140px"></asp:TextBox>
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Label ID="Label10" runat="server" Text="年龄 " ForeColor="White"></asp:Label>
                        </th>
                        <th>
                            <asp:TextBox ID="TextBox7" runat="server" Width="140px"></asp:TextBox>
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Label ID="Label4" runat="server" Text="管理权限" ForeColor="White"></asp:Label>
                        </th>
                        <th>
                            <asp:RadioButtonList ID="RadioButtonList4" runat="server" RepeatDirection="Horizontal" Height="20px" Width="250px" Style="margin: auto" OnSelectedIndexChanged="RadioButtonList4_SelectedIndexChanged" ForeColor="White">
                                <asp:ListItem Value="5">VIP</asp:ListItem>
                                <asp:ListItem Value="4">高</asp:ListItem>
                                <asp:ListItem Value="3">中</asp:ListItem>
                                <asp:ListItem Value="2">低</asp:ListItem>
                                <asp:ListItem Value="1">基本</asp:ListItem>
                            </asp:RadioButtonList>
                        </th>
                    </tr>
                </table>
                <table id="T_3">
                    <tr>
                        <th style="width:0px"></th>
                        <th>
                            <asp:Button ID="Button2" runat="server" Text="完成注册" OnClick="Button2_Click1" CssClass="button" Width="100px" Height="25px" Font-Size="Small" />
                        </th>
                        <th style="width:5px"></th>
                        <th>
                            <asp:Button ID="Button1" runat="server" Text="取消注册" OnClick="Button1_Click1" CssClass="button" Width="100px" Height="25px" Font-Size="Small" />
                        </th>
                    </tr>
                </table>
            </div>
        </div>
        <div class="line"></div>
        <div id="footer">
        </div>
    </form>
</body>
</html>
