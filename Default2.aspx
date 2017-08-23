<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head runat="server">
      <title></title>
  </head>
  <body>
    <form id="form1" runat="server">
     <div>
         <asp:FileUpload ID="FileUpload1" runat="server" />
     </div>
     <br />
     <br />
     <div>
         <asp:Button ID="Button1" runat="server" Text="检查文件" onclick="Button1_Click" Height="25px" />
         &nbsp;&nbsp;
         <asp:Button ID="Button2" runat="server" Text="(改文件名)上传文件" onclick="Button2_Click" Height="25px" />
         &nbsp;&nbsp;
         <asp:Button ID="Button3" runat="server" Text="(不改文件名)上传文件" onclick="Button3_Click" Height="25px" />
     </div>
     <br />
     <div>
        <asp:Label ID="Label1" runat="server"></asp:Label>
     </div>
     <div>已上传文件</div>
     <div>
         <asp:ListBox ID="ListBox1" runat="server" Width="170px" ></asp:ListBox>
     </div>
     <div>
         <asp:Button ID="Button4" runat="server" Text="下载文件" onclick="Button4_Click"  Height="25px"/>
         &nbsp;&nbsp;
         <asp:Button ID="Button5" runat="server" Text="删除文件" Height="25px" onclick="Button5_Click"/>
     </div>
     </form>
 </body>
</html>