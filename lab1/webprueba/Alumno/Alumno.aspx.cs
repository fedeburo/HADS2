﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Collections;

namespace webprueba.Alumno
{
    public partial class Alumno : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            
            Application["cantAlumnos"] = ((int)Application["cantAlumnos"]) - 1;
            string correo = Session["correo"].ToString();
            ArrayList listaAlumnos = (ArrayList)Application.Contents["listaAlumnos"];
            listaAlumnos.Remove(correo);

            Session.Clear();
            Session.Abandon();
            System.Web.Security.FormsAuthentication.SignOut();


            Response.Redirect("~/Inicio.aspx");

        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            lblNumAlumnos.Text =Application.Contents["cantAlumnos"].ToString();
            lblNumProfes.Text =Application.Contents["cantProfes"].ToString();
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