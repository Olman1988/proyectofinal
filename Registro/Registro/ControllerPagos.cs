using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Windows.Forms;

namespace Registro
{
    public class ControllerPagos
    {
        public DataTable llenarTablaId(string id)
        {
            DataTable tabla = new DataTable(); ;
            try
            {
                SqlConnection conexion = Conexion.Conectar();
                String consulta = " select tm.id, tc.name AS curso, te.name AS nombre, tc.price AS precio from tbl_matriculas_cursos tm INNER JOIN tbl_estudiantes te ON tm.idestudiante = te.id INNER JOIN tbl_cursos tc ON tm.idcurso = tc.id WHERE te.dni= '" + id + "' AND tm.estado='Pendiente';";
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

        public int montoTotal(string id) {
            int total;
            try
            {
                SqlConnection conexion = Conexion.Conectar();
                conexion.Open();
                String consulta = " select SUM(tc.price) AS total from tbl_matriculas_cursos tm INNER JOIN tbl_estudiantes te ON tm.idestudiante = te.id INNER JOIN tbl_cursos tc ON tm.idcurso = tc.id WHERE te.dni= '" + id + "' AND tm.estado='Pendiente';";
                SqlCommand cmd = new SqlCommand(consulta, conexion);
                SqlDataReader registro = cmd.ExecuteReader();
                if (registro.HasRows)
                {
                    total = 0;
                    while (registro.Read())
                    {
                        total = registro.GetInt32(0);
                        MessageBox.Show("El total es: " + total);
                    }
                }
                else { total = 0; }
                conexion.Close();
                
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error" + ex);
                total = 0;
            }

            return total;
        }
        public bool insertar(int idestudiante, string tipoPago, int total)
        {
            bool insert;
            string estado = "aplicado";
            try
            {
                SqlConnection conexionN = Conexion.Conectar();
                conexionN.Open();
                
                String consultai = "INSERT INTO tbl_pagos(monto,estado,tipoPago,idestudiante) values ('" + total + "','" + estado + "','" + tipoPago + "','" + idestudiante + "')";
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


    }
}