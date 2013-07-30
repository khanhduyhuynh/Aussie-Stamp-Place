
<%@ Page Title="Shopping Cart Item Page" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ShoppingCartItem.aspx.cs" Inherits="Shopping_ShoppingCartItem" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainContent" Runat="server">
    <h1>Selected Item</h1><asp:Label runat="server" ID="show" />
    <div align="center">
        <asp:DataList ID="StampDetailDataList" runat="server" DataKeyField="StampId" 
            DataSourceID="StampDetailDataSource">
            <ItemTemplate>
                <asp:Image ID="Picture" runat="server" ImageUrl='<%# Eval("Picture") %>' />
                <asp:Label ID="PictureLabel" runat="server" Text='<%# Eval("Picture") %>' Visible="false" />
                <br />
                <br />
                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                <br />
                <asp:Label ID="Price" runat="server" Text='<%# Eval("Price", "{0:c}") %>' />
                <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' Visible="false" />
                <br />
                <br />
            </ItemTemplate>
        </asp:DataList>
        <br />
        <br />
        <asp:ImageButton ID="AddToCartButton" runat="server" 
            ImageUrl="~/Images/add_to_cart.gif" onclick="AddToCartButton_Click" />
        <br />
        <br />
        <br />
        <asp:ImageButton ID="BackButton" runat="server" 
            ImageUrl="~/Images/go_back.gif" onclick="BackButton_Click" />
        <br />
        <br />
    </div>

    <asp:SqlDataSource ID="StampDetailDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:StampDatabaseConnectionString %>">
    </asp:SqlDataSource>
    
</asp:Content>
