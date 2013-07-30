<%@ Page Title="Register Page" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Pages_Register" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainContent" Runat="server">
    <h1>Welcome to Aussie Stamp Place!</h1>
    <h2>We welcome your registration. Please fill out the form below to register.</h2>
    <div align="center">
        <asp:CreateUserWizard ID="CreateUserWizard" runat="server" 
            ContinueDestinationPageUrl="~/Default.aspx" 
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
