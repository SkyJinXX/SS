<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <div class="auto-style1">
            <asp:Label ID="Label4" runat="server" Text="用户名"></asp:Label>
            &nbsp;
        <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
        </div>
        <p class="auto-style1">
            <asp:Label ID="Label3" runat="server" Text="密码"></asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox2" runat="server" Width="188px" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
        </p>
        <p class="auto-style1">
            <asp:Label ID="Label5" runat="server" Text="确认密码"></asp:Label>
&nbsp;<asp:TextBox ID="TextBox3" runat="server" OnTextChanged="TextBox3_TextChanged"></asp:TextBox>
            
        </p>
        <asp:RadioButtonList ID="Identity" runat="server" Height="16px" 
            RepeatDirection="Horizontal" Width="239px"  style="margin:auto" 
            OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
            <asp:ListItem  Value="T">老师</asp:ListItem>
            <asp:ListItem Value="S">学生</asp:ListItem>
        </asp:RadioButtonList>
        <p style="text-align: center">
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text=" 返回 " />
&nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="下一步" style="height: 27px" />
        </p>
    </form>
</body>
</html>
