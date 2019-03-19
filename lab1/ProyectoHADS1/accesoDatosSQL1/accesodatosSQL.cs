using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace accesoDatosSQL1
{
    public class accesodatosSQL
    {
        public SqlConnection conexion = new SqlConnection();
        public  String conectar()
        {
            try
            {
                conexion.ConnectionString = "Server=tcp:hads.database.windows.net,1433;Initial Catalog=Amigos;Persist Security Info=False;User ID=hads;Password=JAVadillo-2018;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30; ";
                conexion.Open();
            }

            catch (Exception ex)
            {
                return "Error de conexion" + ex.Message;
            }

            return "CONEXION OK";
        }
        
        public void cerrarConexion()
        {
            conexion.Close();
        }
    }
}
