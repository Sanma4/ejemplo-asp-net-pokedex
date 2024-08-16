using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace negocio
{
    public static class Seguridad
    {
        public static bool SessionIniciada(object usuario)
        {
            Trainee trainee = usuario != null ? (Trainee)usuario : null;
            if (trainee != null && trainee.Id != 0)
                return true;
            else
                return false;
        }

        public static bool Admin(object user)
        {
            Trainee trainee = user != null ? (Trainee)user : null;
            return trainee != null ? trainee.admin : false;
        }
    }
}
