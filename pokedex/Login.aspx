<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="pokedex.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form>
        <div class="mb-3">
            <label for="txtUser" class="form-label">User</label>
            <asp:TextBox ID="txtUser" runat="server" CssClass="form-control" placeholder="Username"></asp:TextBox>
        </div>
        <div class="mb-3">
            <label for="txtPass" class="form-label">Password</label>
            <asp:TextBox ID="txtPass" runat="server" CssClass="form-control" type="password" placeholder="Contraseña"></asp:TextBox>
        </div>
        <asp:Button Text="Entrar" class="btn btn-dark" runat="server" Id="btnEntrar" OnClick="btnEntrar_Click"  />
    </form>
</asp:Content>
