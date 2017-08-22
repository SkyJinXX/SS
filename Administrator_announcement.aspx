<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Administrator_announcement.aspx.cs" Inherits="Administrator_announcement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin-right: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Welcome！<asp:Label ID="Label1" runat="server"></asp:Label>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="注销" Width="54px" />
    
        <br />
    
        <asp:Label ID="Label2" runat="server" Visible="False"></asp:Label>
    
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" Text="全体管理员" OnClick="Button2_Click" />
&nbsp;&nbsp;
        <asp:Button ID="Button3" runat="server" Text="全体教师" OnClick="Button3_Click" Width="87px" />
&nbsp;&nbsp;
        <asp:Button ID="Button4" runat="server" Text="全体学生" OnClick="Button4_Click" Width="93px" />
        <br />
        <br />
        <br />

        <asp:GridView ID="GridView1" runat="server" CssClass="auto-style1" Height="83px" AutoGenerateColumns="False" Visible="False">
            <Columns>
                <asp:TemplateField>
                     <HeaderTemplate>
                        <asp:CheckBox runat="server" ID="cbHead" OnCheckedChanged="GridView1_SelectAll" AutoPostBack="true">
                        </asp:CheckBox>
                    </HeaderTemplate>
                    <EditItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Aid" HeaderText="工号" />
                <asp:BoundField DataField="Aname" HeaderText="姓名" />
                <asp:BoundField DataField="Asex" HeaderText="性别" />
                <asp:BoundField DataField="Aage" HeaderText="年龄" />
                <asp:BoundField DataField="Abirthday" HeaderText="出生日期" />
            </Columns>
        </asp:GridView>
        <asp:GridView ID="GridView2" runat="server" Visible="False" AutoGenerateColumns="False">
            <Columns>
                <asp:TemplateField>
                    <EditItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Tid" HeaderText="工号" />
                <asp:BoundField DataField="Tname" HeaderText="姓名" />
                <asp:BoundField DataField="Tsex" HeaderText="性别" />
                <asp:BoundField DataField="Tbirthday" HeaderText="出生日期" />
                <asp:BoundField DataField="Tprofession" HeaderText="授课专业" />
                <asp:BoundField DataField="Tphone" HeaderText="联系方式" />
            </Columns>
        </asp:GridView>
        <asp:GridView ID="GridView3" runat="server" Visible="False" AutoGenerateColumns="False">
            <Columns>
                <asp:TemplateField>
                    <EditItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Sid" HeaderText="学号" />
                <asp:BoundField DataField="Sname" HeaderText="姓名" />
                <asp:BoundField DataField="Ssex" HeaderText="性别" />
                <asp:BoundField DataField="Sbirthday" HeaderText="生日" />
                <asp:BoundField DataField="Sage" HeaderText="年龄" />
                <asp:BoundField DataField="Sschool" HeaderText="所在学校" />
                <asp:BoundField DataField="Scollege" HeaderText="隶属学院" />
                <asp:BoundField DataField="Smajor" HeaderText="专业" />
                <asp:BoundField DataField="Sphone" HeaderText="联系方式" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="发布" Width="57px" />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
