<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Study_test1.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
    
        <asp:DataList ID="DataList1" runat="server" DataKeyField="Qid" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
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
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="完成测试" />
    &nbsp;<asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="返回" />
        &nbsp;&nbsp;&nbsp;&nbsp;
    </form>
</body>
</html>
