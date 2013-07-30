<%@ Page Title="Stamp List Page" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="StampList.aspx.cs" Inherits="Pages_StampList" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainContent" Runat="server">
    <h1>
        View Our List
    </h1>
    <h2>
        Below is a complete list of our stamps. Use the drop down list to filter the stamps by series.
    </h2>
    <h3>
        Stamp Series:<br />
    </h3>
    <asp:DropDownList ID="StampListDropDownList" runat="server" AutoPostBack="True" 
        DataSourceID="StampListDataSource" AppendDataBoundItems="True" 
        DataTextField="Series" DataValueField="Series">
    </asp:DropDownList>
    <br />
    <br />
    <asp:SqlDataSource ID="StampListDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:StampDatabaseConnectionString %>" 
        SelectCommand="SELECT DISTINCT [Series] FROM [TabularStamps] ORDER BY [Series]">
    </asp:SqlDataSource>

    <asp:GridView ID="StampListGridView" runat="server" 
        AutoGenerateColumns="False" 
        DataSourceID="StampListDisplayDataSource" AllowSorting="True" 
        HorizontalAlign="Center" GridLines="None" CellPadding="6">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" 
                DataFormatString="{0:c}" ItemStyle-HorizontalAlign="Right" >
            </asp:BoundField>
            <asp:BoundField DataField="InStock" HeaderText="InStock" 
                SortExpression="InStock" />
            <asp:BoundField DataField="LastUpdate" HeaderText="LastUpdate" 
                SortExpression="LastUpdate" DataFormatString="{0:d}" />
            <asp:ImageField DataImageUrlField="Picture"
                SortExpression="Picture" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="AddToCartLinkButton" Text="Add to cart" PostBackUrl='<%# Eval("StampId", "~/Shopping/ShoppingCartItem.aspx?StampId={0}") %>' runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="StampListDisplayDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:StampDatabaseConnectionString %>" 
        SelectCommand="SELECT [StampId], [Name], [Price], [InStock], [LastUpdate], [Picture] FROM [TabularStamps] WHERE ([Series] = @Series)">
        <SelectParameters>
            <asp:ControlParameter ControlID="StampListDropDownList" Name="Series" 
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
