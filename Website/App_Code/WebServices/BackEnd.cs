using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Services;
using System.Collections;  //Para el ArrayList
using ProyTransArte.ReglasDeNegocio;
using ProyTransArte.BeanObjetos;

using System.Data;
namespace WService
{
/// <summary>
/// Descripción breve de WebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// Para permitir que se llame a este servicio Web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
[System.Web.Script.Services.ScriptService]

    public class BackEnd : System.Web.Services.WebService
    {
    
        /// <summary>
        /// Obtiene los reportes del usuario
        /// </summary>
        /// 

        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public Respuesta getReportes()
        {
            try
            {
            Respuesta respuesta = new Respuesta();

                BeanUsuario usuarioActual = new BeanUsuario();
                if (HttpContext.Current.Session != null && HttpContext.Current.Session["usuarioActual"] != null)
                {
                    usuarioActual = (BeanUsuario)HttpContext.Current.Session["usuarioActual"];
                }
                else {
                    respuesta.idError = "errorUsuarioLogueado";
                    return respuesta;
                }
                List<BRReportes.Reporte> _data = new List<BRReportes.Reporte>();
                _data = BRReportes.traerReportes(usuarioActual.usuario);
               
                respuesta.reportes = _data;
                return respuesta;
            }
            catch (Exception ex)
            {
                // logueo el error en bitacora y en ELMATH
                BRLoger.LogError(ex);
                throw ex;
            }
        }
        public class Respuesta
        {
            public string idError { set; get; }
            public List<BRReportes.Reporte> reportes { set; get; }

        }
    }
}
