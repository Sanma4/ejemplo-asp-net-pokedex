<%@ Page Title="Lista de Pokemons" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListaPokemons.aspx.cs" Inherits="pokedex.ListaPokemons" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .oculto{
            display: none;
        }
    </style>
    <asp:GridView runat="server" ID="dgvPokemons" CssClass="table"
        AutoGenerateColumns ="false" DataKeyNames="id" OnSelectedIndexChanged="dgvPokemons_SelectedIndexChanged"
       OnPageIndexChanging="dgvPokemons_PageIndexChanging" AllowPaging="true" PageSize="5" >
        <Columns>
            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
            <asp:BoundField HeaderText="Numero" DataField="Numero" />
            <asp:BoundField HeaderText="Tipo" DataField="Tipo.Descripcion" />
            <asp:BoundField HeaderText="Debilidad" DataField="Debilidad.Descripcion" />
            <asp:CommandField  HeaderText="Modificar" ShowSelectButton="true" SelectText="✍️" />
        </Columns>
    </asp:GridView>
    <a href="FormularioPokemon.aspx" class="btn btn-dark">Agregar</a>
</asp:Content>
