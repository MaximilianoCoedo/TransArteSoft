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
                if (_per.id == 7)
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

        DataTable dtNServicio = new DataTable();
        dtNServicio.Columns.Add("ID");
        dtNServicio.Columns.Add("Usuario");
        dtNServicio.Columns.Add("Nombre");
        dtNServicio.Columns.Add("Apellido");
        dtNServicio.Columns.Add("RazonSocial");
        dtNServicio.Columns.Add("Domicilio");
        dtNServicio.Columns.Add("Mail");
        dtNServicio.Columns.Add("Telefono");
        dtNServicio.Columns.Add("Volumen");
        dtNServicio.Columns.Add("Peso");
        dtNServicio.Columns.Add("Valor");
        dtNServicio.Columns.Add("Cantidad");
        dtNServicio.Columns.Add("FechaSalida");
        dtNServicio.Columns.Add("FechaLlegada");
        DataRow drNServicio = dtNServicio.NewRow();
        drNServicio["ID"] = "1";
        drNServicio["Usuario"] = "MISABEL";
        drNServicio["Nombre"] = "Mar�a Isabel";
        drNServicio["Apellido"] = "de Larra�aga";
        drNServicio["RazonSocial"] = "Museo de la ciudad";
        drNServicio["Domicilio"] = "Av. Infanta Isabel 555";
        drNServicio["Mail"] = "info@museosivori.org.ar";
        drNServicio["Telefono"] = "4774-9452";
        drNServicio["Volumen"] = "57807,5";
        drNServicio["Peso"] = "94";
        drNServicio["Valor"] = "1800000000";
        drNServicio["Cantidad"] = "3";
        drNServicio["FechaSalida"] = "12/12/2013";
        drNServicio["FechaLlegada"] = "15/12/2013";
        dtNServicio.Rows.Add(drNServicio);

        drNServicio = dtNServicio.NewRow();
        drNServicio["ID"] = "2";
        drNServicio["Usuario"] = "ACOUSILLAS";
        drNServicio["Nombre"] = "Ana";
        drNServicio["Apellido"] = "Cousillas";
        drNServicio["RazonSocial"] = "Museo de arte popular Jose Hernandez";
        drNServicio["Domicilio"] = "Av. del Libertador 2373";
        drNServicio["Mail"] = "info_hernandez@buenosaires.gob.ar ";
        drNServicio["Telefono"] = "4803-2384";
        drNServicio["Volumen"] = "10000";
        drNServicio["Peso"] = "85";
        drNServicio["Valor"] = "1021564";
        drNServicio["Cantidad"] = "5";
        drNServicio["FechaSalida"] = "12/05/2013";
        drNServicio["FechaLlegada"] = "18/05/2013";
        dtNServicio.Rows.Add(drNServicio);

        dtNServicio.AcceptChanges();
        gvServicio.DataSource = dtNServicio;
        gvServicio.DataBind();





    }
}
