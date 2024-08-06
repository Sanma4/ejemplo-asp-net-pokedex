using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace pokedex
{
    public partial class FormularioPokemon : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtId.Enabled = false;
            try
            {
                if (!IsPostBack)
                {
                    ElementoNegocio negocio = new ElementoNegocio();
                    List<Elemento> lista = negocio.listar();

                    ddlDebilidad.DataSource = lista;
                    ddlDebilidad.DataValueField = "id";
                    ddlDebilidad.DataTextField = "descripcion";
                    ddlDebilidad.DataBind();

                    ddlTipo.DataSource = lista;
                    ddlTipo.DataValueField = "id";
                    ddlTipo.DataTextField = "descripcion";
                    ddlTipo.DataBind();
                }

                string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
                if (id != "" && !IsPostBack)
                {
                    PokemonNegocio negocio = new PokemonNegocio();
                    Pokemon seleccionado = (negocio.listar(id))[0];

                    txtId.Text = id;
                    txtNombre.Text = seleccionado.Nombre;
                    txtNumero.Text = seleccionado.Numero.ToString();
                    txtDescripcion.Text = seleccionado.Descripcion;
                    txtUrlImg.Text = seleccionado.UrlImagen;

                    ddlDebilidad.SelectedValue = seleccionado.Debilidad.Id.ToString();
                    ddlTipo.SelectedValue = seleccionado.Tipo.Id.ToString();
                    txtUrlImg_TextChanged(sender, e);


                }
                    
            }
            catch (Exception)
            {

                Session.Add("error", false);
                throw;
            }
        }

        protected void txtUrlImg_TextChanged(object sender, EventArgs e)
        {
            imgPokemon.ImageUrl = txtUrlImg.Text;
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            PokemonNegocio negocio = new PokemonNegocio();
            Pokemon nuevo = new Pokemon();
            try
            {
                nuevo.Nombre = txtNombre.Text;
                nuevo.Numero = int.Parse(txtNumero.Text);
                nuevo.Descripcion = txtDescripcion.Text;
                nuevo.UrlImagen = txtUrlImg.Text;

                nuevo.Debilidad = new Elemento();
                nuevo.Debilidad.Id = int.Parse(ddlDebilidad.SelectedValue);
                nuevo.Tipo = new Elemento();
                nuevo.Tipo.Id = int.Parse(ddlTipo.SelectedValue);

                if (Request.QueryString["id"] != null)
                {
                    nuevo.Id = int.Parse(txtId.Text);
                    negocio.modificarSP(nuevo);

                }
                else
                {
                    negocio.agregarSP(nuevo);
                }


            }
            catch (Exception)
            {
                Response.Redirect("error");
                throw;
            }
            finally
            {
                Response.Redirect("ListaPokemons.aspx", false);
            }
            
        }
    }
}