<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Interface_Teacher.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Welcome back!<asp:Label ID="Label1" runat="server"></asp:Label>
    
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text=" 注销 " />
    
    </div>
        <asp:Button ID="Button_Change" runat="server" Text="个人信息修改" OnClick="Button_Change_Click" />
        <asp:Button ID="Button_Create" runat="server" Text="课程管理" OnClick="Button_Create_Click" />
        <asp:GridView ID="GridView1" runat="server" Height="349px" Width="686px" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
            <Columns>
                <asp:BoundField DataField="Tmessage" HeaderText="公告" SortExpression="Tmessage" />
            </Columns>
            
        </asp:GridView>
    </form>
</body>
</html>
