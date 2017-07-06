<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Interface_Student_Select.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style3 {
            width: 84%;
        }
        .auto-style4 {
            width: 69%;
        }
        .auto-style5 {
            width: 86%;
        }
        .auto-style6 {
            width: 283px;
        }
        .auto-style8 {
            width: 168px;
        }
        .auto-style9 {
            width: 209px;
        }
        .auto-style10 {
            width: 66px;
        }
        .auto-style11 {
            width: 525px;
        }
        .auto-style12 {
            width: 132px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        &nbsp;<br />
        <table align="center" class="auto-style4" aria-checked="false">
            <tr>
                <td align="right" class="auto-style6">
                    &nbsp;</td>
                <td align="right" class="auto-style10">
                    <asp:Label ID="Label1" runat="server" Text="用户名："></asp:Label>
                </td>
                <td align="left" aria-checked="undefined">
        <asp:Label ID="Label2" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <br />
        <table align="center" class="auto-style5">
            <tr>
                <td class="auto-style9">
        <asp:Label ID="Label3" runat="server" Text="请输入需要查询的课程"></asp:Label>
                </td>
                <td class="auto-style8">
        <asp:TextBox ID="TextBox1" runat="server" Width="345px"></asp:TextBox>
                </td>
                <td>
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="查询" OnClick="Button1_Click" />
                &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="返回用户主页" />
                </td>
            </tr>
        </table>
        <br />
        <table align="center" class="auto-style3">
            <tr>
                <td align="center" class="auto-style11">
        <asp:Label ID="Label4" runat="server" Text="查询结果"></asp:Label>
                </td>
                <td align="center" class="auto-style12">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style11">
        <asp:GridView ID="GridView1" runat="server" Height="185px" Width="580px" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="Cid" HeaderText="课程编号" />
                <asp:BoundField DataField="Cname" HeaderText="课程名称" />
                <asp:BoundField DataField="Ccategory" HeaderText="课程类别" />
                <asp:BoundField DataField="Ccredit" HeaderText="学分" />
                <asp:BoundField DataField="Cpersonnumber" HeaderText="课程人数" />
                <asp:BoundField DataField="Tscore" HeaderText="分数" />
            </Columns>
        </asp:GridView>
    
                &nbsp;</td>
                <td class="auto-style12">
                    &nbsp;</td>
            </tr>
        </table>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
    </div>
    </form>
</body>
</html>
