using System;
using System.Collections;
using System.Data.SqlClient;
using System.Web.Security;
using accesoDatosSQL;
using Sha256;

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
                int cantidad = 0;
                Session["correo"] = txtCorreo.Text;
                Session["tipo"] = tipo;
                if (tipo == "Profesor" && txtCorreo.Text == "vadillo@ehu.es")
                {
                    cantidad = (int)(Application.Contents["cantProfes"]);
                    cantidad = cantidad + 1;
                    Application.Contents["cantProfes"] = cantidad;
                    ArrayList listaProfes = (ArrayList)Application.Contents["listaProfes"];
                    listaProfes.Add(txtCorreo.Text);
                    Application.Contents["listaProfes"] = listaProfes;

                    FormsAuthentication.SetAuthCookie("Vadillo", false);
                    this.Response.Redirect("/Profesor/Profesor.aspx");

                    


                }
                if (tipo == "Profesor" && txtCorreo.Text != "vadillo@ehu.es")
                {
                    cantidad = (int)(Application.Contents["cantProfes"]);
                    cantidad = cantidad +1;
                    Application.Contents["cantProfes"] = cantidad;
                    ArrayList listaProfes = (ArrayList)Application.Contents["listaProfes"];
                    listaProfes.Add(txtCorreo.Text);
                    Application.Contents["listaProfes"] = listaProfes;

                    FormsAuthentication.SetAuthCookie("Profesor", false);
                    this.Response.Redirect("/Profesor/Profesor.aspx");

                }
                if (tipo == "Alumno")
                {
                    cantidad = (int)Application.Contents["cantAlumnos"];
                    cantidad=cantidad+1;
                    Application.Contents["cantAlumnos"] = cantidad;
                    ArrayList listaAlumnos = (ArrayList)Application.Contents["listaAlumnos"];
                    listaAlumnos.Add(txtCorreo.Text);
                    Application.Contents["listaAlumnos"] = listaAlumnos;

                    FormsAuthentication.SetAuthCookie("Alumno", false);        
                    this.Response.Redirect("/Alumno/Alumno.aspx");
                    

                }
                if (tipo == "Admin")
                {
                    FormsAuthentication.SetAuthCookie("Admin", false);
                    this.Response.Redirect("/Admin/VerUsuarios.aspx");
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
            comando1.Parameters.AddWithValue("@contra", EncriptarMD5.MD5Hash(txtPassword.Text));

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