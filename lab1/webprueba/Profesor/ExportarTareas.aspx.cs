using accesoDatosSQL;
using Newtonsoft.Json;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Xml;

namespace webprueba.Profesor
{
    public partial class ExportarTareas : System.Web.UI.Page
    {
        private string asig;
        accesodatosSQL ac = new accesodatosSQL();
        protected void Page_Load(object sender, EventArgs e)
        {
            verDatos();
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Inicio.aspx");
            System.Web.Security.FormsAuthentication.SignOut();
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            verDatos();
        }
        protected void DropDownList1_DataBound(object sender, EventArgs e)
        {
            DropDownList1.SelectedValue = DropDownList1.Items[0].Value;
            asig = DropDownList1.Items[0].Value;
        }

        protected void btnExportarXML_Click(object sender, EventArgs e)
        {
            try
            {
                DataSet ds = Session["data"] as DataSet;
                ds.Tables[0].Columns[0].ColumnMapping = MappingType.Attribute;
                ds.Tables[0].Columns[0].ColumnName = "codigo";
                ds.Tables[0].Columns[1].ColumnName = "descripcion";
                ds.Tables[0].Columns[2].ColumnName = "hestimadas";

                ds.WriteXml(Server.MapPath("../App_Data/" + DropDownList1.SelectedValue + ".xml"));
                XmlDocument xml = new XmlDocument();
                xml.Load(Server.MapPath("../App_Data/" + DropDownList1.SelectedValue + ".xml"));
                xml.DocumentElement.SetAttribute("xmlns:has", "http://ji.ehu.es/has");
                xml.Save(Server.MapPath("../App_Data/" + DropDownList1.SelectedValue + ".xml"));
                lblMensaje.Text = "Las tareas han sido exportadas sactifactoriamente";
            }
            catch (Exception ex)
            {
                lblMensaje.Text = ex.Message;
            }

        }
        private void verDatos()
        {
            ac.conectar();
            asig = DropDownList1.SelectedValue.ToString();
            string query = "SELECT T.Codigo, T.Descripcion, T.HEstimadas," +
                " T.Explotacion, T.TipoTarea FROM " +
                "TareasGenericas T WHERE (T.CodAsig ='" + asig + "'); ";
            SqlDataAdapter da = new SqlDataAdapter(query, ac.conexion);
            DataSet ds = new DataSet("tareas");
            try
            {
                da.Fill(ds, "tarea");
                GridView1.DataSource = ds;
                GridView1.DataBind();
                Session["tabla"] = ds.Tables[0];
                Session["data"] = ds;
            }
            catch (Exception ex)
            {
                lblMensaje.Text = ex.Message;
            }
            finally
            {
                ds.Dispose();
                da.Dispose();
                ac.conexion.Dispose();
            }
            ac.cerrarConexion();
        }

        protected void btnExportarJSON_Click(object sender, EventArgs e)
        {
            try
            {
                string JSONresult;
                DataSet ds = Session["data"] as DataSet;
                JSONresult = JsonConvert.SerializeObject(ds.Tables[0], Newtonsoft.Json.Formatting.Indented);
                System.IO.File.WriteAllText((Server.MapPath("../App_Data/" + DropDownList1.SelectedValue + ".json")), JSONresult);
                lblMensaje.Text = "Las tareas han sido exportadas exitosamente en formato JSON";
            }
            catch (Exception ex)
            {
                lblMensaje.Text = ex.Message;
            }

        }
    }
}