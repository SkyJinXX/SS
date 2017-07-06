<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Interface_Teacher_SM.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <div>
    
        Welcome back!<asp:Label ID="Label1" runat="server"></asp:Label>
    
    </div>
        <asp:Button ID="Button_Change" runat="server" Text="个人信息修改" OnClick="Button_Change_Click" EnableTheming="True" />
        <asp:Button ID="Button_Create" runat="server" Text="课程管理" OnClick="Button_Create_Click" />
    
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
            <Columns>
                <asp:BoundField DataField="Sid" HeaderText="学号" ReadOnly="True" />
                <asp:BoundField DataField="Sname" HeaderText="姓名" ReadOnly="True" />
                <asp:TemplateField HeaderText="成绩">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Tscore") %>' Width="25px"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Tscore") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField DeleteText="开除" EditText="打分" ShowDeleteButton="True" ShowEditButton="True" UpdateText="确认" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
