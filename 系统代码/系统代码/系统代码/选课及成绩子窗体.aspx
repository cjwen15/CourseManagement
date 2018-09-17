<%@ Page Language="C#" AutoEventWireup="true" CodeFile="选课及成绩子窗体.aspx.cs" Inherits="选课及成绩子窗体" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>选课及成绩子窗体</title>
        <style>
            .auto-style1{
                margin-top:5%;
                margin-left:37%;
            }
        </style>
</head>

<body>
    <form id="form1" runat="server">

                <asp:SiteMapPath ID="SiteMapPath1" runat="server" RenderCurrentNodeAsLink="True"></asp:SiteMapPath>


        <div class="auto-style1">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="课程名称" HeaderText="课程名称" SortExpression="课程名称" />
                <asp:BoundField DataField="课程代号" HeaderText="课程代号" SortExpression="课程代号" />
                <asp:BoundField DataField="成绩" HeaderText="成绩" SortExpression="成绩" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
            </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [课程档案].[课程名称],[选课及成绩].[课程代号],[选课及成绩].[成绩]FROM [课程档案],[选课及成绩] WHERE [课程档案].[课程代号]=[选课及成绩].[课程代号]"></asp:SqlDataSource>
    </form>
</body>
</html>
