<%@ Page Title="Home" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="headContent" ContentPlaceHolderID="headContent" Runat="server">
    <span id="top"></span>
</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="mainContent" Runat="server">
    <h1>Welcome to Aussie Stamp Place!</h1>
    <asp:Image ID="imgDefault" runat="server" ImageUrl="~/Images/kangaroos.jpg" />
    <br />
    <p>
        <strong>Aussie Stamp Place</strong> specialises in online sales of all Australia stamps.
    </p>
    <p>
        We don't run a show , we are able to keep our prices down. All our stamps are in good condition.
    </p>
    <p>
        Our online showroom is divided into numerous parts - our demonstration site only shows.
    </p>
    <p>
        3 series of early Australian stamps. We think you'll like our full range.
    </p>
    <p>
        If you have any question , please don't hesitate to contact us on:
    </p>
    <p>
        Aussie Stamps Place Online Showroom<br />
        123 Fake Street<br />
        Fake City, QLD, 1234<br />
        Ph : 07 1234 5678<br />
    </p>
   
   <a href="#top">Top</a>

</asp:Content>

