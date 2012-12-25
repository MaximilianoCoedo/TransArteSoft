using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using ProyTransArte.BeanObjetos;
public partial class MasterPage : System.Web.UI.MasterPage
{
    public string Titulo
    {
        set
        {
            this.lblTitulo.Text = value;
        }
    }



    protected void Page_Load(object sender, EventArgs e)
    {
        lblFecha.Text = DateTime.Today.ToLongDateString();
        if (Session["usuarioActual"] != null)
        {
            BeanUsuario us = (BeanUsuario)Session["usuarioActual"];
            lblUsuario2.Text = us.usuario;
            btnLogin.Visible = false;
            btnLogout.Visible = true;
            if (us.permisos.Count > 0)
            {
                 HyperLink1.NavigateUrl="~/Servicio/Inicio.aspx";
            }
            else {
                HyperLink1.NavigateUrl = "~/staticPages/Inicio.aspx";
            }
        }
        else
        {
            btnLogin.Visible = true;
            btnLogout.Visible = false;
        }
    }    
    protected void LnkBEspanol_Click(object sender, EventArgs e)
    {
        Session["lenguaje"] = "es-AR";
        Response.Redirect(this.Request.Url.AbsolutePath);
    }
    
    protected void LnkBIngles_Click(object sender, EventArgs e)
    {
        Session["lenguaje"] = "en-US";
        Response.Redirect(this.Request.Url.AbsolutePath);
    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Remove("usuarioActual");
        Session.Remove("Error");
        Response.Redirect("../staticPages/Inicio.aspx");
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
       
        Response.Redirect("../staticPages/Login.aspx");
    }
}
