<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Administrator_Register.aspx.cs" Inherits="Register_Administrator3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        #form1 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        &nbsp;&nbsp;
    
        <asp:Label ID="Label6" runat="server" Text="用户名"></asp:Label>
&nbsp; <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    
        <br />
        <br />
        &nbsp;<asp:Label ID="Label7" runat="server" Text="密码"></asp:Label>
&nbsp;
&nbsp;<asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
        <asp:CheckBox ID="CheckBox1" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" Text="可见" />
        <br />
        <br />
        <asp:Label ID="Label8" runat="server" Text="确认密码"></asp:Label>
&nbsp;<asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox>
        <br />
        <br />
    
        <asp:Label ID="Label1" runat="server" Text="管理员号"></asp:Label>
        &nbsp;<asp:TextBox ID="TextBox4" runat="server" OnTextChanged="TextBox4_TextChanged" Enabled="False" ReadOnly="True"></asp:TextBox>
    
    </div>
        <p>
            &nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label2" runat="server" Text="姓名"></asp:Label>
            &nbsp; <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label5" runat="server" Text="性别"></asp:Label>
            <asp:RadioButtonList ID="RadioButtonList3" runat="server" OnSelectedIndexChanged="RadioButtonList3_SelectedIndexChanged" RepeatDirection="Horizontal"
                Height="16px " Width="398px" style="margin:auto">
                <asp:ListItem Value="男">男</asp:ListItem>
                <asp:ListItem Value="女">女</asp:ListItem>
            </asp:RadioButtonList>
        </p>
        <p>
            &nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label9" runat="server" Text="生日 "></asp:Label>
            &nbsp;<asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
        </p>
        <p>
            &nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label10" runat="server" Text="年龄 "></asp:Label>
            &nbsp;<asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
        </p>
        <asp:Label ID="Label4" runat="server" Text="管理权限"></asp:Label>
         
        <asp:RadioButtonList ID="RadioButtonList4" runat="server" RepeatDirection="Horizontal" Height="16px " Width="398px" style="margin:auto" OnSelectedIndexChanged="RadioButtonList4_SelectedIndexChanged">
            <asp:ListItem Value="1">高</asp:ListItem>
            <asp:ListItem Value="2">中</asp:ListItem>
            <asp:ListItem Value="3">低</asp:ListItem>
        </asp:RadioButtonList>
         
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="上一步" OnClick="Button1_Click1" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="完成注册" OnClick="Button2_Click1" />
    </form>
</body>
</html>
