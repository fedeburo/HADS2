using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary1
{
    public class accesodatosSQL
    {
        private SqlConnection conexion = new SqlConnection();
        private SqlCommand comando = new SqlCommand();
        public String  conectar()
        {
            try
            {
                conexion.ConnectionString = "Server=tcp:hads.database.windows.net,1433;Initial Catalog=Amigos;Persist Security Info=False;User ID=hads;Password=JAVadillo-2018;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;";
                conexion.Open();
            }

        catch (Exception ex)
            {
                return ex = ex.Message;
            }

            return "CONEXION OK";
        }

    }
}
