using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;
using dominio;
using System.Web.Services.Description;

namespace pokedex
{
    public partial class ListaPokemons : System.Web.UI.Page
    {
        public bool filtroAvanzado { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            filtroAvanzado = chkFiltroAvanzado.Checked;
            if ((Session["usuario"] != null && ((dominio.Usuario)Session["usuario"]).TipoUsuario == dominio.TipoUsuario.ADMIN))
            {
                if (!IsPostBack)
                {
                    PokemonNegocio negocio = new PokemonNegocio();
                    Session.Add("listaPokemons", negocio.listarSP());
                    dgvPokemons.DataSource = Session["listaPokemons"];
                    dgvPokemons.DataBind();
                }
            }
            else
            {
                Session.Add("error", "Necesitas permisos para acceder a esta página. Si crees que se trata de un error consulta con el servicio tecnico.");
                Response.Redirect("Error.aspx", false);
            }

        }

        protected void dgvPokemons_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvPokemons.SelectedDataKey.Value.ToString();
            Response.Redirect("FormularioPokemon.aspx?id=" + id);
        }


        protected void dgvPokemons_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvPokemons.PageIndex = e.NewPageIndex;
            dgvPokemons.DataBind();
        }

        protected void txtFiltrar_TextChanged(object sender, EventArgs e)
        {
            List<Pokemon> lista = (List<Pokemon>)Session["listaPokemons"];
            List<Pokemon> listaFiltrada = lista.FindAll(x => x.Nombre.ToUpper().Contains(txtFiltrar.Text.ToUpper()));
            dgvPokemons.DataSource = listaFiltrada;
            dgvPokemons.DataBind();
        }

        protected void chkFiltroAvanzado_CheckedChanged(object sender, EventArgs e)
        {
            filtroAvanzado = chkFiltroAvanzado.Checked;
            txtFiltrar.Enabled = !filtroAvanzado;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                if (!(txtFiltroAvanzado.Text == ""))
                {
                    PokemonNegocio negocio = new PokemonNegocio();
                    dgvPokemons.DataSource = negocio.filtrar(ddlCampo.SelectedItem.ToString(),
                        ddlCriterio.SelectedItem.ToString(),
                        txtFiltroAvanzado.Text, ddlEstado.SelectedItem.ToString());
                    dgvPokemons.DataBind();
                }

            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw;
            }
        }

        protected void ddlCampo_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCampo.SelectedItem.ToString() == "Número")
            {
                ddlCriterio.Items.Clear();
                ddlCriterio.Items.Add("Mayor a");
                ddlCriterio.Items.Add("Igual a");
                ddlCriterio.Items.Add("Menor a");
            }
            else
            {
                ddlCriterio.Items.Clear();
                ddlCriterio.Items.Add("Empieza con");
                ddlCriterio.Items.Add("Contine");
                ddlCriterio.Items.Add("Termina con");
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            List<Pokemon> lista = (List<Pokemon>)Session["listaPokemons"];
            dgvPokemons.DataSource = lista;
            dgvPokemons.DataBind();
        }
    }
}