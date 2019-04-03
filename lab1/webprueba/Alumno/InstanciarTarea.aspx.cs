using accesoDatosSQL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webprueba.Alumno
{
    public partial class InstanciarTarea : System.Web.UI.Page
    {
        accesodatosSQL ac = new accesodatosSQL();
        private DataTable tareasTabla = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {

            ac.conectar();
           string tarea= Request["tarea"].ToString();
            string horas = Request["hrs"].ToString();
            string correo = Session["correo"].ToString();
            txtHorasEst.Text = horas;
            txtTarea.Text = tarea;
            txtUsuario.Text = correo;

            string query = "SELECT ET.Email, ET.CodTarea, ET.HEstimadas," +
                "ET.HReales FROM EstudiantesTareas ET " +
                "WHERE ET.Email = '" + correo + "';";
            SqlDataAdapter da = new SqlDataAdapter(query, ac.conexion);
            DataSet ds = new DataSet();
            try
            {
                da.Fill(ds, "EstudiantesTareas");
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Label1.Text = ex.Message;
            }
            finally
            {
                ds.Dispose();
                da.Dispose();
                ac.conexion.Dispose();
            }
            ac.cerrarConexion();
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            if (txtHorasRea.Text.Trim() != "")
            {
                ac.conectar();
                string insert = "INSERT INTO EstudiantesTareas" +
                    "(Email,CodTarea,HEstimadas,HReales)" +
                    " VALUES (@correo,@codigo,@hrEs,@hrRe)";

                SqlCommand comando = new SqlCommand(insert, ac.conexion);

                try
                {
                    comando.Parameters.AddWithValue("@correo", txtUsuario.Text);
                    comando.Parameters.AddWithValue("@codigo", txtTarea.Text);
                    comando.Parameters.AddWithValue("@hrEs", txtHorasEst.Text);
                    comando.Parameters.AddWithValue("@hrRe", txtHorasRea.Text);

                    int numregs = comando.ExecuteNonQuery();
                    RegularExpressionValidator1.IsValid = true;
                    lblMensaje.Text = numregs + " registro insertado correctamente." + "<br/>" + "" + "<br/>";
                    lblMensaje.ForeColor = Color.Black;
                    ac.cerrarConexion();
                    btnAceptar.Enabled = false;

                }
                catch (Exception ex)
                {

                    lblMensaje.Text = "No puede instanciar una tarea dos veces";
                    lblMensaje.ForeColor = Color.Red;
                }
                ac.conectar();
                string correo = Session["correo"].ToString();
                string query = "SELECT ET.Email, ET.CodTarea, ET.HEstimadas," +
                   "ET.HReales FROM EstudiantesTareas ET " +
                   "WHERE ET.Email = '" + correo + "';";
                SqlDataAdapter da = new SqlDataAdapter(query, ac.conexion);
                DataSet ds = new DataSet();
                try
                {
                    da.Fill(ds, "EstudiantesTareas");
                    GridView1.DataSource = ds;
                    GridView1.DataBind();

                }
                catch (Exception ex)
                {
                    Label1.Text = ex.Message;
                }
                finally
                {
                    ds.Dispose();
                    da.Dispose();
                    ac.conexion.Dispose();
                }
                ac.cerrarConexion();

            }
            else
            {
                RegularExpressionValidator1.IsValid = false;
            }

        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Inicio.aspx");
            System.Web.Security.FormsAuthentication.SignOut();
        }
    }
}