<%@ Page Language="C#" AutoEventWireup="true" CodeFile="学生情况报表.aspx.cs" Inherits="学生情况报表" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>学生情况报表</title>
    <style>
        .auto-style1{
            margin-left:25%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <asp:SiteMapPath ID="SiteMapPath1" runat="server" RenderCurrentNodeAsLink="True"></asp:SiteMapPath>


        <div class="auto-style1">

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="学号" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="学号" HeaderText="学号" ReadOnly="True" SortExpression="学号" />
                    <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                    <asp:BoundField DataField="性别" HeaderText="性别" SortExpression="性别" />
                    <asp:BoundField DataField="出生日期" HeaderText="出生日期" SortExpression="出生日期" />
                    <asp:BoundField DataField="生源地" HeaderText="生源地" SortExpression="生源地" />
                    <asp:BoundField DataField="院系代号" HeaderText="院系代号" SortExpression="院系代号" />
                    <asp:BoundField DataField="政治面貌" HeaderText="政治面貌" SortExpression="政治面貌" />
                    <asp:CheckBoxField DataField="是否住宿" HeaderText="是否住宿" SortExpression="是否住宿" />
                    <asp:BoundField DataField="宿舍电话" HeaderText="宿舍电话" SortExpression="宿舍电话" />
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

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [学生情况]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
