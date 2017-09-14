<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Administrator_TranscriptManagement.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="web_style/Administrator_TranscriptManagement.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server" defaultbutton ="Button8">
        <div id="top_menu">
            <div id="user_box">
                <asp:Label ID="Label1" ForeColor="#FF9900" runat="server"></asp:Label>
                <asp:Button ID="Button13" runat="server" OnClick="Button13_Click" Text=" 注销 " />
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
            <div id="view">
                <div id="search">
                    <table>
                        <tr>
                            <th><asp:Label ID="Label5" runat="server" Text="课程ID：" ForeColor="White"></asp:Label></th>
                            <th><asp:TextBox ID="TextBox5" runat="server" Width="100px" Height="15px"></asp:TextBox></th>
                            <th><asp:Label ID="Label2" runat="server" Text="课程名：" ForeColor="White"></asp:Label></th>
                            <th><asp:TextBox ID="TextBox1" runat="server" Width="100px" Height="15px"></asp:TextBox></th>
                            <th><asp:Label ID="Label6" runat="server" Text="课程类别：" ForeColor="White"></asp:Label></th>
                            <th>
                                <asp:DropDownList ID="DropDownList1" runat="server" Height="20px" Width="100px">
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
                            <th><asp:Label ID="Label7" runat="server" Text="学生ID：" ForeColor="White"></asp:Label></th>
                            <th><asp:TextBox ID="TextBox6" runat="server" Width="100px" Height="15px"></asp:TextBox></th>
                            <th><asp:Label ID="Label8" runat="server" Text="学生姓名：" ForeColor="White"></asp:Label></th>
                            <th><asp:TextBox ID="TextBox7" runat="server" Width="100px" Height="15px"></asp:TextBox></th>
                            <th colspan="2"><asp:Button ID="Button8" runat="server" OnClick="Button8_Click1" Text="查询" CssClass="button" Width="100px" Height="25px" Font-Size="Small" /></th>
                        </tr>
                    </table>
                </div>
                <div id="d_title">
                    <asp:Label ID="Label3" runat="server" Text="课程名单" Font-Size="X-Large" ForeColor="White"></asp:Label>
                </div>
                <div id="d_message">
                    <asp:GridView ID="GridView1" runat="server" Width="700px" AutoGenerateColumns="False" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" Style="margin-left: 0px" HorizontalAlign="Center" ForeColor="White">
                        <Columns>
                            <asp:BoundField DataField="Cid" HeaderText="课程号" ReadOnly="True" />
                            <asp:BoundField DataField="Cname" HeaderText="课程名" ReadOnly="True" />
                            <asp:BoundField DataField="Ccategory" HeaderText="课程类别" ReadOnly="True" />
                            <asp:BoundField DataField="Sid" HeaderText="学生学号" ReadOnly="True" />
                            <asp:BoundField DataField="Sname" HeaderText="学生姓名" ReadOnly="True" />
                            <asp:TemplateField HeaderText="平时分">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Pscore") %>' Width="25px"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Pscore") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="期中考试">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Mscore") %>' Width="25px"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Mscore") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="期末考试">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Fscore") %>' Width="25px"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Fscore") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="总分">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Tscore") %>' Width="25px"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Tscore") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="更新" ForeColor="White"></asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" ForeColor="White"></asp:LinkButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="编辑" ForeColor="White"></asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="删除" ForeColor="White"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <RowStyle HorizontalAlign="Center" />
                    </asp:GridView>
                    
                </div>
                <div id="d_botton">
                    <asp:Button ID="Button9" runat="server" OnClick="Button9_Click" Text="返回主界面" CssClass="button" Width="100px" Height="25px" Font-Size="Small" />
                </div>
            </div>
        </div>
        <div class="line"></div>
        <div id="footer">
        </div>
    </form>
</body>
</html>
