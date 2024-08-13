using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace negocio
{
    public class UsuarioNegocio
    {
        public bool Loguear(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("select Id, TipoUser from USUARIOS where Usuario = @user and Pass = @pass");
                datos.setearParametro("@user", usuario.User);
                datos.setearParametro("@pass", usuario.Pass);

                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    usuario.id = (int)datos.Lector["Id"];
                    usuario.TipoUsuario = (int)datos.Lector["TipoUser"] == 2 ? TipoUsuario.ADMIN : TipoUsuario.NORMAL;
                    return true;
                }
                return false;
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
