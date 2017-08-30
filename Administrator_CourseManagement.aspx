﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Administrator_CourseManagement.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="web_style/Administrator_CourseManagement.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        .auto-style1 {
            margin-left: 0px;
        }
    </style>

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
                <li class="li_1"><a><asp:Button ID="Button2" runat="server" Width="100px" Text="操作管理" OnClick="Button1_Click" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White"/></a></li>
                <li class="li_1"><a><asp:Button ID="Button3" runat="server" Width="100px" Text="新管理员注册" OnClick="Button2_Click" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White"/></a></li>
                <li class="li_1"><a><asp:Button ID="Button4" runat="server" Width="100px" Text="用户信息管理" OnClick="Button3_Click" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White"/></a></li>
                <li class="li_1"><a><asp:Button ID="Button5" runat="server" Width="100px" Text="课程信息管理" OnClick="Button4_Click" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White"/></a></li>
                <li class="li_1"><a><asp:Button ID="Button7" runat="server" Width="100px" Text="成绩系统管理" OnClick="Button5_Click" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White"/></a></li>
                <li class="li_1"><a><asp:Button ID="Button8" runat="server" Width="100px" Text="个人信息修改" OnClick="Button7_Click" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White"/></a></li>
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
                    <asp:Label ID="Label2" runat="server" Text="课程管理" Font-Size="X-Large"></asp:Label>
                    
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
                </div>
                <div id="d_message">
                    <asp:GridView ID="GridView1" runat="server" Width="700px" AutoGenerateColumns="False"
                        Style="margin-right: 0px" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowManagement ="GridView1_RowManagement" OnRowDeleted="GridView1_RowDeleted" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
                        <Columns>
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
                            <asp:TemplateField HeaderText="开课时间" ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:Label ID="Label9" runat="server" Text="选课开始："></asp:Label>
                                    <asp:TextBox ID="TextBox8" runat="server" Width="88px"></asp:TextBox>
                                    <asp:Label ID="Label10" runat="server" Text="--"></asp:Label>
                                    <asp:TextBox ID="TextBox9" runat="server" CssClass="auto-style1" Width="88px"></asp:TextBox>
                                    <asp:Label ID="Label11" runat="server" Text="例：2016-08-06 08：59：00"></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="" Text="管理" Width="50px" OnClick="GridView1_RowManagement"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField CancelText="取消" DeleteText="删除" EditText="修改" ShowDeleteButton="True" ShowEditButton="True" />
                        </Columns>
                        <RowStyle HorizontalAlign="Center" />
                    </asp:GridView>
                </div>
                <div id="main_interface">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="返回主界面" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
