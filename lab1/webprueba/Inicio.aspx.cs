using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using accesoDatosSQL;

namespace webprueba
{
    public partial class Inicio : System.Web.UI.Page
    {
        private string tipo;
         accesodatosSQL ac = new accesodatosSQL();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            ac.conectar();
            if (CorreoyPassyConfirmExistente())
            {
                Session["correo"] = txtCorreo.Text;
                Session["tipo"] = tipo;
                if (tipo == "Profesor")
                {
                    this.Response.Redirect("/Profesor/Profesor.aspx");
                }
                if (tipo == "Alumno")
                {
                    this.Response.Redirect("/Alumno/Alumno.aspx");
                }
                this.lblErrorCorreo.Visible = false;
            }
            else
            {
                this.lblErrorCorreo.Visible = true;
            }
            ac.cerrarConexion();

        }

        private bool CorreoyPassyConfirmExistente()
        {
            bool retorno = false;

            string select = "select * from Usuarios where email=@correo and confirmado=@confirm and pass=@contra";
            SqlCommand comando1 = new SqlCommand(select, ac.conexion);
            comando1.Parameters.AddWithValue("@correo", txtCorreo.Text);
            comando1.Parameters.AddWithValue("@confirm", 1);
            comando1.Parameters.AddWithValue("@contra", txtPassword.Text);

            SqlDataReader dr = comando1.ExecuteReader();
            dr.Read();
            
            if (dr.HasRows)
            {
                retorno = true;
                tipo = dr["tipo"].ToString();
            }

            dr.Close();
            comando1.Dispose();
            return retorno;
        }
    }
}