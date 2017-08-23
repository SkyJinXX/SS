<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Interface_Teacher_Testmanage.aspx.cs" Inherits="Interface_Teache_Testmanage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="web_style/Interface_Teacher_Testmanage.css" rel="stylesheet" type="text/css" />


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
                <li class="li_1"><a><asp:Button ID="Button2" runat="server" Width="100px" Text="公告" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" OnClick="Button2_Click" /></a></li>
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

        <div id="d_body">
            <div id="box">
                <div id="menu">
                    <ul>
                        <li><a>
                            <asp:Button ID="Button5" runat="server" Width="100px"  Text="成绩管理" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" OnClick="Button5_Click1" /></a></li>
                        <li><a>
                            <asp:Button ID="Button9" runat="server" Width="100px"  Text="公告管理" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" OnClick="Button9_Click1" /></a></li>
                        <li><a>
                            <asp:Button ID="Button10" runat="server" Width="100px"  Text="考试管理" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" OnClick="Button10_Click1" /></a></li>
                        <li><a>
                            <asp:Button ID="Button11" runat="server" Width="100px"  Text="章节管理" BackColor="Transparent" BorderColor="Transparent" BorderStyle="None" ForeColor="White" style="height: 17px" OnClick="Button11_Click" /></a></li>
                    </ul>
                </div>
                <div id="d_message">
                    <div id="upload">
                        <asp:Label ID="Label2" runat="server" Text="上传试题"></asp:Label>
                        <br />
                        <asp:FileUpload ID="FileUpload1" runat="server" Width="200px" Height="27px" />
                        <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="上传" />
                        <br />
                    </div>
                    <div id="upload_file">
                        <div>已上传文件</div>
                        <div>
                            <asp:ListBox ID="ListBox1" runat="server" Width="270px" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged"></asp:ListBox>
                            <br />
                            <br />
                        </div>
                        <asp:Button ID="Button7" runat="server" Text="下载文件" OnClick="Button7_Click"  />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button8" runat="server" Text="删除文件" OnClick="Button8_Click"   />
                    </div>
                    <br />
                    <br />
                    <div id="course_table">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="300px">
                            <Columns>
                                <asp:BoundField DataField="Cid" HeaderText="课程号" />
                                <asp:BoundField DataField="Cname" HeaderText="课程名" />
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="Cancel"  Text="设置考试时间"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>