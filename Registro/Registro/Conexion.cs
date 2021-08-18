using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
namespace Registro
{
    public class Conexion
    {
        public static SqlConnection Conectar() {
            string conexionstring = "server=DESKTOP-1SQSJAV\\SQLEXPRESS; database= Estudiantes; integrated security= true";
            SqlConnection conexion = new SqlConnection(conexionstring);
            return conexion;
        }
    }
}