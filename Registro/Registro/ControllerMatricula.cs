using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;
using Control = System.Web.UI.Control;
using TextBox = System.Web.UI.WebControls.TextBox;
namespace Registro
{
    public class ControllerMatricula
    {
        public DataTable llenarTabla()
        {
            DataTable tabla = new DataTable(); ;
            try
            {
                SqlConnection conexion = Conexion.Conectar();
                String consulta = " select tm.id, tc.name AS curso,te.name AS nombre, tm.estado from tbl_matriculas_cursos tm INNER JOIN tbl_estudiantes te ON tm.idestudiante = te.id INNER JOIN tbl_cursos tc ON tm.idcurso = tc.id;";
                SqlCommand cmd = new SqlCommand(consulta, conexion);
                SqlDataAdapter adaptador = new SqlDataAdapter();
                adaptador.SelectCommand = cmd;
                adaptador.Fill(tabla);
                conexion.Close();
                
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error" + ex);

            }
            return tabla;
        }
        public DataTable llenarTablaId(string id)
        {
            DataTable tabla = new DataTable(); 
            try
            {
                SqlConnection conexion = Conexion.Conectar();
                String consulta = " select tm.id, tc.name AS curso,te.name AS nombre, te.firstlastname AS apellido, tm.estado from tbl_matriculas_cursos tm INNER JOIN tbl_estudiantes te ON tm.idestudiante = te.id INNER JOIN tbl_cursos tc ON tm.idcurso = tc.id WHERE te.dni= '" + id + "';";
                SqlCommand cmd = new SqlCommand(consulta, conexion);
                SqlDataAdapter adaptador = new SqlDataAdapter();
                adaptador.SelectCommand = cmd;
              
                adaptador.Fill(tabla);
                conexion.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error" + ex);

            }
            return tabla;

        }
        public bool insertar(int idcurso, int idestudiante) {
            bool insert;
            try
            {
                SqlConnection conexionN = Conexion.Conectar();
                conexionN.Open();
                string estado = "Pendiente";
                String consultai = "INSERT INTO tbl_matriculas_cursos(idcurso,idestudiante,estado) values ('" + idcurso + "','" + idestudiante + "','" + estado + "')";
                SqlCommand cmdin = new SqlCommand(consultai, conexionN);
                cmdin.ExecuteNonQuery();
                conexionN.Close();
                insert = true;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error" + ex);
                insert = false;
            }
            return insert;
        }
        public bool selectcursos(int idcurso, int idestudiante) {
            bool consultabool=true;
            try
            {
                SqlConnection conexion = Conexion.Conectar();
                conexion.Open();
                String consulta2 = "SELECT idcurso FROM tbl_matriculas_cursos where idestudiante='" + idestudiante + "  '";
                SqlCommand cmd1 = new SqlCommand(consulta2, conexion);
                SqlDataReader registro = cmd1.ExecuteReader();
                if (registro.HasRows)
                {
                    while (registro.Read())
                    {
                        if (registro.GetInt32(0) == idcurso)
                        {

                            consultabool = false;
                        }
                    }
                }
                conexion.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error" + ex);
                consultabool = false;
            }
            return consultabool;
        }
        public bool Eliminar(int id) {
            bool eliminar;
            try
            {
                SqlConnection conexion = Conexion.Conectar();
                conexion.Open();
                String consulta = "DELETE FROM tbl_matriculas_cursos where id ='" + id + "'";
                SqlCommand cmd = new SqlCommand(consulta, conexion);
                cmd.ExecuteNonQuery();
                conexion.Close();
                eliminar = true;
            }
            catch (Exception ex) {
                MessageBox.Show("Error" + ex);
                eliminar = false;
            }
            return eliminar;
        }
        public bool actualizar(int idestudiante) {
            bool editar;    
            string estado = "aplicado";
            try
            {
                SqlConnection conexion = Conexion.Conectar();
                conexion.Open();
                String consulta = "UPDATE tbl_matriculas_cursos SET estado='" + estado + "' where idestudiante='" + idestudiante + "'";
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
    }
}