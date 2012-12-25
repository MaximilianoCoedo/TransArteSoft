using System;
using System.Collections;
using System.Web.UI.WebControls;
using ProyTransArte.BeanObjetos;
using ProyTransArte.ReglasDeNegocio;

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

        //-------------------
        //-------------------
        //------------------- TESTEO SACAR
        //-------------------

        /*
BeanUsuario usuario = new BeanUsuario();
usuario.testeo();
BRCriticidad.validarIntegridadHorizontal(usuario);
Session.Add("usuarioActual", usuario);*/
        //-------------------
        //-------------------
        //------------------- TESTEO SACAR
        //-------------------

        lblFecha.Text = DateTime.Today.ToLongDateString();
        if (Session["usuarioActual"] != null)
        {
            BeanUsuario us = (BeanUsuario)Session["usuarioActual"];
            lblUsuario2.Text = us.usuario;
            btnLogin.Visible = false;
            btnLogout.Visible = true;
            lblFecha.Text = DateTime.Today.ToLongDateString();


            if (us.permisos.Count > 0)
            {
                string transArteMenu = "<div style='width: 140px; height: 400px; vertical-align: top'><div style='display:block;position:relative;'>";
                int idMenu = 0;
                IEnumerator _oPermisos = us.permisos.GetEnumerator();
                while (_oPermisos.MoveNext())// utilizo el patron iterator para recorrer la lista
                {
                    BeanPermisos _per = (BeanPermisos)_oPermisos.Current;
                    HyperLink _hyperLinkControl = (HyperLink)form1.FindControl(_per.idForm);
                    if (us.integridad.Count > 0)
                    {
                        if (_per.id == 15 || _per.id == 16 || _per.id == 17 || _per.id == 19)
                        {// cargo solo los permisos para corregir integridad
                            transArteMenu = transArteMenu + "<a href=" + _hyperLinkControl.NavigateUrl + " runat='server'  style='text-decoration:none'><div id='example14-item-" + idMenu + "' class='ui-widget ui-state-default ui-corner-all ui-button-text'  style='text-align:left; text-decoration:none' title='" + _hyperLinkControl.ToolTip + "'><img width='12' height='12' src='" + _hyperLinkControl.ImageUrl + "'/> -" + _hyperLinkControl.Text + "</div></a>";
                            idMenu++;
                        }
                    }
                    else
                    {// cargo todo normal no hay error de integridad
                        if (us.cuit_cuil != "")
                        { // cargo todo normal porque el usuario ya actualizo los datos
                            transArteMenu = transArteMenu + "<a href=" + _hyperLinkControl.NavigateUrl + " runat='server'  style='text-decoration:none'><div id='example14-item-" + idMenu + "' class='ui-widget ui-state-default ui-corner-all ui-button-text'  style='text-align:left; text-decoration:none' title='" + _hyperLinkControl.ToolTip + "'><img width='12' height='12' src='" + _hyperLinkControl.ImageUrl + "'/> -" + _hyperLinkControl.Text + "</div></a>";
                            idMenu++;
                        }
                        else {
                            if (_per.id == 13)
                            { // solo cargo el acceso a PERFIL USUARIO
                                transArteMenu = transArteMenu + "<a href=" + _hyperLinkControl.NavigateUrl + " runat='server'  style='text-decoration:none'><div id='example14-item-" + idMenu + "' class='ui-widget ui-state-default ui-corner-all ui-button-text'  style='text-align:left; text-decoration:none' title='" + _hyperLinkControl.ToolTip + "'><img width='12' height='12' src='" + _hyperLinkControl.ImageUrl + "'/> -" + _hyperLinkControl.Text + "</div></a>";
                                idMenu++;
                            }
                        }

                    }

                }
                transArteMenu = transArteMenu + "</div></div>";
                miID.InnerHtml = transArteMenu;

            }
            else
            {
                // no tiene permisos 
                HyperLink1.NavigateUrl = "~/staticPages/Inicio.aspx";
            }
        }
        else
        {// sesion perdida
            btnLogin.Visible = true;
            btnLogout.Visible = false;
            HyperLink1.NavigateUrl = "~/staticPages/Inicio.aspx";
        }
    }
    protected void LnkBEspanol_Click(object sender, EventArgs e)
    {

        Session["lenguaje"] = "";
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
    }/*
    protected void Button1_Click(object sender, EventArgs e)
    {

        // sacar esto 
        TextBox2.Text = BRSeguridad.encriptar(TextBox1.Text);

    }
    protected void Button2_Click(object sender, EventArgs e)
    {

        // sacar esto 
        TextBox2.Text = BRSeguridad.desencriptar(TextBox1.Text);

    }*/
}
