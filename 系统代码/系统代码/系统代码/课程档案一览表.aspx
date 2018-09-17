<%@ Page Language="C#" AutoEventWireup="true" CodeFile="课程档案一览表.aspx.cs" Inherits="课程档案一览表" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>课程档案一览表</title>
    <style>
        .auto-style1{
            margin-left:30%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

                <asp:SiteMapPath ID="SiteMapPath1" runat="server" RenderCurrentNodeAsLink="True"></asp:SiteMapPath>


        <div class="auto-style1">

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="课程代号" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="课程代号" HeaderText="课程代号" ReadOnly="True" SortExpression="课程代号" />
                    <asp:BoundField DataField="课程名称" HeaderText="课程名称" SortExpression="课程名称" />
                    <asp:BoundField DataField="类别" HeaderText="类别" SortExpression="类别" />
                    <asp:BoundField DataField="考核方式" HeaderText="考核方式" SortExpression="考核方式" />
                    <asp:BoundField DataField="学分" HeaderText="学分" SortExpression="学分" />
                    <asp:BoundField DataField="备注" HeaderText="备注" SortExpression="备注" />
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

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [课程档案]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
