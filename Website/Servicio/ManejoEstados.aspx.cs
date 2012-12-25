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
        BeanUsuario usuario = (BeanUsuario)Session["usuarioActual"];
        try
        {
            if (usuario == null)
            {
                throw new BeanException(new Exception(), BeanException.Critico, "errorFueraSession");
            }
            IEnumerator _oPermisos = usuario.permisos.GetEnumerator();
            Boolean habilitado = false;
            while (_oPermisos.MoveNext())
            {
                BeanPermisos _per = (BeanPermisos)_oPermisos.Current;
                if (_per.id == 10)
                {
                    habilitado = true;
                }
            }
            if (!habilitado)
            {
                throw new BeanException(new Exception(), BeanException.Critico, "errorAcceso");
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

        this.cblEstadoActual.Items.Add(new ListItem("Solicitado", "SOLI"));
        this.cblEstadoActual.Items.Add(new ListItem("Contactado", "CONT"));
        this.cblEstadoActual.Items.Add(new ListItem("Confirmado", "CONF"));
        this.cblEstadoActual.Items.Add(new ListItem("Enrutado", "ENRU"));
        this.cblEstadoActual.Items.Add(new ListItem("En Curso", "ENCU"));
        this.cblEstadoActual.Items.Add(new ListItem("Finalizado", "FINA"));
        this.cblEstadoActual.Items.Add(new ListItem("Facturado", "FACT"));
        this.cblEstadoActual.Items.Add(new ListItem("Cobrado", "COBR"));

        this.cblEstadoFuturo.Items.Add(new ListItem("Solicitado", "SOLI"));
        this.cblEstadoFuturo.Items.Add(new ListItem("Contactado", "CONT"));
        this.cblEstadoFuturo.Items.Add(new ListItem("Confirmado", "CONF"));
        this.cblEstadoFuturo.Items.Add(new ListItem("Enrutado", "ENRU"));
        this.cblEstadoFuturo.Items.Add(new ListItem("En Curso", "ENCU"));
        this.cblEstadoFuturo.Items.Add(new ListItem("Finalizado", "FINA"));
        this.cblEstadoFuturo.Items.Add(new ListItem("Facturado", "FACT"));
        this.cblEstadoFuturo.Items.Add(new ListItem("Cobrado", "COBR"));

    }
}
