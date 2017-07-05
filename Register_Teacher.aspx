<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register_Teacher.aspx.cs" Inherits="Register_Teacher1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="auto-style1">
    
        <asp:Label ID="Label1" runat="server" Text="工号"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="姓名"></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server" ></asp:TextBox>
        <br />
        <br /> 
        <asp:Label ID="Label3" runat="server" Text="性别"></asp:Label>
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal"  Height="16px " Width="398px" style="margin:auto">
            <asp:ListItem>男</asp:ListItem>
            <asp:ListItem>女</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="出生日期"></asp:Label>
        <asp:TextBox ID="TextBox3" runat="server" ></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label5" runat="server" Text="教学专业"></asp:Label>
        <asp:TextBox ID="TextBox4" runat="server" ></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label6" runat="server" Text="个人简介"></asp:Label>
        <asp:TextBox ID="TextBox5" runat="server" ></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label7" runat="server" Text="联系方式"></asp:Label>
        <asp:TextBox ID="TextBox6" runat="server" ></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="上一步" OnClick="Button1_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="完成注册" OnClick="Button2_Click" />
    
    </div>
    </form>
</body>
</html>
