<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MP4play.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="//releases.flowplayer.org/5.4.1/skin/minimalist.css"/>
    <link href="web_style/Mp4play.css" rel="stylesheet" type="text/css" />
    <!-- flowplayer depends on jQuery 1.7.1+ -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <!-- flowplayer javascript component -->
    <script src="//releases.flowplayer.org/5.4.1/flowplayer.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div data-swf="//releases.flowplayer.org/5.4.1/flowplayer.swf"
            class="flowplayer no-toggle"
            data-ratio="0.416">
            <video>
                <asp:Literal ID="LiteralSource" runat="server"></asp:Literal>
            </video>
        </div>
        <div>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="返回" Width="142px" />
        </div>
    </form>
</body>
</html>