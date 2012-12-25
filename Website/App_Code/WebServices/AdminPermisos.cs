using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Services;
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

    public class AdminPermisos : System.Web.Services.WebService {
    
        /// <summary>
        /// Obtiene todos los grupos
        /// </summary>
        /// 
        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public  List<Grupo> getGrupos()
        {
            try
            {
                DataSet dsGrupos = BRGrupos.buscarTodosActivos();
                List<Grupo> data = new List<Grupo>();
                if (dsGrupos.Tables[0].Rows.Count != 0){
                    int nCantColumnas = dsGrupos.Tables[0].Rows.Count - 1;
                    for (int i = 0; i <= nCantColumnas; i++)
                    {

                        data.Add(new Grupo()
                        {
                            ID =  Convert.ToInt32(dsGrupos.Tables[0].Rows[i]["id"]),
                            DescGrupo = Convert.ToString(dsGrupos.Tables[0].Rows[i]["descripcion"])
                        });
                    }
                }
                else{// no hay grupos
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
        public class Grupo
        {
            public int ID { set; get; }
            public string DescGrupo { set; get; }
        }
        public class gridDataGrupos
        {
            public int total { get; set; }
            public int page { get; set; }
            public int records { get; set; }
            public List<Grupo> rows { get; set; }
        }

        //-------------------------------------------------------------------get usuarios-------------------------------------------------------------------
        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<Usuario> getUsuarios(int idGrupo)
        {
            try
            {
                DataSet dsUsuarios = BRUsuarios.buscarPorIdGrupo(idGrupo);
                List<Usuario> data = new List<Usuario>();
                if (dsUsuarios.Tables[0].Rows.Count != 0)
                {
                    int nCantColumnas = dsUsuarios.Tables[0].Rows.Count - 1;
                    for (int i = 0; i <= nCantColumnas; i++)
                    {
                        data.Add(new Usuario()
                        {
                            ID = Convert.ToInt32(dsUsuarios.Tables[0].Rows[i]["id"]),
                            usuario = BRSeguridad.desencriptar(Convert.ToString(dsUsuarios.Tables[0].Rows[i]["usuario"]))
                        });
                    }
                }
                else
                {// no hay grupos
                }


                return  data;
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
            public int ID { set; get; }
            public string usuario { set; get; }
        }

        //-------------------------------------------------------------------get usuarios-------------------------------------------------------------------
        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<History> getHistory(int idGrupo)
        {
            try
            {
                DataSet dsHistory = BRGruposPermisos.traerHistorial(idGrupo);
                List<History> data = new List<History>();
                if (dsHistory.Tables[0].Rows.Count != 0)
                {
                    int nCantColumnas = dsHistory.Tables[0].Rows.Count - 1;
                    for (int i = 0; i <= nCantColumnas; i++)
                    {
                        data.Add(new History()
                        {
                            ID = Convert.ToInt32(dsHistory.Tables[0].Rows[i]["id"]),
                            fechaAlta = Convert.ToString(dsHistory.Tables[0].Rows[i]["fechaAlta"]),
                            fechaBaja = Convert.ToString(dsHistory.Tables[0].Rows[i]["fechaBaja"]),
                            descripcion = Convert.ToString(dsHistory.Tables[0].Rows[i]["descripcion"])
                        });
                    }
                }
                else
                {// no hay grupos
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
        public class History
        {
            public int ID { set; get; }
            public string fechaAlta { set; get; }
            public string fechaBaja { set; get; }
            public string descripcion { set; get; }
        }

    //-------------------------------------------------------------------get Permisos-------------------------------------------------------------------
        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public gridDataPermisos getPermisos(int page, int rows, string sidx, string sord, bool _search)
        {
            try
            {
                DataSet dsPermisos = BRPermisos.buscarTodos();
                List<Permiso> data = new List<Permiso>();
                if (dsPermisos.Tables[0].Rows.Count != 0)
                {
                    int nCantColumnas = dsPermisos.Tables[0].Rows.Count - 1;
                    for (int i = 0; i <= nCantColumnas; i++)
                    {
                        data.Add(new Permiso()
                        {
                            ID = Convert.ToInt32(dsPermisos.Tables[0].Rows[i]["id"]),
                            descripcion = Convert.ToString(dsPermisos.Tables[0].Rows[i]["descripcion"])
                        });
                    }
                }
                else{// no hay grupos
                }
                int recordsCount = data.Count;
                int startIndex = (page - 1) * rows;
                int endIndex = (startIndex + rows < recordsCount) ? startIndex + rows : recordsCount;
                List<Permiso> gridRows = new List<Permiso>(rows);
                for (int i = startIndex; i < endIndex; i++)
                    gridRows.Add(data[i]);


                return new gridDataPermisos()
                {
                    total = (recordsCount + rows - 1) / rows,
                    page = page,
                    records = recordsCount,
                    rows = gridRows
                };
            }
            catch (Exception ex)
            {
                // logueo el error en bitacora y en ELMATH
                BRLoger.LogError(ex);
                throw ex;
            }
        }
        public class Permiso
        {
            public int ID { set; get; }
            public string descripcion { set; get; }
        }
        public class gridDataPermisos
        {
            public int total { get; set; }
            public int page { get; set; }
            public int records { get; set; }
            public List<Permiso> rows { get; set; }
        }

        //----------------------------------------------
        //------------get Permisos por id Grupo---------
        //----------------------------------------------
        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<Permiso> getPermisosPoridGrupo(int idGrupo)
        {
            try
                {
                DataSet dsPermisos = BRPermisos.buscarPorIdGrupo(idGrupo);
                List<Permiso> data = new List<Permiso>();
                if (dsPermisos.Tables[0].Rows.Count != 0){
                    int nCantColumnas = dsPermisos.Tables[0].Rows.Count - 1;
                    for (int i = 0; i <= nCantColumnas; i++){
                        data.Add(new Permiso(){
                            ID = Convert.ToInt32(dsPermisos.Tables[0].Rows[i]["id"]),
                            descripcion = Convert.ToString(dsPermisos.Tables[0].Rows[i]["descripcion"])
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
        //----------------------------------------------
        //------------------ eliminarPoridGrupo---------
        //----------------------------------------------

        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public Respuesta eliminarPoridGrupo(int idGrupo)
        {
            try
            {
                int idPermiso = 0;
                DataSet dsPermisos = BRPermisos.buscarPorIdGrupo(idGrupo);
                if (dsPermisos.Tables[0].Rows.Count != 0)
                {
                    int nCantColumnas = dsPermisos.Tables[0].Rows.Count - 1;
                    Respuesta _respuesta = new Respuesta();
                    for (int i = 0; i <= nCantColumnas; i++)
                    {
                        idPermiso = Convert.ToInt32(dsPermisos.Tables[0].Rows[i]["id"]);
                        if (idPermiso == 13 && BRPermisos.esUltimoPermiso(idPermiso))
                        {
                            _respuesta.errorABMUsuario = true;
                        }
                        else if (idPermiso == 16 && BRPermisos.esUltimoPermiso(idPermiso))
                        {
                            _respuesta.errorRestore = true;
                        }
                        else if (idPermiso == 17 && BRPermisos.esUltimoPermiso(idPermiso))
                        {
                            _respuesta.errorBitacora = true;
                        }
                    }// no retono asi q borro el registro
                    if (_respuesta.errorBitacora || _respuesta.errorABMUsuario || _respuesta.errorRestore)
                    {
                        return _respuesta;
                    }
                    BRGrupos.eliminarPorIdGrupo(idGrupo);
                }
                else {
                    BRGrupos.eliminarPorIdGrupo(idGrupo);
                }
                return new Respuesta();
            }
            catch (Exception ex)
            {
                // logueo el error en bitacora y en ELMATH
                BRLoger.LogError(ex);
                // me voy a mostrar el error
                return new Respuesta() { error = ex.Message };
            }
        }
        //----------------------------------------------
        //------------------------ agregarGrupo---------
        //----------------------------------------------
        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public Respuesta agregarGrupo(string descGrupo, int[] idPermisos)
        {
            try
            {
                Respuesta _respuesta = new Respuesta();
                DataSet ds = BRGrupos.buscarPorNombre(descGrupo);
                if (ds.Tables[0].Rows.Count != 0)
                {
                    _respuesta.errorNombreGrupo = true;// "El nombre del grupo ya existe";// poner ID de elemento a mostrar
                }
                else 
                {// no existe el nombre lo agrego 
                    int idGrupo = BRGrupos.agregarGrupo(descGrupo);// tomo en id del grupo nuevo
                    if (idPermisos.Length != 0)
                    {
                        for (int i = 0; i < idPermisos.Length; i++)
                        {
                            // agregar de a un grupo permiso iterando sobre la coll de grupos
                            BRGruposPermisos.agregarPermisoAlGrupo(idGrupo, Convert.ToInt32(idPermisos[i]));
                        }
                    }
                }
                return _respuesta;
            }
            catch (Exception ex)
            {
                // logueo el error en bitacora y en ELMATH
                BRLoger.LogError(ex);
                // me voy a mostrar el error
                return new Respuesta() { error = ex.Message };
            }
        }



        //----------------------------------------------
        //------------------------ agregarGrupo---------
        //----------------------------------------------

        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public Respuesta modificarGrupo(int idGrupo, string descGrupo, int[] idPermisosCliente)
        {
            try
            {

                Respuesta _respuesta = new Respuesta();
                //string desc = "";

                DataSet ds = BRGrupos.buscarPorNombre(descGrupo);
                if (ds.Tables[0].Rows.Count != 0 )
                {
                    if (Convert.ToInt32(ds.Tables[0].Rows[0]["id"]) != idGrupo)
                    {
                        //descError = "El nombre del grupo " + descGrupo + " ya existe en la BD";//
                        _respuesta.errorNombreGrupo = true;
                        return _respuesta;
                    }
                
                }
                else
                {
                    BRGrupos.modificarGrupo(idGrupo, descGrupo); // modifique el grupo
                }
                // traigo todos los permisos
                DataSet dsPermisos = BRPermisos.buscarPorIdGrupo(idGrupo);
                DataRowCollection drPermisosBD =  dsPermisos.Tables[0].Rows;
                for (int j = 0; j < idPermisosCliente.Length; j++){
                    Boolean existePermiso = false;
                    if (drPermisosBD.Count != 0)
                    { // hay permisos asignados en la BD 
                        for (int i = 0; i <= drPermisosBD.Count - 1; i++)
                        {
                            int idPermisoBD = Convert.ToInt32(drPermisosBD[i]["id"]);
                            int idPerCliente = Convert.ToInt32(idPermisosCliente[j]);
                            if (idPermisoBD == idPerCliente) { // comparo por id 
                                existePermiso = true;
                                // lo saco de la coleccion para no evaluarlo de nuevo y dejo la BD como esta
                                drPermisosBD.Remove(drPermisosBD[i]);
                            }
                        }
                    }
                    if (!existePermiso)
                    { //es un permiso NUEVO, lo agrego en la BD
                        // agregar de a un grupo permiso iterando sobre la coll de grupos
                        BRGruposPermisos.agregarPermisoAlGrupo(idGrupo, Convert.ToInt32(idPermisosCliente[j]));
                    }

                }
                if (drPermisosBD.Count != 0)
                {// tiene elementos en la BD asi q lo tengo q borrar
                    for (int i = 0; i <= drPermisosBD.Count - 1; i++){
                        int idPermiso = Convert.ToInt32(drPermisosBD[i]["id"]);
                        if (idPermiso == 13 ){
                            if (BRPermisos.esUltimoPermiso(idPermiso)){
                                _respuesta.errorABMUsuario = true;
                            }else{
                                BRGruposPermisos.eliminarPermisoDelGrupo(idGrupo, idPermiso);// lo borro de la BD
                            }
                        }
                        else if (idPermiso == 16){
                            if (BRPermisos.esUltimoPermiso(idPermiso)){
                                _respuesta.errorRestore = true;
                            }else{
                                BRGruposPermisos.eliminarPermisoDelGrupo(idGrupo, idPermiso);// lo borro de la BD
                            }
                        }
                        else if (idPermiso == 17){
                            if (BRPermisos.esUltimoPermiso(idPermiso)){
                                _respuesta.errorBitacora = true;
                            }else{
                                BRGruposPermisos.eliminarPermisoDelGrupo(idGrupo, idPermiso);// lo borro de la BD
                            }
                        }else{
                            BRGruposPermisos.eliminarPermisoDelGrupo(idGrupo, idPermiso);// lo borro de la BD
                        }
                    }
                }
                return _respuesta;
            }
            catch (Exception ex)
            {
                // logueo el error en bitacora y en ELMATH
                BRLoger.LogError(ex);
                // me voy a mostrar el error
                return new Respuesta() { error = ex.Message };
            }

        }
        public class Respuesta
        {
            public Boolean errorNombreGrupo { set; get; }
            public Boolean errorRestore { set; get; }
            public Boolean errorBitacora { set; get; }
            public Boolean errorABMUsuario { set; get; }
            public string error { set; get; }
        }
    }
}
