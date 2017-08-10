<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Administrator_CourseManagement.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="web_style/Administrator_CourseManagement.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
        <div  id="top">
            <p id="top_p_r">
                <font id="font_1">Welcome!</font>
                <asp:Label ID="Label1" runat="server" ForeColor="#FF9900" float="right"></asp:Label>
                <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text=" 注销 " />
            </p>
        </div>
        <div id="d_menu">
            <table>
                <tr>
                    <td>
                        <asp:Button ID="Button2" runat="server" Width="100px" Text="操作管理" OnClick="Button1_Click" />
                    </td>
                    <td>
                        <asp:Button ID="Button3" runat="server" Width="100px" Text="新管理员注册" OnClick="Button2_Click" />
                    </td>
                    <td>
                        <asp:Button ID="Button4" runat="server" Width="100px" Text="用户信息管理" OnClick="Button3_Click" />
                    </td>
                    <td>
                        <asp:Button ID="Button5" runat="server" Width="100px" Text="课程信息管理" OnClick="Button4_Click" />
                    </td>
                    <td>
                        <asp:Button ID="Button7" runat="server" Width="100px" Text="成绩系统管理" OnClick="Button5_Click" />
                    </td>
                    <td>
                        <asp:Button ID="Button8" runat="server" Width="100px" Text="个人信息修改" OnClick="Button7_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="d_title">
            <asp:Label ID="Label2" runat="server" Text="课程管理" Font-Size="X-Large"></asp:Label>
        </div>
        <div id="d_message">
            <asp:GridView ID="GridView1" runat="server" Height="250px" Width="1000px" AutoGenerateColumns="False"
                OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                Style="margin-right: 0px" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleted="GridView1_RowDeleted" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
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
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Ccategory") %>'></asp:TextBox>
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
                    <asp:CommandField CancelText="取消" DeleteText="删除" EditText="修改" ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
                <RowStyle HorizontalAlign="Center" />
            </asp:GridView>
        </div>
        <div id="main_interface">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="返回主界面" />
        </div>
    </form>
</body>
</html>
