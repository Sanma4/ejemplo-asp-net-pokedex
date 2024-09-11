<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="pokedex.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .validacion {
            color: red;
            font-size: 12px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-6">
            <h2>Crea tu perfil de entrenador</h2>
            <form>
                <div >
                    <label for="exampleInputEmail1" class="form-label">Email</label>
                    <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator CssClass="validacion" ErrorMessage="Ingrese un email por favor" ControlToValidate="txtEmail" runat="server" />
                </div>
                <div class="mb-3">
                    <asp:RegularExpressionValidator CssClass="validacion" ErrorMessage="Ingrese un email por favor con este formato: tuemail@tudominio.com" ControlToValidate="txtEmail" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" runat="server" />
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Contraseña</label>
                    <asp:TextBox ID="txtContraseña" CssClass="form-control" type="password" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator CssClass="validacion" ErrorMessage="Ingrese una contraseña" ControlToValidate="txtContraseña" runat="server" />
                </div>
                <asp:Button ID="btnRegistrarse" runat="server" CssClass="btn btn-dark" Text="Registrarse" OnClick="btnRegistrarse_Click" />
            </form>
        </div>
    </div>
</asp:Content>
