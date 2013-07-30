
<%@ Page Title="Stamp Catalogue Page" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="StampCatalogue.aspx.cs" Inherits="Pages_StampCatalogue" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainContent" Runat="server">
    <h1>
        View Our Catalogue
    </h1>
    <h2>
        Below is a complete catalogue of our stamps.
    </h2>
    <h3>
        All stamps<br />
    </h3>

    <asp:GridView ID="StampCatalogueGridView" runat="server" 
        AutoGenerateColumns="False" 
        DataSourceID="StampCatalogueDisplayDataSource" AllowSorting="True" 
        HorizontalAlign="Center" GridLines="None" CellPadding="6" DataKeyNames="StampId">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" 
                DataFormatString="{0:c}" ItemStyle-HorizontalAlign="Right" />
            <asp:BoundField DataField="InStock" HeaderText="InStock" 
                SortExpression="InStock" />
            <asp:BoundField DataField="LastUpdate" HeaderText="LastUpdate" 
                SortExpression="LastUpdate" DataFormatString="{0:d}" />
            <asp:ImageField DataImageUrlField="Picture"
                SortExpression="Picture" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton Text="Add to cart" PostBackUrl='<%# Eval("StampId", "~/Shopping/ShoppingCartItem.aspx?StampId={0}") %>' runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="StampCatalogueDisplayDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:StampDatabaseConnectionString %>" 
        SelectCommand="SELECT [StampId], [Name], [Price], [InStock], [LastUpdate], [Picture] FROM [TabularStamps] ORDER BY [Price], [Name]">
    </asp:SqlDataSource>

</asp:Content>

