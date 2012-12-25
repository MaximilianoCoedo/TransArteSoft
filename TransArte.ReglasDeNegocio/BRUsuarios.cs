using System;
using System.Data;
using ProyTransArte.ObjetosDeNegocio;
using ProyTransArte.BeanObjetos;
using System.Net.Mail;
using System.Net;


namespace ProyTransArte.ReglasDeNegocio
{
    public class BRUsuarios
    {
        public static DataSet login(String usuario, String password)
        {
            try
            {
                BOUsuarios bo = new BOUsuarios();
                return bo.GetByN("Login", BRSeguridad.encriptar(usuario.ToUpper()), BRSeguridad.encriptar(password)); // retorna DataSet
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public static BeanUsuario recargarUsuario(BeanUsuario us)
        {
            try
            {

                DataSet ds = BRUsuarios.buscarPorId(us.id);
                if (ds.Tables[0].Rows.Count == 0)
                    us.existe = false;
                else
                {
                    us = new BeanUsuario();
                    us.id = (int)ds.Tables[0].Rows[0]["id"];
                    us.usuario = BRSeguridad.desencriptar(Convert.ToString(ds.Tables[0].Rows[0]["usuario"]));
                    us.apellido = BRSeguridad.desencriptar(Convert.ToString(ds.Tables[0].Rows[0]["apellido"]));
                    us.nombre = BRSeguridad.desencriptar(Convert.ToString(ds.Tables[0].Rows[0]["nombre"]));
                    us.email = BRSeguridad.desencriptar(Convert.ToString(ds.Tables[0].Rows[0]["email"]));
                    us.esCuil = (int)(ds.Tables[0].Rows[0]["esCuit"].ToString() != "" ? ds.Tables[0].Rows[0]["esCuit"] : 0) == 1 ? true : false;
                    us.cuit_cuil = BRSeguridad.desencriptar(Convert.ToString(ds.Tables[0].Rows[0]["cuit_cuil"]));
                    us.razonSocial = BRSeguridad.desencriptar(Convert.ToString(ds.Tables[0].Rows[0]["razonSocial"]));
                    DataSet dsTelefonos = BRTelefonos.buscarPorIdUsuario(us.id);

                    if (dsTelefonos.Tables[0].Rows.Count != 0)
                    {
                        int nCantColumnas = dsTelefonos.Tables[0].Rows.Count - 1;
                        for (int i = 0; i <= nCantColumnas; i++)
                        {
                            BeanTelefono tel = new BeanTelefono();
                            tel.id = (int)dsTelefonos.Tables[0].Rows[i]["id"];
                            tel.telefono = BRSeguridad.desencriptar(Convert.ToString(dsTelefonos.Tables[0].Rows[i]["telefono"]));
                            us.addTelefono(tel);

                        }
                    }
                    us.bloqueado = (int)(ds.Tables[0].Rows[0]["bloqueado"].ToString() != "" ? ds.Tables[0].Rows[0]["bloqueado"] : 0) == 1 ? true : false;
                    us.fechaBaja = Convert.ToString((Convert.ToString(ds.Tables[0].Rows[0]["fechaBaja"]) != "") ? ds.Tables[0].Rows[0]["fechaBaja"] : "");
                    us.motivo =  BRSeguridad.desencriptar(Convert.ToString(ds.Tables[0].Rows[0]["motivo"]));
                    us.existe = true;
                    DataSet dsPermisos = BRPermisos.buscarPorIdUsuario(us.id);
                    if (dsPermisos.Tables[0].Rows.Count != 0)
                    {
                        int nCantColumnas = dsPermisos.Tables[0].Rows.Count - 1;
                        for (int i = 0; i <= nCantColumnas; i++)
                        {
                            BeanPermisos permiso = new BeanPermisos();
                            permiso.id = (int)dsPermisos.Tables[0].Rows[i]["idPermiso"];
                            permiso.idForm = Convert.ToString(dsPermisos.Tables[0].Rows[i]["idForm"]);
                            permiso.descripcion = Convert.ToString(dsPermisos.Tables[0].Rows[i]["descripcion"]);
                            permiso.negado = false;
                            us.addPermiso(permiso);
                        }
                    }
                    DataSet dsPermisosIndependientes = BRPermisos.buscarIndepPorIdUsuario(us.id);
                    if (dsPermisosIndependientes.Tables[0].Rows.Count != 0)
                    {
                        int nCantColumnas = dsPermisosIndependientes.Tables[0].Rows.Count - 1;
                        for (int i = 0; i <= nCantColumnas; i++)
                        {
                            BeanPermisos permiso = new BeanPermisos();
                            permiso.id = (int)dsPermisosIndependientes.Tables[0].Rows[i]["idPermiso"];
                            permiso.idForm = Convert.ToString(dsPermisosIndependientes.Tables[0].Rows[i]["idForm"]);
                            permiso.descripcion = Convert.ToString(dsPermisosIndependientes.Tables[0].Rows[i]["descripcion"]);
                            permiso.negado = (Convert.ToString(dsPermisosIndependientes.Tables[0].Rows[i]["negado"]) != "1") ? false : true;
                            us.addPermisoIndependiente(permiso);
                        }
                    }
                    if (us.bloqueado)
                    {
                        BRBitacora.registrarEvento("Intento de ingreso del usuario = " + us.id + " BLOQUEADO ", BeanException.Moderado);
                    }

                }
                return us;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static BeanUsuario autenticarUsuario(BeanUsuario us, string username, string password)
        {
            try
            {
                //  throw new BeanException(new Exception("An error has happened"), BeanException.Bajo);
                DataSet ds = BRUsuarios.login(username.ToUpper(), password);

                if (ds.Tables[0].Rows.Count == 0)
                    us.existe = false;
                else
                {

                    us.id = (int)ds.Tables[0].Rows[0]["id"];
                    us.usuario = BRSeguridad.desencriptar(Convert.ToString(ds.Tables[0].Rows[0]["usuario"]));
                    us.apellido = BRSeguridad.desencriptar(Convert.ToString(ds.Tables[0].Rows[0]["apellido"]));
                    us.nombre = BRSeguridad.desencriptar(Convert.ToString(ds.Tables[0].Rows[0]["nombre"]));
                    us.email = BRSeguridad.desencriptar(Convert.ToString(ds.Tables[0].Rows[0]["email"]));
                    us.esCuil = (int)(ds.Tables[0].Rows[0]["esCuit"].ToString() != "" ? ds.Tables[0].Rows[0]["esCuit"] : 0) == 1 ? true : false;
                    us.cuit_cuil = BRSeguridad.desencriptar(Convert.ToString(ds.Tables[0].Rows[0]["cuit_cuil"]));
                    us.razonSocial = BRSeguridad.desencriptar(Convert.ToString(ds.Tables[0].Rows[0]["razonSocial"]));
                    DataSet dsTelefonos = BRTelefonos.buscarPorIdUsuario(us.id);

                    if (dsTelefonos.Tables[0].Rows.Count != 0)
                    {
                        int nCantColumnas = dsTelefonos.Tables[0].Rows.Count - 1;
                        for (int i = 0; i <= nCantColumnas; i++)
                        {
                            BeanTelefono tel = new BeanTelefono();
                            tel.id = (int)dsTelefonos.Tables[0].Rows[i]["id"];
                            tel.telefono = BRSeguridad.desencriptar(Convert.ToString(dsTelefonos.Tables[0].Rows[i]["telefono"]));
                            us.addTelefono(tel);

                        }
                    }
                    us.bloqueado = (int)(ds.Tables[0].Rows[0]["bloqueado"].ToString() != "" ? ds.Tables[0].Rows[0]["bloqueado"] : 0) == 1 ? true : false;
                    us.fechaBaja = Convert.ToString((Convert.ToString(ds.Tables[0].Rows[0]["fechaBaja"]) != "") ? ds.Tables[0].Rows[0]["fechaBaja"] : "");
                    us.motivo = BRSeguridad.desencriptar(Convert.ToString(ds.Tables[0].Rows[0]["motivo"]));
                    us.existe = true;
                    DataSet dsPermisos = BRPermisos.buscarPorIdUsuario(us.id);
                    if (dsPermisos.Tables[0].Rows.Count != 0)
                    {
                        int nCantColumnas = dsPermisos.Tables[0].Rows.Count - 1;
                        for (int i = 0; i <= nCantColumnas; i++)
                        {
                            BeanPermisos permiso = new BeanPermisos();
                            permiso.id = (int)dsPermisos.Tables[0].Rows[i]["idPermiso"];
                            permiso.idForm = Convert.ToString(dsPermisos.Tables[0].Rows[i]["idForm"]);
                            permiso.descripcion = Convert.ToString(dsPermisos.Tables[0].Rows[i]["descripcion"]);
                            permiso.negado = false;
                            us.addPermiso(permiso);
                        }
                    }
                    DataSet dsPermisosIndependientes = BRPermisos.buscarIndepPorIdUsuario(us.id);
                    if (dsPermisosIndependientes.Tables[0].Rows.Count != 0)
                    {
                        int nCantColumnas = dsPermisosIndependientes.Tables[0].Rows.Count - 1;
                        for (int i = 0; i <= nCantColumnas; i++)
                        {
                            BeanPermisos permiso = new BeanPermisos();
                            permiso.id = (int)dsPermisosIndependientes.Tables[0].Rows[i]["idPermiso"];
                            permiso.idForm = Convert.ToString(dsPermisosIndependientes.Tables[0].Rows[i]["idForm"]);
                            permiso.descripcion = Convert.ToString(dsPermisosIndependientes.Tables[0].Rows[i]["descripcion"]);
                            permiso.negado = (Convert.ToString(dsPermisosIndependientes.Tables[0].Rows[i]["negado"]) != "1") ? false : true;
                            us.addPermisoIndependiente(permiso);
                        }
                    }


                    if (us.bloqueado)
                    {
                        BRBitacora.registrarEvento("Intento de ingreso del usuario = " + us.id + " BLOQUEADO ", BeanException.Moderado);
                    }

                }
                return us;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static int altaUsuario(string usuario,string  contrasena, string email)
        {
            try
            {
                BOUsuarios bo = new BOUsuarios();
                int idUsuario = bo.Add(BRSeguridad.encriptar(usuario.ToUpper()), BRSeguridad.encriptar(contrasena), BRSeguridad.encriptar(email.ToUpper()));

                Int32 nVerificacion = calcularDVH(idUsuario);
                actualizarDVH(idUsuario, nVerificacion);
                BRDVVertical.actualizarUsuarios("TransArte_Usuarios");
                BRBitacora.registrarEvento("Usuario dado de alta: " + usuario, BeanException.Critico);
                return idUsuario;
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public static int modiUsuario(int idUsuario, string usuario, string contrasena, string email, bool bloqueado, bool baja, string motivo)
        {
            try
            {
                BOUsuarios bo = new BOUsuarios();
                bo.UpdateBy("Admin", idUsuario, BRSeguridad.encriptar(usuario.ToUpper()), BRSeguridad.encriptar(contrasena), BRSeguridad.encriptar(email.ToUpper()), (bloqueado ? 1 : 0), (baja ? 1 : 0), BRSeguridad.encriptar(motivo.ToUpper()));
                Int32 nVerificacion = calcularDVH(idUsuario);
                actualizarDVH(idUsuario, nVerificacion);
                BRDVVertical.actualizarUsuarios("TransArte_Usuarios");
                BRBitacora.registrarEvento("Modificación de Usuario : " + usuario, BeanException.Critico);
                return idUsuario;
            }
            catch (Exception ex)
            {
                throw;
            }

        }
        
        static SmtpClient GetSmtpClient(string host, int port, string user, string password, bool enableSsl)
        {
            SmtpClient smtpClient = new SmtpClient();
            smtpClient.Host = host;
            smtpClient.Port = port;
            NetworkCredential cred = new NetworkCredential(user, password);
            smtpClient.EnableSsl = enableSsl;
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Timeout = 5000;
            smtpClient.Credentials = cred;
            return smtpClient;
        }
        public static Boolean enviarMailAlta(string usuario, string contrasena, string email)
        {
            SmtpClient smtpClient = GetSmtpClient("smtp.gmail.com", 587, "TransArteSrl@gmail.com", "maxicoedo", true);
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("TransArteSrl@gmail.com");
            mail.To.Add(email);
            mail.Subject = " Sistema TransArte = Alta de usuario.-";
            string mesageMail = "Su nombre de usuario es: <br> " + usuario + " <br>  el mismo ha sido dado de alta al sistema, la contraseña es: <br> " + contrasena + "  <br> Ingrese al sistema TransArte y actualice sus datos y cambie su contraseña por una nueva.- <br><br>Atte.: TransArte";
            mail.IsBodyHtml = true;
            mail.Body = mesageMail;
            AlternateView htmlview = default(AlternateView);
            htmlview = AlternateView.CreateAlternateViewFromString(mesageMail, null, "text/html");
            mail.AlternateViews.Add(htmlview);
            try
            {
                smtpClient.Send(mail);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public static Boolean enviarMailModificar(string usuario, string contrasena, string email)
        {
            SmtpClient smtpClient = GetSmtpClient("smtp.gmail.com", 587, "TransArteSrl@gmail.com", "maxicoedo", true);
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("TransArteSrl@gmail.com");
            mail.To.Add(email);
            mail.Subject = " Sistema TransArte = Modificación de datos.-";
            string mesageMail = "Por motivos de seguridad se han modificado sus datos, su contraseña es :  <br> " + (contrasena == "" ? "LA QUE VENIA USANDO" : contrasena) + "  <br> su usuario es:  <br> " + usuario + "  <br> Ingrese al sistema TransArte y actualice sus datos y cambie su contraseña por una nueva.- <br><br>Atte.: TransArte";
            mail.IsBodyHtml = true;
            mail.Body = mesageMail;
            AlternateView htmlview = default(AlternateView);
            htmlview = AlternateView.CreateAlternateViewFromString(mesageMail, null, "text/html");
            mail.AlternateViews.Add(htmlview);
            try
            {
                smtpClient.Send(mail);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public static string desbloquearPorUsuario(string usuario, string password)
        {
            try
            {
                BOUsuarios bo = new BOUsuarios();
                bo.UpdateBy("DesbloquearPorNombre", BRSeguridad.encriptar(usuario.ToUpper()), BRSeguridad.encriptar(password));

                //Obtengo el id del ultimo agregado para verificación de integridad
                DataSet ds = bo.GetByN("usuario", BRSeguridad.encriptar(usuario.ToUpper()));
                string email = "";
                int id = 0;
                if (ds.Tables[0].Rows.Count != 0)
                {
                    id = (int)ds.Tables[0].Rows[0]["id"];
                    email = Convert.ToString(ds.Tables[0].Rows[0]["email"]);
                    Int32 nVerificacion = calcularDVH(id);
                    actualizarDVH(id, nVerificacion);
                    BRDVVertical.actualizarBitacora("TransArte_Usuarios");
                }
                BRBitacora.registrarEvento( "Usuario DesBloqueado: " + usuario , BeanException.Moderado);
                return email;
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public static void modificarByIdUsuario(int idUsuario, string contrasena, string email, string nombre, string apellido, string razonSocial, string esCuit, string cuit_cuil)
        {
            try
            {
                BOUsuarios bo = new BOUsuarios();
                bo.UpdateBy("IdUsuario", idUsuario,  BRSeguridad.encriptar(contrasena),   BRSeguridad.encriptar(email.ToUpper()),  BRSeguridad.encriptar(nombre.ToUpper()),  BRSeguridad.encriptar(apellido.ToUpper()),  BRSeguridad.encriptar(razonSocial.ToUpper()), esCuit,  BRSeguridad.encriptar(cuit_cuil.ToUpper()));
                Int32 nVerificacion = calcularDVH(idUsuario);
                actualizarDVH(idUsuario, nVerificacion);
                BRDVVertical.actualizarUsuarios("TransArte_Usuarios");
                BRBitacora.registrarEvento("Modificación de Usuario : " +  idUsuario, BeanException.Critico);
            }
            catch (Exception ex)
            {
                throw;
            }
        
        
        }
        
        public static DataSet buscarPorIdGrupo(int idGrupo)
        {
            try
            {
                BOUsuarios bo = new BOUsuarios();
                return bo.GetByN("IdGrupo", idGrupo); // retorna DataSet
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public static void bloquearPorUsuario(string usuario, string motivo)
        {
            try
            {                
                BOUsuarios bo = new BOUsuarios();
                bo.UpdateBy("nombreusuario",  BRSeguridad.encriptar(usuario.ToUpper()),  BRSeguridad.encriptar(motivo.ToUpper()));

                //Obtengo el id del ultimo agregado para verificación de integridad
                DataSet ds = bo.GetByN("usuario",  BRSeguridad.encriptar(usuario.ToUpper()));
                int id = 0;
                if (ds.Tables[0].Rows.Count != 0)
                {
                    id = (int)ds.Tables[0].Rows[0]["id"];
                    Int32 nVerificacion = calcularDVH(id);
                    actualizarDVH(id, nVerificacion);
                    BRDVVertical.actualizarBitacora("TransArte_Usuarios");
                }
                BRBitacora.registrarEvento("Usuario Bloqueado: id" + id + " usuario: " + usuario, BeanException.Moderado);

            }
            catch (Exception ex)
            {
                throw ;
            }
        }
        public static DataSet buscarUsuarios(string usuario, string apellido, string razonSocial)
        {
            try
            {
                BOUsuarios bo = new BOUsuarios();
                return bo.GetByN("UsuApeRaz",  BRSeguridad.encriptar(usuario.ToUpper()),  BRSeguridad.encriptar(apellido.ToUpper()),  BRSeguridad.encriptar(razonSocial.ToUpper()));
            }
            catch (Exception ex)
            {
                throw ;
            }
        }


        public static DataSet buscarTodos()
        {
            try
            {
                BOUsuarios bo = new BOUsuarios();
                return bo.GetAll();
            }
            catch (Exception ex)
            {
                throw ;
            }
        }


        public static DataSet buscarPorId(int id)
        {
            try
            {
                BOUsuarios bo = new BOUsuarios();
                return bo.GetByN("id", id);
            }
            catch (Exception ex)
            {
                throw ;
            }
        }
        
        public static DataSet buscarPorUsuario(string usuario)
        {
            try
            {
                BOUsuarios bo = new BOUsuarios();
                return bo.GetByN("Usuario",  BRSeguridad.encriptar(usuario.ToUpper()));
            }
            catch (Exception ex)
            {
                throw ;
            }
        }
        private static Int32 calcularDVH(int id)
        {
            // Calcula el valor numerico de la suma de todos los caracteres de los campos.
            try
            {
                Int32 nVerificacion = 0;
                BOUsuarios bo = new BOUsuarios();
                DataSet ds = bo.GetByN("Id", id);
                if (ds.Tables[0].Rows.Count != 0)
                {
                    string sCadena = "";
                    int nCantColumnas = ds.Tables[0].Columns.Count - 2;
                    for (int i = 0; i <= nCantColumnas; i++)
                    {
                        if (typeof(DateTime) == ds.Tables[0].Rows[0][i].GetType())
                        {
                            sCadena = String.Concat(sCadena, Convert.ToDateTime(ds.Tables[0].Rows[0][i]).Ticks);
                        }
                        else
                        {
                            sCadena = String.Concat(sCadena, Convert.ToString(ds.Tables[0].Rows[0][i]));
                        }
                    }

                    for (int i2 = 0; i2 <= sCadena.Length - 1; i2++)
                    {
                        char sPos = Convert.ToChar(sCadena.Substring(i2, 1));
                        nVerificacion = nVerificacion + Convert.ToInt32(sPos);
                    }

                }
                return nVerificacion;
            }
            catch (Exception ex)
            {
                throw ;
            }

        }

        public static Boolean validarIntegridadHorizontal(BeanUsuario usuario)
        {
            try
            {   
                BOUsuarios bo = new BOUsuarios();
                DataSet ds = bo.GetByN("Consistencia", "");

                //Mensaje de Inconsistencia
                String identificador = "";

                if (ds.Tables[0].Rows.Count == 0)
                    return true; // la tabla de usuarios está vacía.

                Int32 nVerificacion = 0;
                Int32 nSuma = 0;
                string sCadena = "";
                int j, y;
                j = 0;

                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    nVerificacion = 0;
                    sCadena = "";
                    for (int i = 0; i <= ds.Tables[0].Columns.Count - 2; i++)
                    {   // Armo un string largo con todos los campos de la tabla.
                        if (i == 0)
                        {
                            identificador = String.Concat(sCadena, Convert.ToString(dr[i]));
                        }
                        if (typeof(DateTime) == dr[i].GetType())
                        {
                            sCadena = String.Concat(sCadena, Convert.ToDateTime(dr[i]).Ticks);
                        }
                        else
                        {
                            sCadena = String.Concat(sCadena, Convert.ToString(dr[i]));
                        }
                    }
                    for (int i2 = 0; i2 <= sCadena.Length - 1; i2++)
                    {   // Obtengo el valor en int de cada caracter del string largo
                        char sPos = Convert.ToChar(sCadena.Substring(i2, 1));
                        nVerificacion = nVerificacion + Convert.ToInt32(sPos);

                    }

                    y = Convert.ToInt32(ds.Tables[0].Rows[j]["Verificacion"]);
                    if (nVerificacion != y)
                    {   //La suma de verificación Horizontal no corresponde. No sigo.
                        BRBitacora.registrarEvento( "Consist. Horizontal incorrecta en Tabla: TransArte_Usuarios id = " + ds.Tables[0].Rows[j]["id"], BeanException.Critico);
                        usuario.addIntegridad(new BeanIntegridad(identificador, "TransArte_Usuarios"));
                    }
                    nSuma = nSuma + nVerificacion;
                    j = j + 1;


                } // Fin Recorro todas las filas de la tabla
                Int32 nIntVertical = BRDVVertical.consistenciaVertical("TransArte_Usuarios");
                if (!nIntVertical.Equals(nSuma))
                {
                    BRBitacora.registrarEvento("Consist. Vertical incorrecta en Tabla: TransArte_Usuarios", BeanException.Critico);
                    usuario.addIntegridad(new BeanIntegridad("", "TransArte_Usuarios"));
                    return false;
                }
                else
                    return true;
            }
            catch (Exception ex)
            {
                throw ;
            }

        }

        public static Boolean corregirIntegridad()
        {
            try
            {
                BOUsuarios bo = new BOUsuarios();
                DataSet ds = bo.GetByN("Consistencia", "");
                int y, j;


                if (ds.Tables[0].Rows.Count == 0)
                    return true; // la tabla de usuarios está vacía.

                Int32 nVerificacion = 0;
                Int32 nSuma = 0;
                string sCadena = "";
                j = 0;
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    nVerificacion = 0;
                    sCadena = "";
                    for (int i = 0; i <= ds.Tables[0].Columns.Count - 2; i++)
                    {   // Armo un string largo con todos los campos de la tabla.
                         if (typeof(DateTime) == dr[i].GetType())
                        {
                            sCadena = String.Concat(sCadena,  Convert.ToDateTime(dr[i]).Ticks);
                        }else
                        {
                            sCadena = String.Concat(sCadena, Convert.ToString(dr[i]));
                        }
                    }

                    for (int i2 = 0; i2 <= sCadena.Length - 1; i2++)
                    {   // Obtengo el valor en int de cada caracter del string largo
                        char sPos = Convert.ToChar(sCadena.Substring(i2, 1));
                        nVerificacion = nVerificacion + Convert.ToInt32(sPos);
                    }
                    bo.UpdateBy("Verificacion", dr[0], nVerificacion);
                    y = Convert.ToInt32(ds.Tables[0].Rows[j]["Verificacion"]);
                    nSuma = nSuma + nVerificacion;
                    j = j + 1;
                } // Fin Recorro todas las filas de la tabla

                Int32 nIntVertical = BRDVVertical.consistenciaVertical("TransArte_Usuarios");
                if (!nIntVertical.Equals(nSuma))
                {
                    BRDVVertical.actualizarUsuarios("TransArte_Usuarios");
                    BRBitacora.registrarEvento("Rev. Consist. Vertical Tabla TransArte_Usuarios:OK!", BeanException.Critico);
                }

                BRBitacora.registrarEvento("Rev. Consist. Horizontal Tabla TransArte_Usuarios:OK!", BeanException.Critico);
                return true;
            }
            catch (Exception ex)
            {
                throw ;
            }
        }

        private static void actualizarDVH(int id, double nValor)
        {
            BOUsuarios bo = new BOUsuarios();
            try
            {
                bo.UpdateBy("Verificacion", id, nValor);
            }
            catch (Exception ex)
            {
                throw ;
            }

        }
    }
}