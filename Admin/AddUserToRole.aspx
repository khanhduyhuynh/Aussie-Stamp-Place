
<%@ Page Title="Add User To Role Page" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddUserToRole.aspx.cs" Inherits="Admin_AddUserToRole" %>
<asp:Content ID="mainContent" ContentPlaceHolderID="mainContent" Runat="server">
    <h1>Add User To Role</h1>
    <h2>Select a user</h2>
    <div align="center">
        <asp:ListBox ID="UsersListBox" runat="server" 
            DataSourceID="UsersListBoxDataSource" DataTextField="UserName">

        </asp:ListBox>
        <asp:SqlDataSource ID="UsersListBoxDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [UserName] FROM [vw_aspnet_MembershipUsers]">
        </asp:SqlDataSource>

        <h2>Select a role</h2>
        <asp:ListBox ID="RolesListBox" runat="server" DataSourceID="RolesDataSource" 
            DataTextField="RoleName" DataValueField="RoleName">
        </asp:ListBox>
        <asp:SqlDataSource ID="RolesDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [RoleName] FROM [vw_aspnet_Roles]">
        </asp:SqlDataSource>
    

        <h2>Click button to add user to role</h2>
        <asp:Button ID="AddUserToRoleButton" runat="server" Text="Add user to role" 
            onclick="AddUserToRoleButton_Click" />
        <br />
        <asp:Label ID="MessageLabel" runat="server" />
        
    </div>
    <br />
</asp:Content>