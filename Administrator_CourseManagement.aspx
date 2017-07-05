<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Administrator_CourseManagement.aspx.cs" Inherits="Default2" %>

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
        课程表：</div>
        <asp:GridView ID="GridView1" runat="server" Height="307px" Width="624px">
            <Columns>
                <asp:ButtonField Text="Button" />
            </Columns>
        </asp:GridView>
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="删除" />
    </form>
</body>
</html>
