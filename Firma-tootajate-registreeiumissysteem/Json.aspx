<%@ Page Title="JSON-faili sisu" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Json.aspx.cs" Inherits="Firma_tootajate_registreeiumissysteem.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>.</h2>

        <pre><%: JsonContent %></pre>
    </main>
</asp:Content>
