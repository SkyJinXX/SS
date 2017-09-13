<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Interface_Teacher_Change.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="web_style/Interface_Teacher_Change.css" rel="stylesheet" type="text/css" />


</head>
<body>
    <form id="form1" runat="server">
        <div id="top_menu">
            <div id="user_box">
                <asp:Label ID="Label1" ForeColor="#FF9900" runat="server"></asp:Label>
                <asp:Button ID="Button1"  runat="server" OnClick="Button1_Click" Text=" 注销 " />
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
                maxStars = 1400;

            // Thanks @jackrugile for the performance tip! http://codepen.io/jackrugile/pen/BjBGoM
            // Cache gradient
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

            var Star = function () {

                this.orbitRadius = random(w / 2 - 50);
                this.radius = random(100, this.orbitRadius) / 10;
                this.orbitX = w / 2;
                this.orbitY = h / 2;
                this.timePassed = random(0, maxStars);
                this.speed = random(this.orbitRadius) / 900000;
                this.alpha = random(2, 10) / 10;

                count++;
                stars[count] = this;
            }

            Star.prototype.draw = function () {
                var x = Math.sin(this.timePassed + 1) * this.orbitRadius + this.orbitX,
                    y = Math.cos(this.timePassed) * this.orbitRadius / 2 + this.orbitY,
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
        
        <div id="d_body">
            <div id="d_message">
                <table id="T_1">
                    <tr>
                        <th style="width: 3px;">
                        </th>
                        <th style="width: 3px;">
                        </th>
                        <th>
                            <asp:Label ID="Label8" runat="server" Text="个人信息" Font-Size="X-Large"></asp:Label>
                        </th>
                    </tr>
                </table>
                <table id="T_2">
                    <tr>
                        <th>
                            <asp:Label ID="Label9" runat="server" Text="工号："></asp:Label>
                        </th>
                        <th>
                            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Label ID="Label10" runat="server" Text="昵称："></asp:Label>
                        </th>
                        <th>
                            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Label ID="Label11" runat="server" Text="性别："></asp:Label>
                        </th>
                        <th>
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" Width="100px">
                                <asp:ListItem>男</asp:ListItem>
                                <asp:ListItem>女</asp:ListItem>
                            </asp:RadioButtonList>
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Label ID="Label12" runat="server" Text="权限："></asp:Label>
                        </th>
                        <th>
                            <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Label ID="Label2" runat="server" Text="生日："></asp:Label>
                        </th>
                        <th>
                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Label ID="Label3" runat="server" Text="职称："></asp:Label>
                        </th>
                        <th>
                            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Label ID="Label4" runat="server" Text="电话号码："></asp:Label>
                        </th>
                        <th>
                            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        </th>
                    </tr>
                </table>
                <table class="T_3">
                    <tr>
                        <th>
                            <asp:Label ID="Label5" runat="server" Text="介绍："></asp:Label>
                        </th>
                        <th>
                            <asp:TextBox ID="TextBox1" runat="server" Height="120px" TextMode="MultiLine" Width="300px"></asp:TextBox>
                        </th>
                    </tr>
                </table>
                <table class="T_3">
                    <tr>
                        <th style="width:20px"></th>
                        <th>
                            <asp:Button ID="Button6" CssClass="button" runat="server" OnClick="Button6_Click" Text="保存" Width="50px" Height="25px" Font-Size="Small" />
                        </th>
                        <th style="width:10px"></th>
                        <th>
                            <asp:Button ID="Button2" CssClass="button" runat="server" OnClick="Button2_Click" Text="返回" Width="50px" Height="25px" Font-Size="Small" />
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
