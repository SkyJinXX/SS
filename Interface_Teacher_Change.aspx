<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Interface_Teacher_Change.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="web_style/Interface_Teacher_Change.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
        <div id="top">
            <p id="top_p_r">
                <font id="font_1">Welcome back!</font>
                <asp:Label ID="Label1" ForeColor="#FF9900" runat="server"></asp:Label>
                <asp:Button ID="Button1"  runat="server" OnClick="Button1_Click" Text=" 注销 " />
            </p>
        </div>
        <div id="d_menu">
            <table>
                <tr>
                    <td>
                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="公告" Width="105px" />
                        <asp:Button ID="Button_Change" runat="server" Width="105px" Text="个人信息修改" OnClick="Button_Change_Click" EnableTheming="True" />
                    </td>
                    <td>
                        <asp:Button ID="Button_Create" runat="server" Width="85px" Text="课程管理" OnClick="Button_Create_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="d_body">
            <div id="d_message">
                <table id="T_1">
                    <tr>
                        <th style="width: 50px;">&nbsp;
                        </th>
                        <th style="width: 50px;">&nbsp;
                        </th>
                        <th>
                            <asp:Label ID="Label8" runat="server" Text="个人信息" Font-Size="X-Large"></asp:Label>
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
                            <asp:Label ID="Label2" runat="server" Text="生日:"></asp:Label>
                        </th>
                        <th>
                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Label ID="Label3" runat="server" Text="职称:"></asp:Label>
                        </th>
                        <th>
                            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Label ID="Label4" runat="server" Text="电话号码:"></asp:Label>
                        </th>
                        <th>
                            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Label ID="Label5" runat="server" Text="介绍:"></asp:Label>
                        </th>
                        <th>
                            <asp:TextBox ID="TextBox1" runat="server" Height="120px" TextMode="MultiLine" Width="300px"></asp:TextBox>
                        </th>
                    </tr>
                </table>
                <table id="T_3">
                    <tr>
                        <th>
                            &nbsp;
                        </th>
                        <th>
                            <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="保存" Width="60px" Height="30px" Font-Size="Medium"  />
                        </th>
                        
                    </tr>
                </table>
            </div>
        </div>
        <div id="footer">

        </div>
    </form>
</body>
</html>
