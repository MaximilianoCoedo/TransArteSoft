using System;
using System.Data;
using System.Web;
using ProyTransArte.BeanObjetos;
using ProyTransArte.ObjetosDeNegocio;




namespace ProyTransArte.ReglasDeNegocio
{
    public class BRBitacora
    {
        public static int registrarEvento(String sAccion, int iCriticidad)
        {

            try
            {
                int idUsuario = 0;
                if (HttpContext.Current.Session != null && HttpContext.Current.Session["usuarioActual"] != null)
                {
                    BeanUsuario usuarioActual = (BeanUsuario)HttpContext.Current.Session["usuarioActual"];
                    idUsuario = usuarioActual.id;
                }

                
                BOBitacora bo = new BOBitacora();
                //Obtengo el id del ultimo agregado para verificaci�n de integridad
                int idBitacora = bo.Add(idUsuario, sAccion, iCriticidad);

                Int32 nVerificacion = calcularDVH(idBitacora);
                actualizarDVH(idBitacora, nVerificacion);
                BRDVVertical.actualizarBitacora("TransArte_Bitacora");

                return idBitacora;
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public static DataSet buscarPorFiltro(string fechaDesde, string fechaHasta, string idUsuario, string idCriticidad, string descEvento)
        {
            try
            {
                BOBitacora bo = new BOBitacora();
                return bo.GetByN("Filtro", fechaDesde, fechaHasta, idUsuario, idCriticidad, descEvento);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public static void eliminarPorUsuario(string idUsuario)
        {
            try
            {
                BOBitacora bo = new BOBitacora();
                bo.DeleteBy("IdUsuario", Convert.ToInt32(idUsuario));
                BRBitacora.registrarEvento("Se eliminaron los registro de la Tabla: TransArte_Bitacora por idUsuario = " + idUsuario, BeanException.Critico);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public static void eliminarPorDescripcion(string descEvento)
        {
            try
            {
                BOBitacora bo = new BOBitacora();
                bo.DeleteBy("Descripcion", descEvento);
                BRBitacora.registrarEvento("Se eliminaron los registro de la Tabla: TransArte_Bitacora por descripcion = " + descEvento, BeanException.Critico);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public static void eliminarPorFiltro(string fechaDesde, string fechaHasta, string idUsuario, string idCriticidad, string descEvento)
        {
            try
            {
                BOBitacora bo = new BOBitacora();
                bo.DeleteBy("Filtro", fechaDesde, fechaHasta, idUsuario, idCriticidad, descEvento);
                BRBitacora.registrarEvento("Se eliminaron los registro de la Tabla: TransArte_Bitacora por Filtro " + fechaDesde + " - " + fechaHasta + " - " + idUsuario + " - " + idCriticidad + " - " + descEvento, BeanException.Critico);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public static void eliminarPorRangoFecha(string fechaDesde, string fechaHasta)
        {
            try
            {
                BOBitacora bo = new BOBitacora();
                bo.DeleteBy("Fechas", fechaDesde, fechaHasta);
                BRBitacora.registrarEvento("Se eliminaron los registro de la Tabla: TransArte_Bitacora por fechaDesde = " + fechaDesde + " fechaHasta = " + fechaHasta, BeanException.Critico);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public static void eliminarPorCriticidad(string idCriticidad)
        {
            try
            {
                BOBitacora bo = new BOBitacora();
                bo.DeleteBy("IdCriticidad", idCriticidad);
                BRBitacora.registrarEvento("Se eliminaron los registro de la Tabla: TransArte_Bitacora por IdCriticidad = " + idCriticidad , BeanException.Critico);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public static void eliminarTodos()
        {
            try
            {
                BOBitacora bo = new BOBitacora();
                bo.DeleteBy("Todos"); ;
                BRBitacora.registrarEvento("Se eliminaron TODOS los registro de la Tabla: TransArte_Bitacora " , BeanException.Critico);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        //PARA LA VERIFICACION DE LA INTEGRIDAD

        private static Int32 calcularDVH(int id)
        {
            // Calcula el valor numerico de la suma de todos los caracteres de los campos.
            try
            {
                Int32 nVerificacion = 0;
                BOBitacora bo = new BOBitacora();
                DataSet ds = bo.GetByN("id", id);
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
            String identificador = "";
            try
            {
                BOBitacora bo = new BOBitacora();
                DataSet ds = bo.GetByN("Consistencia", "");
                if (ds.Tables[0].Rows.Count == 0)
                    return true; // la tabla de bitacora est� vac�a.

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

                    y = Convert.ToInt32(ds.Tables[0].Rows[j]["Verificacion"]);
                    if (nVerificacion != y)
                    {   //La suma de verificaci�n Horizontal no corresponde. 
                        BRBitacora.registrarEvento( "Consist. Horizontal incorrecta en Tabla: TransArte_Bitacora id = " + ds.Tables[0].Rows[j]["id"], BeanException.Critico);
                       usuario.addIntegridad(new BeanIntegridad(identificador, "TransArte_Bitacora"));
                    }
                    nSuma = nSuma + nVerificacion;
                    j = j + 1;

                } // Fin Recorro todas las filas de la tabla
                Int32 nIntVertical = BRDVVertical.consistenciaVertical("TransArte_Bitacora");
                if (!nIntVertical.Equals(nSuma))
                {
                    BRBitacora.registrarEvento( "Consist. Vertical incorrecta en Tabla: TransArte_Bitacora", BeanException.Critico);
                    usuario.addIntegridad(new BeanIntegridad("", "TransArte_Bitacora"));
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
                BOBitacora bo = new BOBitacora();
                DataSet ds = bo.GetByN("Consistencia", "");
                int y, j;

                if (ds.Tables[0].Rows.Count == 0)
                    return true; // la tabla de bitacora est� vac�a.

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

                    // }
                    nSuma = nSuma + nVerificacion;

                    j = j + 1;
                } // Fin Recorro todas las filas de la tabla

                Int32 nIntVertical = BRDVVertical.consistenciaVertical("TransArte_Bitacora");
                if (!nIntVertical.Equals(nSuma))
                {
                    BRDVVertical.actualizarBitacora("TransArte_Bitacora");
                    BRBitacora.registrarEvento("Rev. Consist. Vertical Tabla TransArte_Bitacora:OK!", BeanException.Critico);
                }

                BRBitacora.registrarEvento("Rev. Consist. Horizontal Tabla TransArte_Bitacora:OK!", BeanException.Critico);
                return true;
            }
            catch (Exception ex)
            {
                throw ;
            }
        }

        private static void actualizarDVH(int id, double nValor)
        {
            BOBitacora bo = new BOBitacora();
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