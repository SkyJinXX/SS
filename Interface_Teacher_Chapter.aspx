<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Interface_Teacher_Chapter.aspx.cs" Inherits="Interface_Teacher_Chapter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Welcome!<asp:Label ID="Label1" runat="server"></asp:Label>
        <br />
        <asp:Button ID="Button12" runat="server" OnClick="Button12_Click" Text="返回" Width="57px" />
        <br />
        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label4" runat="server" Text="课程设置"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="C语言共有："></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server" Width="75px"></asp:TextBox>
        <asp:Label ID="Label3" runat="server" Text="章"></asp:Label>
        <br />
        <br />
&nbsp;&nbsp;<asp:Button ID="Button10" runat="server" OnClick="Button10_Click" Text="上一步" />
        &nbsp;
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="下一步" />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label5" runat="server" Text="第"></asp:Label>
        <asp:Label ID="Label6" runat="server" Text="1"></asp:Label>
        <asp:Label ID="Label7" runat="server">章</asp:Label>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label9" runat="server">本章共有：</asp:Label>
        <asp:TextBox ID="TextBox3" runat="server" Width="99px"></asp:TextBox>
        &nbsp;<asp:Label ID="Label10" runat="server">节</asp:Label>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        &nbsp;&nbsp;<asp:Button ID="Button11" runat="server" OnClick="Button11_Click" Text="上一步" />
        &nbsp;&nbsp;
        <asp:Button ID="Button7" runat="server" OnClick="Button7_Click" Text="下一步" />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
        <asp:Label ID="Label11" runat="server" Text="第"></asp:Label>
        <asp:Label ID="Label12" runat="server" Text="1"></asp:Label>
        <asp:Label ID="Label13" runat="server">节</asp:Label>
        <br />
        <br />
        <asp:Label ID="Label8" runat="server">标题：</asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:FileUpload ID="FileUpload1" runat="server" />
        &nbsp;
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="上传" Width="53px" />
        <br />
        <br />
        <asp:Button ID="Button8" runat="server" OnClick="Button8_Click" Text="上一节" />
&nbsp;&nbsp;
        <asp:Button ID="Button9" runat="server" OnClick="Button9_Click" Text="下一节" />
        <br />
        <br />
        <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="上一章" style="height: 21px" />
&nbsp;
        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="下一章" />
&nbsp;
        <br />
        <br />
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="完成" Width="54px" />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
