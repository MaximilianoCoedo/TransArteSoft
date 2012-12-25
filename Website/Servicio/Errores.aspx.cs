using System;
using System.Collections;  //Para el ArrayList
using System.Drawing;
using System.Web.UI.WebControls;
using ProyTransArte.BeanObjetos;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usuarioActual"] != null)
        {
            BeanUsuario usuario;
            literalIntegridad.Text = "";
            usuario = (BeanUsuario)Session["usuarioActual"];
            if (usuario.integridad.Count > 0) { // hay problemas de integridad los muestro
                literalIntegridad.Visible = true;
                literalIntegridad.Text = "<b>" + lblintBD.Text + "</b> </br> <hr/>";
                IEnumerator _oIntegridad = usuario.integridad.GetEnumerator();
                while (_oIntegridad.MoveNext())// utilizo el patron iterator para recorrer la lista
                {
                    BeanIntegridad _integridad = (BeanIntegridad)_oIntegridad.Current;
                    if (_integridad.identificador == "")
                    { // inconsistencia vertical 
                        literalIntegridad.Text = literalIntegridad.Text + labelIntVertical.Text + " <b>" + _integridad.Tabla + "</b></br><hr/>";
                    }
                    else
                    { // inconsistencia horizontal 
                        literalIntegridad.Text = literalIntegridad.Text + labelIntHorTabla.Text + "<b>" + _integridad.Tabla + "</b>" + labelIntHorIdentificador.Text + "<b>" + _integridad.identificador + " </b></br>";
                    }
                    
                }
                
            }
        }
        if (Session["Error"] != null){
            BeanException ex;
            if (Session["Error"] is BeanException){
                ex = (BeanException)Session["Error"];
            }else{
                Exception exec;
                exec = (Exception)Session["Error"];
                ex = new BeanException(exec);
                ex.idMessage = "errorDefault";
            }

            imgCritico.BackColor = Color.LightPink;
            imgModerado.BackColor = Color.LightBlue;
            imgLeve.BackColor = Color.LightGreen;
            String detalle = ex.detalleError;
            TextBox _LabelError = new TextBox();
            if (this.Master.FindControl("form1") != null)
            {
                _LabelError = (TextBox)this.Master.FindControl("form1").FindControl("Contenido").FindControl(ex.idMessage);
            }
            if (_LabelError != null)
            {
                detalle = _LabelError.Text;
            }
            LabelError.Text = "<b>" + detalle + "</b><hr/></br>" + ex.StackTrace + "  </br>" + ex.Source + " </br> " + ex.Data + "  </br>" + ex.HelpLink + "  </br>" + ex.InnerException + " </br>" + ex.Message + "  </br> " + ex.TargetSite + "  </br>" + ex.Source;
            imgCritico.Visible = false;
            LabelCritico.Visible = false;
            LabelModerado.Visible = false;
            imgModerado.Visible = false;
            LabelLeve.Visible = false;
            imgLeve.Visible = false;
            if (ex.criticidadError == 1)
            {// leve
                imgError.BackColor = Color.LightGreen;
                LabelLeve.Visible = true;
                imgLeve.Visible = true;
            }
            else if (ex.criticidadError == 2)// moderado
            {
                imgError.BackColor = Color.LightBlue;
                LabelModerado.Visible = true;
                imgModerado.Visible = true;

            }
            else
            {// critico
                imgError.BackColor = Color.LightPink;
                imgCritico.Visible = true;
                LabelCritico.Visible = true;
            }
        }
    }
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
}
