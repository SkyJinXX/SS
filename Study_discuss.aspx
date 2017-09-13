<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Study_discuss.aspx.cs" Inherits="Study_discuss" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="web_style/Study_discuss.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
        <div id="top">
            <div id="top_image">
                <asp:Image ID="Image1" runat="server" Height="200px" Width="200px"  ImageUrl="~/image/1.jpg" />
            </div>
            <div id="content_title">
                <asp:Label ID="Label1" runat="server" Text="讨论区" Font-Size="XX-Large"></asp:Label>
            </div>
        </div>
        <div id="d_body">
            <div id="menu">
                <table id="T_menu">
                    <tr>
                        <th>
                            <asp:Button ID="Button1" runat="server" Height="50px" Width="100px" Text="公告" OnClick="Button1_Click"/>
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Button ID="Button2" runat="server" Height="50px" Width="100px" Text="课件学习" OnClick="Button2_Click"/>
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Button ID="Button3" runat="server" Height="50px" Width="100px" Text="作业与测验" OnClick="Button3_Click"/>
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Button ID="Button4" runat="server" Height="50px" Width="100px" Text="考试" OnClick="Button4_Click"/>      
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Button ID="Button5" runat="server"  Height="50px" Width="100px" Text="讨论区" OnClick="Button5_Click"/>
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Button ID="Button6" runat="server" Height="50px" Width="100px" Text="进度排行" OnClick="Button6_Click" />
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Button ID="Button7" runat="server" Height="50px" Width="100px" Text="返回选课" OnClick="Button7_Click"/>
                        </th>
                    </tr>
                </table>
            </div>
            <div id="content">
                <asp:Label ID="Label2" runat="server" Text="欢迎来到讨论区！本讨论区供各位同学就该课程问题进行交流学习。" ></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" Height="25px" Width="350px"></asp:TextBox>
                <asp:Button ID="Button8" runat="server" Text="发起主题" Height="32px" Width="80px" OnClick="Button8_Click"/>
            </div>
            <div id="content_table">
                <asp:GridView ID="GridView1" runat="server" Width="470px" AutoGenerateColumns="False" >
                    <Columns>
                        <asp:BoundField DataField="Uusername" HeaderText="用户名">
                            <HeaderStyle Width="80px"></HeaderStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Umessage" HeaderText="发言内容" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="Cancel"  Text="回复" OnClick="LinkButton1_Click1"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle HorizontalAlign="Center" />
                </asp:GridView>
                <br />
                <br />
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" Width="470px">
                    <Columns>
                        <asp:BoundField DataField="Uname1" HeaderText="回复者" />
                        <asp:BoundField DataField="Uname2" HeaderText="回复对象" />
                        <asp:BoundField DataField="Ureply" HeaderText="回复内容" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="Cancel" OnClick="LinkButton1_Click" Text="回复"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>