using accesoDatosSQL1;
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
    public partial class CambiarPassword : System.Web.UI.Page
    {
        accesodatosSQL ac = new accesodatosSQL();
        protected void Page_Load(object sender, EventArgs e)
        {
            ac.conectar();
        }

        protected void btnCorreo_Click(object sender, EventArgs e)
        {
            ac.conectar();
            string correo = this.txtCorreo.Text;
            Random rm = new Random();
            int numConfirm = rm.Next(100000, 999999);
            bool existeCorreo = CorreoExistente();
            if (existeCorreo)
            {
                try
                {
                    Correos cr = new Correos();
                    MailMessage mnsj = new MailMessage();

                    mnsj.Subject = "Reestablecer contrasena";

                    mnsj.To.Add(new MailAddress(this.txtCorreo.Text));

                    mnsj.From = new MailAddress("fburoni001@ikasle.ehu.eus", "Fede Buroni");

                    /* Si deseamos Adjuntar algún archivo
                    mnsj.Attachments.Add(new Attachment("C:\\archivo.pdf"));*/

                    mnsj.Body = "  Su numero de confirmacion es:" + numConfirm;

                    /* Enviar */
                    cr.MandarCorreo(mnsj);
                    string update = "update Usuarios set codpass='" + numConfirm + "' where email='" + correo + "'";

                    SqlCommand comandoUpdate = new SqlCommand(update, ac.conexion);
                    comandoUpdate.ExecuteNonQuery();
                    comandoUpdate.Dispose();
                    lblCorreoMandado.Visible = true;
                    this.lblCorreoMandado.Text = "Revise su casilla de correo electronico";
                    this.txtCorreo.ReadOnly = true;
                    this.Panel1.Visible = true;
                    this.Panel1.Enabled = true;
                    this.RequiredFieldValidator1.Enabled = true;
                    this.RequiredFieldValidator2.Enabled = true;
                    this.RequiredFieldValidator3.Enabled = true;
                    this.btnEnviar.Visible = true;
                    this.lblErrorCorreo.Visible = false;


                }
                catch (Exception ex)
                {
                    lblErrorCorreo.Text = "El correo electronico no es correcto" + ex.Message;
                }
            }
            else
            {
                lblErrorCorreo.Text = "El correo ingresado no existe";
                lblCorreoMandado.Visible = false;
            }
            
            ac.cerrarConexion();

        }

        private bool CorreoExistente()
        {
            bool retorno = false;

            string select = "select * from Usuarios where email=@correo";
            SqlCommand comando1 = new SqlCommand(select, ac.conexion);
            comando1.Parameters.AddWithValue("@correo", txtCorreo.Text);
            SqlDataReader dr = comando1.ExecuteReader();
            dr.Read();
            if (dr.HasRows)
                retorno = true;
            dr.Close();
            comando1.Dispose();
            return retorno;
        }

        private void actualizarContrasena()
        {
            string pass1 = this.txtPassword.Text;
            string pass2 = this.txtPassword2.Text;
            if (pass1.Equals(pass2))
            {
                string update = "update Usuarios set pass='" + pass1 + "' where email='" + txtCorreo.Text + "'";

                SqlCommand comandoUpdate = new SqlCommand(update, ac.conexion);
                comandoUpdate.ExecuteNonQuery();
                comandoUpdate.Dispose();
                this.lblSucces.Text = "La contrasena ha sido modificada correctamente";
            }
        }

        private bool comprobarCampos()
        {

            bool retorno = false;
            int numCod = Int32.Parse(txtCodigo.Text);
            string select = "select * from Usuarios where email=@correo";
            SqlCommand comando1 = new SqlCommand(select, ac.conexion);
            comando1.Parameters.AddWithValue("@correo", txtCorreo.Text);
            SqlDataReader dr = comando1.ExecuteReader();

            while (dr.Read())
            {
                int numDR = Convert.ToInt32(dr["codpass"]);
                if (numDR == numCod)
                {
                    retorno = true;
                }
            }
            dr.Close();
            comando1.Dispose();

            return retorno;
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {

            bool correcto = comprobarCampos();
            if (correcto)
            {
                actualizarContrasena();
            }

        }
    }
}