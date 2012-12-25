using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Services;
using System.Collections;  //Para el ArrayList
using ProyTransArte.ReglasDeNegocio;
using ProyTransArte.BeanObjetos;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System.Data;
using System.IO;


namespace WService
{
/// <summary>
/// Descripción breve de WebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// Para permitir que se llame a este servicio Web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
[System.Web.Script.Services.ScriptService]

    public class Bitacora : System.Web.Services.WebService
    {
    
        /// <summary>
        /// Obtiene todos los usuarios
        /// </summary>
        /// 

        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<usuarios> getUsuarios(){
            try{
                DataSet dsUsuario = BRUsuarios.buscarTodos(); 
           
                List<usuarios> data = new List<usuarios>();
                data.Add(new usuarios()
                {
                    id = 0,
                    usuario = "NO REGISTRADO",
                    fechaBaja = ""
                });
                if (dsUsuario.Tables[0].Rows.Count != 0){
                    int nCantColumnas = dsUsuario.Tables[0].Rows.Count - 1;
                    for (int i = 0; i <= nCantColumnas; i++)
                    {

                        data.Add(new usuarios()
                        {
                            id =  Convert.ToInt32(dsUsuario.Tables[0].Rows[i]["id"]),
                            usuario = BRSeguridad.desencriptar(Convert.ToString(dsUsuario.Tables[0].Rows[i]["usuario"])),
                            fechaBaja = Convert.ToString(dsUsuario.Tables[0].Rows[i]["fechaBaja"])
                        });
                    }
                }
                else{// no hay usuarios
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
        public class usuarios
        {
            public int id { set; get; }
            public string usuario { set; get; }
            public string fechaBaja { set; get; }
        
        }

        /// <summary>
        /// Obtiene todos las criticidades
        /// </summary>
        /// 

        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<Criticidades> getCriticidades()
        {
            try
            {
                DataSet dsCriticidades = BRCriticidad.buscarTodos();

                List<Criticidades> data = new List<Criticidades>();
                if (dsCriticidades.Tables[0].Rows.Count != 0)
                {
                    int nCantColumnas = dsCriticidades.Tables[0].Rows.Count - 1;
                    for (int i = 0; i <= nCantColumnas; i++)
                    {

                        data.Add(new Criticidades()
                        {
                            id = Convert.ToInt32(dsCriticidades.Tables[0].Rows[i]["id"]),
                            descripcion = Convert.ToString(dsCriticidades.Tables[0].Rows[i]["descripcion"])
                        });
                    }
                }
                else
                {// no hay usuarios
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
        public class Criticidades
        {
            public int id { set; get; }
            public string descripcion { set; get; }

        }


    
        /// <summary>
        /// Obtiene todos las registros segun parametros
        /// </summary>
        /// 
    
        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<regBitacora> getRegistrosBitacora(string fechaDesde, string fechaHasta, string idUsuario, string idCriticidad, string descEvento)
        {
            try
            {
                DataSet dsBitacora = BRBitacora.buscarPorFiltro(fechaDesde, fechaHasta,idUsuario, idCriticidad, descEvento);

                List<regBitacora> data = new List<regBitacora>();
                if (dsBitacora.Tables[0].Rows.Count != 0)
                {
                    int nCantColumnas = dsBitacora.Tables[0].Rows.Count - 1;
                    for (int i = 0; i <= nCantColumnas; i++)
                    {

                        data.Add(new regBitacora()
                        {
                            id = Convert.ToInt32(dsBitacora.Tables[0].Rows[i]["id"]),
                            fecha = Convert.ToString(dsBitacora.Tables[0].Rows[i]["fecha"]),
                            idUsuario = Convert.ToInt32(dsBitacora.Tables[0].Rows[i]["idUsuario"]),
                            usuario = BRSeguridad.desencriptar(Convert.ToString(dsBitacora.Tables[0].Rows[i]["usuario"])),
                            idCriticidad = Convert.ToInt32(dsBitacora.Tables[0].Rows[i]["idCriticidad"]),
                            descCriticidad = Convert.ToString(dsBitacora.Tables[0].Rows[i]["descCriticidad"]),
                            accion = Convert.ToString(dsBitacora.Tables[0].Rows[i]["accion"])
                        });
                    }
                }
                else
                {// no hay usuarios
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
        public class regBitacora
        {
            public int id { set; get; }
            public string fecha { set; get; }
            public int idUsuario { set; get; }
            public string usuario { set; get; }
            public int idCriticidad { set; get; }
            public string descCriticidad { set; get; }
            public string accion { set; get; }
        }


        /// <summary>
        /// Borra todos las registros por usuario
        /// </summary>

        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public Boolean borrarPorUsuario(string idUsuario)
        {
            try
            {
                BRBitacora.eliminarPorUsuario(idUsuario);
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
        /// Borra todos las registros por descripcion
        /// </summary>
        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public Boolean borrarPorDescripcion(string descEvento)
        {
            try
            {
                BRBitacora.eliminarPorDescripcion(descEvento);
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
        /// Borra todos las registros por fechas
        /// </summary>
        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public Boolean borrarPorFechas(string fechaDesde, string fechaHasta)
        {
            try
            {
                BRBitacora.eliminarPorRangoFecha(fechaDesde, fechaHasta);

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
        /// Borra todos las registros por criticidad
        /// </summary>

        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public Boolean borrarPorCriticidad(string idCriticidad)
        {
            try
            {
                BRBitacora.eliminarPorCriticidad(idCriticidad);
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
        /// Borra todos las registros por filtro aplicado
        /// </summary>

        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public Boolean borrarPorParametros(string fechaDesde, string fechaHasta, string idUsuario, string idCriticidad, string descEvento)
        {
            try
            {
                BRBitacora.eliminarPorFiltro(fechaDesde, fechaHasta, idUsuario, idCriticidad, descEvento);
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
        /// Borra todos las registros de la bitacora
        /// </summary>

        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public Boolean borrarTodos()
        {
            try
            {
                BRBitacora.eliminarTodos();
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
        /// Corrige la integridad de toda la BD
        /// </summary>
        /// 



        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public Boolean corregirIntegridad()
        {
            try
            {
                BeanUsuario usuarioActual = new BeanUsuario();
                if (HttpContext.Current.Session != null && HttpContext.Current.Session["usuarioActual"] != null)
                {
                    usuarioActual = (BeanUsuario)HttpContext.Current.Session["usuarioActual"];
                }
                BRSeguridad.corregirIntegridadCompleta(usuarioActual);
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
        /// verificar la integridad de toda la BD
        /// </summary>
        /// 

        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<regIntegridad> verificarIntegridad()
        {
            try
            {
                Session["Error"] = null;
                BeanUsuario usuarioActual = new BeanUsuario();
                if (HttpContext.Current.Session != null && HttpContext.Current.Session["usuarioActual"] != null)
                {
                    usuarioActual = (BeanUsuario)HttpContext.Current.Session["usuarioActual"];
                }

                if (usuarioActual.integridad.Count ==  0) {// significa q se acaba de logear asi q ya sabe lo que esta mal en la BD
                    BRSeguridad.VerificarIntegridadCompleta(usuarioActual);
                }


                List<regIntegridad> data = new List<regIntegridad>();
                if (usuarioActual.integridad.Count > 0)
                { // hay problemas de integridad los muestro
                    IEnumerator _oIntegridad = usuarioActual.integridad.GetEnumerator();
                    while (_oIntegridad.MoveNext())// utilizo el patron iterator para recorrer la lista
                    {
                        BeanIntegridad _integridad = (BeanIntegridad)_oIntegridad.Current;
                        data.Add(new regIntegridad()
                        {
                            id = Convert.ToString(_integridad.identificador),
                            inconsistencia = (_integridad.identificador == "" ? "Vertical" : "Horizontal"),
                            tabla = Convert.ToString(_integridad.Tabla)
                        });
                    }
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
        public class regIntegridad
        {
            public string id { set; get; }
            public string tabla { set; get; }
            public string inconsistencia { set; get; }
            
        }


    
        /// <summary>
        /// verificar la integridad de toda la BD
        /// </summary>
        /// 

        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void recargarMenu()
        {
            try
            {
                BeanUsuario usuarioActual = new BeanUsuario();
                if (HttpContext.Current.Session != null && HttpContext.Current.Session["usuarioActual"] != null)
                {
                    usuarioActual = (BeanUsuario)HttpContext.Current.Session["usuarioActual"];
                }
                usuarioActual.permisos.Clear();
                usuarioActual.integridad.Clear();
            }
            catch (Exception ex)
            {
                // logueo el error en bitacora y en ELMATH
                BRLoger.LogError(ex);
                throw ex;
            }
        }




        /// <summary>
        /// generar reporte de bitacora
        /// </summary>
        /// 

        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void generarReporte(string fechaDesde, string fechaHasta, string usuarioFiltro, string criticidadFiltro, string descEvento, List<regBitacora> registrosGrilla)
        {
            try
            {
                BeanUsuario usuarioActual = new BeanUsuario();
                if (HttpContext.Current.Session != null && HttpContext.Current.Session["usuarioActual"] != null)
                {
                    usuarioActual = (BeanUsuario)HttpContext.Current.Session["usuarioActual"];
                }

                DataSet dsBitacora = new DataSet();
                DataTable dsBitacoraTable = dsBitacora.Tables.Add();
                dsBitacoraTable.Columns.Add("id", System.Type.GetType("System.Int32"));
                dsBitacoraTable.Columns.Add("accion", System.Type.GetType("System.String"));
                dsBitacoraTable.Columns.Add("usuario", System.Type.GetType("System.String"));
                dsBitacoraTable.Columns.Add("desCriticidad", System.Type.GetType("System.String"));
                dsBitacoraTable.Columns.Add("fecha", System.Type.GetType("System.String"));

                dsBitacoraTable.Columns.Add("UsuarioFiltro", System.Type.GetType("System.String"));
                dsBitacoraTable.Columns.Add("FechaDesdeFiltro", System.Type.GetType("System.String"));
                dsBitacoraTable.Columns.Add("FechaHastaFiltro", System.Type.GetType("System.String"));
                dsBitacoraTable.Columns.Add("CriticidadFiltro", System.Type.GetType("System.String"));
                dsBitacoraTable.Columns.Add("LogoCriticidad", System.Type.GetType("System.Byte[]"));
                dsBitacoraTable.Columns.Add("DescripcionFiltro", System.Type.GetType("System.String"));
                byte[] logoCriticidad; 
                foreach (regBitacora _regBitacora in registrosGrilla)
                {
                    if (_regBitacora.idCriticidad == 1) {
                        logoCriticidad = CargarImagen("C:\\TransArte\\Website\\images\\leve.png");
                    }
                    else if (_regBitacora.idCriticidad == 2)
                    {
                        logoCriticidad = CargarImagen("C:\\TransArte\\Website\\images\\moderada.png");
                    }
                    else {// 3
                        logoCriticidad = CargarImagen("C:\\TransArte\\Website\\images\\critica.png");
                    }
                    dsBitacoraTable.Rows.Add(_regBitacora.id, _regBitacora.accion, _regBitacora.usuario, _regBitacora.descCriticidad, _regBitacora.fecha, usuarioFiltro, fechaDesde, fechaHasta, criticidadFiltro, logoCriticidad, descEvento);
                }
                // encabezados
                dsBitacoraTable.Columns.Add("Logo", System.Type.GetType("System.Byte[]"));//Agrego la columna con el tipo de dato "System.Byte[]",donde guardare mi imagen.
                dsBitacoraTable.Columns.Add("UsuarioLog", System.Type.GetType("System.String"));
                dsBitacoraTable.Columns.Add("NombreUsuario", System.Type.GetType("System.String"));
                dsBitacoraTable.Columns.Add("ApellidoUsuario", System.Type.GetType("System.String"));

                if (registrosGrilla.Count > 0)
                {
                    dsBitacoraTable.Rows[0]["Logo"] = CargarImagen("C:\\TransArte\\Website\\images\\logoMini.PNG");
                    dsBitacoraTable.Rows[0]["UsuarioLog"] = usuarioActual.usuario;
                    dsBitacoraTable.Rows[0]["NombreUsuario"] = usuarioActual.nombre;
                    dsBitacoraTable.Rows[0]["ApellidoUsuario"] = usuarioActual.apellido;
                    
                }
                else {
                    dsBitacoraTable.Rows.Add(null, "", "", "", "", usuarioFiltro, fechaDesde, fechaHasta, criticidadFiltro, descEvento, CargarImagen("C:\\TransArte\\Website\\images\\logoMini.PNG"), usuarioActual.usuario, usuarioActual.nombre, usuarioActual.apellido);
                }
                

                ReportDocument rpt = new ReportDocument();
                String szFileName = "";
                String strServerPath = "";
                rpt.PrintOptions.PaperOrientation = PaperOrientation.DefaultPaperOrientation;
                rpt.PrintOptions.PaperSize = PaperSize.DefaultPaperSize;
                rpt.PrintOptions.PaperSource = PaperSource.Upper;
                rpt.PrintOptions.PrinterDuplex = PrinterDuplex.Default;
                

                rpt.Load(Server.MapPath("../Reportes/ReportBitacora.rpt"));
                rpt.SetDataSource(dsBitacoraTable);


                strServerPath = Server.MapPath("~") + "\\Reportes\\" + usuarioActual.usuario + "\\";
                DirectoryInfo dirReport = new DirectoryInfo(strServerPath);
                if (!dirReport.Exists)
                { // crea la carpeta si no existe
                    dirReport.Create();
                }

                szFileName += "\\" + "BITACORA_";
                szFileName += DateTime.Now.Year + "_" + (DateTime.Now.Month.ToString().Length > 1 ? "" + DateTime.Now.Month : "0" + DateTime.Now.Month) + "_" + (DateTime.Now.Day.ToString().Length > 1 ? "" + DateTime.Now.Day : "0" + DateTime.Now.Day) + "_" + (DateTime.Now.Hour.ToString().Length > 1 ? "" + DateTime.Now.Hour : "0" + DateTime.Now.Hour) + "_" + (DateTime.Now.Minute.ToString().Length > 1 ? "" + DateTime.Now.Minute : "0" + DateTime.Now.Minute) + "_" + (DateTime.Now.Second.ToString().Length > 1 ? "" + DateTime.Now.Second : "0" + DateTime.Now.Second);
                szFileName += ".PDF";

                DiskFileDestinationOptions dfdoFile = new DiskFileDestinationOptions();
                dfdoFile.DiskFileName = strServerPath + szFileName;

                rpt.ExportOptions.ExportDestinationType = ExportDestinationType.DiskFile;
                rpt.ExportOptions.ExportFormatType = ExportFormatType.PortableDocFormat;
                rpt.ExportOptions.DestinationOptions = dfdoFile;
                rpt.Export();



            }
            catch (Exception ex)
            {
                // logueo el error en bitacora y en ELMATH
                BRLoger.LogError(ex);
                throw ex;
            }
        }
        public static Byte[] CargarImagen(string rutaArchivo)
        {
            if (rutaArchivo != ""){
                try{
                    FileStream Archivo = new FileStream(rutaArchivo, FileMode.Open);//Creo el archivo
                    BinaryReader binRead = new BinaryReader(Archivo);//Cargo el Archivo en modo binario
                    Byte[] imagenEnBytes = new Byte[(Int64)Archivo.Length]; //Creo un Array de Bytes donde guardare la imagen
                    binRead.Read(imagenEnBytes,0, (int)Archivo.Length);//Cargo la imagen en el array de Bytes
                    binRead.Close();
                    Archivo.Close();
                    return imagenEnBytes;//Devuelvo la imagen convertida en un array de bytes
                }catch{
                    return new Byte[0];
                }
            }
            return new byte[0];
        }
    


    }
}
