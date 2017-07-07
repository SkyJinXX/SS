<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Administrator_individual.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Welcome !<asp:Label ID="Label1" runat="server"></asp:Label>
        <br />
    
    </div>
        <asp:Label ID="Label2" runat="server" Text="Aid"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" Enabled="False"></asp:TextBox>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Aname"></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label4" runat="server" Text="Asex"></asp:Label>
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" Width="98px">
            <asp:ListItem>男</asp:ListItem>
            <asp:ListItem>女</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <asp:Label ID="Label5" runat="server" Text="Abirthday"></asp:Label>
        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label6" runat="server" Text="Aage"></asp:Label>
        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label7" runat="server" Text="Alevel"></asp:Label>
        <asp:TextBox ID="TextBox6" runat="server" Enabled="False"></asp:TextBox>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="确定" />
    </form>
</body>
</html>
