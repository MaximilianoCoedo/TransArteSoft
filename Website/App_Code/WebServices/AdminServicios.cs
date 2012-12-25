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

    public class AdminServicios : System.Web.Services.WebService
    {
    
        /// <summary>
        /// Obtiene los datos del usuario
        /// </summary>
        /// 

        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public List<Servicio> getServicios()
    {
            try{

                DataSet dsServicio = BRServiciosExtra.getServicios();
                List<Servicio> dataServicio = new List<Servicio>();
                if (dsServicio.Tables[0].Rows.Count != 0)
                {
                    int nCantColumnas = dsServicio.Tables[0].Rows.Count - 1;
                    for (int i = 0; i <= nCantColumnas; i++)
                    {
                        dataServicio.Add(new Servicio()
                        {
                            id = Convert.ToInt32(dsServicio.Tables[0].Rows[i]["id"]),
                            esFijo = Convert.ToString(dsServicio.Tables[0].Rows[i]["esfijo"]),
                            descripcion = BRSeguridad.desencriptar(Convert.ToString(dsServicio.Tables[0].Rows[i]["descripcion"])),
                            costoBase = BRSeguridad.desencriptar(Convert.ToString(dsServicio.Tables[0].Rows[i]["costoBase"]))
                        });
                    }
                }
                return dataServicio;
            }
            catch (Exception ex)
            {
                // logueo el error en bitacora y en ELMATH
                BRLoger.LogError(ex);
                throw ex;
            }
        }
        public class Servicio
        {
            public int id { set; get; }
            public string esFijo { set; get; }
            public string descripcion { set; get; }
            public string costoBase { set; get; }

        }
    
        /// <summary>
        /// Alta del servicio
        /// </summary>
        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void altaServicio(string descServicio, string costo)
        {
            try
            {
                BRServiciosExtra.agregarServiciosExtra(BRSeguridad.encriptar(descServicio), BRSeguridad.encriptar(costo));
            }
            catch (Exception ex)
            {
                // logueo el error en bitacora y en ELMATH
                BRLoger.LogError(ex);
                throw ex;
            }
        }
        /// <summary>
        /// Modificacion del servicio
        /// </summary>
        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void modiServicio(int idServicio, string descServicio, string costo)
        {
            try
            {
                BRServiciosExtra.modificarServiciosExtra(idServicio, BRSeguridad.encriptar(descServicio), BRSeguridad.encriptar(costo));
            }
            catch (Exception ex)
            {
                // logueo el error en bitacora y en ELMATH
                BRLoger.LogError(ex);
                throw ex;
            }
        }
        /// <summary>
        /// Baja del servicio 
        /// </summary>
        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void bajaServicio(int idServicio)
        {
            try
            {
                BRServiciosExtra.bajaServiciosExtra(idServicio);
            }
            catch (Exception ex)
            {
                // logueo el error en bitacora y en ELMATH
                BRLoger.LogError(ex);
                throw ex;
            }
        }

    }
}
