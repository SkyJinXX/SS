<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Administrator_TranscriptManagement.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="web_style/Administrator_TranscriptManagement.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
        <div id="top">
            <p id="top_p_r">
                <font id="font_1">Welcome !</font>
                <asp:Label ID="Label1" ForeColor="#FF9900" runat="server"></asp:Label>
                <asp:Button ID="Button13" runat="server" OnClick="Button13_Click" Text=" 注销 " />
            </p>
        </div>
        <div id="globllink">
            <ul>
                <li class="li_1"><a><asp:Button ID="Button1" runat="server" Width="100px" Text="操作管理" OnClick="Button1_Click" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White"/></a></li>
                <li class="li_1"><a><asp:Button ID="Button2" runat="server" Width="100px" Text="新管理员注册" OnClick="Button2_Click" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White"/></a></li>
                <li class="li_1"><a><asp:Button ID="Button3" runat="server" Width="100px" Text="用户信息管理" OnClick="Button3_Click" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White"/></a></li>
                <li class="li_1"><a><asp:Button ID="Button4" runat="server" Width="100px" Text="课程信息管理" OnClick="Button4_Click" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White"/></a></li>
                <li class="li_1"><a><asp:Button ID="Button5" runat="server" Width="100px" Text="成绩系统管理" OnClick="Button5_Click" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White"/></a></li>
                <li class="li_1"><a><asp:Button ID="Button6" runat="server" Width="100px" Text="个人信息修改" OnClick="Button6_Click" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White"/></a></li>
                <!---填充导航菜单栏>
                <li><a></a></li>
                <li><a></a></li>
                <li><a></a></li>
                <--->
            </ul>
        </div>
        <div id="d_body">
            <div id="view">
                <div id="search">
                    <asp:Label ID="Label2" runat="server" Text="请输入课程名"></asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server" Width="400px" Height="17px"></asp:TextBox>
                    <asp:Button ID="Button8" runat="server" OnClick="Button8_Click1" Text="搜索" />
                    <asp:Button ID="Button9" runat="server" OnClick="Button9_Click" Text="返回主界面" />
                </div>
                <div id="d_title">
                    <asp:Label ID="Label3" runat="server" Text="课程名单" Font-Size="X-Large"></asp:Label>
                    <asp:Label ID="Label4" runat="server"></asp:Label>
                </div>
                <div id="d_message">
                    <asp:GridView ID="GridView1" runat="server" Width="600px" AutoGenerateColumns="False" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
                        <Columns>
                            <asp:BoundField DataField="Sid" HeaderText="学生学号" ReadOnly="True" />
                            <asp:BoundField DataField="Sname" HeaderText="学生姓名" ReadOnly="True" />
                            <asp:BoundField DataField="Scollege" HeaderText="所属学院" ReadOnly="True" />
                            <asp:BoundField DataField="Smajor" HeaderText="专业" ReadOnly="True" />
                            <asp:BoundField DataField="Sclass" HeaderText="班级" ReadOnly="True" />
                            <asp:TemplateField HeaderText="分数">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Tscore") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Tscore") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="更新"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="编辑"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="删除"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
