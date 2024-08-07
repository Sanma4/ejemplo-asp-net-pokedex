<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormularioPokemon.aspx.cs" Inherits="pokedex.FormularioPokemon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="row">
        <div class="col-6">
            <div class="mb-3">
                <label for="txtId" class="form-label">ID</label>
                <asp:TextBox ID="txtId" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="txtNombre" class="form-label">Nombre</label>
                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="txtNumero" class="form-label">Número</label>
                <asp:TextBox ID="txtNumero" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div class="mb-3">
                <label for="txtNombre" class="form-label">Tipo</label>
                <asp:DropDownList ID="ddlTipo" runat="server" CssClass="form-select"></asp:DropDownList>
            </div>
            <div class="mb-3">
                <label for="txtNombre" class="form-label">Debilidad</label>
                <asp:DropDownList ID="ddlDebilidad" runat="server" CssClass="form-select"></asp:DropDownList>
            </div>
            <div class="mb-3">
                <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="btn btn-dark" OnClick="btnAceptar_Click" />
                <a href="ListaPokemons.aspx" class="btn btn-outline-dark">Cancelar</a>
            </div>
        </div>


        <div class="col-6">
            <div class="mb-3">
                <label for="txtDescripcion" class="form-label">Descripción</label>
                <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
            </div>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <div class="mb-3">
                        <label for="txtUrlImg" class="form-label">Url Imagen</label>
                        <asp:TextBox ID="txtUrlImg" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtUrlImg_TextChanged"></asp:TextBox>
                    </div>
                    <asp:Image ID="imgPokemon" ImageUrl="https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png" runat="server"
                        Width="52%" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <div class="row">
        <div class="col-6">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div>
                        <asp:Button ID="btnEliminar" runat="server" Text="Eliminar"  CssClass="btn btn-danger" onClick="btnEliminar_Click"/>
                        <%if (confirmarEliminar)
                        {%>
                        <asp:CheckBox Text="Confirme su eliminación" runat="server" ID="chkConfirmarEliminacion" />
                        <asp:Button ID="btnConfirmarEliminacion" runat="server" Text="Confirmar"  CssClass="btn btn-outline-danger" onClick="btnConfirmarEliminacion_Click" />
                        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar"  CssClass="btn btn-outline-success" onClick="btnCancelar_Click"   />
                      <%}%>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

    </div>


</asp:Content>
