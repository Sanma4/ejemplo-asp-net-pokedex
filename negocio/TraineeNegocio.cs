using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace negocio
{
    public class TraineeNegocio
    {
        public void actualizar(Trainee user)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("StoredActualizarUser");
                datos.setearParametro("@nombre", user.Nombre);
                datos.setearParametro("@apellido", user.Apellido);
                datos.setearParametro("@img", user.Imagen != null ? user.Imagen : (object)DBNull.Value);
                datos.setearParametro("@id", user.Id);
                datos.setearParametro("@fechaNacimiento", user.FechaNacimiento);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }

        }

        public int AgregarTrainee(Trainee nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("insertarNuevo");
                datos.setearParametro("@email", nuevo.Email);
                datos.setearParametro("@pass", nuevo.Pass);
                return datos.ejecutarAccionScalar();


            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public bool Loguear(Trainee trainee)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("Select id, email, pass, admin, nombre, apellido, imagenPerfil, fechaNacimiento from USERS where email = @email and pass = @pass");
                datos.setearParametro("@email", trainee.Email);
                datos.setearParametro("@pass", trainee.Pass);

                datos.ejecutarLectura();
                if (datos.Lector.Read())
                {
                    trainee.Id = (int)datos.Lector["id"];
                    trainee.admin = (bool)datos.Lector["admin"];

                    if (!(datos.Lector["imagenPerfil"] is DBNull))
                        trainee.Imagen = (string)datos.Lector["imagenPerfil"];
                    if(!(datos.Lector["nombre"] is DBNull))
                        trainee.Nombre = (string)datos.Lector["nombre"];
                    if(!(datos.Lector["Apellido"] is DBNull))
                        trainee.Apellido = (string)datos.Lector["Apellido"];
                    if(!(datos.Lector["fechaNacimiento"] is DBNull))
                        trainee.FechaNacimiento = DateTime.Parse(datos.Lector["fechaNacimiento"].ToString());

                    return true;
                }
                return false;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }


    }
}


