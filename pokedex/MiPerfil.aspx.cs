using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pokedex
{
    public partial class Mi_Perfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Seguridad.SessionIniciada(Session["trainee"]))
                {
                    Trainee user = (Trainee)Session["trainee"];
                    txtNombre.Text = user.Nombre;
                    txtApellido.Text = user.Apellido;
                    txtFechaNacimiento.Text = user.FechaNacimiento.ToString("yyyy-MM-dd");
                    txtEmail.Text = user.Email;
                    txtEmail.Enabled = false;
                    if (!string.IsNullOrEmpty(user.Imagen))
                        imgNuevaPerfil.ImageUrl = "~/Images/" + user.Imagen;



                }
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                Page.Validate();
                if (!Page.IsValid)
                    return;

                Trainee user = (Trainee)Session["trainee"];
                TraineeNegocio negocio = new TraineeNegocio();
                if (txtImg.PostedFile.FileName != "")
                {
                    string ruta = Server.MapPath("./Images/");
                    txtImg.PostedFile.SaveAs(ruta + "Perfil-" + user.Id + ".jpg");
                    user.Imagen = "Perfil-" + user.Id + ".jpg";
                }
                user.Nombre = txtNombre.Text;
                user.Apellido = txtApellido.Text;
                user.FechaNacimiento = DateTime.Parse(txtFechaNacimiento.Text);

                negocio.actualizar(user);

                Image img = (Image)Master.FindControl("imgPerfil");
                img.ImageUrl = "~/Images/" + user.Imagen;


                imgNuevaPerfil.ImageUrl = "~/Images/" + user.Imagen;
            }
            catch (Exception ex)
            {
                Session.Add("error", Seguridad.ManejoError(ex));
                Response.Redirect("Error.aspx");
            }
        }

    }
}