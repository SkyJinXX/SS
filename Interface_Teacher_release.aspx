﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Interface_Teacher_release.aspx.cs" Inherits="Interface_Teacher_release" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="web_style/Interface_Teacher_release.css" rel="stylesheet" type="text/css" />


</head>
<body>
    <form id="form1" runat="server">
        <div id="top_menu">
            <div id="user_box">
                <asp:Label ID="Label1" runat="server" ForeColor="#FF9900" float="right"></asp:Label>
                <asp:Button ID="Button1" runat="server" Text=" 注销 " />
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
        <div id="middle">
            <div id="box">
                <div id="menu">
                    <ul>
                        <li><a>
                            <asp:Button ID="Button7" runat="server" Width="100px" OnClick="Button7_Click" Text="成绩管理" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" /></a></li>
                        <li><a>
                            <asp:Button ID="Button8" runat="server" Width="100px" OnClick="Button8_Click" Text="公告管理" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" /></a></li>
                        <li><a>
                            <asp:Button ID="Button9" runat="server" Width="100px" OnClick="Button9_Click" Text="考试管理" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" /></a></li>
                        <li><a>
                            <asp:Button ID="Button10" runat="server" Width="100px" OnClick="Button10_Click" Text="章节管理" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" /></a></li>
                    </ul>
                </div>
            </div>
            <div id="d_message">
                <div id="announcement">
                    <table>
                        <tr>
                            <th style="width:100px"></th>
                            <th style="width:100px"></th>
                            <th style="width:100px"><asp:Label ID="Label3" runat="server" Text="请填写公告" ForeColor="White"></asp:Label></th>
                            <th style="width:100px"></th>
                            <th style="width:100px"></th>
                        </tr>
                    </table>
                    <asp:TextBox ID="TextBox1" runat="server" Height="120px" Width="500px" TextMode="MultiLine"></asp:TextBox>
                    <table>
                        <tr>
                            <th style="width:100px">
                            </th>
                            <th style="width:100px">
                                <asp:Button ID="Button6" runat="server"  Text="发布" OnClick="Button6_Click" CssClass="button"/>
                            </th>
                            <th style="width:100px">
                            </th>
                            <th  style="width:100px">
                                <asp:Button ID="Button11" runat="server" Text="返回" OnClick="Button11_Click" CssClass="button"/>
                            </th>
                            <th  style="width:100px">
                            </th>
                        </tr>
                    </table>
                </div>
                <table>
                        <tr>
                            <th style="width:100px"></th>
                            <th style="width:100px"></th>
                            <th style="width:100px"><asp:Label ID="Label2" runat="server" Text="已发公告" ForeColor="White"></asp:Label></th>
                            <th style="width:100px"></th>
                            <th style="width:100px"></th>
                        </tr>
                    </table>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="auto-style1" Width="494px" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" ForeColor="White">
                    <Columns>
                        <asp:BoundField DataField="Cid" HeaderText="课程号" ReadOnly="True" />
                        <asp:TemplateField HeaderText="公告">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Crelease") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Crelease") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="更新" ForeColor="White"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" ForeColor="White"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"  Text="编辑" ForeColor="White"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="删除" ForeColor="White"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <div class="line"></div>
        <div id="footer">
        </div>
    </form>
</body>
</html>