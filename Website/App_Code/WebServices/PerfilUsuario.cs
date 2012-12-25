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

    public class PerfilUsuario : System.Web.Services.WebService
    {
    
        /// <summary>
        /// Obtiene los datos del usuario
        /// </summary>
        /// 

        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public Usuario getUsuario()
    {
            try{

                BeanUsuario usuarioActual = new BeanUsuario();
                if (HttpContext.Current.Session != null && HttpContext.Current.Session["usuarioActual"] != null)
                {
                    usuarioActual = (BeanUsuario)HttpContext.Current.Session["usuarioActual"];
                    
                }
                Usuario user = new Usuario();
                DataSet dsUsuario = BRUsuarios.buscarPorId(usuarioActual.id); 
                if (dsUsuario.Tables[0].Rows.Count != 0){
                    int nCantColumnas = dsUsuario.Tables[0].Rows.Count - 1;
                    for (int i = 0; i <= nCantColumnas; i++)
                    {
                        user.id = Convert.ToInt32(dsUsuario.Tables[0].Rows[i]["id"]);
                        user.usuario = BRSeguridad.desencriptar(Convert.ToString(dsUsuario.Tables[0].Rows[i]["usuario"]));
                        user.pass = BRSeguridad.desencriptar(Convert.ToString(dsUsuario.Tables[0].Rows[i]["pass"]));
                        user.nombre = BRSeguridad.desencriptar(Convert.ToString(dsUsuario.Tables[0].Rows[i]["nombre"]));
                        user.apellido = BRSeguridad.desencriptar(Convert.ToString(dsUsuario.Tables[0].Rows[i]["apellido"]));
                        user.email = BRSeguridad.desencriptar(Convert.ToString(dsUsuario.Tables[0].Rows[i]["email"]));
                        user.esCuit = Convert.ToString(dsUsuario.Tables[0].Rows[i]["esCuit"]);
                        user.cuit_cuil = BRSeguridad.desencriptar(Convert.ToString(dsUsuario.Tables[0].Rows[i]["cuit_cuil"]));
                        user.razonSocial = BRSeguridad.desencriptar(Convert.ToString(dsUsuario.Tables[0].Rows[i]["razonSocial"]));
                    }
                }
                return user;
            }
            catch (Exception ex)
            {
                // logueo el error en bitacora y en ELMATH
                BRLoger.LogError(ex);
                throw ex;
            }
        }
        public class Usuario
        {
            public int id { set; get; }
            public string usuario { set; get; }
            public string pass { set; get; }
            public string nombre { set; get; }
            public string apellido { set; get; }
            public string email { set; get; }
            public string esCuit { set; get; }
            public string cuit_cuil { set; get; }
            public string razonSocial { set; get; }        
        }

        /// <summary>
        /// Obtiene los telefonos del usuario
        /// </summary>
        /// 

        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<Telefono> getTelefonos()
        {
            try
            {
                BeanUsuario usuarioActual = new BeanUsuario();
                if (HttpContext.Current.Session != null && HttpContext.Current.Session["usuarioActual"] != null)
                {
                    usuarioActual = (BeanUsuario)HttpContext.Current.Session["usuarioActual"];
                }
                DataSet dsTelefonos = BRTelefonos.buscarPorIdUsuario(usuarioActual.id);
                List<Telefono> dataTelefono = new List<Telefono>();
                if (dsTelefonos.Tables[0].Rows.Count != 0)
                {
                    int nCantColumnas = dsTelefonos.Tables[0].Rows.Count - 1;
                    for (int i = 0; i <= nCantColumnas; i++)
                    {
                        dataTelefono.Add(new Telefono()
                        {
                            id = i + 1,
                            idTelefono = Convert.ToInt32(dsTelefonos.Tables[0].Rows[i]["id"]),
                            telefono = BRSeguridad.desencriptar(Convert.ToString(dsTelefonos.Tables[0].Rows[i]["telefono"]))
                        });
                    }
                }
                return dataTelefono;
            }
            catch (Exception ex)
            {
                // logueo el error en bitacora y en ELMATH
                BRLoger.LogError(ex);
                throw ex;
            }
        }
        public class Telefono
        {
            public int id { set; get; }
            public int idTelefono { set; get; }
            public string telefono { set; get; }

        }

        /// <summary>
        /// Obtiene los domicilios del usuario
        /// </summary>
        /// 

        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<Domicilio> getDomicilios()
        {
            try
            {
                BeanUsuario usuarioActual = new BeanUsuario();
                if (HttpContext.Current.Session != null && HttpContext.Current.Session["usuarioActual"] != null)
                {
                    usuarioActual = (BeanUsuario)HttpContext.Current.Session["usuarioActual"];
                }
                DataSet dsDomicilio = BRDomicilio.buscarPorIdusuario(usuarioActual.id);
                List<Domicilio> dataDomicilio = new List<Domicilio>();
                if (dsDomicilio.Tables[0].Rows.Count != 0)
                {

                    int nCantColumnas = dsDomicilio.Tables[0].Rows.Count - 1;
                    for (int i = 0; i <= nCantColumnas; i++)
                    {
                        dataDomicilio.Add(new Domicilio()
                        {
                            id = Convert.ToInt32(dsDomicilio.Tables[0].Rows[i]["id"]),
                            idUsuario = Convert.ToInt32(dsDomicilio.Tables[0].Rows[i]["idUsuario"]),
                            descripcion = BRSeguridad.desencriptar(Convert.ToString(dsDomicilio.Tables[0].Rows[i]["descripcion"])),
                            idLocalidad = Convert.ToString(dsDomicilio.Tables[0].Rows[i]["idLocalidad"]),
                            idDepartamento = Convert.ToString(dsDomicilio.Tables[0].Rows[i]["idDepartamento"]),
                            idProvincia = Convert.ToString(dsDomicilio.Tables[0].Rows[i]["idProvincia"]),
                            latitud = BRSeguridad.desencriptar(Convert.ToString(dsDomicilio.Tables[0].Rows[i]["latitud"])),
                            longitud = BRSeguridad.desencriptar(Convert.ToString(dsDomicilio.Tables[0].Rows[i]["longitud"])),
                            ubicacionZoom = Convert.ToString(dsDomicilio.Tables[0].Rows[i]["ubicacionZoom"]),
                            idCodPostal = Convert.ToString(dsDomicilio.Tables[0].Rows[i]["idCodPostal"]),
                            codigoPostal = Convert.ToString(dsDomicilio.Tables[0].Rows[i]["codigoPostal"]),
                            provincia = Convert.ToString(dsDomicilio.Tables[0].Rows[i]["provincia"]),
                            departamento = Convert.ToString(dsDomicilio.Tables[0].Rows[i]["departamento"]),
                            localidad = Convert.ToString(dsDomicilio.Tables[0].Rows[i]["localidad"])
                        });
                    }
                }

                return dataDomicilio;
            }
            catch (Exception ex)
            {
                // logueo el error en bitacora y en ELMATH
                BRLoger.LogError(ex);
                throw ex;
            }
        }
        public class Domicilio
        {
            public int id { set; get; }
            public int idUsuario { set; get; }
            public string descripcion { set; get; }
            public string idLocalidad { set; get; }
            public string idDepartamento { set; get; }
            public string idProvincia { set; get; }
            public string latitud { set; get; }
            public string longitud { set; get; }
            public string ubicacionZoom { set; get; }
            public string idCodPostal { set; get; }
            public string codigoPostal { set; get; }
            public string provincia { set; get; }
            public string departamento { set; get; }
            public string localidad { set; get; }
            
        }

        /// <summary>
        /// Obtiene las provincias del usuario
        /// </summary>
        /// 

        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<Provincia> getProvincias()
        {
            try
            {
                DataSet dsProvincias = BRProvincias.buscarTodo(); 
                List<Provincia> dataProvincias = new List<Provincia>();
                if (dsProvincias.Tables[0].Rows.Count != 0)
                {
                    int nCantColumnas = dsProvincias.Tables[0].Rows.Count - 1;
                    for (int i = 0; i <= nCantColumnas; i++)
                    {
                        dataProvincias.Add(new Provincia()
                        {

                            id = Convert.ToInt32(dsProvincias.Tables[0].Rows[i]["id"]),
                            nombre = Convert.ToString(dsProvincias.Tables[0].Rows[i]["nombre"])
                            
                        });
                    }
                }

                return dataProvincias;
            }
            catch (Exception ex)
            {
                // logueo el error en bitacora y en ELMATH
                BRLoger.LogError(ex);
                throw ex;
            }
        }
        public class Provincia
        {
            public int id { set; get; }
            public string nombre { set; get; }
        }
        /// <summary>
        /// Obtiene los departamentos 
        /// </summary>
        /// 

        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<Departamento> getDepartamentos(int idProvincia)
        {
            try
            {
                DataSet dsDepartamentos = BRDepartamentos.buscarPorProvincia(idProvincia); 
                List<Departamento> dataDepartamentos = new List<Departamento>();
                if (dsDepartamentos.Tables[0].Rows.Count != 0)
                {
                    int nCantColumnas = dsDepartamentos.Tables[0].Rows.Count - 1;
                    for (int i = 0; i <= nCantColumnas; i++)
                    {
                        dataDepartamentos.Add(new Departamento()
                        {

                            id = Convert.ToInt32(dsDepartamentos.Tables[0].Rows[i]["id"]),
                            provincia_Id = Convert.ToInt32(dsDepartamentos.Tables[0].Rows[i]["provincia_id"]),
                            nombre = Convert.ToString(dsDepartamentos.Tables[0].Rows[i]["nombre"])

                        });
                    }
                }

                return dataDepartamentos;
            }
            catch (Exception ex)
            {
                // logueo el error en bitacora y en ELMATH
                BRLoger.LogError(ex);
                throw ex;
            }
        }
        public class Departamento
        {
            public int id { set; get; }
            public int provincia_Id { set; get; }
            public string nombre { set; get; }
        }

        /// <summary>
        /// Obtiene las Localidades 
        /// </summary>
        /// 

        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<Localidad> getLocalidades(int idDepartamento)
        {
            try
            {
                DataSet dsLocalidades = BRLocalidades.buscarPorDepartamento(idDepartamento); // verificar
                List<Localidad> dataLocalidades = new List<Localidad>();
                if (dsLocalidades.Tables[0].Rows.Count != 0)
                {
                    int nCantColumnas = dsLocalidades.Tables[0].Rows.Count - 1;
                    for (int i = 0; i <= nCantColumnas; i++)
                    {
                        dataLocalidades.Add(new Localidad()
                        {
                            id = Convert.ToInt32(dsLocalidades.Tables[0].Rows[i]["id"]),
                            departamento_Id = Convert.ToInt32(dsLocalidades.Tables[0].Rows[i]["departamento_id"]),
                            nombre = Convert.ToString(dsLocalidades.Tables[0].Rows[i]["nombre"])

                        });
                    }
                }

                return dataLocalidades;
            }
            catch (Exception ex)
            {
                // logueo el error en bitacora y en ELMATH
                BRLoger.LogError(ex);
                throw ex;
            }
        }
        public class Localidad
        {
            public int id { set; get; }
            public int departamento_Id { set; get; }
            public string nombre { set; get; }
        }
        /// <summary>
        /// Obtiene los codigos postales 
        /// </summary>
        /// 
        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<CodPostal> getCodPostales(string codPostal)
        {
            try
            {
                DataSet dsCodPostales = BRCodPostal.buscarPorCodPostal(codPostal);
                //DataSet dsCodPostales = BRCodPostal.buscarTodos();
                List<CodPostal> dataCodPostales = new List<CodPostal>();
                int nnas = dsCodPostales.Tables[0].Rows.Count - 1;
                if (dsCodPostales.Tables[0].Rows.Count != 0)
                {
                    int nCantColumnas = dsCodPostales.Tables[0].Rows.Count - 1;
                    for (int i = 0; i <= nCantColumnas; i++)
                    {
                        dataCodPostales.Add(new CodPostal()
                        {
                            id = Convert.ToInt32(dsCodPostales.Tables[0].Rows[i]["id"]),
                            codigoPostal = Convert.ToString(dsCodPostales.Tables[0].Rows[i]["codigoPostal"]),
                            nombreLocalidad = Convert.ToString(dsCodPostales.Tables[0].Rows[i]["nombreLocalidad"]),
                            provincia = Convert.ToString(dsCodPostales.Tables[0].Rows[i]["provincia"]),
                            latitude = Convert.ToString(dsCodPostales.Tables[0].Rows[i]["latitude"]),
                            longitude  = Convert.ToString(dsCodPostales.Tables[0].Rows[i]["longitude"]),
                            accuracy = Convert.ToInt32(dsCodPostales.Tables[0].Rows[i]["accuracy"])
                        });
                    }
                }
                return dataCodPostales;
            }
            catch (Exception ex)
            {
                // logueo el error en bitacora y en ELMATH
                BRLoger.LogError(ex);
                throw ex;
            }
        }
        public class CodPostal
        {
            public int id { set; get; }
            public string codigoPostal { set; get; }
            public string nombreLocalidad { set; get; }
            public string provincia { set; get; }
            public string latitude { set; get; }
            public string longitude { set; get; }
            public int accuracy { set; get; }
        }
        /// <summary>
        /// Alta del telefono 
        /// </summary>
        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void AltaTelefono(string telefono)
        {
            try
            {
                BeanUsuario usuarioActual = new BeanUsuario();
                if (HttpContext.Current.Session != null && HttpContext.Current.Session["usuarioActual"] != null)
                {
                    usuarioActual = (BeanUsuario)HttpContext.Current.Session["usuarioActual"];
                }
                BRTelefonos.agregarTelefonoUsuario(usuarioActual.id, telefono);
            }
            catch (Exception ex)
            {
                // logueo el error en bitacora y en ELMATH
                BRLoger.LogError(ex);
                throw ex;
            }
        }
        /// <summary>
        /// Modificacion del telefono 
        /// </summary>
        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void ModiTelefono(int idTelefono, string telefono)
        {
            try
            {
                BRTelefonos.modificarTelefono(idTelefono, telefono);
            }
            catch (Exception ex)
            {
                // logueo el error en bitacora y en ELMATH
                BRLoger.LogError(ex);
                throw ex;
            }
        }
        /// <summary>
        /// Baja del telefono 
        /// </summary>
        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void BajaTelefono(int idTelefono)
        {
            try
            {
                BRTelefonos.bajaTelefono(idTelefono);
            }
            catch (Exception ex)
            {
                // logueo el error en bitacora y en ELMATH
                BRLoger.LogError(ex);
                throw ex;
            }
        }
        /// <summary>
        /// Alta del domicilio 
        /// </summary>
        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void altaDomicilio(string domicilio, string idLocalidad, string latitud, string longitud, string idCodPostal)
        {
            try
            {
                BeanUsuario usuarioActual = new BeanUsuario();
                if (HttpContext.Current.Session != null && HttpContext.Current.Session["usuarioActual"] != null)
                {
                    usuarioActual = (BeanUsuario)HttpContext.Current.Session["usuarioActual"];
                }
                BRDomicilio.agregarDomicilioUsuario(usuarioActual.id, domicilio, idLocalidad,  latitud,  longitud, idCodPostal);
            }
            catch (Exception ex)
            {
                // logueo el error en bitacora y en ELMATH
                BRLoger.LogError(ex);
                throw ex;
            }
        }
        /// <summary>
        /// Modificacion del domicilio 
        /// </summary>
        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void modificarDomicilio(int idDomicilio, string domicilio, string idLocalidad, string latitud, string longitud, string idCodPostal)
        {
            try
            {
                BRDomicilio.modificarDomicilio( idDomicilio,  domicilio, idLocalidad,  latitud, longitud, idCodPostal);
            }
            catch (Exception ex)
            {
                // logueo el error en bitacora y en ELMATH
                BRLoger.LogError(ex);
                throw ex;
            }
        }

        /// <summary>
        /// Baja del domicilio 
        /// </summary>

        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void bajaDomicilio(int idDomicilio)
        {
            try
            {
                BRDomicilio.bajaDomicilio(idDomicilio);
            }
            catch (Exception ex)
            {
                // logueo el error en bitacora y en ELMATH
                BRLoger.LogError(ex);
                throw ex;
            }
        }

        /// <summary>
        /// modificar usuario
        /// </summary>

        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void modificarUsuario(string contrasena, string email, string nombre, string apellido, string razonSocial, string esCuit, string cuit_cuil)
        {
            try
            {
                BeanUsuario usuarioActual = new BeanUsuario();
                if (HttpContext.Current.Session != null && HttpContext.Current.Session["usuarioActual"] != null)
                {
                    usuarioActual = (BeanUsuario)HttpContext.Current.Session["usuarioActual"];
                }
                BRUsuarios.modificarByIdUsuario(usuarioActual.id, contrasena, email, nombre, apellido, razonSocial, esCuit, cuit_cuil);
            }
            catch (Exception ex)
            {
                // logueo el error en bitacora y en ELMATH
                BRLoger.LogError(ex);
                throw ex;
            }
        }



        /// <summary>
        /// recargo los datos del usuario
        /// </summary>
        /// 

        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void recargarUsuario()
        {
            try
            {
                BeanUsuario usuarioActual = new BeanUsuario();
                if (HttpContext.Current.Session != null && HttpContext.Current.Session["usuarioActual"] != null)
                {
                    usuarioActual = (BeanUsuario)HttpContext.Current.Session["usuarioActual"];
                }
                BeanUsuario usuarioRecargado = BRUsuarios.recargarUsuario(usuarioActual);
                Session.Add("usuarioActual", usuarioRecargado);
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
