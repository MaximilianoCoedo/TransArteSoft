using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Net.Mail;
using System.Collections.Generic;
using System.Text;
using System.Net;


public partial class QuienesSomos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblRespuestaOk.Visible = false;
        lblRespuestaError.Visible = false;
        lblRespuestaError.Text = "";
    }

    protected void Btn_enviar_mail_Click(object sender, EventArgs e)
    {

        Boolean x = RequiredFieldValidator1.IsValid;

        if (IsValid) {
            SmtpClient smtpClient = GetSmtpClient("smtp.gmail.com", 587, "TransArteSrl@gmail.com", "maxicoedo", true);
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("TransArteSrl@gmail.com");
            mail.To.Add("TransArteSrl@gmail.com");
            mail.Subject = "----Contacto de:" + txtApellidos.Text + ", " + txtNombre.Text + " - " + txtCorreo.Text ;
            string mesageMail = "Has recibido un mail de:" + txtApellidos.Text + ", " + txtNombre.Text + "<br>Telefono: " + txtTelefono.Text + "<br>Correo: " + txtCorreo.Text + "<br>Comentarios: " + txtComentarios.Text;
            mail.IsBodyHtml = true;
            mail.Body = mesageMail;
            AlternateView htmlview = default(AlternateView);
            htmlview = AlternateView.CreateAlternateViewFromString(mesageMail, null, "text/html");
            mail.AlternateViews.Add(htmlview);
            try
            {
                smtpClient.Send(mail);
                lblRespuestaOk.Visible = true;
            }
            catch (Exception t)
            {
                lblRespuestaError.Text = lblRespuestaError.Text + t.Message;
                lblRespuestaError.Visible = true;
            }
        }   

    }
    static SmtpClient GetSmtpClient(string host, int port, string user, string password, bool enableSsl)
    {
        SmtpClient smtpClient = new SmtpClient();
        smtpClient.Host = host;
        smtpClient.Port = port;
        NetworkCredential cred = new NetworkCredential(user, password);
        smtpClient.EnableSsl = enableSsl;
        smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
        smtpClient.UseDefaultCredentials = false;
        smtpClient.Timeout = 5000;
        smtpClient.Credentials = cred;
        return smtpClient;
    }
    protected override void InitializeCulture()
    {
        base.InitializeCulture();
        if (Session["lenguaje"] != null)
        {
            this.UICulture = Convert.ToString(Session["lenguaje"]);
            this.Culture = Convert.ToString(Session["lenguaje"]);
        }
        else
        {
            this.Culture = "auto";
            this.UICulture = "auto";
        }
    }
}

    
