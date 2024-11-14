<%@ Page Title="XML-faili sisu" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Xml.aspx.cs" Inherits="Firma_tootajate_registreeiumissysteem.Xml" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%= Title %></h2>

        <pre><%= XmlContent %></pre>
    </main>
</asp:Content>