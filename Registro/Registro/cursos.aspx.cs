using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using TextBox = System.Web.UI.WebControls.TextBox;

namespace Registro
{
    public partial class cursos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarGrid();

            }
        }

        protected void editarRow(object sender, GridViewUpdateEventArgs e)
        {
            bool update = true;
            DialogResult resul = MessageBox.Show("Seguro que quiere modificar el Registro?", "Eliminar Registro", MessageBoxButtons.YesNo);
            if (resul == DialogResult.Yes)
            {
               
                GridViewRow fila = GridView1.Rows[e.RowIndex];
                int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                string nombre = (fila.FindControl("txtname") as TextBox).Text.Trim();
                string descripcion = (fila.FindControl("txtdescription") as TextBox).Text.Trim();
                int monto = int.Parse((fila.FindControl("txtprice") as TextBox).Text);

                if (update)
                {
                    controllerCursos query = new controllerCursos();
                    update = query.editar(id, nombre, descripcion, monto);
                    if (update)
                    {
                        mostrarMensajes("modificar");
                        GridView1.EditIndex = -1;
                        CargarGrid();
                    }
                    else
                    {
                        mostrarMensajes("modificarError");
                        GridView1.EditIndex = -1;
                        CargarGrid();
                    }
                }
                else
                {
                    mostrarMensajes("modificarErrorDatosVacios");
                   
                    Response.AddHeader("REFRESH", "2;URL=./");
                }
            }
        }

        protected void editingRow(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            CargarGrid();
        }

        protected void delitingRow(object sender, GridViewDeleteEventArgs e)
        {
            bool delete;
            DialogResult resul = MessageBox.Show("Seguro que quiere eliminar el Registro?", "Eliminar Registro", MessageBoxButtons.YesNo);
            if (resul == DialogResult.Yes)
            {
                int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                Registro.controllerCursos query = new Registro.controllerCursos();
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

        protected void cancelingRow(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            CargarGrid();
        }

        protected void CargarGrid() {

            controllerCursos query = new controllerCursos();
            GridView1.DataSource = query.llenarTabla();
            GridView1.DataBind();
        }
        private bool validacionDatosVacios() {
            string nombre = txt_name.Value.Trim();
            string descripcion = txt_descripcion.Value.Trim();
            string monto =txt_precio.Value.Trim();
            if (nombre.Length > 0 && descripcion.Length > 0 && monto.Length > 0)
            {
                return true;
            }
            else {
                return false;
            }

        }
        private void mostrarMensajes(string tipo)
        {
            lblmsj.Visible = false;
            switch (tipo)
            {

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

        protected void Button2_Click(object sender, EventArgs e)
        {
            bool insert;
            bool insertado;

            insert = validacionDatosVacios();
            if (insert)
            {
                controllerCursos curso = new controllerCursos();
                string nombre = txt_name.Value.Trim();
                string descripcion = txt_descripcion.Value.Trim();
                int monto = Convert.ToInt32(txt_precio.Value.Trim());
                
                insertado = curso.Insertar(nombre,descripcion,monto);
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
            else
            {
                mostrarMensajes("insertarErrorDatosVacios");

            }
        }
        private void limpiar()
        {
            txt_name.Value = "";
            txt_descripcion.Value = "";
            txt_precio.Value = "";
            
        }
    }
}