using System;
using System.Collections;  //Para el ArrayList
using System.Data;
using System.Web.UI.WebControls;
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
                if (_per.id == 2)
                {
                    habilitado = true;
                }
            }
            if (!habilitado)
            {
                throw new BeanException(new Exception(), BeanException.Critico, "errorAcceso");
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




            DataTable dt = new DataTable();
            dt.Columns.Add("ID");
            dt.Columns.Add("Desc");
            dt.Columns.Add("Alto");
            dt.Columns.Add("Ancho");
            dt.Columns.Add("Largo");
            dt.Columns.Add("Volumen");
            dt.Columns.Add("Peso");
            dt.Columns.Add("Valor");
            dt.Columns.Add("Foto");
            DataRow dr = dt.NewRow();
            dr["ID"] = "1";
            dr["Desc"] = "Mona Lisa, cuadro pintado entre 1503 y 1519. mantener una temperatura constante de 20 °C y 50% de humedad relativa, para garantizar las condiciones óptimas para la estabilidad de la pintura. La pintura tiene una grieta vertical de 12 centímetros en la mitad superior";
            dr["Alto"] = "77";
            dr["Ancho"] = "53";
            dr["Largo"] = "5";
            dr["Volumen"] = 5 * 53 * 77;
            dr["Peso"] = "15";
            dr["Valor"] = "1.200.000.000";
            dr["Foto"] = "~/images/Monalisa.jpg";
            dt.Rows.Add(dr);
            dr = dt.NewRow();
            dr["ID"] = "2";
            dr["Desc"] = "El grito (en noruego Skrik) del noruego Edvard Munch (1863-1944).El cuadro es abundante en colores cálidos de fondo, luz semioscura y la figura principal es una persona en un sendero con vallas que se pierde de vista fuera de la escena. Esta figura está gritando, con una expresión de desesperación. En el fondo, casi fuera de escena, se aprecian dos figuras con sombrero que no se pueden distinguir con claridad. El cielo parece fluido y arremolinado, igual que el resto del fondo. ";
            dr["Alto"] = "91";
            dr["Ancho"] = "73,5";
            dr["Largo"] = "5";
            dr["Volumen"] = 5 * 91 * 73.5;
            dr["Peso"] = "70";
            dr["Valor"] = "600.000.000";
            dr["Foto"] = "~/images/ElGrito.jpg";
            dt.Rows.Add(dr);
            dr = dt.NewRow();
            dr["ID"] = "3";
            dr["Desc"] = "Los relojes blandos,  del pintor español Salvador Dalí pintado en 1931.Realizado mediante la técnica del óleo sobre lienzo, es de estilo surrealista ";
            dr["Alto"] = "24";
            dr["Ancho"] = "33";
            dr["Largo"] = "5";
            dr["Volumen"] = 5 * 24 * 33;
            dr["Peso"] = "9";
            dr["Valor"] = "-------";
            dr["Foto"] = "~/images/RelojesBlandos.jpg";
            dt.Rows.Add(dr);

            dt.AcceptChanges();
            gvServicios.DataSource = dt;
            gvServicios.DataBind();



            this.cblAdicionales.Items.Add(new ListItem("Seguimiento satelital", "SS"));
            this.cblAdicionales.Items.Add(new ListItem("Catalogo Electronico", "CE"));
            this.cblAdicionales.Items.Add(new ListItem("....................", ".."));
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
