<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Study_test1.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="web_style/Study_test1.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

        <asp:UpdatePanel ID="UpdatePanelCountdown" runat="server" UpdateMode="Conditional">  
            <ContentTemplate>  
                <asp:Label ID="lblTimerDays" runat="server" Text="0" ForeColor="Red" />天  
                <asp:Label ID="lblTimerHours" runat="server" Text="0" ForeColor="Red" />时  
                <asp:Label ID="lblTimerMinutes" runat="server" Text="0" ForeColor="Red" />分  
                <asp:Label ID="lblTimerSeconds" runat="server" Text="0" ForeColor="Red" />秒  
             <asp:Timer ID="Timer1" runat="server" Interval="1000"  />  
            </ContentTemplate>  
        </asp:UpdatePanel>   
        
        <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
        <div id="top">
            <div id="top_image">
                <asp:Image ID="Image1" runat="server" Height="200px" Width="200px" ImageUrl="~/image/1.jpg" />
            </div>
            <div id="title_1">
                <asp:Label ID="Label3" runat="server" Text="欢迎"></asp:Label>
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </div>
            <div id="title_2">
                <asp:Label ID="Label2" runat="server" Text="第一章" Font-Size="XX-Large"></asp:Label>
                
            </div>
        </div>
        <div id="testpaper">
            
            
&nbsp;&nbsp;&nbsp;
            <asp:DataList ID="DataList1" runat="server" Width="700px" DataKeyField="Qid" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
                <FooterStyle BackColor="White" ForeColor="#333333" />
                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                <ItemStyle BackColor="White" ForeColor="#333333" />
                <ItemTemplate>
                    题号:
                <asp:Label ID="QidLabel" runat="server" Text='<%# Eval("Qid") %>' />
                    <br />
                    题目:
                <asp:Label ID="QuestionLabel" runat="server" Text='<%# Eval("Question") %>' />
                    <br />
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="A">A </asp:ListItem>
                        <asp:ListItem>B</asp:ListItem>
                        <asp:ListItem>C</asp:ListItem>
                        <asp:ListItem>D</asp:ListItem>
                    </asp:RadioButtonList>
                    <br />
                </ItemTemplate>
                <SelectedItemStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                <SelectedItemTemplate>
                    <asp:RadioButtonList ID="RadioButtonList2" runat="server">
                    </asp:RadioButtonList>
                </SelectedItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConStr %>" SelectCommand="SELECT [Qid], [Question] FROM [Questions]"></asp:SqlDataSource>
        </div>
        <div id="operate">
            <table id="T_1">
                <tr>
                    <th>
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="完成测试" />
                    </th>
                    <th>
                        &nbsp;
                    </th>
                    <th>
                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="返回选课" />
                    </th>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
