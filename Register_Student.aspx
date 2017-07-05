<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register_Student.aspx.cs" Inherits="Register_Student1" %>

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
    
        <asp:Label ID="Label1" runat="server" Text="学号"></asp:Label>
         <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
    
        <br />
    
        <div class="auto-style1">
            <asp:Label ID="Label2" runat="server" Text="姓名"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" ></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="性别"></asp:Label>
            <asp:RadioButtonList ID="RadioButtonList1" runat="server"  RepeatDirection="Horizontal"
                Height="16px " Width="398px" style="margin:auto">
                <asp:ListItem>男</asp:ListItem>
                <asp:ListItem>女</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <asp:Label ID="Label4" runat="server" Text="出生日期"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server" Height="23px" ></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Text="年龄"></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server" ></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label6" runat="server" Text="隶属学校"></asp:Label>
            <asp:TextBox ID="TextBox5" runat="server" ></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label7" runat="server" Text="学院"></asp:Label>
            <asp:TextBox ID="TextBox6" runat="server" ></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label8" runat="server" Text="专业"></asp:Label>
            <asp:TextBox ID="TextBox7" runat="server" ></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label9" runat="server" Text="班级"></asp:Label>
            <asp:TextBox ID="TextBox8" runat="server" ></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label10" runat="server" Text="联系方式"></asp:Label>
            <asp:TextBox ID="TextBox9" runat="server" style="height: 23px"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="上一步" />
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="完成注册" />
    </form>
    <p style="text-align: center">
        &nbsp;</p>
</body>
</html>
