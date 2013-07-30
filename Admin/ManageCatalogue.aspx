
<%@ Page Title="Manage Catalogue Page" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManageCatalogue.aspx.cs" Inherits="Admin_ManageCatalogue" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainContent" Runat="server">
    <h1>Manage Content</h1>
    <h3>Select category</h3>
     <asp:DropDownList ID="ManageCatalogueDropDownList" runat="server" AutoPostBack="True" 
        DataSourceID="ManageCatalogueDataSource" AppendDataBoundItems="True" 
        DataTextField="Series" DataValueField="Series">
    </asp:DropDownList>
    <br />
    <br />
    <asp:SqlDataSource ID="ManageCatalogueDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:StampDatabaseConnectionString %>" 
        SelectCommand="SELECT DISTINCT [Series] FROM [TabularStamps] ORDER BY [Series]">
    </asp:SqlDataSource>

    <h2>Existing catelogue items:</h2>
    <asp:GridView ID="ManageCatalogueGridView" runat="server" 
        AutoGenerateColumns="False" DataKeyNames="StampId"
        DataSourceID="ManageCatalogueDisplayDataSource" HorizontalAlign="Center"
        EmptyDataText="There are no data records to display." AllowPaging="True" 
        AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />

            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" 
                DataFormatString="{0:n4}" ItemStyle-HorizontalAlign="Right" >
            </asp:BoundField>
            <asp:BoundField DataField="InStock" HeaderText="InStock" SortExpression="InStock" />
            <asp:BoundField DataField="LastUpdate" HeaderText="LastUpdate" SortExpression="LastUpdate" DataFormatString="{0:d}" ReadOnly="true" />
            <asp:BoundField DataField="Picture" HeaderText="Picture Url" SortExpression="Picture" />
            <asp:BoundField DataField="OnSpecial" HeaderText="OnSpecial" SortExpression="OnSpecial" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <asp:SqlDataSource ID="ManageCatalogueDisplayDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StampDatabaseConnectionString %>"
        DeleteCommand="DELETE FROM [TabularStamps] WHERE [StampId] = @StampId" InsertCommand="INSERT INTO [TabularStamps] ([Name], [Price], [InStock], [LastUpdate], [Picture], [OnSpecial]) VALUES (@Name, @Price, @InStock, @LastUpdate, @Picture, @OnSpecial)"
        ProviderName="<%$ ConnectionStrings:StampDatabaseConnectionString.ProviderName %>"
        SelectCommand="SELECT [StampId], [Name], [Price], [InStock], [LastUpdate], [Picture], [OnSpecial] FROM [TabularStamps]  WHERE ([Series] = @Series) ORDER BY [Price], [Name]"
        UpdateCommand="UPDATE [TabularStamps] SET [Name] = @Name, [Price] = @Price, [InStock] = @InStock, [LastUpdate] = GETDATE(), [Picture] = @Picture, [OnSpecial] = @OnSpecial WHERE [StampId] = @StampId">
        <DeleteParameters>
            <asp:Parameter Name="StampId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="InStock" Type="Int32" />
            <asp:Parameter Name="LastUpdate" Type="DateTime" />
            <asp:Parameter Name="Picture" Type="String" />
            <asp:Parameter Name="OnSpecial" Type="Int16" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="InStock" Type="Int32" />

            <asp:Parameter Name="Picture" Type="String" />
            <asp:Parameter Name="OnSpecial" Type="Int16" />
            <asp:Parameter Name="StampId" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="ManageCatalogueDropDownList" Name="Series" 
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <h2>Add a new stamp to the category</h2>
    <asp:FormView ID="StampItemFormView"
                DataSourceID="StampItemsDataSource"
                DataKeyNames="StampId"
                runat="server" DefaultMode="Insert"
                HorizontalAlign="Center" 
        oniteminserted="StampItemFormView_ItemInserted" 
        oniteminserting="StampItemFormView_ItemInserting">
        <HeaderStyle forecolor="white" backcolor="Blue" />                
        <InsertItemTemplate>
            <table>
                <tr>
                    <td><asp:Label ID="NameLabel" runat="server">Name:</asp:Label></td>
                    <td><asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' /></td>
                </tr>
                <tr>
                    <td><asp:Label ID="PriceLabel" runat="server">Price:</asp:Label></td>
                    <td><asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' /></td>
                </tr>
                <tr>
                    <td><asp:Label ID="InStockLabel" runat="server">InStock:</asp:Label></td>
                    <td><asp:TextBox ID="InStockTextBox" runat="server" Text='<%# Bind("InStock") %>' /></td>
                </tr>
                <tr>
                    <td><asp:Label ID="PictureLabel" runat="server">Picture:</asp:Label></td>
                    <td><asp:TextBox ID="PictureTextBox" runat="server" Text='<%# Bind("Picture") %>' /></td>
                </tr>
                <tr>
                    <td><asp:Label ID="OnSpecialLabel" runat="server">OnSpecial:</asp:Label></td>
                    <td><asp:TextBox ID="OnSpecialTextBox" runat="server" Text='<%# Bind("OnSpecial") %>' /></td>
                </tr>
                <tr align="right">
                    <td colspan="2">
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                        CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                        CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </td>
                </tr>
            </table>
        </InsertItemTemplate>
    </asp:FormView>

    <br />
    <asp:SqlDataSource ID="StampItemsDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:StampDatabaseConnectionString %>" 
        SelectCommand="SELECT * FROM [TabularStamps]"
        InsertCommand="INSERT INTO [TabularStamps] ([Name], [Price], [InStock], [LastUpdate], [Picture], [Series], [OnSpecial]) VALUES (@Name, @Price, @InStock, @LastUpdate, @Picture, @Series, @OnSpecial)">
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="InStock" Type="Int32" />
            <asp:Parameter Name="LastUpdate" Type="DateTime" />
            <asp:Parameter Name="Picture" Type="String" />
            <asp:Parameter Name="Series" Type="String" />
            <asp:Parameter Name="OnSpecial" Type="Int16" />
        </InsertParameters>
    </asp:SqlDataSource>

</asp:Content>