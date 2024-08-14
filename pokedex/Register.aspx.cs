using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;

namespace pokedex
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {
            Trainee usuario = new Trainee();
            TraineeNegocio negocio = new TraineeNegocio();
            try
            {
                if (!(usuario.Email == ""))
                {
                    usuario.Email = txtEmail.Text;
                    usuario.Pass = txtContraseña.Text;
                    int id = negocio.AgregarTrainee(usuario);
                    EmailService emailService = new EmailService();
                    emailService.armarCorreo(txtEmail.Text, "Bienvenido a la Pokedex Web", "Bienvenido entrenador, ya eres parte de la pokedex web y podras cumplir muchas funciones. Descubrelas interactuando en nuestra página. Atentamente equipo de administación");
                    Response.Redirect("Default.aspx", false);
                }
                else
                {
                    Session.Add("error", "No has ingresado datos correctos. Vuelve a intentarlo rellenando los campos.");
                    Response.Redirect("Error.aspx", false);
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                Response.Redirect("Error.aspx", false);
            }

        }
    }
}