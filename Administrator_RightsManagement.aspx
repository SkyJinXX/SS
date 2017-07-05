<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Administrator_RightsManagement.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     Welcome !<asp:Label ID="Label1" runat="server"></asp:Label>
    
    </div>
        <p>
            <asp:Label ID="Label2" runat="server" Enabled="False" Text="管理员工号："></asp:Label>
&nbsp;&nbsp;
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;
            <asp:Button ID="Button1" runat="server" Text=" 搜索 " OnClick="Button1_Click" />
        </p>
        <p>
            权限：&nbsp; 
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </p>
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="修改" />
        </p>
        <p>
            <asp:GridView ID="GridView1" runat="server" Width="350px">
            </asp:GridView>
        </p>
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text=" 返回" />
        </p>
    </form>
</body>
</html>
