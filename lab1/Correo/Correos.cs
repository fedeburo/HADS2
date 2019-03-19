using System;
using System.Net.Mail;

namespace Correo
{
    public class Correos
    {
        SmtpClient server = new SmtpClient("smtp.ehu.eus", 587);

        public Correos()
        {
            /*
             * Autenticacion en el Servidor
             * Utilizaremos nuestra cuenta de correo
             *
             * Direccion de Correo (Gmail o Hotmail)
             * y Contrasena correspondiente
             */
            server.Credentials = new System.Net.NetworkCredential("fburoni001@ikasle.ehu.eus", "Nexus123");
            server.EnableSsl = true;
        }
        public void MandarCorreo(MailMessage mensaje)
        {
            server.Send(mensaje);
        }

    }
}
