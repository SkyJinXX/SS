<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Administrator_announcement.aspx.cs" Inherits="Administrator_announcement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="web_style/Administrator_announcement.css" rel="stylesheet" type="text/css" />
    
    
</head>
<body>
    <form id="form1" runat="server">
        <div id="top_menu">
            <div id="user_box">
                <asp:Label ID="Label1" runat="server" ForeColor="#FF9900" float="right"></asp:Label>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text=" 注销 " />
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
                            <asp:Button ID="Button2" runat="server" Text="全体管理员" OnClick="Button2_Click" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" /></a></li>
                        <li><a>
                            <asp:Button ID="Button3" runat="server" Text="全体教师" OnClick="Button3_Click" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" /></a></li>
                        <li><a>
                            <asp:Button ID="Button4" runat="server" Text="全体学生" OnClick="Button4_Click" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" /></a></li>
                        <li><a>
                            <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="返回" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" /></a></li>
                    </ul>
                </div>
            </div>
            <div class="title">
                <asp:Label ID="Label5" runat="server" ForeColor="White"></asp:Label>
                <asp:Label ID="Label2" runat="server" Visible="False" ForeColor="White"></asp:Label>
            </div>
            <div id="d_body_1">
                <div id="T_A">
                    <asp:GridView ID="GridView1" runat="server" Width="400px" AutoGenerateColumns="False" ForeColor="White">
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:CheckBox runat="server" ID="cbHead" Text="全选" OnCheckedChanged="GridView1_SelectAll" AutoPostBack="true" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Aid" HeaderText="工号" ReadOnly="True" />
                            <asp:BoundField DataField="Aname" HeaderText="姓名" />
                            <asp:BoundField DataField="Asex" HeaderText="性别" />
                            <asp:BoundField DataField="Abirthday" HeaderText="出生日期" />
                        </Columns>
                    </asp:GridView>
                </div>
                <div id="T_T">
                    <asp:GridView ID="GridView2" runat="server" Width="600px" AutoGenerateColumns="False" ForeColor="White">
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:CheckBox runat="server" ID="cbHead" Text="全选" OnCheckedChanged="GridView2_SelectAll" AutoPostBack="true" />
                                </HeaderTemplate>
                                <EditItemTemplate>
                                    <asp:CheckBox ID="CheckBox2" runat="server" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Tid" HeaderText="工号" />
                            <asp:BoundField DataField="Tname" HeaderText="姓名" />
                            <asp:BoundField DataField="Tsex" HeaderText="性别" />
                            <asp:BoundField DataField="Tbirthday" HeaderText="出生日期" />
                            <asp:BoundField DataField="Tprofession" HeaderText="授课专业" />
                            <asp:BoundField DataField="Tphone" HeaderText="联系方式" />
                        </Columns>
                    </asp:GridView>
                </div>
                <div id="T_S">
                    <asp:GridView ID="GridView3" runat="server" Width="700px" AutoGenerateColumns="False" ForeColor="White">
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:CheckBox runat="server" ID="cbHead" Text="全选" OnCheckedChanged="GridView3_SelectAll" AutoPostBack="true" />
                                </HeaderTemplate>
                                <EditItemTemplate>
                                    <asp:CheckBox ID="CheckBox2" runat="server" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Sid" HeaderText="学号" />
                            <asp:BoundField DataField="Sname" HeaderText="姓名" />
                            <asp:BoundField DataField="Ssex" HeaderText="性别" />
                            <asp:BoundField DataField="Sbirthday" HeaderText="出生日期" />
                            <asp:BoundField DataField="Sage" HeaderText="年龄" />
                            <asp:BoundField DataField="Sschool" HeaderText="所在学校" />
                            <asp:BoundField DataField="Scollege" HeaderText="隶属学院" />
                            <asp:BoundField DataField="Smajor" HeaderText="专业" />
                            <asp:BoundField DataField="Sphone" HeaderText="联系方式" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <div class="title">
                <asp:Label ID="Label3" runat="server" Text="公告内容：" Visible="False" ForeColor="White"></asp:Label>
            </div>
            <div id="box_1">
                <asp:TextBox ID="TextBox1" runat="server" Height="100px" Width="400px" TextMode="MultiLine" Visible="False"></asp:TextBox>
            </div>
            <div id="fabu">
                <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="发布" Width="57px" Visible="False" CssClass="button" Height="25px" Font-Size="Small" />
            </div>
        </div>
        <div class="line"></div>
        <div id="footer">
        </div>
    </form>
</body>
</html>
