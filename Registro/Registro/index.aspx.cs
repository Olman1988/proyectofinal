using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace Registro
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

            if (Request.QueryString["action"]!=null&& Request.QueryString["action"]=="CerrarSesion") {
                Session["idUsuario"] = null;
                MessageBox.Show("La sesion se cerró exitosamente");
                Response.Redirect("index.aspx");
                
            }
            if (Session["idUsuario"] != null)
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           ControllerUsuarios usuario = new ControllerUsuarios();
            string email = txtemaili.Value.Trim();
           string pass = txtpassi.Value.Trim();
           
            bool respuesta =usuario.consulta(email, pass);

            if (respuesta == true)
            {
                Session["idUsuario"] = email;
                Response.Redirect("Default.aspx");
            }
            else {
                MessageBox.Show("Error al ingresar verifique su usuario y contraseña");
            }
            
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            
            string nombre = txtname.Value.Trim();
            string apellidos = txtapellidos.Value.Trim();
            string email = txtemail.Value.Trim();
            string pass = txtpass.Value.Trim();
            string perfil = txtperfil.Text;
            if (nombre.Length > 0 && apellidos.Length > 0 && email.Length > 0 && pass.Length > 0 && perfil.Length > 0)
            {
                ControllerUsuarios usuario = new ControllerUsuarios();
                bool respuesta = usuario.insertar(nombre,apellidos,email,pass,perfil);
                if (respuesta == true)
                {
                    MessageBox.Show("Usuario creado con éxito");
                    Session["idUsuario"] = email;
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    MessageBox.Show("Error al ingresar verifique su usuario y contraseña");
                }   

            }
            else {

                MessageBox.Show("Error espacios vacíos, debe llenar todos los espacios");
            }

        }
    }
}