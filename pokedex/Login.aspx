<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="pokedex.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-6">
            <form>
                <div class="mb-3">
                    <label for="txtUser" class="form-label">Email</label>
                    <asp:TextBox ID="txtUser" runat="server" CssClass="form-control"  placeholder="Email"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="txtPass" class="form-label">Password</label>
                    <asp:TextBox ID="txtPass" runat="server" CssClass="form-control" type="password" placeholder="Contraseña"></asp:TextBox>
                </div>
                <asp:Button Text="Entrar" class="btn btn-dark" runat="server" ID="btnEntrar" OnClick="btnEntrar_Click" />
            </form>
        </div>
    </div>
</asp:Content>
