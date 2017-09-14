<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Administrator.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="web_style/Administrator.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
        <div id="top_menu">
            <div id="user_box">
                <asp:Label ID="Label1" runat="server" ForeColor="#FF9900" float="right"></asp:Label>
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
        <div id="welcome">
            <asp:Label ID="Label3" runat="server" Text="Welcome" Font-Size="XX-Large" ForeColor="#ffffcc"></asp:Label>
            <div id="dowm_arrow">
            </div>
        </div>
        <div class="wrapper">
            <div class="holder">
                <div class="menu1">
                    <a href="#" class="animBtn themeA">
                        <asp:Button ID="Button1" runat="server" CssClass="button" Text="操作管理" OnClick="Button1_Click" /></a>
                </div>
                <div class="menu2">
                    <a href="#" class="animBtn themeB">
                        <asp:Button ID="Button2" runat="server" CssClass="button" Text="新管理员注册" OnClick="Button2_Click" /></a>
                </div>
                <div class="menu3">
                    <a href="#" class="animBtn themeC">
                        <asp:Button ID="Button3" runat="server" CssClass="button" Text="用户信息管理" OnClick="Button3_Click" /></a>
                </div>
                <div class="menu4">
                    <a href="#" class="animBtn themeD">
                        <asp:Button ID="Button4" runat="server" CssClass="button" Text="课程管理" OnClick="Button4_Click" /></a>
                </div>
                <div class="menu1">
                    <a href="#" class="animBtn themeA">
                        <asp:Button ID="Button5" runat="server" CssClass="button" Text="成绩系统管理" OnClick="Button5_Click" /></a>
                </div>
                <div class="menu2">
                    <a href="#" class="animBtn themeB">
                        <asp:Button ID="Button9" runat="server" CssClass="button" Text="选课信息管理" OnClick="Button9_Click" /></a>
                </div>
                <div class="menu3">
                    <a href="#" class="animBtn themeC">
                        <asp:Button ID="Button8" runat="server" CssClass="button" Text="公告发布" OnClick="Button8_Click" /></a>
                </div>
                <div class="menu4">
                    <a href="#" class="animBtn themeD">
                        <asp:Button ID="Button7" runat="server" CssClass="button" Text="个人信息修改" OnClick="Button7_Click" /></a>
                </div>
            </div>
        </div>
        <div class="line"></div>
        <div id="view">
            <div id="d_title">
                <asp:Label ID="Label2" runat="server" Text="信息公告" Font-Size="X-Large" ForeColor="White"></asp:Label>
            </div>
            <div id="d_message">
                <asp:GridView ID="GridView1" runat="server" Height="300px" Width="700px" AutoGenerateColumns="False" ForeColor="White">
                    <Columns>
                        <asp:BoundField DataField="Aname1" HeaderText="管理员A" />
                        <asp:BoundField DataField="Aname2" HeaderText="管理员B" />
                        <asp:BoundField DataField="A_A_Message" HeaderText="留言信息" />
                        <asp:BoundField DataField="A_A_Action" HeaderText="权限操作" />
                    </Columns>
                    <RowStyle HorizontalAlign="Center" />
                </asp:GridView>
            </div>
        </div>
        <div id="footer">
        </div>
    </form>
</body>
</html>
