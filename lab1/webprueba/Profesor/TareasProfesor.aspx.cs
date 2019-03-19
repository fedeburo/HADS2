using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webprueba.Profesor
{
    public partial class TareasProfesor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string correo = Session["correo"].ToString();
        }

        protected void btnInsertarTarea_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Profesor/InsertarTarea.aspx");
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Inicio.aspx");
        }
    }
}