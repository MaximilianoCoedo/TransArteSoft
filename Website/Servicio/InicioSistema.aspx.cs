using System;
using System.Data;
using System.Configuration;
using System.Collections;  //Para el ArrayList
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using ProyTransArte.BeanObjetos;
using ProyTransArte.ReglasDeNegocio;

public partial class _Default : System.Web.UI.Page
{
    
    protected override void InitializeCulture()
    {
        base.InitializeCulture();
        if (Session["lenguaje"] != null){
            this.UICulture = Convert.ToString(Session["lenguaje"]);
            this.Culture = Convert.ToString(Session["lenguaje"]);

        }else{
            this.Culture = "auto";
            this.UICulture = "auto";
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        
    try
        {
            DataSet dsUsuario = BRUsuarios.buscarTodos();
            if (dsUsuario.Tables[0].Rows.Count != 0)
            {
                throw new BeanException(new Exception(), BeanException.Critico, "errorAcceso");
            }
            else {// no hay usuarios en la BD asi que cargo la pantalla 
                  // creo un usuario virtual para que pueda cargar lo que desee
                BeanUsuario usuario = new BeanUsuario();
                usuario.usuarioInicio();
                BRCriticidad.validarIntegridadHorizontal(usuario);
                Session.Add("usuarioActual", usuario);
                Response.Redirect("../Servicio/AdminUsuarios.aspx", false);
            }
        }
        catch (Exception ex)
        {
            // logueo el error en bitacora
            BRLoger.LogError(ex);
            // me voy a mostrar el error
            Session["Error"] = ex;
            Response.Redirect("../Servicio/Errores.aspx", false);
        }
    }
}
