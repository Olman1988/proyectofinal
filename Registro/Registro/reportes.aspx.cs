using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using Control = System.Web.UI.Control;

namespace Registro
{
    public partial class reportes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idUsuario"] == null)
            {
                Response.Redirect("index.aspx");
            }
        }

        protected void Unnamed1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string reporte = listaReportes.Text;
            titulos.Text=reporte;
            switch (reporte) {
                case "Estudiantes":
                    GridView1.DataSourceID = "SqlDataSource1";
                    
                    break;
                case "Cursos":
                    GridView1.DataSourceID = "SqlDataSource3";
                    break;
                case "Pagos":
                    GridView1.DataSourceID = "SqlDataSource2";
                    break;
                case "Matrículas":
                    GridView1.DataSourceID = "SqlDataSource4";
                    break;
                case "Usuarios":
                    GridView1.DataSourceID = "SqlDataSource5";
                    break;
                default:
                    break;
            
            
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.AddHeader("content-disposition", "attachment;filename = Reporte.xls");
            Response.ContentType = "application/vnd.xls";

            System.IO.StringWriter stringWriter = new System.IO.StringWriter();

            System.Web.UI.HtmlTextWriter htmlTextWriter = new HtmlTextWriter(stringWriter);
            GridView1.RenderControl(htmlTextWriter);
            Response.Write(stringWriter.ToString());

            Response.End();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {

        }

    }
}