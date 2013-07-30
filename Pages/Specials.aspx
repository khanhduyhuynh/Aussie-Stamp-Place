<%@ Page Title="Specials Page" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Specials.aspx.cs" Inherits="Pages_Specials" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainContent" Runat="server">
    <asp:LoginView ID="SpecialLoginView" runat="server">
        <AnonymousTemplate>
          <h1>Welcome to our specials!</h1>
          <h2>
              To be eligible to see and purchase listed specials, you must register as a member.
              <br />
              To become a member, <asp:HyperLink ID="registerLink" runat="server" Text="register now" NavigateUrl="~/Pages/Register.aspx" />.
          </h2>
        </AnonymousTemplate>

        <RoleGroups>
            <asp:RoleGroup Roles="member">
                <ContentTemplate>
                    <h1>Welcome to our member specials!</h1>
                    <h2>
                        Here at Aussie Stamp Place we feature a number of stamps.<br />
                        Featured stamps are available at 15% off their regular listed sale price to members.
                    </h2>
                    <asp:GridView ID="StampSpecialMemberCatalogueGridView" runat="server" 
                        AutoGenerateColumns="False" 
                        DataSourceID="StampSpecialMemberCatalogueDisplayDataSource" AllowSorting="True" 
                        HorizontalAlign="Center" GridLines="None" CellPadding="6">
                        <Columns>
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" 
                                DataFormatString="{0:c}" ItemStyle-HorizontalAlign="Right" >
                            </asp:BoundField>
                            <asp:BoundField DataField="InStock" HeaderText="InStock" 
                                SortExpression="InStock" />
                            <asp:BoundField DataField="LastUpdate" HeaderText="LastUpdate" 
                                SortExpression="LastUpdate" DataFormatString="{0:d}" />
                            <asp:ImageField DataImageUrlField="Picture" 
                                SortExpression="Picture" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="AddToCartMemberButton" Text="Add to cart" PostBackUrl='<%# Eval("StampId", "~/Shopping/ShoppingCartItem.aspx?StampId={0}") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <br />
                    <asp:SqlDataSource ID="StampSpecialMemberCatalogueDisplayDataSource" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:StampDatabaseConnectionString %>" 
                        SelectCommand="SELECT [StampId], [Name], [Price] * 0.85 AS [Price], [InStock], [LastUpdate], [Picture] FROM [TabularStamps] WHERE [OnSpecial] = 1 ORDER BY [Price], [Name]">
                    </asp:SqlDataSource>
                </ContentTemplate>
            </asp:RoleGroup>
            <asp:RoleGroup Roles="dealer, admin">
                <ContentTemplate>
                    <h1>Welcome to our <%= roleName %> specials!</h1>
                    <h2>
                        Here at Aussie Stamp Place we stamps available at 30% of their regular listed sale price to <%= roleName %>s.
                    </h2>
                    <asp:GridView ID="StampSpecialDealerCatalogueGridView" runat="server" 
                        AutoGenerateColumns="False" 
                        DataSourceID="StampSpecialDealerCatalogueDisplayDataSource" AllowSorting="True" 
                        HorizontalAlign="Center" GridLines="None">
                        <Columns>
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Price" HeaderText="Wholesale Price" SortExpression="Price" 
                                DataFormatString="{0:c}" ItemStyle-HorizontalAlign="Right" >
                            </asp:BoundField>
                            <asp:BoundField DataField="InStock" HeaderText="InStock" 
                                SortExpression="InStock" />
                            <asp:BoundField DataField="LastUpdate" HeaderText="LastUpdate" 
                                SortExpression="LastUpdate" DataFormatString="{0:d}" />
                            <asp:ImageField DataImageUrlField="Picture" 
                                SortExpression="Picture" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="AddToCartDealerButton" Text="Add to cart" PostBackUrl='<%# Eval("StampId", "~/Shopping/ShoppingCartItem.aspx?StampId={0}") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <br />
                    <asp:SqlDataSource ID="StampSpecialDealerCatalogueDisplayDataSource" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:StampDatabaseConnectionString %>" 
                        SelectCommand="SELECT [StampId], [Name], [Price] * 0.70 AS [Price], [InStock], [LastUpdate], [Picture] FROM [TabularStamps] WHERE [OnSpecial] = 1 ORDER BY [Price], [Name]">
                    </asp:SqlDataSource>
                </ContentTemplate>
            </asp:RoleGroup>
        </RoleGroups>

        <LoggedInTemplate>
            
        </LoggedInTemplate>
    </asp:LoginView>
</asp:Content>

