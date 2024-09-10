<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MiPerfil.aspx.cs" Inherits="pokedex.Mi_Perfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col">
            <div class="card text-center border-secondary">
                <div class="card-header border-secondary">
                    MI PERFIL
                </div>
                <div class="card-body ">
                    <div class="col ">
                        <form>
                            <div class="mb-3 text-start ">
                                <label for="txtEmail" class="form-label">Email</label>
                                <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control border-secondary"></asp:TextBox>
                            </div>
                            <div class="mb-3 text-start ">
                                <label for="txtNombre" class="form-label">Nombre</label>
                                <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control border-secondary"></asp:TextBox>
                            </div>
                            <div class="mb-3 text-start">
                                <label for="txtApellido" class="form-label">Apellido</label>
                                <asp:TextBox runat="server" ID="txtApellido" CssClass="form-control border-secondary"></asp:TextBox>
                            </div>
                            <div class="mb-3 text-start">
                                <label for="txtApellido" class="form-label">Fecha de Nacimiento</label>
                                <asp:TextBox runat="server" ID="txtFechaNacimiento" type="date" CssClass="form-control border-secondary"></asp:TextBox>
                            </div>
                        </form>
                    </div>


                    <div class="col-6">
                        <div class="mb-3 text-start">
                            <label class="form-label">Imagen del perfil</label>
                            <input type="file" id="txtImg" runat="server" class="form-control" />
                        </div>
                        <asp:Image ID="imgNuevaPerfil" ImageUrl="https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png"
                            CssClass="img-fluid mb-3" runat="server"></asp:Image>
                    </div>
                    <div class="text-start">

                        <asp:Button runat="server" ID="btnGuardar" CssClass="btn btn-success" Text="Guardar" OnClick="btnGuardar_Click" />
                        <a class="btn btn-outline-danger" href="Default.aspx">Volver</a>
                    </div>

                </div>
            </div>
        </div>
    </div>


</asp:Content>
