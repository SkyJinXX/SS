<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Interface_Teacher_Change.aspx.cs" Inherits="Default2" %>

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
        <asp:Button ID="Button_Change" runat="server" Text="个人信息修改" OnClick="Button_Change_Click" EnableTheming="True" />
        <asp:Button ID="Button_Create" runat="server" Text="课程管理" OnClick="Button_Create_Click" />
        <asp:Button ID="Button3" runat="server" Text="打分" OnClick="Button3_Click" />
        </p>
        <asp:Label ID="Label2" runat="server" Text="生日:"></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <p>
            <asp:Label ID="Label3" runat="server" Text="职称："></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        </p>
        <asp:Label ID="Label4" runat="server" Text="电话号码："></asp:Label>
        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        <p>
            <asp:Label ID="Label5" runat="server" Text="介绍："></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" Height="294px" TextMode="MultiLine" Width="426px"></asp:TextBox>
        </p>
        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="提交" />
    </form>
</body>
</html>
