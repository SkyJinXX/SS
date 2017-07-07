﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Administrator_CourseManagement.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Welcome !<asp:Label ID="Label1" runat="server"></asp:Label>
    
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="返回" />
    
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="课程表："></asp:Label>
        </div>
        <asp:GridView ID="GridView1" runat="server" Height="307px" Width="624px" AutoGenerateColumns="False" 
            OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
            style="margin-right: 0px">
            <Columns>
                <asp:BoundField DataField="Cid" HeaderText="课程号" />
                <asp:BoundField DataField="Cname" HeaderText="课程名" />
                <asp:BoundField DataField="Ccredit" HeaderText="学分" />
                <asp:BoundField DataField="Cpersonnumber" HeaderText="授课人数" />
                <asp:BoundField DataField="Ccategory" HeaderText="类别" />
                <asp:BoundField DataField="Cintroduction" HeaderText="课程简介" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="" OnClick="LinkButton1_Click" Text="删除"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
