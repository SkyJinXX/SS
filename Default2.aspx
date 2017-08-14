<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
   <asp:UpdatePanel ID="UpdatePanelCountdown" runat="server" UpdateMode="Conditional">  
            <ContentTemplate>  
                <asp:Label ID="lblTimerDays" runat="server" Text="0" ForeColor="Red" />天  
                <asp:Label ID="lblTimerHours" runat="server" Text="0" ForeColor="Red" />时  
                <asp:Label ID="lblTimerMinutes" runat="server" Text="0" ForeColor="Red" />分  
                <asp:Label ID="lblTimerSeconds" runat="server" Text="0" ForeColor="Red" />秒  
             <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick1" />  
            </ContentTemplate>  
        </asp:UpdatePanel>   
    </div>
    </form>
</body>
</html>
