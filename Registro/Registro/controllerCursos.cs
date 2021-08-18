using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Windows.Forms;

namespace Registro
{
    public class controllerCursos
    {
        public SqlDataReader consultartodos()
        {

            SqlConnection conexion = Conexion.Conectar();
            conexion.Open();
            String consulta = "SELECT name FROM tbl_cursos";
            SqlCommand cmd = new SqlCommand(consulta, conexion);
            SqlDataReader registro = cmd.ExecuteReader();
            return registro;
        }
        public DataTable llenarTabla()
        {

            SqlConnection conexion = Conexion.Conectar();
            String consulta = " SELECT id, name AS Nombre, description AS Descripcion, price AS Precio FROM tbl_cursos";
            SqlCommand cmd = new SqlCommand(consulta, conexion);
            SqlDataAdapter adaptador = new SqlDataAdapter();
            adaptador.SelectCommand = cmd;
            DataTable tabla = new DataTable();
            adaptador.Fill(tabla);
            conexion.Close();
            return tabla;

        }
        public bool Eliminar(int id)
        {
            bool eliminar;
            try
            {
                SqlConnection conexion = Conexion.Conectar();
                conexion.Open();
                String consulta = "DELETE FROM tbl_cursos where id ='" + id + "'";
                SqlCommand cmd = new SqlCommand(consulta, conexion);
                cmd.ExecuteNonQuery();
                conexion.Close();
                eliminar = true;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error" + ex);
                eliminar = false;
            }
            return eliminar;
        }
        public bool editar(int id, string nombre, string descripcion, int monto)
        {
            bool editar;
            try
            {
                SqlConnection conexion = Conexion.Conectar();
                conexion.Open();
                String consulta = " UPDATE tbl_cursos SET name=' " + nombre + "',description=' " + descripcion + "'" +
                    ", price= ' " + monto + "' where id='" + id + "'";
                SqlCommand cmd = new SqlCommand(consulta, conexion);
                cmd.ExecuteNonQuery();
                conexion.Close();
                editar = true;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error" + ex);
                editar = false;
            }
            return editar;
        }
        public bool Insertar(string nombre, string descripcion, int precio)
        {
            bool insertar;
            try
            {
                SqlConnection conexion = Conexion.Conectar();
                conexion.Open();
                String consulta = "INSERT INTO tbl_cursos(name,description,price)"
                    + "values ('" + nombre + "','" + descripcion + "','" + precio + "')";
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