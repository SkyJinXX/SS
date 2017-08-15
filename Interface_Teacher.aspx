<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Interface_Teacher.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="web_style/Interface_Teacher.css" rel="stylesheet" type="text/css" />


</head>
<body>
    <form id="form1" runat="server">
        <div  id="top">
            <p id="top_p_r">
                <font id="font_1">Welcome back!</font>
                <asp:Label ID="Label1" runat="server" ForeColor="#FF9900" float="right"></asp:Label>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text=" 注销 " />
            </p>
        </div>
        <div id="d_menu">
            <table>
                <tr>
                    <td>
                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="公告" Width="105px" />
                        <asp:Button ID="Button_Change" runat="server" Width="105px" Text="个人信息修改" OnClick="Button_Change_Click" />
                    </td>
                    <td>
                        <asp:Button ID="Button_Create" runat="server" Width="80px" Text="课程管理" OnClick="Button_Create_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="middle">
            <asp:GridView ID="GridView1" runat="server" Height="350px" Width="680px" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
            <Columns>
                <asp:BoundField DataField="Tmessage" HeaderText="公告" SortExpression="Tmessage" />
            </Columns>  
        </asp:GridView>
        </div>
        <div id="footer">

        </div>  
    </form>
</body>
</html>
