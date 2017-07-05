<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Interface_Teacher_Manage.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Welcome back!<asp:Label ID="Label1" runat="server"></asp:Label>
    
    </div>
        <p>
        <asp:Button ID="Button_Change" runat="server" Text="个人信息修改" OnClick="Button_Change_Click" />
        <asp:Button ID="Button_Create" runat="server" Text="课程管理" OnClick="Button_Create_Click" />
        <asp:Button ID="Button3" runat="server" Text="学生管理" OnClick="Button3_Click" />
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" RepeatDirection="Horizontal">
                <asp:ListItem Value="create">开设课程</asp:ListItem>
                <asp:ListItem Value="change">修改课程</asp:ListItem>
            </asp:RadioButtonList>
        </p>
        <p>
            <asp:Label ID="Label2" runat="server" Text="课程号"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="确认号码" Visible="False" />
        </p>
        <p>
            <asp:Label ID="Label3" runat="server" Text="课程名"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label4" runat="server" Text="学分"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label5" runat="server" Text="人数"></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label6" runat="server" Text="类别"></asp:Label>
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label7" runat="server" Text="课程简介"></asp:Label>
            <asp:TextBox ID="TextBox6" runat="server" Height="190px" TextMode="MultiLine" Width="420px"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="Button4" runat="server" Text="提交" OnClick="Button4_Click" />
        </p>
        <asp:GridView ID="GridView1" runat="server" Height="334px" Width="1264px" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="Cid" HeaderText="课程编号" />
                <asp:BoundField DataField="Cname" HeaderText="课程名称" />
                <asp:BoundField DataField="Ccredit" HeaderText="课程学分" />
                <asp:BoundField DataField="Ccategory" HeaderText="课程类别" />
                <asp:BoundField DataField="Cpersonnumber" HeaderText="课程人数" />
                <asp:BoundField DataField="Cintroduction" HeaderText="课程简介" />
                <asp:CommandField HeaderText="kk" ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" ShowSelectButton="True" />
                <asp:ButtonField Text="Button" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
