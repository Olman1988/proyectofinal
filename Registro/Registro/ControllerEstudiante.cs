using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Windows.Forms;

namespace Registro
{
   class ControllerEstudiante
    {
        public  DataTable llenarTabla() {

            SqlConnection conexion = Conexion.Conectar();
            String consulta = " SET DATEFORMAT DMY ; SELECT id, name AS Nombre, firstlastname AS 'PrimerApellido', secondlastname AS 'SegundoApellido', dni AS Identificación, age AS Edad, CONVERT(VARCHAR(10),registerDate,103) AS 'FechaRegistro' FROM tbl_estudiantes";
            SqlCommand cmd = new SqlCommand(consulta, conexion);
            SqlDataAdapter adaptador = new SqlDataAdapter();
            adaptador.SelectCommand = cmd;
            DataTable tabla = new DataTable();
            adaptador.Fill(tabla);
            conexion.Close();
            return tabla;
          
        }
        public bool Insertar(Estudiante estudiante)
        {
            bool insertar;
            try
            {
                SqlConnection conexion = Conexion.Conectar();
                conexion.Open();
                String consulta = "set dateformat dmy; INSERT INTO tbl_estudiantes(name,firstLastname,secondLastname,dni,age,registerDate)"
                    + "values ('" + estudiante.nombre + "','" + estudiante.primerApellido + "','" + estudiante.segundoApellido + "','" + estudiante.DNI + "','" + estudiante.edad + "','" + estudiante.fechaRegistro + "')";
                SqlCommand cmd = new SqlCommand(consulta, conexion);
                cmd.ExecuteNonQuery();
                conexion.Close();
                insertar = true;
            }
            catch (Exception ex) {
                MessageBox.Show("Error"+ ex);
                insertar = false;
            }
           
            return insertar;
        }
        public bool Eliminar(int id)
        {
            bool eliminar;
            try
            {
                SqlConnection conexion = Conexion.Conectar();
                conexion.Open();
                String consulta = "DELETE FROM tbl_estudiantes where id ='" + id + "'";
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
        public SqlDataReader consultaid(string id)
        {
                
            SqlConnection conexion = Conexion.Conectar();
            conexion.Open();
            String consulta = "SELECT * FROM tbl_estudiantes where dni ='" + id + "'";
            SqlCommand cmd = new SqlCommand(consulta, conexion);
            SqlDataReader registro = cmd.ExecuteReader();
            return registro;
        }
        public bool editar(Estudiante estudiante, int id)
        {
            bool editar;
            try
            {
                SqlConnection conexion = Conexion.Conectar();
                conexion.Open();
                String consulta = "set dateformat dmy; UPDATE tbl_estudiantes SET name=' " + estudiante.nombre + "',firstLastname=' " + estudiante.primerApellido + "'" +
                    ", secondLastname= ' " + estudiante.segundoApellido + "',dni='" + estudiante.DNI + "',age='" + estudiante.edad + "',registerDate='" + estudiante.fechaRegistro + "' where id='" + id + "'";
                SqlCommand cmd = new SqlCommand(consulta, conexion);
                cmd.ExecuteNonQuery();
                conexion.Close();
                editar = true;
            }
            catch(Exception ex) {
                MessageBox.Show("Error" + ex);
                editar = false;
            }
            return editar;
        }
    }
}