<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Administrator_RightsManagement.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="web_style/Administrator_RightsManagement.css" rel="stylesheet" type="text/css" />


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
        <div id="d_body">
            <div id="box">
                <div id="menu">
                    <ul>
                        <li><a>
                            <asp:Button ID="Button9" runat="server" Width="100px" OnClick="Button9_Click" Text="权限修改" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" /></a></li>
                        <li><a>
                            <asp:Button ID="Button10" runat="server" Width="100px" OnClick="Button10_Click" Text="回复留言" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" /></a></li>
                        <li><a>
                            <asp:Button ID="Button13" runat="server" Width="100px" OnClick="Button13_Click" Text="返回主界面" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" /></a></li>
                    </ul>
                </div>
                <div id="view">
                    <div id="d_title">
                        <asp:Label ID="Label6" runat="server" Text="管理" Font-Size="X-Large" ForeColor="White"></asp:Label>
                    </div>
                    <div id="d_message">
                        <asp:GridView ID="GridView1" runat="server" Width="500px" AutoGenerateColumns="False" ForeColor="White">
                            <Columns>
                                <asp:BoundField DataField="Aid" HeaderText="管理员编号" />
                                <asp:BoundField DataField="Aname" HeaderText="管理员姓名" />
                                <asp:BoundField DataField="Asex" HeaderText="性别" />
                                <asp:BoundField DataField="Abirthday" HeaderText="生日" />
                                <asp:BoundField DataField="Aage" HeaderText="年龄" />
                                <asp:BoundField DataField="Alevel" HeaderText="权限" />
                            </Columns>
                            <RowStyle HorizontalAlign="Center" />
                        </asp:GridView>
                    </div>
                    <div id="operating">
                        <table id="T_1">
                            <tr>
                                <th>
                                    <asp:Label ID="Label2" runat="server" Enabled="False" Text="管理员工号:" Visible="False" ForeColor="White"></asp:Label>
                                </th>
                                <th>
                                    <asp:TextBox ID="TextBox1" runat="server" Width="200px" Height="20px" Visible="False"></asp:TextBox>
                                </th>
                                <th>
                                    <asp:Button ID="Button11" runat="server" Text=" 搜索 " OnClick="Button11_Click" Visible="False" CssClass="button" Width="50px" Height="25px" Font-Size="Small" />
                                </th>
                            </tr>
                            <tr>
                                <th>
                                    <asp:Label ID="Label3" runat="server" Visible="False" ForeColor="White">权限:</asp:Label>
                                </th>
                                <th>
                                    <asp:TextBox ID="TextBox3" runat="server" Width="200px" Height="20px" Visible="False"></asp:TextBox>
                                </th>
                                <th>
                                    <asp:Button ID="Button12" runat="server" Text=" 修改 " OnClick="Button12_Click" Visible="False" CssClass="button" Width="50px" Height="25px" Font-Size="Small" />
                                </th>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>

        </div>
        <div class="line"></div>
        <div id="footer">
        </div>
    </form>
</body>
</html>
