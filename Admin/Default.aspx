
<%@ Page Title="Admin Page" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainContent" Runat="server">
    <h1>Administration</h1>
    <h2>
        Welcome <asp:LoginName ID="AdminLoginName" runat="server" />. You have administration priviledges.
    </h2>
</asp:Content>