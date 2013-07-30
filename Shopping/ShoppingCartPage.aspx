
<%@ Page Title="Shopping Cart Page" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ShoppingCartPage.aspx.cs" Inherits="Shopping_ShoppingCartPage" %>

<%@ Register src="CartControl.ascx" tagname="CartControl" tagprefix="uc1" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainContent" Runat="server">
    <h1>Your Shopping Cart</h1>
    <uc1:CartControl ID="CartControl1" runat="server" />
    <br />
    <br />
    
</asp:Content>
