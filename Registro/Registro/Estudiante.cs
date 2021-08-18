using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace Registro
{
    class Estudiante
    {

        
        public string nombre { get; set; }
       
        public string primerApellido { get; set; }
        public string segundoApellido { get; set; }

        public string DNI { get; set; }

        public  DateTime fechaRegistro { get; set; }
        public int edad { get; set; }

      
    }
}