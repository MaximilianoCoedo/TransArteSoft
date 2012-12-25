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

    public class BackUp : System.Web.Services.WebService
    {
    
        /// <summary>
        /// Obtiene todos los backUP
        /// </summary>
        /// 

        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<BackUps> getBackUp()
        {
            try
            {
               List<BackUps> data = new List<BackUps>();
                Hashtable backups = BRBackUp.traerBackUps();
                int i = 0;
                foreach( DictionaryEntry _backup in backups )
                {
                    data.Add(new BackUps()
                    {
                        id = i++,
                        nombreBackUp = Convert.ToString(_backup.Key),
                        cantidadVolumen = Convert.ToString(_backup.Value)
                    });
                    
                }
                return data;
            }
            catch (Exception ex)
            {
                // logueo el error en bitacora y en ELMATH
                BRLoger.LogError(ex);
                throw ex;
            }
        }
        public class BackUps
        {
            public int id { set; get; }
            public string nombreBackUp { set; get; }
            public string cantidadVolumen { set; get; }
        }


        /// <summary>
        /// obtiene el tamaño de la BD
        /// </summary>
        /// 

        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string obtenerTamanio()
        {
            try
            {
                return BRBackUp.obtenerTamanio();
            }
            catch (Exception ex)
            {
                // logueo el error en bitacora y en ELMATH
                BRLoger.LogError(ex);
                throw ex;
            }
        }

    
        /// <summary>
        /// Realiza el BackUp de la BD
        /// </summary>
        /// 

        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public Boolean hacerBackUp(int vol)
        {
            try
            {
                BRBackUp.generarBackUp(vol);
                return true;
            }
            catch (Exception ex)
            {
                // logueo el error en bitacora y en ELMATH
                BRLoger.LogError(ex);
                throw ex;
            }
        }
    
        /// <summary>
        /// Realiza el BackUp de la BD
        /// </summary>
        /// 

        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public Boolean hacerRestore(string fileToRestore , int vol)
        {
            try
            {
                BRBackUp.generarRestore(fileToRestore, vol);
                return true;
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
