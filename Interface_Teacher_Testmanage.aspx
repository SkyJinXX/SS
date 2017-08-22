<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Interface_Teacher_Testmanage.aspx.cs" Inherits="Interface_Teache_Testmanage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="web_style/Interface_Teacher_SM.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        .auto-style1 {
            margin-right: 4px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div  id="top">
            <p id="top_p_r">
                <font id="font_1">Welcome back!</font>
                <asp:Label ID="Label1" runat="server" ForeColor="#FF9900" float="right"></asp:Label>
                <asp:Button ID="Button1" runat="server"  Text=" 注销 " BackColor="#3399FF" BorderColor="Black" BorderStyle="Dotted" BorderWidth="1px"  style="height: 25px" />
            </p>
        </div>
        <div id="globllink">
            <ul>
                <li class="li_1"><a><asp:Button ID="Button2" runat="server" Width="100px" Text="公告" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" /></a></li>
                <li class="li_1"><a><asp:Button ID="Button3" runat="server" Width="100px" Text="个人信息修改"  BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" /></a></li>
                <li class="li_1"><a><asp:Button ID="Button4" runat="server" Width="100px" Text="课程管理"  BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" /></a></li>
                <!---填充导航菜单栏>
                <li><a></a></li>
                <li><a></a></li>
                <li><a></a></li>
                <li><a></a></li>
                <li><a></a></li>
                <li><a></a></li>
                <--->
            </ul>
        </div>
        <div id="middle">
            <div id="d_message">
                <asp:Label ID="Label2" runat="server" Text="上传试题"></asp:Label>
                <br />
                <br />
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="上传" />
&nbsp;&nbsp;&nbsp;
                <br />
                <br />
                <div>已上传文件</div>
     <div>
         <asp:ListBox ID="ListBox1" runat="server" Width="269px" Height="87px"></asp:ListBox>
         <br />
         <br />
         <asp:Button ID="Button7" runat="server" Text="下载文件" />
&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:Button ID="Button8" runat="server" Text="删除文件" />
     </div>
                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="auto-style1">
                    <Columns>
                        <asp:BoundField DataField="Cid" HeaderText="课程号" />
                        <asp:BoundField DataField="Cname" HeaderText="课程名" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="Cancel" OnClick="LinkButton1_Click" Text="设置考试时间"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <br />
                </div>
        </div>
    </form>
</body>
</html>