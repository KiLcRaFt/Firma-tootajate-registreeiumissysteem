<%@ Page Title="Lisamine" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Lisamine.aspx.cs" Inherits="Firma_tootajate_registreeiumissysteem.Contact" Async="true"%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>.</h2>
        <asp:Label ID="StatusLabel" runat="server" Text="" ForeColor="Green"></asp:Label>
    </main>
</asp:Content>
