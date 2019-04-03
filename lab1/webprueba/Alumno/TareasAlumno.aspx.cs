using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using accesoDatosSQL;

namespace webprueba.Alumno
{
    public partial class TareasAlumno : System.Web.UI.Page
    {
        accesodatosSQL ac = new accesodatosSQL();

        protected void Page_Load(object sender, EventArgs e)
        {

            string correo = Session["correo"].ToString();
            ac.conectar();
            if (!Page.IsPostBack)
            {
               
                DataTable asignaturasTabla = new DataTable();
                try
                {
                    string query = "SELECT A.Nombre FROM Asignaturas A, " +
                        "EstudiantesGrupo EG, Usuarios U, GruposClase GC " +
                        "WHERE U.email = '" + correo + "' " +
                        "and U.email = EG.Email and EG.Grupo = GC.codigo " +
                        "AND GC.codigoasig = A.codigo; ";
                    SqlDataAdapter adapter = new SqlDataAdapter(query, ac.conexion);
                    adapter.Fill(asignaturasTabla);

                    DropDownListAsig.DataSource = asignaturasTabla;
                    DropDownListAsig.DataTextField = "Nombre";
                    DropDownListAsig.DataValueField = "Nombre";
                    DropDownListAsig.DataBind();
                }
                catch (Exception ex)
                {
                    lblSeleccionar.Text = ex.Message;
                }

            }
            string asig = DropDownListAsig.SelectedValue.ToString();
            DataTable tareasTabla = new DataTable();
            string query2 = "SELECT T.Codigo, T.Descripcion, T.HEstimadas,T.TipoTarea" +
                " FROM TareasGenericas T, Asignaturas A" +
                " WHERE A.Nombre = '"+ asig+ "' " +
                "AND A.codigo = T.CodAsig AND T.Explotacion = 1" +
                " AND T.Codigo NOT IN(SELECT ET.CodTarea " +
                "FROM EstudiantesTareas ET" +
                " WHERE ET.Email = '"+ correo + "'); ";
            SqlDataAdapter da = new SqlDataAdapter(query2, ac.conexion);
            DataSet ds = new DataSet();
            try {
                da.Fill(ds, "TareasGenericas");
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                lblSeleccionar.Text = ex.Message;
            }
            finally
            {
                ds.Dispose();
                da.Dispose();
                ac.conexion.Dispose();
            }
          ac.cerrarConexion();
        }

        protected void GridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            string codigoTarea = row.Cells[1].Text;
            string horas = row.Cells[3].Text;
            Response.Redirect("~/Alumno/InstanciarTarea.aspx?tarea=" + codigoTarea+"&hrs="+ horas);
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Inicio.aspx");
            System.Web.Security.FormsAuthentication.SignOut();
        }
    }
}