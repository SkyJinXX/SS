<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Interface_Teacher_Testmanage.aspx.cs" Inherits="Interface_Teache_Testmanage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="web_style/Interface_Teacher_Testmanage.css" rel="stylesheet" type="text/css" />


</head>
<body>
    <form id="form1" runat="server">
        <div id="top_menu">
            <div id="user_box">
                <asp:Label ID="Label1" runat="server" ForeColor="#FF9900" float="right"></asp:Label>
                <asp:Button ID="Button1" runat="server"  Text=" 注销 " />
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
            <div id="box">
                <div id="menu">
                    <ul>
                        <li><a>
                            <asp:Button ID="Button5" runat="server" Width="100px"  Text="成绩管理" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" OnClick="Button5_Click" /></a></li>
                        <li><a>
                            <asp:Button ID="Button9" runat="server" Width="100px"  Text="公告管理" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" OnClick="Button9_Click" /></a></li>
                        <li><a>
                            <asp:Button ID="Button10" runat="server" Width="100px"  Text="考试管理" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" OnClick="Button10_Click" /></a></li>
                        <li><a>
                            <asp:Button ID="Button11" runat="server" Width="100px"  Text="章节管理" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" style="height: 17px" OnClick="Button11_Click" /></a></li>
                    </ul>
                </div>
                <div id="d_message">
                    <div id="upload">
                        <asp:Button ID="Button12" runat="server" OnClick="Button12_Click" Text="试题模版.txt" Width="112px" CssClass="button" />
                        &nbsp;<br />
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="上传试题"></asp:Label>
                        <br />
                        <asp:FileUpload ID="FileUpload1" runat="server" Width="200px" Height="25px" ForeColor="White" CssClass="button" />
                        <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="上传" CssClass="button" />
                        <br />
                    </div>
                    <div id="upload_file">
                        <div>
                            <asp:Label ID="Label3" runat="server" Text="已上传文件" ForeColor="White"></asp:Label></div>
                        <div>
                            <asp:ListBox ID="ListBox1" runat="server" Width="270px" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged" ForeColor="White"></asp:ListBox>
                            <br />
                            <br />
                        </div>
                        <asp:Button ID="Button7" runat="server" Text="下载文件" OnClick="Button7_Click" CssClass="button" width="80px"/>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button8" runat="server" Text="删除文件" OnClick="Button8_Click" CssClass="button" width="80px"/>
                    </div>
                    <br />
                    <br />
                    <div id="course_table">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="300px" ForeColor="White">
                            <Columns>
                                <asp:BoundField DataField="Cid" HeaderText="课程号" />
                                <asp:BoundField DataField="Cname" HeaderText="课程名" />
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="Cancel"  Text="设置考试时间" OnClick="LinkButton1_Click" ForeColor="White"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
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