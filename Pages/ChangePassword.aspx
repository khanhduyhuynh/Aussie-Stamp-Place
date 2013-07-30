
<%@ Page Title="Change Password Page" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="Pages_ChangePassword" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainContent" Runat="server">
    <h1>Change your password</h1>
    <div align="center">
        <asp:ChangePassword ID="ChangePassword" runat="server" 
            ContinueDestinationPageUrl="~/Default.aspx" CancelDestinationPageUrl="~/Default.aspx">
        </asp:ChangePassword>
    </div>
</asp:Content>



