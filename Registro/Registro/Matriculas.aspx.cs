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
    
    public partial class Matriculas : System.Web.UI.Page
    {
        bool seleccionado;
        int idcursoMatricular;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarGrid();

            }
            if (Session["idUsuario"] == null)
            {
                Response.Redirect("index.aspx");
            }
        }
       
        

        protected void Button1_Click(object sender, EventArgs e)
        {
            

        }

        protected void rowdeleting(object sender, GridViewDeleteEventArgs e)
        {
            bool delete;
            int id = Convert.ToInt32(GridViewCurso.DataKeys[e.RowIndex].Values[0]);
            Registro.ControllerMatricula query = new Registro.ControllerMatricula();
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

        protected void Button1_Click1(object sender, EventArgs e)
        {
            string dni = txt_id_estudiante.Value.Trim();
            if (dni.Length > 0)
            {

                ControllerMatricula query2 = new ControllerMatricula();
                GridViewCurso.DataSource = query2.llenarTablaId(dni);
                GridViewCurso.DataBind();
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
                else {
                    mostrarMensajes("busquedaError");
                    seleccionado = false;
                    limpiarcampos();
                }
            }
            else {
                mostrarMensajes("buscarId");
                seleccionado = false;
                limpiarcampos();
            }
            
        }
        protected void btn_matricular_Click(object sender, EventArgs e)
        {
            string[] cursosId ;
            List<string> list = new List<string>();
            string dniConfirmado = lbl_dni.Text.Trim();
            if (dniConfirmado.Length > 0)
            {
                controllerCursos cursoConsulta = new controllerCursos();
                
                SqlDataReader consulta = cursoConsulta.consultartodos();
                while (consulta.Read())
                {
                    list.Add(consulta[0].ToString());
                }
                cursosId= list.ToArray();
                

                string curso = ListaCursos.Text.Trim();
                for (int i = 0; i < cursosId.Length; i++)
                {
                   
                    if (curso == cursosId[i].Trim())
                    {
                        
                        idcursoMatricular = i + 1;

                    }
                }
                int id = int.Parse(id_consulta.Text);
                ControllerMatricula query2 = new ControllerMatricula();
                bool result = query2.selectcursos(idcursoMatricular, id);
                if (result)
                {
                    bool result2 = query2.insertar(idcursoMatricular, id);
                    if (result2)
                    {
                        mostrarMensajes("matricular");
                        CargarGrid();
                    }
                    else
                    {
                        mostrarMensajes("matricularError");
                    }
                }
                else
                {
                    mostrarMensajes("cursoMatriculado");
                }

            }
            else {
                mostrarMensajes("errorId");
            }
            
           
        }
        private void CargarGrid()
        {
            ControllerMatricula query = new ControllerMatricula();
            GridViewCurso.DataSource = query.llenarTabla();
            GridViewCurso.DataBind();
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
                    lblmensajes.Text = "Estudiante seleccionado, puede proceder con la matrícula!";
                    lblmensajes.Visible = true;
                    lblmensajes.CssClass = "ok";
                    break;
                case "errorId":
                    lblmensajes.Text = "Es necesario buscar un alumno válido para realizar la matrícula!";
                    lblmensajes.Visible = true;
                    lblmensajes.CssClass = "error";
                    break;
                case "matricular":
                    
                    lblmensajes.Text = "La matrícula se realizó con éxito";
                    lblmensajes.Visible = true;
                    lblmensajes.CssClass = "ok";
                    break;
                    
                case "matricularError":
                    lblmensajes.Text = "Error al realizar la matrícula, intente nuevamente!";
                    lblmensajes.Visible = true;
                    lblmensajes.CssClass = "error";
                    break;
                case "cursoMatriculado":
                    lblmensajes.Text = "Este curso ya fue matriculado por el estudiante";
                    lblmensajes.Visible = true;
                    lblmensajes.CssClass = "error";
                    break;
                    
                case "eliminar":
                    lblmensajes.Text = "Curso eliminado correctamente!";
                    lblmensajes.Visible = true;
                    lblmensajes.CssClass = "ok";
                    break;
                case "eliminarError":
                    lblmensajes.Text = "Error al eliminar curso, intente nuevamente!";
                    lblmensajes.Visible = true;
                    lblmensajes.CssClass = "error";
                    break;
               


            }


        }

        private void limpiarcampos() {
            name_e.Text = "";
            apellido_e.Text = "";
            id_consulta.Text = "";
            lbl_dni.Text = "";
        }
    }
}