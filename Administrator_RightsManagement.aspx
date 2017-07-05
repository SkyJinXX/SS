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
            <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="权限修改" />
&nbsp;&nbsp;
            <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="回复留言" />
            <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
            <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
        </p>
        <p>
            &nbsp;<asp:GridView ID="GridView1" runat="server" Width="350px">
            </asp:GridView>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </p>
        <p>
            <asp:Label ID="Label2" runat="server" Enabled="False" Text="管理员工号：" Visible="False"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text=" 搜索 " OnClick="Button1_Click" Visible="False" />
        </p>
        <p>
            &nbsp;<asp:Label ID="Label3" runat="server" Visible="False"></asp:Label>
        </p>
        <p>
            <asp:TextBox ID="TextBox3" runat="server" Visible="False"></asp:TextBox>
        </p>
        <p>
            &nbsp;<asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Visible="False" />
        </p>
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text=" 返回" Height="19px" />
        </p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </p>
    </form>
</body>
</html>
