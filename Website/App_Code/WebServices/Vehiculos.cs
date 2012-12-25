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

    public class Vehiculos : System.Web.Services.WebService
    {
    
        /// <summary>
        /// Obtiene los vehiculos
        /// </summary>
        /// 

        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public List<Vehiculo> getVehiculos()
    {
            try{

                DataSet dsVehiculo = BRVehiculos.getVehiculos();
                List<Vehiculo> dataVehiculo = new List<Vehiculo>();
                if (dsVehiculo.Tables[0].Rows.Count != 0)
                {
                    int nCantColumnas = dsVehiculo.Tables[0].Rows.Count - 1;
                    for (int i = 0; i <= nCantColumnas; i++)
                    {
                        dataVehiculo.Add(new Vehiculo()
                        {
                            id = Convert.ToInt32(dsVehiculo.Tables[0].Rows[i]["id"]),
                            patente = Convert.ToString(dsVehiculo.Tables[0].Rows[i]["Patente"]),
                            descripcion = Convert.ToString(dsVehiculo.Tables[0].Rows[i]["Descripcion"]),
                            modelo = Convert.ToString(dsVehiculo.Tables[0].Rows[i]["Modelo"]),
                            autonomia = Convert.ToString(dsVehiculo.Tables[0].Rows[i]["Autonomia"]),
                            tara = Convert.ToString(dsVehiculo.Tables[0].Rows[i]["Tara"]),
                            kilometraje = Convert.ToString(dsVehiculo.Tables[0].Rows[i]["Kilometraje"]),
                            cargaAncho = Convert.ToString(dsVehiculo.Tables[0].Rows[i]["CargaAncho"]),
                            cargaAlto = Convert.ToString(dsVehiculo.Tables[0].Rows[i]["CargaAlto"]),
                            cargaLargo = Convert.ToString(dsVehiculo.Tables[0].Rows[i]["CargaLargo"]),
                            volumen = (Convert.ToInt32(dsVehiculo.Tables[0].Rows[i]["cargaLargo"]) * Convert.ToInt32(dsVehiculo.Tables[0].Rows[i]["cargaAlto"]) * Convert.ToInt32(dsVehiculo.Tables[0].Rows[i]["cargaAlto"]))
                        });
                    }
                }
                return dataVehiculo;
            }
            catch (Exception ex)
            {
                // logueo el error en bitacora y en ELMATH
                BRLoger.LogError(ex);
                throw ex;
            }
        }
        public class Vehiculo
        {
            public int id { set; get; }
            public string patente { set; get; }
            public string descripcion { set; get; }
            public string modelo { set; get; }
            public string autonomia { set; get; }
            public string tara { set; get; }
            public string kilometraje { set; get; }
            public string cargaAncho { set; get; }
            public string cargaAlto { set; get; }
            public string cargaLargo { set; get; }
            public int volumen { set; get; }
        }
    
        /// <summary>
        /// Alta de vehiculo
        /// </summary>
        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void altaVehiculo(string patente, string descripcion , string modelo, string autonomia , string tara, string kilometraje, string cargaAncho, string cargaAlto, string cargaLargo)
        {
            try
            {
                BRVehiculos.agregarVehiculo(patente, descripcion , modelo,  autonomia , tara, kilometraje, cargaAncho, cargaAlto, cargaLargo);
            }
            catch (Exception ex)
            {
                // logueo el error en bitacora y en ELMATH
                BRLoger.LogError(ex);
                throw ex;
            }
        }
        /// <summary>
        /// Modificacion del Vehiculo
        /// </summary>
        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void modiVehiculo(int idVehiculo, string patente, string descripcion, string modelo, string autonomia, string tara, string kilometraje, string cargaAncho, string cargaAlto, string cargaLargo)
        {
            try
            {
                BRVehiculos.modificarVehiculo(idVehiculo, patente, descripcion, modelo, autonomia, tara, kilometraje, cargaAncho, cargaAlto, cargaLargo);
            }
            catch (Exception ex)
            {
                // logueo el error en bitacora y en ELMATH
                BRLoger.LogError(ex);
                throw ex;
            }
        }
        /// <summary>
        /// Baja del Vehiculo 
        /// </summary>
        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void bajaVehiculo(int idVehiculo)
        {
            try
            {
                BRVehiculos.bajaVehiculo(idVehiculo);
            }
            catch (Exception ex)
            {
                // logueo el error en bitacora y en ELMATH
                BRLoger.LogError(ex);
                throw ex;
            }
        }


        /*
        ------------------------------------------------------------------------------------------
        ------------------------------------------------------------------------------------------
        ------------------------------------------------------------------------------------------
        ------------------------------------------------------------------------------------------
         MANTENIMIENTO
        ------------------------------------------------------------------------------------------
        ------------------------------------------------------------------------------------------
        ------------------------------------------------------------------------------------------
        ------------------------------------------------------------------------------------------
         */


        /// <summary>
        /// Obtiene los mantenimientos
        /// </summary>
        /// 

        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<Mantenimiento> getMantenimientos(int idVehiculo)
        {
            try
            {

                DataSet dsMantenimientos = BRMantenimientos.getMantenimientos(idVehiculo);
                List<Mantenimiento> dataMantenimientos = new List<Mantenimiento>();
                if (dsMantenimientos.Tables[0].Rows.Count != 0)
                {
                    int nCantColumnas = dsMantenimientos.Tables[0].Rows.Count - 1;
                    for (int i = 0; i <= nCantColumnas; i++)
                    {
                        dataMantenimientos.Add(new Mantenimiento()
                        {
                            id = Convert.ToInt32(dsMantenimientos.Tables[0].Rows[i]["id"]),
                            idVehiculo = Convert.ToInt32(dsMantenimientos.Tables[0].Rows[i]["idVehiculo"]),
                            descripcion = Convert.ToString(dsMantenimientos.Tables[0].Rows[i]["Descripcion"]),
                            kilometros = Convert.ToString(dsMantenimientos.Tables[0].Rows[i]["Kilometros"]),
                            fechaMantenimiento = Convert.ToString(dsMantenimientos.Tables[0].Rows[i]["FechaMantenimiento"])
                        });
                    }
                }
                return dataMantenimientos;
            }
            catch (Exception ex)
            {
                // logueo el error en bitacora y en ELMATH
                BRLoger.LogError(ex);
                throw ex;
            }
        }
        public class Mantenimiento
        {
            public int id { set; get; }
            public int idVehiculo    { set; get; }
            public string descripcion { set; get; }
            public string kilometros { set; get; }
            public string fechaMantenimiento { set; get; }
        }

        /// <summary>
        /// Alta de mantenimiento
        /// </summary>
        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void altaMantenimiento(int idVehiculo, string descripcion, string kilometros, string fechaMantenimiento)
        {
            try
            {
                BRMantenimientos.agregarMantenimiento(idVehiculo, descripcion, kilometros, fechaMantenimiento);
            }
            catch (Exception ex)
            {
                // logueo el error en bitacora y en ELMATH
                BRLoger.LogError(ex);
                throw ex;
            }
        }
        /// <summary>
        /// Modificacion del mantenimiento
        /// </summary>
        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void modiMantenimiento(int id, int idVehiculo, string descripcion, string kilometros, string fechaMantenimiento)
        {
            try
            {
                BRMantenimientos.modificarMantenimiento(id, idVehiculo, descripcion, kilometros, fechaMantenimiento);
            }
            catch (Exception ex)
            {
                // logueo el error en bitacora y en ELMATH
                BRLoger.LogError(ex);
                throw ex;
            }
        }
        /// <summary>
        /// Baja del mantenimiento 
        /// </summary>
        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void bajaMantenimiento(int idMantenimiento)
        {
            try
            {
                BRMantenimientos.bajaMantenimiento(idMantenimiento);
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
