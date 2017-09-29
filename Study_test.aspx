<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Study_test.aspx.cs" Inherits="Study_test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="web_style/Study_test.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        .auto-style1 {
            margin-bottom: 10px;
        }
        .auto-style2 {
            width: 37px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div id="top" class="auto-style1">
            <div id="top_image">
                <asp:Image ID="Image1" runat="server" Height="200px" Width="200px"  ImageUrl="~/image/1.jpg" />
            </div>
            <div >
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" >
                    <Columns>
                        <asp:BoundField DataField="Cid" HeaderText="课程号" />
                        <asp:BoundField DataField="ChapterName" HeaderText="章名" />
                        <asp:BoundField DataField="SectionName" HeaderText="节名" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="Cancel" OnClick="LinkButton1_Click" Text="开始测试"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <br />
            </div>
        </div>
        <div id="d_body">
            <div id="menu">
                <table id="T_menu">
                    <tr>
                        <th>
                            <asp:Button ID="Button1" runat="server" Height="50px" Width="100px" Text="公告" OnClick="Button1_Click" />
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Button ID="Button2" runat="server" Height="50px" Width="100px" Text="课件学习" OnClick="Button2_Click" />
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Button ID="Button3" runat="server" Height="50px" Width="100px" Text="作业与测验" OnClick="Button3_Click" />
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Button ID="Button4" runat="server" Height="50px" Width="100px" Text="考试" OnClick="Button4_Click" />
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Button ID="Button5" runat="server" Height="50px" Width="100px" Text="讨论区" OnClick="Button5_Click" />
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Button ID="Button9" runat="server" Height="50px" Width="100px" Text="进度排行" OnClick="Button9_Click"  />
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Button ID="Button7" runat="server" Height="50px" Width="100px" Text="返回选课" OnClick="Button7_Click" />
                        </th>
                    </tr>
                </table>
            </div>
        </div>
    
    </form>
</body>
</html>
