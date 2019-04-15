using accesoDatosSQL;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace webprueba.Profesor
{
    public partial class ImportarTareasXMLDocument : System.Web.UI.Page
    {
        accesodatosSQL ac = new accesodatosSQL();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnInsertarTarea_Click(object sender, EventArgs e)
        {
            ac.conectar();
            XmlDocument xmlDoc = new XmlDocument();
            if(!File.Exists(Server.MapPath("../App_Data/" + DropDownList1.SelectedValue + ".xml"))){
                lblMensaje.Text = "No hay documentos xml para importar de esa asignatura";
                btnImportar.Visible = false;
            }
            else
            {
                btnImportar.Visible = true;
                try
                {
                    xmlDoc.Load(Server.MapPath("../App_Data/" + DropDownList1.SelectedValue + ".xml"));
                    //Se genera el dataSet de tareas genericas
                    DataSet ds = new DataSet();
                    SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM TareasGenericas", ac.conexion);
                    SqlCommandBuilder cb = new SqlCommandBuilder(da);
                    DataTable tareas = new DataTable();
                    da.Fill(ds, "tareas");
                    try
                    {
                        XmlNode root = xmlDoc.DocumentElement;
                        XmlNodeList tarea = xmlDoc.GetElementsByTagName("tarea");
                        for (int i = 0; i < tarea.Count; i++)
                        {
                            DataRow fila = ds.Tables[0].NewRow();
                            fila[0] = tarea[i].Attributes["codigo"].Value;//o Value;
                            fila[1] = tarea[i].ChildNodes[0].InnerText;
                            fila[2] = DropDownList1.SelectedValue;
                            fila[3] = tarea[i].ChildNodes[1].InnerText;
                            fila[4] = tarea[i].ChildNodes[2].InnerText;
                            fila[5] = tarea[i].ChildNodes[3].InnerText;
                            ds.Tables[0].Rows.Add(fila);
                            da.Update(ds.Tables[0]);
                            ds.AcceptChanges();

                        }


                        lblMensaje.Text = "Las tareas han sido insertadas en la BD exitosamente";
                    }



                    catch (Exception ex)
                    {
                        lblMensaje.Text = "No se ha podido insertar la tarea. Puede ser que exista una tarea con el mismo codigo, modifiquelo.";
                    }
                }
                catch(FileNotFoundException ex)
                {
                    lblMensaje.Text = "No hay documentos xml para importar de esa asignatura";
                }

            }

           
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

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                verDatos();
            }

            catch (FileNotFoundException ex)
            {
                lblMensaje.Text = "No se encontro el fichero";
            }
        }

        protected void DropDownList1_DataBound(object sender, EventArgs e)
        {
            DropDownList1.SelectedValue = DropDownList1.Items[0].Value;
            try
            {
                verDatos();
            }

            catch (FileNotFoundException ex)
            {
                lblMensaje.Text = "No se encontro el fichero";
            }
        }
        void verDatos()
        {
            if (!File.Exists(Server.MapPath("../App_Data/" + DropDownList1.SelectedValue + ".xml")))
            {
                lblMensaje.Text = "No hay documentos xml para importar de esa asignatura";
                btnImportar.Visible = false;
            }
            else
            {
                try
                {
                    Xml1.DocumentSource = Server.MapPath("../App_Data/" + DropDownList1.SelectedValue + ".xml");
                    Xml1.TransformSource = Server.MapPath("../App_Data/XSLTFile.xsl");
                    lblMensaje.Text = "Exito";
                }
                catch (FileNotFoundException ex)
                {
                    lblMensaje.Text = "No se encontro el fichero";
                }
            }

        }
    }
}