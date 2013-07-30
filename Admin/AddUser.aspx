
<%@ Page Title="Add User Page" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddUser.aspx.cs" Inherits="Admin_AddUser" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainContent" Runat="server">
    <h1>Add new user</h1>
    <div align="center">
        <asp:CreateUserWizard ID="AdminCreateUserWizard" runat="server" 
            ContinueDestinationPageUrl="~/Default.aspx" LoginCreatedUser="false" 
            oncreateduser="CreateUserWizard_CreatedUser">
            <WizardSteps>
                <asp:CreateUserWizardStep ID="CreateUserWizardStep" runat="server">
                </asp:CreateUserWizardStep>
                <asp:CompleteWizardStep ID="CompleteWizardStep" runat="server">
                </asp:CompleteWizardStep>
            </WizardSteps>
        </asp:CreateUserWizard>
    </div>
</asp:Content>