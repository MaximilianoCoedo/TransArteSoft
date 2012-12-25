using System;
using System.Collections;  //Para el ArrayList
using System.Data;
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
            if (usuario.permisos.Count == 0)
            {
                BRSeguridad.VerificarIntegridadCompleta(usuario);
                cargarPermisos(usuario);
            }
            IEnumerator _oPermisos = usuario.permisos.GetEnumerator();
            Boolean habilitado = false;

            while (_oPermisos.MoveNext())
            {
                BeanPermisos _per = (BeanPermisos)_oPermisos.Current;
                if (_per.id == 17)
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

    protected void cargarPermisos(BeanUsuario us)
    {
        DataSet dsPermisos = BRPermisos.buscarPorIdUsuario(us.id);
        if (dsPermisos.Tables[0].Rows.Count != 0)
        {
            int nCantColumnas = dsPermisos.Tables[0].Rows.Count - 1;
            for (int i = 0; i <= nCantColumnas; i++)
            {
                BeanPermisos permiso = new BeanPermisos();
                permiso.id = (int)dsPermisos.Tables[0].Rows[i]["idPermiso"];
                permiso.idForm = Convert.ToString(dsPermisos.Tables[0].Rows[i]["idForm"]);
                permiso.descripcion = Convert.ToString(dsPermisos.Tables[0].Rows[i]["descripcion"]);
                permiso.negado = false;
                us.addPermiso(permiso);
            }
        }
        DataSet dsPermisosIndependientes = BRPermisos.buscarIndepPorIdUsuario(us.id);
        if (dsPermisosIndependientes.Tables[0].Rows.Count != 0)
        {
            int nCantColumnas = dsPermisosIndependientes.Tables[0].Rows.Count - 1;
            for (int i = 0; i <= nCantColumnas; i++)
            {
                BeanPermisos permiso = new BeanPermisos();
                permiso.id = (int)dsPermisosIndependientes.Tables[0].Rows[i]["idPermiso"];
                permiso.idForm = Convert.ToString(dsPermisosIndependientes.Tables[0].Rows[i]["idForm"]);
                permiso.descripcion = Convert.ToString(dsPermisosIndependientes.Tables[0].Rows[i]["descripcion"]);
                permiso.negado = (Convert.ToString(dsPermisosIndependientes.Tables[0].Rows[i]["negado"]) != "1") ? false : true;
                us.addPermisoIndependiente(permiso);
            }
        }
    }
}
