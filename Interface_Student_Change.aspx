<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Interface_Student_Change.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="web_style/Interface_Student_Change.css" rel="stylesheet" type="text/css" />
    
</head>
<body>
    <form id="form1" runat="server">
        <div id="top_menu">
            <div id="user_box">
                <asp:Label ID="Label1" runat="server"></asp:Label>
                <asp:Button ID="Button1" runat="server" Text="注销" OnClick="Button1_Click" />
            </div>
        </div>
        <div id="c_background">
            <canvas id="c"></canvas>
            <script src="JavaScript/geometry.js" type="text/javascript"></script>
        </div>

        <div id="d_body" >
            <div id="d_message">
                <p class="p2_1"></p>
                <table>
                    <tr>
                        <th style="width: 100px;"></th>
                        <th style="width: 40px;"></th>
                        <th>
                            <asp:Label ID="Label8" runat="server" Text="个人信息" Font-Size="X-Large"></asp:Label>
                        </th>
                        <th style="width: 50px;"></th>
                        <th style="width: 50px;"></th>
                    </tr>
                </table>
                <table id="T_1">
                    <tr style="height: 10px"></tr>
                    <tr>
                        <th style="width: 100px;"></th>
                        <th style="width: 100px;">
                            <asp:Label ID="Label9" runat="server" Text="学号:"></asp:Label>
                        </th>
                        <th style="width: 100px;">
                            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                        </th>
                        <th style="width: 100px;"></th>
                    </tr>
                    <tr style="height: 10px"></tr>
                    <tr>
                        <th style="width: 100px;"></th>
                        <th style="width: 100px;">
                            <asp:Label ID="Label3" runat="server" Text="姓名:"></asp:Label>
                        </th>
                        <th style="width: 100px;">
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </th>
                        <th style="width: 100px;"></th>
                    </tr>
                    <tr style="height: 10px"></tr>
                    <tr>
                        <th style="width: 100px;"></th>
                        <th style="width: 100px;">
                            <asp:Label ID="Label5" runat="server" Text="专业:"></asp:Label>
                        </th>
                        <th style="width: 100px;">
                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        </th>
                        <th style="width: 100px;"></th>
                    </tr>
                    <tr style="height: 10px"></tr>
                    <tr>
                        <th style="width: 100px;"></th>
                        <th style="width: 100px;">
                            <asp:Label ID="Label6" runat="server" Text="班级:"></asp:Label>
                        </th>
                        <th style="width: 100px;">
                            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                        </th>
                        <th style="width: 100px;"></th>
                    </tr>
                    <tr style="height: 10px"></tr>
                    <tr>
                        <th style="width: 100px;"></th>
                        <th style="width: 100px;">
                            <asp:Label ID="Label7" runat="server" Text="联系方式:"></asp:Label>
                        </th>
                        <th style="width: 100px;">
                            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        </th>
                        <th style="width: 100px;"></th>
                    </tr>
                    <tr style="height: 10px"></tr>
                    <tr>
                        <th style="width: 100px;"></th>
                        <th style="width: 100px;">
                            <asp:Label ID="Label10" runat="server" Text="出生日期:"></asp:Label>
                        </th>
                        <th style="width: 100px;">
                            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                        </th>
                        <th style="width: 100px;"></th>
                    </tr>
                    <tr style="height: 10px"></tr>
                    <tr>
                        <th style="width: 100px;"></th>
                        <th style="width: 100px;">
                            <asp:Label ID="Label11" runat="server" Text="年龄:"></asp:Label>
                        </th>
                        <th style="width: 100px;">
                            <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                        </th>
                        <th style="width: 100px;"></th>
                    </tr>
                    <tr style="height: 10px"></tr>
                    <tr>
                        <th style="width: 100px;"></th>
                        <th style="width: 100px;">
                            <asp:Label ID="Label12" runat="server" Text="性别:"></asp:Label>
                        </th>
                        <th style="width: 100px;">
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" Width="111px">
                                <asp:ListItem>男</asp:ListItem>
                                <asp:ListItem>女</asp:ListItem>
                            </asp:RadioButtonList>
                        </th>
                        <th style="width: 100px;"></th>
                    </tr>
                    <tr style="height: 10px"></tr>
                    <tr>
                        <th style="width: 100px;"></th>
                        <th style="width: 100px;">
                            <asp:Label ID="Label13" runat="server" Text="所在学校:"></asp:Label>
                        </th>
                        <th style="width: 100px;">
                            <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                        </th>
                        <th style="width: 100px;"></th>
                    </tr>
                    <tr style="height: 10px"></tr>
                    <tr>
                        <th style="width: 100px;"></th>
                        <th style="width: 100px;">
                            <asp:Label ID="Label14" runat="server" Text="隶属学院:"></asp:Label>
                        </th>
                        <th style="width: 100px;">
                            <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                        </th>
                        <th style="width: 100px;"></th>
                    </tr>
                </table>
                <table id="T_2">
                    <tr style="height: 10px"></tr>
                    <tr>
                        <th style="width: 100px;">
                        </th>
                        <th style="width: 100px;">
                        </th>
                        <th>
                            <asp:Button ID="Button4" CssClass="button" runat="server" Text="保存" OnClick="Button4_Click" Width="50px" Height="25px" Font-Size="Small" /></th>
                        <th>
                            <asp:Button ID="Button5" CssClass="button" runat="server" Text="返回" OnClick="Button5_Click" Width="50px" Height="25px" Font-Size="Small" /></th>
                        <th style="width: 100px;">
                        </th>
                        <th style="width: 100px;">
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
