<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CartControl.ascx.cs" Inherits="Shopping_CartControl" %>

<asp:GridView ID="grdCart" runat="server" AutoGenerateColumns="False" DataKeyNames="StampID" 
    OnRowCancelingEdit="grdCart_RowCancelingEdit" OnRowDeleting="grdCart_RowDeleting" 
    OnRowEditing="grdCart_RowEditing" OnRowUpdating="grdCart_RowUpdating" HorizontalAlign="Center" GridLines="None" CellPadding="6">
    <Columns>
        <asp:ImageField DataImageUrlField="Picture" ReadOnly="true" />
        <asp:BoundField DataField="Name" HeaderText="Product" ReadOnly="true" />
        <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
        <asp:BoundField DataField="Price" HeaderText="Price" ReadOnly="true"
                    DataFormatString="{0:c}" ItemStyle-HorizontalAlign="Right" />
        <asp:BoundField DataField="SubTotal" HeaderText="Total" ReadOnly="true"
                    DataFormatString="{0:c}" ItemStyle-HorizontalAlign="Right" />
           
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
    </Columns>
    <EmptyDataTemplate>
        Your Shopping Cart is empty.
    </EmptyDataTemplate>
</asp:GridView>
<asp:Label ID="TotalLabel" runat="server"></asp:Label>
<br />
<br />
<asp:ImageButton ID="CheckoutLink" runat="server" ImageUrl="~/Images/check_out.gif" PostBackUrl="~/Shopping/Checkout.aspx" />
<br />
<br />
