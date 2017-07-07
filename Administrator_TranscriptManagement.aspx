<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Administrator_TranscriptManagement.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 36%;
        }
        .auto-style2 {
            width: 44%;
        }
        .auto-style3 {
            height: 20px;
        }
        .auto-style4 {
            height: 20px;
            width: 16px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Welcome !<asp:Label ID="Label1" runat="server"></asp:Label>
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="返回" />
        <br />
        <br />
        <table class="auto-style2">
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="请输入课程名"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" Width="202px"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="搜索" />
                </td>
            </tr>
        </table>
    
    </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style3">
                    <asp:Label ID="Label3" runat="server" Text="课程名单"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:Label ID="Label4" runat="server"></asp:Label>
                </td>
                <td class="auto-style3"></td>
                <td class="auto-style3"></td>
            </tr>
            <tr>
                <td colspan="5">
                    <asp:GridView ID="GridView1" runat="server" Height="308px" Width="572px">
                    </asp:GridView>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
