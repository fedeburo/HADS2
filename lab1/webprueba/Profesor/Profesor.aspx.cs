using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webprueba.Profesor
{
    public partial class Profesor1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Application["cantProfes"] = ((int)Application["cantProfes"]) - 1;
            string correo = Session["correo"].ToString();
            ArrayList listaProfes = (ArrayList)Application.Contents["listaProfes"];
            listaProfes.Remove(correo);

            Session.Clear();
            Session.Abandon();
            System.Web.Security.FormsAuthentication.SignOut();

            Response.Redirect("~/Inicio.aspx");

        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            lblNumAlumnos.Text = Application.Contents["cantAlumnos"].ToString();
            lblNumProfes.Text = Application.Contents["cantProfes"].ToString();
            ArrayList listaAlumnos = (ArrayList)Application.Contents["listaAlumnos"];
            ArrayList listaProfes = (ArrayList)Application.Contents["listaProfes"];

            listBoxAlumnos.Items.Clear();
            for (int i = 0; i < listaAlumnos.Count; i++)
            {
                listBoxAlumnos.Items.Add(listaAlumnos[i].ToString());
            }

            listBoxProfes.Items.Clear();
            for (int i = 0; i < listaProfes.Count; i++)
            {
                listBoxProfes.Items.Add(listaProfes[i].ToString());
            }
        }
    }
}