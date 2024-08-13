<%@ Page Title="Lista de Pokemons" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListaPokemons.aspx.cs" Inherits="pokedex.ListaPokemons" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" />
    <h1>Lista de Pokemons</h1>

    <div class="row">
        <div class="col-4">
            <div class="mb-3">
                <asp:Label ID="lblFiltro" CssClass="form-label" runat="server" Text="Filtrar(Toca TAB para buscar) "></asp:Label>
                <asp:TextBox ID="txtFiltrar" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtFiltrar_TextChanged" runat="server"></asp:TextBox>
                <asp:CheckBox Text="Filtro por criterios" runat="server" ID="chkFiltroAvanzado" OnCheckedChanged="chkFiltroAvanzado_CheckedChanged" AutoPostBack="true" />
            </div>
        </div>
    </div>

    <%if (filtroAvanzado)
        {%>
    <div class="row">
        <div class="col-3">
            <div class="mb-3">
                <asp:Label Text="Campo" runat="server" CssClass="form-label" />
                <asp:DropDownList runat="server" CssClass="form-control" ID="ddlCampo" AutoPostBack="true" OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged"  >
                    <asp:ListItem Text="Nombre" />
                    <asp:ListItem Text="Tipo" />
                    <asp:ListItem Text="Número" />
                </asp:DropDownList>
            </div>
        </div>
        <div class="col-3">
            <div class="mb-3">
                <asp:Label Text="Criterio" runat="server" CssClass="form-label" />
                <asp:DropDownList runat="server" CssClass="form-control" ID="ddlCriterio" >
                </asp:DropDownList>
            </div>
        </div>
        <div class="col-3">
            <div class="mb-3">
                <asp:Label Text="Filtro" runat="server" CssClass="form-label" />
                <asp:TextBox  ID="txtFiltroAvanzado" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="col-3">
            <div class="mb-3">
                <asp:Label Text="Estado" runat="server" CssClass="form-label" />
                <asp:DropDownList runat="server" CssClass="form-control" ID="ddlEstado">
                    <asp:ListItem Text="Todos" />
                    <asp:ListItem Text="Activo" />
                    <asp:ListItem Text="Inactivo" />
                </asp:DropDownList>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-3">
            <div class="mb-3">
                <asp:Button Text="Buscar" ID="btnBuscar" runat="server" CssClass="btn btn-outline-dark" OnClick="btnBuscar_Click" />
                <asp:Button Text="Restablecer" ID="btnCancelar" runat="server" CssClass="btn btn-outline-danger" OnClick="btnCancelar_Click" />
            </div>
        </div>
         
    </div>


    <%} %>


    <asp:GridView runat="server" ID="dgvPokemons" CssClass="table"
        AutoGenerateColumns="false" DataKeyNames="id" OnSelectedIndexChanged="dgvPokemons_SelectedIndexChanged"
        OnPageIndexChanging="dgvPokemons_PageIndexChanging" AllowPaging="true" PageSize="10">
        <Columns>
            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
            <asp:BoundField HeaderText="Numero" DataField="Numero" />
            <asp:BoundField HeaderText="Tipo" DataField="Tipo.Descripcion" />
            <asp:BoundField HeaderText="Debilidad" DataField="Debilidad.Descripcion" />
            <asp:CheckBoxField HeaderText="Activo" DataField="Activo" />
            <asp:CommandField HeaderText="Acciones" ShowSelectButton="true" SelectText="✍️" />
        </Columns>
    </asp:GridView>
    <a href="FormularioPokemon.aspx" class="btn btn-dark">Agregar</a>
</asp:Content>
