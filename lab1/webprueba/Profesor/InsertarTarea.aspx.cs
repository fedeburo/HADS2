using accesoDatosSQL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webprueba.Profesor
{
    public partial class InsertarTarea : System.Web.UI.Page
    {
        accesodatosSQL ac = new accesodatosSQL();
        protected void Page_Load(object sender, EventArgs e)
        {
            string correo = Session["correo"].ToString();


        }

        protected void btnInsertar_Click(object sender, EventArgs e)
        {
            ac.conectar();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM TareasGenericas",ac.conexion);
            SqlCommandBuilder cb = new SqlCommandBuilder(da);
            DataTable tareas = new DataTable();
            da.Fill(ds,"tareas");
            try
            {
                DataRow fila = ds.Tables[0].NewRow();
                fila[0] = txtCod.Text;
                fila[1] = txtDesc.Text;
                fila[2] = DropDownListAs.SelectedValue.ToString();
                fila[3] = Convert.ToInt32(txtHEs.Text);
                fila[4] = 0;
                fila[5] = DropDownListTipo.SelectedItem.Text;
                ds.Tables[0].Rows.Add(fila);
                da.Update(ds.Tables[0]);
                ds.AcceptChanges();
                lblInsertado.Text = "La tarea se ha ingresado correctamente";
                
            }
            catch (Exception ex)
            {
                lblInsertado.Text = "No se ha podido insertar la tarea. Puede ser que exista una tarea con el mismo codigo, modifiquelo.";
            }


        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Inicio.aspx");
        }
    }
}