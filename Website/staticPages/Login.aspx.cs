using System;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using ProyTransArte.BeanObjetos;
using ProyTransArte.ReglasDeNegocio;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    
    protected void btnResetPass_Click(object sender, EventArgs e)
    {
        try
        {
            String pasword = System.Web.Security.Membership.GeneratePassword(25, 10);
            string email = BRUsuarios.desbloquearPorUsuario(txtLoginUsuario.Text, pasword);

            SmtpClient smtpClient = GetSmtpClient("smtp.gmail.com", 587, "TransArteSrl@gmail.com", "maxicoedo", true);
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("TransArteSrl@gmail.com");
            mail.To.Add(email);
            mail.Subject = " Sistema TransArte = Restablecimiento de contraseña.-";
            string mesageMail = "En base a los intentos de ingreso sin la contraseña correcta se a restablecido la contraseña por: " + pasword + ", <br> Ingrese a la nuevamente su usario y use la contraseña enviada para acceder a la aplicación.- <br><br>Atte.: TransArte";
            mail.IsBodyHtml = true;
            mail.Body = mesageMail;
            AlternateView htmlview = default(AlternateView);
            htmlview = AlternateView.CreateAlternateViewFromString(mesageMail, null, "text/html");
            mail.AlternateViews.Add(htmlview);
            try
            {
                smtpClient.Send(mail);
                this.lblBloqueado.Visible = false;
                this.lblBloqueado2.Visible = false;
                this.btnResetPass.Visible = false;
                return;
            }
            catch (Exception ex)
            {
                throw new BeanException(ex, BeanException.Moderado, "errorMail");
            }
        }
        catch (Exception ex)
        {
            // logueo el error en bitacora y en ELMATH
            BRLoger.LogError(ex);
            // me voy a mostrar el error
            Session["Error"] = ex;
            Response.Redirect("../Servicio/Errores.aspx", false);
        }
    }

    protected void btnIngresar_Click(object sender, EventArgs e)
    {
        BeanUsuario usuario = new BeanUsuario();
        /*
            verifico intrgridad
            error
                busco usuario
             * No existe 
             * 
             * error con integridad
             * 
             * existe
             *  fehca baja// error
             *  bloqueado // error
             *  ok muestro menu si es q puede
            sin error 
             * busco usuario
             * no existe
             *  
             * contador de bloqueos
             * 
             * existe
             * 
             *  fehca baja a error
             *  bloqueado a desbloqueo
             * ok = nuestro menu
             * 
            */
        try
        {

            Session["Error"] = null;
            this.lblBloqueado.Visible = false;
            this.lblBloqueado2.Visible = false;
            this.btnResetPass.Visible = false;

            BRSeguridad.VerificarIntegridadCompleta(usuario);
            if (usuario.integridad.Count != 0)
            {  // Hay problemas de integridad 


                //String sPass = getMD5(txtLoginPassword.Text);
                String sPass = txtLoginPassword.Text;
                BRUsuarios.autenticarUsuario(usuario, txtLoginUsuario.Text, sPass);

                if (!usuario.existe)
                {// No existe el usuario username y pass INVALIDOS
                    // Contador de veces de inicio de sesión inválido
                    this.lblInvalido.Visible = true;
                    if (Session["InvalidUser"] != null)
                    {
                        Session["InvalidUser"] = Convert.ToInt32(Session["InvalidUser"]) + 1;
                        if (Session["InvalidUser"].ToString() == "3")
                        {// Bloqueo del usuario
                            BRUsuarios.bloquearPorUsuario(txtLoginUsuario.Text, "Tuvo 3 errores de logueo");
                            Session["InvalidUser"] = 0;
                        }
                    }
                    else
                    {// primera vez q el usuario es invalido
                        Session["InvalidUser"] = 0;
                    }
                    throw new BeanException(new Exception("Error de integridad en la BD"), BeanException.Moderado, "errorIntegridad");
                }
                else
                {// Existe el usuario username y pass Validos
                    if (usuario.fechaBaja != null && usuario.fechaBaja != "")
                    {
                        usuario.permisos.Clear();
                        throw new BeanException(new Exception("Error de usuario " + usuario.usuario + " id = " + +usuario.id + " esta dado de baja.-"), BeanException.Moderado, "errorBajaDeUsuario");
                    }
                    if (usuario.bloqueado)
                    {
                        usuario.permisos.Clear();
                    }
                }
                Session.Add("usuarioActual", usuario);
                BRBitacora.registrarEvento("Sesión Iniciada por usuario = " + usuario.usuario + " id = " + usuario.id, BeanException.Leve);
                throw new BeanException(new Exception("Error de integridad en la BD"), BeanException.Moderado, "errorIntegridad");
            }
            else
            {// es un usuario sin problemas de intregridad
                
                //String sPass = getMD5(txtLoginPassword.Text);
                String sPass = txtLoginPassword.Text;
                BRUsuarios.autenticarUsuario(usuario, txtLoginUsuario.Text, sPass);

                if (!usuario.existe)
                {// No existe el usuario username y pass INVALIDOS
                    // Contador de veces de inicio de sesión inválido
                    this.lblInvalido.Visible = true;
                    if (Session["InvalidUser"] != null)
                    {
                        Session["InvalidUser"] = Convert.ToInt32(Session["InvalidUser"]) + 1;
                        if (Session["InvalidUser"].ToString() == "3")
                        {// Bloqueo del usuario
                            BRUsuarios.bloquearPorUsuario(txtLoginUsuario.Text, "Tuvo 3 errores de logueo");
                            Session["InvalidUser"] = 0;
                            this.lblBloqueado.Visible = true;
                            this.lblBloqueado2.Visible = true;
                            this.btnResetPass.Visible = true;
                            return;
                        }
                        return;
                    }
                    else
                    {// primera vez q el usuario es invalido
                        Session["InvalidUser"] = 0;
                        return;
                    }
                }
                else
                {// Existe el usuario username y pass Validos
                    if (usuario.fechaBaja != null && usuario.fechaBaja != "")
                    {
                        usuario.permisos.Clear();
                        throw new BeanException(new Exception("Error de usuario " + usuario.usuario + " id = " + +usuario.id + " esta dado de baja.-"), BeanException.Moderado, "errorBajaDeUsuario");
                    }
                    if (usuario.bloqueado)
                    {
                        usuario.permisos.Clear();
                        this.lblBloqueado.Visible = true;
                        this.lblBloqueado2.Visible = true;
                        this.btnResetPass.Visible = true;
                        return;
                    }
                }
                Session.Add("usuarioActual", usuario);
                BRBitacora.registrarEvento("Sesión Iniciada por usuario = " + usuario.usuario + " id = " + usuario.id, BeanException.Leve);
                Response.Redirect("../Servicio/Inicio.aspx", false);
            }
        }
        catch (Exception ex)
        {
            // logueo el error en bitacora y en ELMATH
            BRLoger.LogError(ex);
            // me voy a mostrar el error
            Session["Error"] = ex;
            Response.Redirect("../Servicio/Errores.aspx", false); 
        }
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

    private string getMD5(string str)
    {
        MD5 md5 = MD5CryptoServiceProvider.Create();
        ASCIIEncoding encoding = new ASCIIEncoding();
        byte[] stream = null;
        StringBuilder sb = new StringBuilder();
        stream = md5.ComputeHash(encoding.GetBytes(str));
        for (int i = 0; i < stream.Length; i++) sb.AppendFormat("{0:x2}", stream[i]);
        return sb.ToString();
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
}
