<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Firma_tootajate_registreeiumissysteem._Default" %>


<asp:Content ID="xmlContent" ContentPlaceHolderID="MainContent" runat="server">

    <!DOCTYPE html>
    <html xmls="http://www.w3.org/1999/xhtml">
        <head>
            <title>
                andmeta
            </title>
        </head>
        <body>
            <h1>
                xml ja xslt andmete kuvamine
            </h1>
            <br />
            <div>
                <asp:Xml runat="server" DocumentSource="~/Kompaania.xml" TransformSource="~/Kompaania.xslt"/>
            </div>
        </body>

    </html>
</asp:Content>