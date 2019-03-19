using accesoDatosSQL;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webprueba
{
    public partial class Confirmar : System.Web.UI.Page
    {
        accesodatosSQL ac = new accesodatosSQL();
        protected void Page_Load(object sender, EventArgs e)
        {
            ac.cerrarConexion();
            ac.conectar();
            bool correcto = false;
            string dirCorreo = Request["correo"];
            string num = Request["numconf"];
            int numInt = Int32.Parse(num);
            string select = "select * from Usuarios where email=@correo";
            SqlCommand comando1 = new SqlCommand(select, ac.conexion);
            comando1.Parameters.AddWithValue("@correo", dirCorreo);
            SqlDataReader dr = comando1.ExecuteReader();

            while (dr.Read())
            {
                int numDR = Convert.ToInt32(dr["numconfir"]);
                if (numDR == numInt)
                {
                    correcto = true;
                }
            }
            dr.Close();
            comando1.Dispose();
            if (correcto)
            {
                int num1 = 1;
                string update = "update Usuarios set confirmado='" + num1 + "' where email='" + dirCorreo + "' and numconfir='" + numInt + "'";

                SqlCommand comandoUpdate = new SqlCommand(update, ac.conexion);
                comandoUpdate.ExecuteNonQuery();
                lblSucces.Visible = true;
                HyperLink1.NavigateUrl = "~/Inicio.aspx?correo="+dirCorreo;

            }
            else
            {
                lblError.Visible = true;
                lblSucces.Visible = false;
            }
            ac.cerrarConexion();
        }
        protected void Page_Unload(object sender, EventArgs e)
        {
            ac.cerrarConexion();
        }
    }
}

