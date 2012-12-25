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
            /*Boolean habilitado = false;
            while (_oPermisos.MoveNext())
            {
                BeanPermisos _per = (BeanPermisos)_oPermisos.Current;
                if (_per.id == 4)
                {
                    habilitado = true;
                }
            }
            if (!habilitado)
            {
                throw new BeanException(new Exception(), BeanException.Critico, "errorAcceso");
            }*/
        }
        catch (Exception ex)
        {
            // logueo el error en bitacora
            BRLoger.LogError(ex);
            // me voy a mostrar el error
            Session["Error"] = ex;
            Response.Redirect("../Servicio/Errores.aspx", false);
        }






        ddlProvincia.Items.Add("Buenos Aires");
        ddlProvincia.Items.Add("Cordoba");
        ddlProvincia.Items.Add("San Luis");

        ddlLocalidad.Items.Add("Avellaneda");
        ddlLocalidad.Items.Add("Quilmes");
        ddlLocalidad.Items.Add("Cap. fed.");

        ddlPartido.Items.Add("Sarandi");
        ddlPartido.Items.Add("Crucecita");
        ddlPartido.Items.Add("Dock Sud");

        ddlPRovinciaDestino.Items.Add("Buenos Aires");
        ddlPRovinciaDestino.Items.Add("Cordoba");
        ddlPRovinciaDestino.Items.Add("San Luis");

        ddlLocalidadDestino.Items.Add("Cap. fed.");
        ddlLocalidadDestino.Items.Add("Quilmes");
        ddlLocalidadDestino.Items.Add("Avellaneda");

        ddlPartidoDestino.Items.Add("barracas");
        ddlPartidoDestino.Items.Add("San Telmo");
        ddlPartidoDestino.Items.Add("Almagro");



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
        drNServicio["Nombre"] = "María Isabel";
        drNServicio["Apellido"] = "de Larrañaga";
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
        gvNuevoServicio.DataSource = dtNServicio;
        gvNuevoServicio.DataBind();



        DataTable dtVehiculos = new DataTable();
        dtVehiculos.Columns.Add("check");
        dtVehiculos.Columns.Add("ID");
        dtVehiculos.Columns.Add("Patente");
        dtVehiculos.Columns.Add("descripcion");
        dtVehiculos.Columns.Add("modelo");
        dtVehiculos.Columns.Add("autonomia");
        dtVehiculos.Columns.Add("Tara");
        dtVehiculos.Columns.Add("Kilometraje");
        dtVehiculos.Columns.Add("cargaAncho");
        dtVehiculos.Columns.Add("cargaAlto");
        dtVehiculos.Columns.Add("cargaLargo");
        dtVehiculos.Columns.Add("Volumen");


        DataRow drVehiculos = dtVehiculos.NewRow();
        drVehiculos["ID"] = "1";
        drVehiculos["Patente"] = "AAA935";
        drVehiculos["descripcion"] = "camion de carga";
        drVehiculos["modelo"] = "1999";
        drVehiculos["autonomia"] = "300km";
        drVehiculos["Tara"] = "4000kg";
        drVehiculos["Kilometraje"] = "100.000km";
        drVehiculos["cargaAncho"] = "2500";
        drVehiculos["cargaAlto"] = "4000";
        drVehiculos["cargaLargo"] = "8000";
        drVehiculos["Volumen"] = 25 * 40 * 80 + "cm3";
        dtVehiculos.Rows.Add(drVehiculos);
        drVehiculos = dtVehiculos.NewRow();
        drVehiculos["ID"] = "2";
        drVehiculos["Patente"] = "DXT687";
        drVehiculos["descripcion"] = "Camioneta tipo Furgon";
        drVehiculos["modelo"] = "1996";
        drVehiculos["autonomia"] = "200km";
        drVehiculos["Tara"] = "1500kg";
        drVehiculos["Kilometraje"] = "150.000km";
        drVehiculos["cargaAncho"] = "1000";
        drVehiculos["cargaAlto"] = "2000";
        drVehiculos["cargaLargo"] = "2500";
        drVehiculos["Volumen"] = 10 * 20 * 25 + "cm3";
        dtVehiculos.Rows.Add(drVehiculos);


        dtVehiculos.AcceptChanges();
        gvVehiculos.DataSource = dtVehiculos;
        gvVehiculos.DataBind();


        GridViewRow row = gvVehiculos.Rows[0];
        ((CheckBox)row.FindControl("chkSelect")).Checked = true;
        row = gvVehiculos.Rows[1];
        ((CheckBox)row.FindControl("chkSelect")).Checked = false;




        DataTable dt = new DataTable();
        dt.Columns.Add("ID");
        dt.Columns.Add("descripcion");
        dt.Columns.Add("viaticos");
        dt.Columns.Add("puntoX");
        dt.Columns.Add("puntoY");
        dt.Columns.Add("tiempoRecorrido");
        dt.Columns.Add("distanciaRecorrida");
        dt.Columns.Add("tiempoDestino");
        DataRow dr = dt.NewRow();
        dr["ID"] = "1";
        dr["descripcion"] = "TransArte - Combustible";
        dr["viaticos"] = "0";
        dr["puntoX"] = "-58.381755352020264 ";
        dr["puntoY"] = "-34.62215040181421";
        dr["tiempoRecorrido"] = "00:11";
        dr["distanciaRecorrida"] = "3.1km";
        dr["tiempoDestino"] = "00:30";
        dt.Rows.Add(dr);
        dr = dt.NewRow();
        dr["ID"] = "2";
        dr["descripcion"] = "Combustible - Museo";
        dr["viaticos"] = "$200";
        dr["puntoX"] = "-58.3850759267807 ";
        dr["puntoY"] = "-34.603925470633094";
        dr["tiempoRecorrido"] = "00:30";
        dr["distanciaRecorrida"] = "6.9km";
        dr["tiempoDestino"] = "6:00";
        dt.Rows.Add(dr);
        dr = dt.NewRow();
        dr["ID"] = "3";
        dr["descripcion"] = "Museo - TransArte";
        dr["viaticos"] = "0";
        dr["puntoX"] = "-58.41679573059082";
        dr["puntoY"] = "-34.5701890841777";
        dr["tiempoRecorrido"] = "00:21";
        dr["distanciaRecorrida"] = "10.4km";
        dr["tiempoDestino"] = "0:00";
        dt.Rows.Add(dr);
        dr = dt.NewRow();
        dr["ID"] = "4";
        dr["descripcion"] = "Fin Servicio";
        dr["viaticos"] = "0";
        dr["puntoX"] = "-58.381755352020264 ";
        dr["puntoY"] = "-34.62215040181421";
        dr["tiempoRecorrido"] = "00:00";
        dr["distanciaRecorrida"] = "0";
        dr["tiempoDestino"] = "0:00";
        dt.Rows.Add(dr);

        dt.AcceptChanges();
        gvHojaRuta.DataSource = dt;
        gvHojaRuta.DataBind();











        this.cblAdicionales.Items.Add(new ListItem("Seguimiento satelital", "SS"));
        this.cblAdicionales.Items.Add(new ListItem("Catalogo Electronico", "CE"));
        this.cblAdicionales.Items.Add(new ListItem("....................", ".."));

    }
}
