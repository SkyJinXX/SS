<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            text-align: center;
        }
    </style>
</head>
<body style="height: 557px">
    <form id="form1" runat="server">
    <div>
    
    </div>
        <asp:Label ID="Label2" runat="server" Text="用户名:"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <p>
            <asp:Label ID="Label3" runat="server" Text="密码:"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
        </p>    
         <div>
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" Height="16px" 
            RepeatDirection="Horizontal" Width="398px"  style="margin:auto" 
            OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
            <asp:ListItem Value="A">管理员</asp:ListItem>
            <asp:ListItem Value="T">老师</asp:ListItem>
            <asp:ListItem Value="S">学生</asp:ListItem>
        </asp:RadioButtonList>
        </div>
        <p>
            &nbsp;
            <asp:Button ID="Login" runat="server" OnClick="Button1_Click" Text="登陆" Width="51px" Height="25px" />
            <asp:Button ID="Register" runat="server" OnClick="Register_Click" Text="注册" Height="25px" Width="50px" />
            <asp:Button ID="Change" runat="server" OnClick="Change_Click" Text="修改密码" Height="27px" Width="62px" />
        </p>
        
    </form>
</body>
</html>
