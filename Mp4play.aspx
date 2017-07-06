<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MP4play.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <link rel="stylesheet" type="text/css"
       href="//releases.flowplayer.org/5.4.1/skin/minimalist.css">
    </link>
    
    <style>
    /* site specific styling */
    body {
       font: 12px "Myriad Pro", "Lucida Grande", "Helvetica Neue", sans-serif;
       text-align: center;
       padding-top: 1%;
       color: #999;
       background-color: #333333;
    }
 
    /* custom player skin */
    .flowplayer { width: 105%; 
background-color: #222; background-size: cover; max-width: 800px; }
    .flowplayer .fp-controls { background-color: rgba(0, 0, 0, 0.4)}
    .flowplayer .fp-timeline { background-color: rgba(0, 0, 0, 0.5)}
    .flowplayer .fp-progress { background-color: rgba(219, 0, 0, 1)}
    .flowplayer .fp-buffer { background-color: rgba(249, 249, 249, 1)}
     .flowplayer { background-image: url('http://farm4.staticflickr.com/3169/2972817861_73ae53c2e5_b.jpg');
            top: 0px;
            left: -17px;
            height: 761px;
        }
 
    </style>
 
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
          <asp:Literal ID="LiteralSource" runat="server" ></asp:Literal>
       </video>   
    </div>
    </form>
</body>
</html>