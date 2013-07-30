
<%@ Page Title="Shopping Cart Page" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Checkout.aspx.cs" Inherits="Shopping_Checkout" %>

<%@ Register src="CartControl.ascx" tagname="CartControl" tagprefix="uc1" %>
<%@ Import Namespace ="System.Data.SqlClient"%>
<%@ Import Namespace ="Shopping"%>
<asp:Content ID="mainContent" ContentPlaceHolderID="mainContent" Runat="server">

    <asp:Label id="NoCartlabel" runat="server" visible="false">
        <br />
        <br />
        There are no items in your cart. Visit the shop to buy items.
        <br />
        <br />
        <br />
    </asp:Label>
    <div style="float:right">
        <asp:LoginView ID="LoginView" Runat="server">
            <AnonymousTemplate>
                <asp:passwordrecovery id="PasswordRecovery" runat="server">
                    <MailDefinition From="khanhduyhuynhcqu@gmail.com" Subject="Password Recovery">
                    </MailDefinition>
                </asp:passwordrecovery>
            </AnonymousTemplate>
        </asp:LoginView>
    </div>
    <asp:Wizard ID="CheckoutWizard" runat="server" ActiveStepIndex="1" 
        onfinishbuttonclick="CheckoutWizard_FinishButtonClick">
        <WizardSteps>
            <asp:WizardStep runat="server" Title="Login">
                <asp:Login ID="userLogin" runat="server">

                </asp:Login>
            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="Delivery Address">
                <asp:CheckBox ID="chkUseProfileAddress" runat="server" AutoPostBack="true" Text="Use membership address" OnCheckedChanged="chkUseProfileAddress_CheckedChanged" />
                <br />
                <table style="border: none">
                    <tr>
                        <td>Name</td>
                        <td><asp:textbox id="txtName" runat="server" /></td>
                        <td>
                            <asp:RequiredFieldValidator ID="NameRequiredFieldValidator" runat="server" 
                                ControlToValidate="txtName" CssClass="ErrorMessage"> * Name is required
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td><asp:textbox id="txtAddress" runat="server" /></td>
                        <td>
                            <asp:RequiredFieldValidator ID="AddressRequiredFieldValidator" runat="server" 
                                ControlToValidate="txtAddress" CssClass="ErrorMessage"> * Address is required
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>City</td>
                        <td><asp:textbox id="txtCity" runat="server" /></td>
                        <td>
                            <asp:RequiredFieldValidator ID="CityRequiredFieldValidator" runat="server" 
                                ControlToValidate="txtCity" CssClass="ErrorMessage"> * City is required
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>State</td>
                        <td><asp:textbox id="txtState" runat="server" /></td>
                        <td>
                            <asp:RequiredFieldValidator ID="StateRequiredFieldValidator" runat="server" 
                                ControlToValidate="txtState" CssClass="ErrorMessage"> * State is required
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Postcode</td>
                        <td><asp:textbox id="txtPostCode" runat="server" /></td>
                        <td>
                            <asp:RequiredFieldValidator ID="PostcodeRequiredFieldValidator" runat="server" 
                                ControlToValidate="txtPostcode" CssClass="ErrorMessage"> * Postcode is required
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Country</td>
                        <td><asp:textbox id="txtCountry" runat="server" /></td>
                        <td>
                            <asp:RequiredFieldValidator ID="CountryRequiredFieldValidator" runat="server" 
                                ControlToValidate="txtCountry" CssClass="ErrorMessage"> * Country is required
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="Payment">
                <asp:DropDownList id="lstCardType" runat="server">
                    <asp:Listitem>MasterCard</asp:Listitem>
                    <asp:Listitem>Visa</asp:Listitem>
                </asp:DropDownList>
                <br />
                Card Number: <asp:Textbox id="txtNurnber" runat="server" Text="0123456789" ReadOnly="True"/>
                <br />
                Expires:
                <asp:textbox id="txtExpiresMonth" runat="server" columns="2" />/<asp:textbox id="txtExpiresYear" runat="server" columns="4" />
            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="Confirmation">
                <uc1:CartControl ID="CartControl1" runat="server" />
                <br />
                <br />
                <br />
                Please confirm the amount you wish to have deducted from your credit card.
            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="Complete">
                <br />
                <br />
                <br />
                Thank you for your order.
                <br />
                <br />
                <br />
            </asp:WizardStep>
        </WizardSteps>
    </asp:Wizard>

</asp:Content>