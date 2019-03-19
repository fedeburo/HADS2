using accesoDatosSQL;
using Correo;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webprueba
{
    public partial class Registro : System.Web.UI.Page
    {
        accesodatosSQL ac = new accesodatosSQL();
        protected void Page_Load(object sender, EventArgs e)
        {
            lblConfir.Text= ac.conectar();
        }

        protected void Page_Unload(object sender, EventArgs e)
        {

        }

       protected void btnRegistrar_Click2(object sender, EventArgs e)
        {
            bool enviado = false;
            Random rm = new Random();
            int numConfirm = rm.Next(1000000, 9999999);
            bool correoExistente = false;
            string select = "select * from Usuarios where email=@correo";
            SqlCommand comando1 = new SqlCommand(select, ac.conexion);
            comando1.Parameters.AddWithValue("@correo", txtDirCorreo.Text);

            SqlDataReader dr = comando1.ExecuteReader();
            dr.Read();
            if (dr.HasRows)
                correoExistente = true;
            dr.Close();
            comando1.Dispose();
            if (!correoExistente)
            {
                try
                {
                    Correos cr = new Correos();
                    MailMessage mnsj = new MailMessage();

                    mnsj.Subject = "Confirmacion de correo electronico";

                    mnsj.To.Add(new MailAddress(txtDirCorreo.Text));

                    mnsj.From = new MailAddress("fburoni001@ikasle.ehu.eus", "Fede Buroni");


                    mnsj.Body = "  Mensaje de Prueba \n\n Enviado desde C#\n\n http://hads18-fede.azurewebsites.net//Confirmar.aspx?correo=" + txtDirCorreo.Text + "&numconf=" + numConfirm;

                    /* Enviar */
                    cr.MandarCorreo(mnsj);
                    enviado = true;
                    lblconfirmail.Text = "El Mail se ha Enviado Correctamente";
                }
                catch (Exception ex)
                {
                    lblconfirmail.Text = ex.Message;
                    enviado = false;
                }
                if (enviado)
                {
                    int confirm = 0;
                    int codPass = 0;
                    string insert = "INSERT INTO Usuarios(email,nombre,apellidos,numconfir,confirmado,tipo,pass,codpass) VALUES (@email,@nombre,@apellidos,@numconfir,@confirmado,@tipo,@pass,@codpass)";

                    SqlCommand comando = new SqlCommand(insert, ac.conexion);

                    try
                    {
                        comando.Parameters.AddWithValue("@email", this.txtDirCorreo.Text);
                        comando.Parameters.AddWithValue("@nombre", this.txtNom.Text);
                        comando.Parameters.AddWithValue("@apellidos", this.txtApe.Text);
                        comando.Parameters.AddWithValue("@numconfir", numConfirm);
                        comando.Parameters.AddWithValue("@confirmado", confirm);
                        comando.Parameters.AddWithValue("@tipo", RadioButtonList1.SelectedItem.Text);
                        comando.Parameters.AddWithValue("@pass", this.txtPassword1.Text);
                        comando.Parameters.AddWithValue("@codpass", codPass);

                        int numregs = comando.ExecuteNonQuery();
                        lblConfir.Text = numregs + " registro insertado correctamente." + "<br/>" + "" + "<br/>" + " Puede confirmarlo con el correo mandado a su email, o con el link:  <a href =\"http://hads18-fede.azurewebsites.net/Confirmar.aspx?correo=" + txtDirCorreo.Text + "&numconf=" + numConfirm + "\">Validar Correo</a>" + "<br/>" + "" + "<br/>" + "";
                        ac.cerrarConexion();
                        lblCorreoInexistente.Visible = false;

                    }
                    catch (Exception ex)
                    {
                        lblConfir.Text = ex.Message;
                    }
                }
                else
                {
                    this.lblCorreoInexistente.Visible = true;
                }


            }
            else
            {
                lblCorreoInexistente.Text = "El correo ingresado ya existe";
                lblCorreoInexistente.Visible = true;
            }


        }
    }
}
