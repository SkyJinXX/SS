<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Administrator.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Welcome!<asp:Label ID="Label1" runat="server"></asp:Label>
        <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text=" 注销 " />
        </div>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="height: 21px" Text="权限管理" />
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Text="新管理员注" OnClick="Button2_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button3" runat="server" Text="用户信息管理" OnClick="Button3_Click" />
&nbsp;&nbsp; &nbsp;&nbsp;<asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="成绩系统管理" />
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button4" runat="server" Text="课程信息管理" OnClick="Button4_Click" />
        </p>
        &nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Text="信息公告"></asp:Label>
        ：<br />
        <asp:GridView ID="GridView1" runat="server" Height="332px" Width="889px" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="Aname1" HeaderText="管理员A" />
                <asp:BoundField DataField="Aname2" HeaderText="管理员B" />
                <asp:BoundField DataField="A2A_Message" HeaderText="留言信息" />
                <asp:BoundField DataField="A2A_Action" HeaderText="权限操作" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
