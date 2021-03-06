using System;
using System.Collections;  //Para el ArrayList
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
                if (_per.id == 18)
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
    }
}
