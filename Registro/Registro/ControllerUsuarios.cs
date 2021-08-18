using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Windows.Forms;

namespace Registro
{
    public class ControllerUsuarios
    {
        public bool consulta(string email, string pass)
        {
            try
            {
                
                SqlConnection conexion = Conexion.Conectar();
                conexion.Open();
                String consulta = "SELECT * FROM tbl_user where email ='" + email+"'";
                SqlCommand cmd = new SqlCommand(consulta, conexion);
                SqlDataReader registro = cmd.ExecuteReader();
                if (registro.Read())
                {
                    if (email == registro["email"].ToString() && pass == registro["pass"].ToString()) {
                        return true;
                    }
                    
                }
                return true;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error" + ex);
                return false;
            }
        }
        public bool insertar(string nombre, string apellidos, string email, string pass, string perfil)
        {
            bool insertar;
            try
            {
                SqlConnection conexion = Conexion.Conectar();
                conexion.Open();
                String consulta = "INSERT INTO tbl_user(nombre,apellidos,email,pass,perfil)"
                    + "values ('" + nombre + "','" + apellidos + "','" + email + "','" + pass + "','" + perfil + "')";
                SqlCommand cmd = new SqlCommand(consulta, conexion);
                cmd.ExecuteNonQuery();
                conexion.Close();
                insertar = true;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error" + ex);
                insertar = false;
            }

            return insertar;
        }
    }
}