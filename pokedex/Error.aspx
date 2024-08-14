<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="pokedex.Error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>⚠️Hubo un problema. Contacta con el servicio tecnico.⚠️</h1>
    <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
</asp:Content>
