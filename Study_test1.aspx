<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Study_test1.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="web_style/Study_test1.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript"  >
        var t;
        var hour = 1;
        var minute =49;
        var second = 50;
        function timeCount() {
            second++;
            if (second == 60) {
                second = 0;
                minute++;
            }
            if (minute == 60) {
                minute = 0;
                hour++;
            }
            if (hour == 2) {
                clearTimeout(t);
                alert("考试结束") 
                location.href='study1.aspx'
            }
            
            document.getElementById('<%=lblTimerHours.ClientID %>').innerHTML = hour;
            document.getElementById('<%=lblTimerMinutes.ClientID%>').innerHTML = minute;
            document.getElementById('<%=lblTimerSeconds.ClientID%>').innerHTML = second;
            t = setTimeout("timeCount()", 1000);
        }
      

</script>
         
</head>
<body>
    <script type="text/javascript">
        window.onload = function () {
            timeCount();
        }
</script>
       
    <form id="form1" runat="server">
        
        <asp:Label ID="lblTimerDays" runat="server" Text="0" ForeColor="Red" />天  
        <asp:Label ID="lblTimerHours" runat="server" Text="0" ForeColor="Red" />时  
        <asp:Label ID="lblTimerMinutes" runat="server" Text="0" ForeColor="Red" />分  
        <asp:Label ID="lblTimerSeconds" runat="server" Text="0" ForeColor="Red" />秒       
         <br />
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

            </div>
        </div>
        <div id="testpaper">
            &nbsp;&nbsp;&nbsp;
            <asp:DataList ID="DataList1" runat="server" Width="700px"  BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="None">
                <FooterStyle BackColor="White" ForeColor="#333333" />
                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                <ItemStyle BackColor="White" ForeColor="#333333" />
                <ItemTemplate>
                     题号:
                <asp:Label ID="Label8" runat="server" Text='<%# Eval("Qid") %>' />
                    <br />
                    题目:
                <asp:Label ID="QuestionLabel" runat="server" Text='<%# Eval("Question") %>' />
                    <br />
                    选项A
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("ChoiceA") %>' />
                    <br/>
                    选项B
                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("ChoiceB") %>' />
                    <br/>
                    选项C
                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("ChoiceC") %>' />
                    <br/>
                    选项D
                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("ChoiceD") %>' />
                    <br/>
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1">A </asp:ListItem>
                        <asp:ListItem Value="2">B</asp:ListItem>
                        <asp:ListItem Value="3">C</asp:ListItem>
                        <asp:ListItem Value="4">D</asp:ListItem>
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
                    <th>&nbsp;
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
