<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="pokedex.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-6">
            <form>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Email</label>
                    <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" type="email"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Contraseña</label>
                    <asp:TextBox ID="txtContraseña" CssClass="form-control" type="password" runat="server"></asp:TextBox>
                </div>
                <asp:Button ID="btnRegistrarse" runat="server" CssClass="btn btn-dark" Text="Registrarse" OnClick="btnRegistrarse_Click" />
            </form>
        </div>
    </div>
</asp:Content>
