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
        public int AgregarTrainee(Trainee nuevo)
        {
			AccesoDatos datos = new AccesoDatos();
			try
			{
				datos.setearProcedimiento("insertarNuevo");
				datos.setearParametro("@email", nuevo.Email );
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
				datos.setearConsulta("Select id, email, pass, admin from USERS where email = @email and pass = @pass");
				datos.setearParametro("@email", trainee.Email);
				datos.setearParametro("@pass", trainee.Pass);
				datos.ejecutarLectura();
				if (datos.Lector.Read())
				{
					trainee.Id = (int)datos.Lector["id"];
					trainee.admin = (bool)datos.Lector["admin"];
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


