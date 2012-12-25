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

    public class SolicitudServicio : System.Web.Services.WebService
    {
    
        /// <summary>
        /// Obtiene los ServicioExtras
        /// </summary>
        /// 

        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<Servicio> getServicios()
        {
            try
            {

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
        /// Solicitar presupuesto
        /// </summary>
        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void solicitarPresupuesto(string fechaSalida, string horaSalida, string domicilioSalida, string latitudSalida, string longitudSalida, string fechaDestino, string horaDestino, string domicilioDestino, string latitudDestino, string longitudDestino, string descripcionServicio, List<int> serviciosExtra, List<obrasArte> obrasArte)
        {
            try
            {

                BeanUsuario usuarioActual = new BeanUsuario();
                if (HttpContext.Current.Session != null && HttpContext.Current.Session["usuarioActual"] != null)
                {
                    usuarioActual = (BeanUsuario)HttpContext.Current.Session["usuarioActual"];
                }



                int idServicio = BRServicios.solicitarServicio(usuarioActual.id, fechaSalida, horaSalida,  fechaDestino, horaDestino,  descripcionServicio);
                BRServicios_domicilio.agregarDomicilioServicio(usuarioActual.id, idServicio, domicilioSalida, latitudSalida, longitudSalida, true);
                BRServicios_domicilio.agregarDomicilioServicio(usuarioActual.id, idServicio, domicilioDestino, latitudDestino, longitudDestino, false);

                

                foreach (int _idServicioExtra in serviciosExtra){
                    BRServicio_ServicioExtra.agregarServicioExtra(idServicio, _idServicioExtra);
                }
                
                // agrego las obras de arte

                foreach (obrasArte _obrasArte in obrasArte)
                {
                    BRObrasDeArte.agregarObraDeArte(idServicio, _obrasArte.nombre, _obrasArte.descripcion, _obrasArte.ancho, _obrasArte.alto, _obrasArte.largo, _obrasArte.peso, _obrasArte.valor);
                }
                
                
                
            }
            catch (Exception ex)
            {
                // logueo el error en bitacora y en ELMATH
                BRLoger.LogError(ex);
                throw ex;
            }
        }
        public class obrasArte
        {
            public int ID { set; get; }
            public string nombre { set; get; }
            public string descripcion { set; get; }
            public string ancho { set; get; }
            public string alto { set; get; }
            public string largo { set; get; }
            public string peso { set; get; }
            public string valor { set; get; }

        }
    }
}
