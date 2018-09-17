<%@ Page Language="C#" AutoEventWireup="true" CodeFile="各院系人数生源地分布查询.aspx.cs" Inherits="各院系人数生源地分布查询" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>各院系人数生源地分布查询</title>
    <style>
        .auto-style1{
            margin-top:5%;
            margin-left:32%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

                <asp:SiteMapPath ID="SiteMapPath1" runat="server" RenderCurrentNodeAsLink="True"></asp:SiteMapPath>


        <div class="auto-style1">

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="院系名称" HeaderText="院系名称" SortExpression="院系名称" />
                    <asp:BoundField DataField="院系人数" HeaderText="院系人数" SortExpression="院系人数" />
                    <asp:BoundField DataField="安徽" HeaderText="安徽" SortExpression="安徽" />
                    <asp:BoundField DataField="福建" HeaderText="福建" SortExpression="福建" />
                    <asp:BoundField DataField="广东" HeaderText="广东" SortExpression="广东" />
                    <asp:BoundField DataField="湖北" HeaderText="湖北" SortExpression="湖北" />
                    <asp:BoundField DataField="湖南" HeaderText="湖南" SortExpression="湖南" />
                    <asp:BoundField DataField="江西" HeaderText="江西" SortExpression="江西" />
                    <asp:BoundField DataField="重庆" HeaderText="重庆" SortExpression="重庆" />
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
    </form>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select * from [各院系人数生源地分布查询]"></asp:SqlDataSource>
</body>
</html>
