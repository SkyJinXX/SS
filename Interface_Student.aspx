<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Interface_Student.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 64%;
        }
        .auto-style2 {
            width: 198px;
        }
        .auto-style3 {
            width: 201px;
        }
        .auto-style4 {
            width: 169px;
            height: 20px;
        }
        .auto-style5 {
            width: 201px;
            height: 20px;
        }
        .auto-style6 {
            height: 20px;
        }
        .auto-style9 {
            width: 300px;
        }
        .auto-style10 {
            width: 270px;
        }
        .auto-style11 {
            margin-left: 0px;
        }
        .auto-style12 {
            margin-top: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        <table align="center" class="auto-style1">
            <tr>
                <td align="right" class="auto-style10">
    
        <asp:Label ID="Label1" runat="server" Text="用户名："></asp:Label>
                </td>
                <td align="left" class="auto-style9">
        <asp:Label ID="Label2" runat="server"></asp:Label>
    
                    <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text=" 注销 " />
    
                </td>
            </tr>
        </table>
    
    </div>
        <table align="center" class="auto-style1">
            <tr>
                <td align="center" class="auto-style2">
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="查询成绩" />
                </td>
                <td align="center" class="auto-style3">
                    <asp:Label ID="Label9" runat="server" Text="选课界面"></asp:Label>
                </td>
                <td align="center" class="auto-style3">
                    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="信息修改" />
                </td>
            </tr>
            </table>
        <p>
        </p>
        <table align="center" class="auto-style1">
            <tr align="center">
                <td align="right" class="auto-style4">
                    <asp:Label ID="Label6" runat="server" Text="寻找课程："></asp:Label>
                </td>
                <td align="center" class="auto-style5">
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style11" Width="402px"></asp:TextBox>
                </td>
                <td align="center" class="auto-style6">
                    <asp:Button ID="Button4" runat="server" OnClick="Button1_Click" Text="搜索" Width="51px" />
                </td>
            </tr>
            </table>
        <p>
        </p>
        <table align="center" class="auto-style1">
            <tr>
                <td align="center" class="auto-style6">
                    <asp:Label ID="Label8" runat="server" Text="课程"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center" class="auto-style6">
        <asp:GridView ID="GridView1" runat="server" Height="334px" Width="652px" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="Cid" HeaderText="课程编号" />
                <asp:BoundField DataField="Cname" HeaderText="课程名称" />
                <asp:BoundField DataField="Ccredit" HeaderText="课程学分" />
                <asp:BoundField DataField="Ccategory" HeaderText="课程类别" />
                <asp:BoundField DataField="Cpersonnumber" HeaderText="课程人数" />
                <asp:BoundField DataField="Cintroduction" HeaderText="课程简介" />
            </Columns>
        </asp:GridView>
                    
                </td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
            </tr>
            <tr>
                <td align="center" class="auto-style6">
                    <asp:Label ID="Label7" runat="server" Text="已选课程"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center" class="auto-style6">
                    <asp:GridView ID="GridView2" runat="server" Height="177px" Width="596px" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="Sid" HeaderText="学号" />
                            <asp:BoundField DataField="Cid" HeaderText="课程号" />
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
