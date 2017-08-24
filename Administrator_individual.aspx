﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Administrator_individual.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="web_style/Administrator_individual.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
        <div id="top">
            <p id="top_p_r">
                <font id="font_1">Welcome !</font>
                <asp:Label ID="Label1" ForeColor="#FF9900" runat="server"></asp:Label>
                <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text=" 注销 " />
            </p>
        </div>
        <div id="d_body">
            <div id="view">
                <div id="d_message">
                    <table id="T_1">
                        <tr>
                            <th style="width: 60px;">&nbsp;
                            </th>
                            <th style="width: 60px">&nbsp;
                            </th>
                            <th>
                                <asp:Label ID="Label11" runat="server" Text="信息修改" Font-Size="X-Large"></asp:Label>
                            </th>
                            <th style="width: 50px;">&nbsp;
                            </th>
                            <th style="width: 50px;">&nbsp;
                            </th>
                        </tr>
                    </table>
                    <table id="T_2">
                        <tr>
                            <th>
                                <asp:Label ID="Label2" runat="server" Text="编号"></asp:Label>
                            </th>
                            <th>
                                <asp:TextBox ID="TextBox1" runat="server" Enabled="False"></asp:TextBox>
                            </th>
                            <th>&nbsp;
                            </th>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="Label3" runat="server" Text="姓名"></asp:Label>
                            </th>
                            <th>
                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                            </th>
                            <th>&nbsp;
                                <asp:Label ID="Label12" runat="server"></asp:Label>
                            </th>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="Label4" runat="server" Text="性别"></asp:Label>
                            </th>
                            <th>
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" Width="126px">
                                    <asp:ListItem>男</asp:ListItem>
                                    <asp:ListItem>女</asp:ListItem>
                                </asp:RadioButtonList>
                            </th>
                            <th>&nbsp;<asp:Label ID="Label13" runat="server"></asp:Label>
&nbsp;</th>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="Label5" runat="server" Text="生日"></asp:Label>
                            </th>
                            <th>
                                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                            </th>
                            <th>&nbsp;
                            </th>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="Label6" runat="server" Text="年龄"></asp:Label>
                            </th>
                            <th>
                                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                            </th>
                            <th>&nbsp;
                            </th>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="Label7" runat="server" Text="管理权限"></asp:Label>
                            </th>
                            <th>
                                <asp:TextBox ID="TextBox6" runat="server" Enabled="False"></asp:TextBox>
                            </th>
                            <th>&nbsp;
                            </th>
                        </tr>
                    </table>
                    <table id="T_3">
                        <tr>
                            <th>&nbsp;&nbsp;&nbsp;&nbsp;
                            </th>
                            <th>
                                <asp:Button ID="Button1" runat="server" Width="50px" OnClick="Button1_Click" Text="确定" />
                            </th>
                            <th>&nbsp;
                            </th>
                            <th>
                                <asp:Button ID="Button2" runat="server" Width="50px" OnClick="Button2_Click" Text="返回" />
                            </th>
                            <th>&nbsp;
                            </th>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
