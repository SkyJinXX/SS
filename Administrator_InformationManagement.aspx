<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Administrator_InformationManagement.aspx.cs" Inherits="Administrator_InformationManagement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="web_style/Administrator_CourseManagement.css" rel="stylesheet" type="text/css" />

    </head>

<body>
    <form id="form1" runat="server" defaultbutton ="Button9">
        <div  id="top">
            <p id="top_p_r">
                <font id="font_1">Welcome !</font>
                <asp:Label ID="Label1" runat="server" ForeColor="#FF9900" float="right"></asp:Label>
                <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text=" 注销 " />
            </p>
        </div>
        <div id="globllink">
            <ul>
                <li class="li_1"><a><asp:Button ID="Button2" runat="server" Width="100px" Text="操作管理" OnClick="Button2_Click" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White"/></a></li>
                <li class="li_1"><a><asp:Button ID="Button3" runat="server" Width="100px" Text="新管理员注册" OnClick="Button3_Click" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" style="height: 17px"/></a></li>
                <li class="li_1"><a><asp:Button ID="Button4" runat="server" Width="100px" Text="用户信息管理" OnClick="Button4_Click" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" style="height: 17px"/></a></li>
                <li class="li_1"><a><asp:Button ID="Button5" runat="server" Width="100px" Text="课程信息管理" OnClick="Button5_Click" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White"/></a></li>
                <li class="li_1"><a><asp:Button ID="Button7" runat="server" Width="100px" Text="成绩系统管理" OnClick="Button7_Click" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White"/></a></li>
                <li class="li_1"><a><asp:Button ID="Button8" runat="server" Width="100px" Text="个人信息修改" OnClick="Button8_Click" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White"/></a></li>
                <li class="li_1"><a><asp:Button ID="Button10" runat="server" Width="100px" Text="公告发布" OnClick="Button10_Click" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" /></a></li>
                <!---填充导航菜单栏>
                <li><a></a></li>
                <li><a></a></li>
                <li><a></a></li>
                <--->
            </ul>
        </div>
        <div id="d_body">
            <div id="view">
                <div id="d_title">
                    <asp:Label ID="Label2" runat="server" Text="信息管理" Font-Size="X-Large"></asp:Label>
                    
                </div>
                <div id="d_menu">
                    <asp:Label ID="Label6" runat="server" Text="课程ID："></asp:Label>
                    <asp:TextBox ID="TextBox6" runat="server" Width="100px"></asp:TextBox>
                    <asp:Label ID="Label7" runat="server" Text="课程名："></asp:Label>
                    <asp:TextBox ID="TextBox7" runat="server" Width="100px"></asp:TextBox>
                    <asp:Label ID="Label8" runat="server" Text="课程类别："></asp:Label>
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
                    <asp:Button ID="Button9" runat="server" OnClick="Button9_Click" Text="查询" Width="55px" />
                    <br />
                    <asp:Label ID="Label15" runat="server">（提示：请先选择课程在进行操作）</asp:Label>
                    <br />
                </div>
                <div id="d_message">
                    <asp:GridView ID="GridView1" runat="server" Width="700px" AutoGenerateColumns="False"
                        Style="margin-right: 0px" >
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:CheckBox runat="server" ID="cbHead" Text="全选" OnCheckedChanged="GridView1_SelectAll" AutoPostBack="true" />
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
                    <br />
                    <asp:Label ID="Label13" runat="server" Visible="False"></asp:Label>
                    &nbsp;<asp:Button ID="Button12" runat="server" OnClick="Button12_Click" Text="设置课程时间" Width="113px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button13" runat="server" OnClick="Button13_Click" Text="修改课程时间" Width="113px" />
                    &nbsp;<asp:Label ID="Label14" runat="server">（提示：如果修改课程请单独个别修改）</asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label9" runat="server" Text="选课开始："></asp:Label>
                    <asp:TextBox ID="TextBox8" runat="server" Width="150px"></asp:TextBox>
&nbsp;&nbsp;
                    <asp:Label ID="Label10" runat="server" Text="选课结束："></asp:Label>
                    <asp:TextBox ID="TextBox9" runat="server" Width="150px"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="Label11" runat="server" Text="退选开始："></asp:Label>
                    <asp:TextBox ID="TextBox10" runat="server" Width="150px" ></asp:TextBox>
&nbsp;&nbsp;
                    <asp:Label ID="Label12" runat="server" Text="退选结束："></asp:Label>
                    <asp:TextBox ID="TextBox11" runat="server" Width="150px"></asp:TextBox>
                    <br />
                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button11" runat="server" OnClick="Button11_Click" Text="确认" Width="92px" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="返回主界面" Width="91px" />
                </div>
                <div id="main_interface">
                </div>
            </div>
        </div>
    </form>
</body>
</html>

