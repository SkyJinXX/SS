<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Administrator_InformationManagement.aspx.cs" Inherits="Administrator_InformationManagement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="web_style/Administrator_InformationManagement.css" rel="stylesheet" type="text/css" />

    </head>

<body>
    <form id="form1" runat="server" defaultbutton ="Button9">
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
        <div class="d_body">
            <div class="view">
                <div class="d_title">
                    <asp:Label ID="Label2" runat="server" Text="信息管理" Font-Size="X-Large" ForeColor="White"></asp:Label>
                </div>
                <div class="d_menu">
                    <table>
                        <tr>
                            <th><asp:Label ID="Label6" runat="server" Text="课程ID：" ForeColor="White"></asp:Label></th>
                            <th><asp:TextBox ID="TextBox6" runat="server" Width="100px"></asp:TextBox></th>
                            <th><asp:Label ID="Label7" runat="server" Text="课程名：" ForeColor="White"></asp:Label></th>
                            <th><asp:TextBox ID="TextBox7" runat="server" Width="100px"></asp:TextBox></th>
                            <th><asp:Label ID="Label8" runat="server" Text="课程类别：" ForeColor="White"></asp:Label></th>
                            <th>
                                <asp:DropDownList ID="DropDownList1" runat="server" Width="100px">
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
                            <th><asp:Button ID="Button9" runat="server" OnClick="Button9_Click" Text="查询" Width="55px" CssClass="button" Height="25px" Font-Size="Small" /></th>
                        </tr>
                        <tr>
                            <th colspan="7"><asp:Label ID="Label15" runat="server" ForeColor="White">（提示：请先选择课程在进行操作）</asp:Label></th>
                        </tr>
                    </table>
                </div>
                <div class="d_message">
                    <asp:GridView ID="GridView2" runat="server" Width="700px" AutoGenerateColumns="False"
                        Style="margin-right: 0px" ForeColor="White" >
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:CheckBox runat="server" ID="cbHead" Text="全选" OnCheckedChanged="GridView2_SelectAll" AutoPostBack="true" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Cid" HeaderText="课程号" ReadOnly="True" />
                            <asp:TemplateField HeaderText="课程名">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Cname") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Cname") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="学分">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Ccredit") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Ccredit") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="授课人数">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Cpersonnumber") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Cpersonnumber") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="类别">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList2" runat="server">
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
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Ccategory") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="课程简介">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Cintroduction") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Cintroduction") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <RowStyle HorizontalAlign="Center" />
                    </asp:GridView>
                    <div id="time_setting">
                        <table>
                            <tr style="height:15px"></tr>
                            <tr>
                                <th style="Width:135px"><asp:Label ID="Label13" runat="server" Visible="False" ForeColor="White" ></asp:Label></th>
                                <th style="Width:135px"><asp:Button ID="Button12" runat="server" OnClick="Button12_Click" Text="设置课程时间" Width="110px" CssClass="button" Height="25px" Font-Size="Small" /></th>
                                <th style="Width:135px"><asp:Button ID="Button13" runat="server" OnClick="Button13_Click" Text="修改课程时间" Width="110px" CssClass="button" Height="25px" Font-Size="Small" /></th>
                                <th style="Width:135px"><asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="返回主界面" Width="100px" CssClass="button" Height="25px" Font-Size="Small" /></th>
                            </tr>
                            <tr style="height:15px"></tr>
                            <tr>
                                <th style="Width:135px"></th>
                                <th colspan="3"><asp:Label ID="Label14" runat="server" ForeColor="White">（提示：如果修改课程请单独个别修改）</asp:Label></th>
                            </tr>
                            <tr style="height:15px"></tr>
                            <tr>
                                <th style="Width:135px"><asp:Label ID="Label9" runat="server" Text="选课开始：" ForeColor="White"></asp:Label></th>
                                <th style="Width:135px"><asp:TextBox ID="TextBox8" runat="server" Width="130px"></asp:TextBox></th>
                                <th style="Width:135px"><asp:Label ID="Label10" runat="server" Text="选课结束：" ForeColor="White"></asp:Label></th>
                                <th style="Width:135px"><asp:TextBox ID="TextBox9" runat="server" Width="130px"></asp:TextBox></th>
                                <th style="Width:135px" rowspan="3"><asp:Button ID="Button11" runat="server" OnClick="Button11_Click" Text="确认" Width="70px" CssClass="button" Height="25px" Font-Size="Small" /></th>
                            </tr>
                            <tr style="height:15px"></tr>
                            <tr>
                                <th style="Width:135px"><asp:Label ID="Label11" runat="server" Text="退选开始：" ForeColor="White"></asp:Label></th>
                                <th style="Width:135px"><asp:TextBox ID="TextBox10" runat="server" Width="130px" ></asp:TextBox></th>
                                <th style="Width:135px"><asp:Label ID="Label12" runat="server" Text="退选结束：" ForeColor="White"></asp:Label></th>
                                <th style="Width:135px"><asp:TextBox ID="TextBox11" runat="server" Width="130px"></asp:TextBox></th>
                            </tr>
                        </table>
                    </div>
                    
                </div>
                <div class="main_interface">
                </div>
            </div>
        </div>
        <div class="line"></div>
        <div id="footer">
        </div>
    </form>
</body>
</html>

