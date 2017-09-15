<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Interface_Teacher_Manage.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="web_style/Interface_Teacher_Manage.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
        <div id="top_menu">
            <div id="user_box">
                <asp:Label ID="Label1" ForeColor="#FF9900" runat="server" float="right"></asp:Label>
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
                        <th style="width: 3px;"></th>
                        <th style="width: 3px;"></th>
                        <th>
                            <asp:Label ID="Label8" runat="server" Text="课程信息" Font-Size="X-Large" ForeColor="White"></asp:Label>
                        </th>
                    </tr>
                </table>
                <table id="T_2">
                    <tr>
                        <th>
                            <asp:Label ID="Label2" runat="server" Text="课程号:" ForeColor="White"></asp:Label>
                        </th>
                        <th>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="确认号码" Visible="False" Style="height: 21px" />
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Label ID="Label3" runat="server" Text="课程名:" ForeColor="White"></asp:Label>
                        </th>
                        <th>
                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Label ID="Label4" runat="server" Text="学分:" ForeColor="White"></asp:Label>
                        </th>
                        <th>
                            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Label ID="Label5" runat="server" Text="人数:" ForeColor="White"></asp:Label>
                        </th>
                        <th>
                            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Label ID="Label6" runat="server" Text="类别:" ForeColor="White"></asp:Label>
                        </th>
                        <th>
                            <asp:DropDownList ID="DropDownList1" runat="server" Height="25px" Width="147px">
                                <asp:ListItem> </asp:ListItem>
                                <asp:ListItem Value="办公效率">办公效率</asp:ListItem>
                                <asp:ListItem Value="编程开发">编程开发</asp:ListItem>
                                <asp:ListItem Value="产品和设计">产品和设计</asp:ListItem>
                                <asp:ListItem Value="生活方式">生活方式</asp:ListItem>
                                <asp:ListItem Value="职业发展">职业发展</asp:ListItem>
                                <asp:ListItem Value="市场营销">市场营销</asp:ListItem>
                                <asp:ListItem Value="技能特长">技能特长</asp:ListItem>
                                <asp:ListItem Value="人文社会">人文社会</asp:ListItem>
                                <asp:ListItem Value="艺术发展">艺术发展</asp:ListItem>
                                <asp:ListItem>其他</asp:ListItem>
                            </asp:DropDownList>
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Label ID="Label7" runat="server" Text="课程简介:" ForeColor="White"></asp:Label>
                        </th>
                        <th>
                            <asp:TextBox ID="TextBox6" runat="server" Height="170px" TextMode="MultiLine" Width="200px"></asp:TextBox>
                        </th>
                    </tr>
                </table>
                <table id="T_3">
                    <tr>
                        <th style="width:20px"></th>
                        <th>
                            <asp:Button ID="Button7" runat="server" Text="开设课程" OnClick="Button7_Click" CssClass="button" Width="80px" Height="25px" Font-Size="Small" />
                        </th>
                        <th style="width:20px"></th>
                        <th>
                            <asp:Button ID="Button2" runat="server" Text="返回主页" OnClick="Button2_Click" CssClass="button" Width="80px" Height="25px" Font-Size="Small" /></th>
                    </tr>
                </table>
            </div>
            <div id="view">
                <div id="T_title">
                    <asp:Label ID="Label9" runat="server" Text="已开课程" Font-Size="X-Large" ForeColor="White"></asp:Label>
                </div>
                <asp:GridView ID="GridView1" runat="server" Width="700px" AutoGenerateColumns="False" HorizontalAlign="Center" ForeColor="White">
                    <Columns>
                        <asp:BoundField DataField="Cid" HeaderText="课程编号" ReadOnly="True" />
                        <asp:TemplateField HeaderText="课程名称">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Cname") %>' Width="25px"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Cname") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="课程学分">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Ccredit") %>' Width="25px"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Ccredit") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="课程类别">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Ccategory") %>' Width="25px"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Ccategory") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="课程人数">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Cpersonnumber") %>' Width="25px"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Cpersonnumber") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="false" CommandName="Cancel" OnClick="LinkButton2_Click" Text="管理" ForeColor="White"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle HorizontalAlign="Center" />
                </asp:GridView>
            </div>
        </div>
        <div class="line"></div>
        <div id="footer">
        </div>
    </form>
</body>
</html>
