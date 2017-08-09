<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Administrator_UsersManagement.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Welcome !<asp:Label ID="Label1" runat="server"></asp:Label>
        <br />
        <asp:Label ID="Label3" runat="server" Enabled="False" Visible="False"></asp:Label>
        <br />
        <br />
    
    </div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="学生表" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="教师表" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="管理员表" />
        &nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="工号 "></asp:Label>
&nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="搜索" />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" Height="160px" Width="224px" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="Uusername" HeaderText="账号" />
                <asp:BoundField DataField="Upassword" HeaderText="密码" />
                <asp:BoundField DataField="Uidentity" HeaderText="身份" />
            </Columns>
        </asp:GridView>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="Sid" HeaderText="学生工号" />
                <asp:BoundField DataField="Sname" HeaderText="姓名" />
                <asp:BoundField DataField="Ssex" HeaderText="性别" />
                <asp:BoundField DataField="Sbirthday" HeaderText="生日" />
                <asp:BoundField DataField="Sage" HeaderText="年龄" />
                <asp:BoundField DataField="Sschool" HeaderText="所在学校" />
                <asp:BoundField DataField="Scollege" HeaderText="隶属学院" />
                <asp:BoundField DataField="Smajor" HeaderText="专业" />
                <asp:BoundField DataField="Sphone" HeaderText="联系电话" />
                <asp:BoundField DataField="Uusername" HeaderText="账号" />
                <asp:BoundField DataField="Upassword" HeaderText="密码" />
                <asp:BoundField DataField="Uidentity" HeaderText="身份" />
            </Columns>
        </asp:GridView>
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="Tid" HeaderText="教师工号" />
                <asp:BoundField DataField="Tname" HeaderText="姓名" />
                <asp:BoundField DataField="Tsex" HeaderText="性别" />
                <asp:BoundField DataField="Tbirthday" HeaderText="生日" />
                <asp:BoundField DataField="Tprofession" HeaderText="专业" />
                <asp:BoundField DataField="Tphone" HeaderText="联系电话" />
                <asp:BoundField DataField="Uusername" HeaderText="账号" />
                <asp:BoundField DataField="Upassword" HeaderText="密码" />
                <asp:BoundField DataField="Uidentity" HeaderText="身份" />
            </Columns>
        </asp:GridView>
        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="Aid" HeaderText="管理员工号" />
                <asp:BoundField DataField="Aname" HeaderText="姓名" />
                <asp:BoundField DataField="Asex" HeaderText="性别" />
                <asp:BoundField DataField="Abirthday" HeaderText="生日" />
                <asp:BoundField DataField="Aage" HeaderText="年龄" />
                <asp:BoundField DataField="Alevel" HeaderText="权限等级" />
                <asp:BoundField DataField="Uusername" HeaderText="账号" />
                <asp:BoundField DataField="Upassword" HeaderText="密码" />
                <asp:BoundField DataField="Uidentity" HeaderText="身份" />
            </Columns>
        </asp:GridView>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="返回" />
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="重置密码" />
    </form>
</body>
</html>
