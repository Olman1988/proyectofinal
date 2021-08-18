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
using System.Threading;


namespace Registro
{
    public partial class WebForm1 : System.Web.UI.Page
    {
       

        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                CargarGrid();
                
            }
            if (Session["idUsuario"] == null) {
                Response.Redirect("index.aspx");
            }
            DateTime today = DateTime.Today;
            txtregisterDate.Value = today.ToString("yyyy-MM-dd");
            
        }

       

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            MessageBox.Show("hola");
        }

       

        protected void Button1_Click2(object sender, EventArgs e)
        {
             bool insert;
            bool insertado;
           
            insert =validacionDatosVacios();
            if (insert)
            {
                Registro.Estudiante estudiante = new Estudiante();
                estudiante.nombre = txtname.Value.Trim();
                estudiante.primerApellido = txtfirstLastname.Value.Trim();
                estudiante.segundoApellido = txtsecondLastname.Value.Trim();
                estudiante.edad = Convert.ToInt32(txtage.Value.Trim());
                estudiante.DNI = txtidentificacion.Value.Trim();
                estudiante.fechaRegistro = Convert.ToDateTime(txtregisterDate.Value.Trim());
                Registro.ControllerEstudiante query = new Registro.ControllerEstudiante();
                insertado = query.Insertar(estudiante);
                if (insertado)
                {
                    mostrarMensajes("insertar");
                    CargarGrid();
                    limpiar();

                }
                else
                {
                    mostrarMensajes("insertarError");
                }
            }
            else {
                    mostrarMensajes("insertarErrorDatosVacios");

                }
            

        }

      

        protected void Rowcancel(object sender, GridViewCancelEditEventArgs e)
        {
            GridView2.EditIndex = -1;
            CargarGrid();
        }

        protected void Rowdeleting(object sender, GridViewDeleteEventArgs e)
        {
            bool delete;
            DialogResult resul = MessageBox.Show("Seguro que quiere eliminar el Registro?", "Eliminar Registro", MessageBoxButtons.YesNo);
            if (resul == DialogResult.Yes)
            {
                int id = Convert.ToInt32(GridView2.DataKeys[e.RowIndex].Values[0]);
                Registro.ControllerEstudiante query = new Registro.ControllerEstudiante();
                delete = query.Eliminar(id);
                if (delete)
                {
                    mostrarMensajes("eliminar");
                    CargarGrid();
                }
                else
                {
                    mostrarMensajes("eliminarError");
                }
            }
        }

        protected void rowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView2.EditIndex = e.NewEditIndex;
            CargarGrid();
        }

        protected void rowUpdatingEvent(object sender, GridViewUpdateEventArgs e)
        {
            bool update=true;
            DialogResult resul = MessageBox.Show("Seguro que quiere modificar el Registro?", "Eliminar Registro", MessageBoxButtons.YesNo);
            if (resul == DialogResult.Yes)
            {
                Registro.Estudiante estudiante = new Registro.Estudiante();
                GridViewRow fila = GridView2.Rows[e.RowIndex];
                int id = Convert.ToInt32(GridView2.DataKeys[e.RowIndex].Values[0]);
                estudiante.nombre = (fila.FindControl("txtnameed") as TextBox).Text.Trim();
                estudiante.primerApellido = (fila.FindControl("txtflastnameed") as TextBox).Text.Trim();
                estudiante.segundoApellido = (fila.FindControl("txtsecondnameed") as TextBox).Text.Trim();
                estudiante.DNI = (fila.FindControl("txtdnied") as TextBox).Text;
                estudiante.edad = int.Parse((fila.FindControl("txtageed") as TextBox).Text);
                estudiante.fechaRegistro = Convert.ToDateTime((fila.FindControl("txtdateed") as TextBox).Text.Trim());
                
                update = validacionDatosVaciosUpdate(estudiante);
               
                if (update)
                {
                    Registro.ControllerEstudiante query = new Registro.ControllerEstudiante();
                    update = query.editar(estudiante, id);
                    if (update)
                    {
                        mostrarMensajes("modificar");
                        GridView2.EditIndex = -1;
                        CargarGrid();
                    }
                    else
                    {
                        mostrarMensajes("modificarError");
                        GridView2.EditIndex = -1;
                        CargarGrid();
                    }
                }
                else
                {
                    mostrarMensajes("modificarErrorDatosVacios");
                    estudiante = null;
                    Response.AddHeader("REFRESH", "2;URL=./");
                }
            }
        }
        private void CargarGrid() {
            ControllerEstudiante query = new ControllerEstudiante();
            GridView2.DataSource = query.llenarTabla();
            GridView2.DataBind();
        }
        private void limpiar() {
            txtname.Value = "";
            txtfirstLastname.Value="";
           txtsecondLastname.Value="";
            txtage.Value="";
            txtidentificacion.Value="";
            DateTime today = DateTime.Today;
            txtregisterDate.Value = today.ToString("yyyy-MM-dd");
        }
        private bool validacionDatosVacios() {
            bool respuesta;
            if (txtname.Value.Length > 0 && txtname.Value.Length > 0 && txtfirstLastname.Value.Length > 0 && txtsecondLastname.Value.Length > 0 && txtage.Value.Length > 0 && txtidentificacion.Value.Length > 0 && txtregisterDate.Value.Length > 0)
            {
                respuesta = true;
            }
            else {

                respuesta = false;
            }
            return respuesta;
            
        }
        private bool validacionDatosVaciosUpdate(Estudiante estudian)
        {
            bool respuesta2;
            if (estudian.nombre.Length > 0 && estudian.primerApellido.Length > 0 && estudian.segundoApellido.Length > 0 && estudian.DNI.Length > 0 && estudian.edad > 0 && txtregisterDate.Value.Length > 0)
            {
                respuesta2 = true;
            }
            else
            {

                respuesta2 = false;
            }
            return respuesta2;

        }

        private void mostrarMensajes(string tipo) {
            lblmsj.Visible = false;
            switch (tipo) {

                case "modificar":
                    lblmsj.Text = "Datos modificados con éxito!";
                    lblmsj.Visible = true;
                    lblmsj.CssClass = "ok";
                    break;

                case "eliminar":
                    lblmsj.Text = "Datos eliminados con éxito!";
                    lblmsj.Visible = true;
                    lblmsj.CssClass = "ok";
                    break;
                case "insertar":
                    lblmsj.Text = "Datos insertados con éxito!";
                    lblmsj.Visible = true;
                    lblmsj.CssClass = "ok";
                    break;
                case "eliminarError":
                    lblmsj.Text = "Error al eliminar datos, intente nuevamente!";
                    lblmsj.Visible = true;
                    lblmsj.CssClass = "error";
                    break;
                case "insertarError":
                    lblmsj.Text = "Error al insertar datos, intente nuevamente!";
                    lblmsj.Visible = true;
                    lblmsj.CssClass = "error";
                    break;
                case "insertarErrorDatosVacios":
                    lblmsj.Text = "Algunos datos están vacíos o nulos, intente nuevamente!";
                    lblmsj.Visible = true;
                    lblmsj.CssClass = "error";
                    break;
                case "modificarError":
                    lblmsj.Text = "Error al modificar datos, intente nuevamente!";
                    lblmsj.Visible = true; 
                    lblmsj.CssClass = "error";
                    break;
                case "modificarErrorDatosVacios":
                    lblmsj.Text = "Algunos datos están vacíos o nulos, intente nuevamente!";
                    lblmsj.Visible = true;
                    lblmsj.CssClass = "error";
                    break;

            }


        }
    }

   
    
}