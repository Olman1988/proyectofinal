using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace Registro
{
    public partial class pagos : System.Web.UI.Page
    {
        bool seleccionado;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["idUsuario"] == null)
            {
                Response.Redirect("index.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string dni = txt_id_estudiante.Value.Trim();
            if (dni.Length > 0)
            {
                
                   ControllerPagos pendientes = new ControllerPagos();
                double subtotal = pendientes.montoTotal(dni);
                subtotalPago.Text= subtotal.ToString();
                double total = subtotal + (subtotal * 0.13); 
                totalPago.Text = total.ToString();
                DataTable tabla = new DataTable();  
                tabla= pendientes.llenarTablaId(dni);
                
                if (tabla.Rows.Count == 0)
                {
                    dni = "";
                    mostrarMensajes("errorCargarTabla");
                }
                else
                {
                    if (tabla != null)
                    {
                        GridView1.DataSource = tabla;

                        GridView1.DataBind();
                    }
                    ControllerEstudiante queryEstudiante = new ControllerEstudiante();
                    SqlDataReader response = queryEstudiante.consultaid(dni);
                    if (response.Read())
                    {
                        name_e.Text = response["name"].ToString();
                        apellido_e.Text = response["firstlastname"].ToString();
                        id_consulta.Text = response["id"].ToString();
                        lbl_dni.Text = response["dni"].ToString();
                        mostrarMensajes("busqueda");
                        seleccionado = true;
                    }
                    else
                    {
                        mostrarMensajes("busquedaError");
                        seleccionado = false;
                        limpiarcampos();
                    }
                }
            }
            else
            {
                mostrarMensajes("buscarId");
                seleccionado = false;
                limpiarcampos();
            }
        }
        private void mostrarMensajes(string tipo)
        {
            lblmensajes.Visible = false;
            lblmensajes.CssClass = "";
            switch (tipo)
            {

                case "buscarId":
                    lblmensajes.Text = "Es necesario que el campo DNI o identificación no esté vacío";
                    lblmensajes.Visible = true;
                    lblmensajes.CssClass = "error";
                    break;

                case "busquedaError":
                    lblmensajes.Text = "No se encontraron datos con el DNI utilizado.";
                    lblmensajes.Visible = true;
                    lblmensajes.CssClass = "error";
                    break;
                case "busqueda":
                    lblmensajes.Text = "Estudiante seleccionado, puede proceder con el pago!";
                    lblmensajes.Visible = true;
                    lblmensajes.CssClass = "ok";
                    break;
                case "errorId":
                    lblmensajes.Text = "Es necesario buscar un alumno válido para realizar la matrícula!";
                    lblmensajes.Visible = true;
                    lblmensajes.CssClass = "error";
                    break;
                case "pagado":

                    lblmensajes.Text = "El pago se realizó con éxito";
                    lblmensajes.Visible = true;
                    lblmensajes.CssClass = "ok";
                    break;

                case "pagarError":
                    lblmensajes.Text = "Error al realizar el pago, intente nuevamente!";
                    lblmensajes.Visible = true;
                    lblmensajes.CssClass = "error";
                    break;
               

                case "errorPagoUsuario":
                    lblmensajes.Text = "Error, el usuario seleccionado no es valido o no cuenta con pendientes de pago";
                    lblmensajes.Visible = true;
                    lblmensajes.CssClass = "error";
                    break;
                case "errorCargarTabla":
                    MessageBox.Show("No hay pagos pendientes para este cliente");
                    lblmensajespagos.Text = "No hay pagos pendientes para este cliente";
                    lblmensajespagos.Visible = true;
                    lblmensajespagos.CssClass = "error";
                    break;



            }


        }

        private void limpiarcampos()
        {
            name_e.Text = "";
            apellido_e.Text = "";
            id_consulta.Text = "";
            lbl_dni.Text = "";
        }

        protected void btn_matricular_Click(object sender, EventArgs e)
        {
            if (id_consulta.Text.Length > 0)
            {
                double subtotal = Int32.Parse(subtotalPago.Text);
                int total = Int32.Parse(totalPago.Text);
                int id = Int32.Parse(id_consulta.Text);
                subtotalFactura.Text = subtotal.ToString();
                totalFactura.Text = total.ToString();
                DateTime thisDay = DateTime.Now;
                fecha.Text = thisDay.ToString();
                string tipopago = tipoPago.Text;
                ControllerPagos pago = new ControllerPagos();
                bool resultado = pago.insertar(id, tipopago, total);
                if (resultado == true)
                {
                    mostrarMensajes("pagado");
                    ControllerMatricula actualizarMonto = new ControllerMatricula();
                    resultado = actualizarMonto.actualizar(id);
                    //Response.AddHeader("refresh", "2;URL=pagos.aspx");
                }
                else { mostrarMensajes("pagarError"); //Response.AddHeader("refresh", "3;URL=pagos.aspx");
                                                      }
            }
            else {
                mostrarMensajes("errorPagoUsuario");
               // Response.AddHeader("refresh", "3;URL=pagos.aspx");
            }
        }
    }
}