using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Services;
using ProyTransArte.ReglasDeNegocio;
using ProyTransArte.ObjetosDeNegocio;
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

public class AdminUsuarios: System.Web.Services.WebService {
    /// <summary>
    /// Obtiene todos los usuarios
    /// </summary>
    /// 
    [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public List<usuarios> getUsuarios(string usuario, string apellido, string razonSocial)
    {
        try
        {


            DataSet dsUsuario = BRUsuarios.buscarUsuarios(usuario, apellido, razonSocial);
            List<usuarios> data = new List<usuarios>();
            if (dsUsuario.Tables[0].Rows.Count != 0)
            {
                int nCantColumnas = dsUsuario.Tables[0].Rows.Count - 1;
                for (int i = 0; i <= nCantColumnas; i++)
                {
                    data.Add(new usuarios()
                    {
                        id = Convert.ToInt32(dsUsuario.Tables[0].Rows[i]["id"]),
                        fechaAlta = Convert.ToString(dsUsuario.Tables[0].Rows[i]["fechaAlta"]),
                        usuario = BRSeguridad.desencriptar(Convert.ToString(dsUsuario.Tables[0].Rows[i]["usuario"])),
                        nombre = BRSeguridad.desencriptar(Convert.ToString(dsUsuario.Tables[0].Rows[i]["nombre"])),
                        apellido = BRSeguridad.desencriptar(Convert.ToString(dsUsuario.Tables[0].Rows[i]["apellido"])),
                        esCuit = Convert.ToString(dsUsuario.Tables[0].Rows[i]["esCuit"]),
                        email = BRSeguridad.desencriptar(Convert.ToString(dsUsuario.Tables[0].Rows[i]["email"])),
                        cuit_cuil = BRSeguridad.desencriptar(Convert.ToString(dsUsuario.Tables[0].Rows[i]["cuit_cuil"])),
                        bloqueado = Convert.ToString(dsUsuario.Tables[0].Rows[i]["bloqueado"]),
                        fechaBaja = Convert.ToString(dsUsuario.Tables[0].Rows[i]["fechaBaja"]),
                        motivo = BRSeguridad.desencriptar(Convert.ToString(dsUsuario.Tables[0].Rows[i]["motivo"])),
                        razonSocial = BRSeguridad.desencriptar(Convert.ToString(dsUsuario.Tables[0].Rows[i]["razonSocial"]))
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
    public class usuarios
    {
        public int id { set; get; }
        public string fechaAlta { set; get; }
        public string usuario { set; get; }
        public string nombre { set; get; }
        public string apellido { set; get; }
        public string email { set; get; }
        public string esCuit { set; get; }
        public string cuit_cuil { set; get; }
        public string bloqueado { set; get; }
        public string fechaBaja { set; get; }
        public string motivo { set; get; }
        public string razonSocial { set; get; }
    }


    /// <summary>
    /// Obtiene todos los grupos para cargar la grilla
    /// </summary>
    /// 
    [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public List<Grupo> getGrupos()
    {
        try
        {
            DataSet dsGrupos = BRGrupos.buscarTodosActivos();
            List<Grupo> data = new List<Grupo>();
            if (dsGrupos.Tables[0].Rows.Count != 0)
            {
                int nCantColumnas = dsGrupos.Tables[0].Rows.Count - 1;
                for (int i = 0; i <= nCantColumnas; i++)
                {

                    data.Add(new Grupo()
                    {
                        ID = i+ 1,
                        idGrupo = Convert.ToInt32(dsGrupos.Tables[0].Rows[i]["id"]),
                        DescGrupo = Convert.ToString(dsGrupos.Tables[0].Rows[i]["descripcion"])
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
    public class Grupo
    {
        public int ID { set; get; }
        public int idGrupo { set; get; }
        public string DescGrupo { set; get; }
    }

    /// <summary>
    /// Obtiene todos los permisos para cargar la grilla
    /// </summary>
    /// 
    [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public List<Permiso> getPermisos()
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
                        ID = i+1,
                        idPermiso= Convert.ToInt32(dsPermisos.Tables[0].Rows[i]["id"]),
                        cant = 0,
                        descripcion = Convert.ToString(dsPermisos.Tables[0].Rows[i]["descripcion"]),
                        grupo = false,
                        individual = false,
                        bloqueado = false
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
    public class Permiso
    {
        public int ID { set; get; }
        public int idPermiso { set; get; }
        public int cant { set; get; }
        public string descripcion { set; get; }
        public Boolean grupo { set; get; }
        public Boolean individual { set; get; }
        public Boolean bloqueado { set; get; }
    }


    //-------------------------------------------------------------------get getGruposPermisosPorIdusuario-------------------------------------------------------------------
    /// <summary>
    /// Obtiene todos los grupos
    /// </summary>
    /// 
    
    [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public List<GrupoPermisos> getGruposPermisosPorIdusuario(int idUsuario)
    {
        try
        {

            DataSet dsGrupos = BRGrupos.getGruposPorIdusuario(idUsuario);
            List<GrupoPermisos> dataGruposPermisos = new List<GrupoPermisos>();

            if (dsGrupos.Tables[0].Rows.Count != 0)
            {
                int nCantColumnas = dsGrupos.Tables[0].Rows.Count - 1;
                for (int i = 0; i <= nCantColumnas; i++)
                {
                    DataSet dsPermisos = BRPermisos.buscarPorIdGrupo(Convert.ToInt32(dsGrupos.Tables[0].Rows[i]["id"]));
                    List<Permiso> dataPermisos = new List<Permiso>();
                    if (dsPermisos.Tables[0].Rows.Count != 0)
                    {
                        int nCantColumnasPermisos = dsPermisos.Tables[0].Rows.Count - 1;
                        for (int j = 0; j <= nCantColumnasPermisos; j++)
                        {
                            dataPermisos.Add(new Permiso()
                            {
                                ID = i +1,
                                idPermiso = Convert.ToInt32(dsPermisos.Tables[0].Rows[j]["id"]),
                                descripcion = Convert.ToString(dsPermisos.Tables[0].Rows[ j]["descripcion"])
                            });
                        }
                    }
                    dataGruposPermisos.Add(new GrupoPermisos()
                    {
                        idGrupo = Convert.ToInt32(dsGrupos.Tables[0].Rows[i]["id"]),
                        descripcionGrupo = Convert.ToString(dsGrupos.Tables[0].Rows[i]["descripcion"]),
                        permisos = dataPermisos
                    });

                }
            }

            return dataGruposPermisos;
            
        }
        catch (Exception ex)
        {
            // logueo el error en bitacora y en ELMATH
            BRLoger.LogError(ex);
            throw ex;
        }
    }
    public class GrupoPermisos
    {
        public int idGrupo { get; set; }
        public string descripcionGrupo { get; set; }
        public List<Permiso> permisos { get; set; }
    }

    //-------------------------------------------------------------------get getPermisosIndependientesPorIdusuario-------------------------------------------------------------------
    /// <summary>
    /// Obtiene todos los permisos independientes
    /// </summary>
    /// 

    [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public List<PermisoInd> getPermisosIndependientesPorIdusuario(int idUsuario)
    {
        try
        {

            DataSet dsPermisos = BRUsuariosPermisos.buscarPorUsuario(idUsuario);
            List<PermisoInd> dataPermisos = new List<PermisoInd>();
            if (dsPermisos.Tables[0].Rows.Count != 0)
            {
                int nCantColumnasPermisos = dsPermisos.Tables[0].Rows.Count - 1;
                for (int j = 0; j <= nCantColumnasPermisos; j++)
                {
                    dataPermisos.Add(new PermisoInd()
                    {
                        id = Convert.ToInt32(dsPermisos.Tables[0].Rows[j]["id"]),
                        idPermiso = Convert.ToInt32(dsPermisos.Tables[0].Rows[j]["idPermiso"]),
                        descripcion = Convert.ToString(dsPermisos.Tables[0].Rows[j]["descripcion"]),
                        negado = Convert.ToString(dsPermisos.Tables[0].Rows[j]["negado"])
                    });
                }
            }

            return dataPermisos;

        }
        catch (Exception ex)
        {
            // logueo el error en bitacora y en ELMATH
            BRLoger.LogError(ex);
            throw ex;
        }
    }
    public class PermisoInd
    {
        public int id { set; get; }
        public int idPermiso { set; get; }
        public string descripcion { set; get; }
        public string negado { set; get; }
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
            if (dsPermisos.Tables[0].Rows.Count != 0)
            {
                int nCantColumnas = dsPermisos.Tables[0].Rows.Count - 1;
                for (int i = 0; i <= nCantColumnas; i++)
                {
                    data.Add(new Permiso()
                    {
                        ID = i + 1,
                        idPermiso = Convert.ToInt32(dsPermisos.Tables[0].Rows[i]["id"]),
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
    //------------ alta de usuario         ---------
    //----------------------------------------------
    [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public Respuesta altaUsuario(string usuario, string contrasena, string email, List<int> grupos, List<Permiso> permisos)
    {
        try
        {
            Respuesta _respuesta = new Respuesta();

            // verifico que el usuario NO ESTE INGRESADO
            DataSet ds = BRUsuarios.buscarPorUsuario(usuario);
            if (ds.Tables[0].Rows.Count != 0)
            {
                //descError = "El nombre del usuario ya existe en la BD";//
                _respuesta.errorNombreUsuario = true;
                return _respuesta;
            }
            else
            {
                if (!BRUsuarios.enviarMailAlta(usuario, contrasena, email)) {  // envio mail al usuario con la contraseña
                    _respuesta.errorEnviarMail = true;
                    return _respuesta;
                }
                int idUsuario = BRUsuarios.altaUsuario(usuario, contrasena, email); // alta del usuario
                // agrego los grupos al usuario 
                foreach (int _idGrupo in grupos)
                {
                    BRUsuarios_Grupos.agregarGrupoAlUsuario(idUsuario, _idGrupo);
                }
                // agrego los permisos individuales al usuario
                foreach (Permiso _permiso in permisos)
                {
                    if (_permiso.individual)
                    {
                        BRUsuariosPermisos.agregarPermisoAlUsuario(idUsuario, _permiso.idPermiso, _permiso.bloqueado);
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
    //------------ modi de usuario         --------- 
    //----------------------------------------------
    [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public Respuesta modiUsuario(int idUsuario, string usuario, string contrasena, string email, List<int> grupos, List<Permiso> permisos, bool bloqueado, bool baja, string motivo)
    {
        try
        {
            Respuesta _respuesta = new Respuesta();
            // verifico que el usuario LEGUEADO no sea el que se quiere modifciar los permisos
            BeanUsuario usuarioActual = new BeanUsuario();
            if (HttpContext.Current.Session != null && HttpContext.Current.Session["usuarioActual"] != null)
            {
                usuarioActual = (BeanUsuario)HttpContext.Current.Session["usuarioActual"];
                if (usuarioActual.id == idUsuario)
                {
                    _respuesta.errorMismoUsuario = true;
                    return _respuesta;
                }
            }
            // verifico que el nombre de usuario no este guardado anteriormente
            DataSet ds = BRUsuarios.buscarPorId(idUsuario);
            Boolean cambieNombreUsuario = false;
            if (ds.Tables[0].Rows.Count != 0)
            {
                int nCantColumnas = ds.Tables[0].Rows.Count - 1;
                for (int j = 0; j <= nCantColumnas; j++)
                {
                    string nombreUsuario = BRSeguridad.desencriptar(Convert.ToString(ds.Tables[0].Rows[j]["usuario"]));
                    if (nombreUsuario != usuario)
                    {
                        ds = BRUsuarios.buscarPorUsuario(usuario);
                        if (ds.Tables[0].Rows.Count != 0)
                        {
                            //descError = "El nombre del usuario ya existe en la BD";//
                            _respuesta.errorNombreUsuario = true;
                            return _respuesta;
                        }
                        cambieNombreUsuario = true;
                    }
                }
            }
            // verifico que si cambio el PSW de usuario le envio el mail
            if (contrasena != "" ){
                if (!BRUsuarios.enviarMailModificar(usuario, contrasena, email)) {  // envio mail al usuario con la contraseña
                    _respuesta.errorEnviarMail = true;
                    return _respuesta;
                }
            }
            // verifico que si cambio del nombre del usuario y envio el mail
            if (cambieNombreUsuario)
            {
                if (!BRUsuarios.enviarMailModificar(usuario, contrasena, email))
                {  // envio mail al usuario con la contraseña
                    _respuesta.errorEnviarMail = true;
                    return _respuesta;
                }
            }


            BRUsuarios.modiUsuario(idUsuario, usuario, contrasena, email, bloqueado, baja, motivo); // modifico los datos del usuario
            
            
            // modifico los permisos independientes al usuario 
            // primero traigo todos los permisos independientes

            DataSet dsPermisosIndBD = BRUsuariosPermisos.buscarPorUsuario(idUsuario);
            DataRowCollection drPermisosIndBD = dsPermisosIndBD.Tables[0].Rows;
            foreach (Permiso _permiso in permisos)
            {
                if (_permiso.individual)
                {
                    Boolean existePermiso = false;
                    if (drPermisosIndBD.Count != 0)
                    { // hay permisos asignados en la BD 
                        for (int i = 0; i <= drPermisosIndBD.Count - 1; i++)
                        {
                            int idUsuarioPermiso = Convert.ToInt32(drPermisosIndBD[i]["id"]);
                            int idPermisoBD = Convert.ToInt32(drPermisosIndBD[i]["idPermiso"]);
                            bool _perBloqueado = (Convert.ToInt32(drPermisosIndBD[i]["negado"]) == 1 ? true : false);
                            if (idPermisoBD == _permiso.idPermiso)
                            { // comparo por id 
                                existePermiso = true;
                                // lo saco de la coleccion para no evaluarlo de nuevo y dejo la BD como esta
                                if (_perBloqueado != _permiso.bloqueado)
                                { // determina que SOLO TIENE MODIFICADO EL BLOQUEO
                                    BRUsuariosPermisos.modificarBloqueo(idUsuarioPermiso, _permiso.bloqueado);
                                }
                                drPermisosIndBD.Remove(drPermisosIndBD[i]);
                            }
                        }
                    }
                    if (!existePermiso)
                    { //es un permiso independiente es NUEVO, lo agrego en la BD
                        BRUsuariosPermisos.agregarPermisoAlUsuario(idUsuario, _permiso.idPermiso, _permiso.bloqueado);
                    }
                }
            }

            if (drPermisosIndBD.Count != 0)
            {// tiene elementos en la BD asi q lo tengo q borrar
                for (int i = 0; i <= drPermisosIndBD.Count - 1; i++)
                {
                    int idUsuarioPermiso = Convert.ToInt32(drPermisosIndBD[i]["id"]);
                    int idPermisoBD = Convert.ToInt32(drPermisosIndBD[i]["idPermiso"]);
                    if (idPermisoBD == 13)
                    {
                        if (BRPermisos.esUltimoPermiso(idPermisoBD))
                        {
                            _respuesta.errorABMUsuario = true;
                        }
                        else
                        {
                            BRUsuariosPermisos.eliminarPermisoIndependiente(idUsuarioPermiso);// lo borro de la BD
                        }
                    }
                    else if (idPermisoBD == 15)
                    {
                        if (BRPermisos.esUltimoPermiso(idPermisoBD))
                        {
                            _respuesta.errorBackUp = true;
                        }
                        else
                        {
                            BRUsuariosPermisos.eliminarPermisoIndependiente(idUsuarioPermiso);// lo borro de la BD
                        }
                    }
                    else if (idPermisoBD == 16)
                    {
                        if (BRPermisos.esUltimoPermiso(idPermisoBD))
                        {
                            _respuesta.errorRestore = true;
                        }
                        else
                        {
                            BRUsuariosPermisos.eliminarPermisoIndependiente(idUsuarioPermiso);// lo borro de la BD
                        }
                    }
                    else if (idPermisoBD == 17)
                    {
                        if (BRPermisos.esUltimoPermiso(idPermisoBD))
                        {
                            _respuesta.errorBitacora = true;
                        }
                        else
                        {
                            BRUsuariosPermisos.eliminarPermisoIndependiente(idUsuarioPermiso);// lo borro de la BD
                        }
                    }
                    else
                    {
                        BRUsuariosPermisos.eliminarPermisoIndependiente(idUsuarioPermiso);// lo borro de la BD
                    }
                }
            }

            // ahora voy por los grupos 
            DataSet dsGruposBD = BRGrupos.getGruposPorIdusuario(idUsuario);
            DataRowCollection drGruposBD = dsGruposBD.Tables[0].Rows;
            foreach (int _idGrupo in grupos)
            {
                Boolean existeGrupo = false;
                if (drGruposBD.Count != 0)
                { // hay grupos asignados en la BD 
                    for (int i = 0; i <= drGruposBD.Count - 1; i++)
                    {
                        int idGrupo = Convert.ToInt32(drGruposBD[i]["id"]);
                        if (idGrupo == _idGrupo)
                        { // comparo por id 
                            existeGrupo = true;
                            // lo saco de la coleccion para no evaluarlo de nuevo y dejo la BD como esta
                            drGruposBD.Remove(drGruposBD[i]);
                        }
                    }
                }
                if (!existeGrupo)
                { //es un grupo es NUEVO, lo agrego en la BD
                    BRUsuarios_Grupos.agregarGrupoAlUsuario(idUsuario, _idGrupo);
                }
            }
            // ahora voy por la ELIMINACION DE GRUPOS 
            if (drGruposBD.Count != 0)
            {// tiene elementos en la BD asi q lo tengo q borrar
                for (int i = 0; i <= drGruposBD.Count - 1; i++)
                {
                    int idGrupo = Convert.ToInt32(drGruposBD[i]["id"]);
                    int idUsuarioGrupo = Convert.ToInt32(drGruposBD[i]["idUsuarioGrupo"]);
                    DataSet dsPermGrupoBD = BRPermisos.buscarPorIdGrupo(idGrupo);
                    DataRowCollection drPermGrupoBD = dsPermGrupoBD.Tables[0].Rows;
                    if (drPermGrupoBD.Count != 0)
                    { // hay permisos asignados al grupo 
                        Boolean tieneUltimoPermiso = false;
                        for (int z = 0; z <= drPermGrupoBD.Count - 1; z++)
                        {
                            // consulto que no sea el ULTIMO 
                            int idPermisoBD = Convert.ToInt32(drPermGrupoBD[z]["id"]);// id del permiso
                            if (idPermisoBD == 13)
                            {
                                if (BRPermisos.esUltimoPermiso(idPermisoBD))
                                {
                                    _respuesta.errorABMUsuario = true;
                                    tieneUltimoPermiso = true;
                                }
                            }
                            else if (idPermisoBD == 15)
                            {
                                if (BRPermisos.esUltimoPermiso(idPermisoBD))
                                {
                                    _respuesta.errorRestore = true;
                                    tieneUltimoPermiso = true;
                                }
                            }
                            else if (idPermisoBD == 16)
                            {
                                if (BRPermisos.esUltimoPermiso(idPermisoBD))
                                {
                                    _respuesta.errorRestore = true;
                                    tieneUltimoPermiso = true;
                                }
                            }
                            else if (idPermisoBD == 17)
                            {
                                if (BRPermisos.esUltimoPermiso(idPermisoBD))
                                {
                                    _respuesta.errorBitacora = true;
                                    tieneUltimoPermiso = true;
                                }
                            }
                        }
                        if (!tieneUltimoPermiso)
                        { // Saco al grupo de la BD ya q NO contiene ULTIMOS permisos
                            BRUsuarios_Grupos.eliminarUsuarios_Grupos(idUsuarioGrupo);
                        }
                    }
                    else
                    {// es un grupo q no tiene permisos asi q lo saco
                        BRUsuarios_Grupos.eliminarUsuarios_Grupos(idUsuarioGrupo);
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
        public Boolean errorMismoUsuario { set; get; }
        public Boolean errorEnviarMail { set; get; }
        public Boolean errorNombreUsuario { set; get; }
        public Boolean errorNombreGrupo { set; get; }
        public Boolean errorRestore { set; get; }
        public Boolean errorBackUp { set; get; }
        public Boolean errorBitacora { set; get; }
        public Boolean errorABMUsuario { set; get; }
        public string error { set; get; }
    }






    }
}
