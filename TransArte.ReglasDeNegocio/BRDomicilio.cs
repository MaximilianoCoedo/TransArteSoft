using System;
using System.Data;
using ProyTransArte.BeanObjetos;
using ProyTransArte.ObjetosDeNegocio;

namespace ProyTransArte.ReglasDeNegocio
{
    public class BRDomicilio
    {
        
        public static DataSet buscarPorIdusuario(int idUsuario)
        {
            try
            {
                BODomicilios bo = new BODomicilios();
                return bo.GetByN("IdUsuario", idUsuario); // retorna DataSet
            }
            catch (Exception ex)
            {
                
                throw;
            }
        }
        public static int agregarDomicilioUsuario(int idUsuario, string domicilio, string idLocalidad, string latitud, string longitud, string idCodPostal)
        {
            try
            {
                BODomicilios bo = new BODomicilios();
                int idDomicilio = bo.Add(idUsuario, BRSeguridad.encriptar(domicilio.ToUpper()), (idLocalidad == "" ? null : idLocalidad), BRSeguridad.encriptar(latitud.ToUpper()), BRSeguridad.encriptar(longitud.ToUpper()), (idCodPostal == "" ? null : idCodPostal));
                Int32 nVerificacion = calcularDVH(idDomicilio);
                actualizarDVH(idDomicilio, nVerificacion);
                BRDVVertical.actualizarDomicilios("TransArte_Domicilios");
                return idDomicilio;
            }
            catch (Exception ex)
            {
                
                throw;
            }
        }
        public static void modificarDomicilio(int idDomicilio, string domicilio, string idLocalidad, string latitud, string longitud, string idCodPostal)
        {
            try
            {
                BODomicilios bo = new BODomicilios();
                bo.UpdateBy("IdDomicilio", idDomicilio, BRSeguridad.encriptar(domicilio.ToUpper()), (idLocalidad == "" ? null : idLocalidad), BRSeguridad.encriptar(latitud.ToUpper()), BRSeguridad.encriptar(longitud.ToUpper()), (idCodPostal == "" ? null : idCodPostal));
                Int32 nVerificacion = calcularDVH(idDomicilio);
                actualizarDVH(idDomicilio, nVerificacion);
                BRDVVertical.actualizarDomicilios("TransArte_Domicilios");
            }
            catch (Exception ex)
            {

                throw;
            }
        }
        public static void bajaDomicilio(int idDomicilio)
        {
            try
            {
                BODomicilios bo = new BODomicilios();
                bo.Delete(idDomicilio);
                Int32 nVerificacion = calcularDVH(idDomicilio);
                actualizarDVH(idDomicilio, nVerificacion);
                BRDVVertical.actualizarDomicilios("TransArte_Domicilios");
            }
            catch (Exception ex)
            {

                throw;
            }
        }
        private static Int32 calcularDVH(int id)
        {
            // Calcula el valor numerico de la suma de todos los caracteres de los campos.
            try
            {
                Int32 nVerificacion = 0;
                BODomicilios bo = new BODomicilios();
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
                throw;
            }

        }

        public static Boolean validarIntegridadHorizontal(BeanUsuario usuario)
        {

            try
            {
                BODomicilios bo = new BODomicilios();
                DataSet ds = bo.GetByN("Consistencia", "");
                String identificador = "";
                if (ds.Tables[0].Rows.Count == 0)
                    return true; // la tabla de bitacora está vacía.

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
                    {   //La suma de verificación Horizontal no corresponde. 
                        BRBitacora.registrarEvento("Consist. Horizontal incorrecta en Tabla: Domicilios id = " + ds.Tables[0].Rows[j]["id"], BeanException.Critico);
                        usuario.addIntegridad(new BeanIntegridad(identificador, "TransArte_Domicilios "));
                    }
                    nSuma = nSuma + nVerificacion;
                    j = j + 1;

                } // Fin Recorro todas las filas de la tabla
                Int32 nIntVertical = BRDVVertical.consistenciaVertical("TransArte_Domicilios");
                if (!nIntVertical.Equals(nSuma))
                {
                    BRBitacora.registrarEvento("Consist. Vertical incorrecta en Tabla: TransArte_Domicilios ", BeanException.Critico);
                    usuario.addIntegridad(new BeanIntegridad("", "TransArte_Domicilios"));
                    return false;
                }
                else
                    return true;
            }
            catch (Exception ex)
            {
                throw;
            }

        }

        public static Boolean corregirIntegridad()
        {
            try
            {
                BODomicilios bo = new BODomicilios();
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
                    bo.UpdateBy("Verificacion", dr[0], nVerificacion);
                    y = Convert.ToInt32(ds.Tables[0].Rows[j]["Verificacion"]);
                    nSuma = nSuma + nVerificacion;
                    j = j + 1;
                } // Fin Recorro todas las filas de la tabla

                Int32 nIntVertical = BRDVVertical.consistenciaVertical("TransArte_Domicilios");
                if (!nIntVertical.Equals(nSuma))
                {
                    BRDVVertical.actualizarDomicilios("TransArte_Domicilios");
                    BRBitacora.registrarEvento("Rev. Consist. Vertical Tabla TransArte_Domicilios:OK!", BeanException.Critico);
                }
                BRBitacora.registrarEvento("Rev. Consist. Horizontal Tabla TransArte_Domicilios:OK!", BeanException.Critico);
                return true;
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        private static void actualizarDVH(int id, double nValor)
        {
            BODomicilios bo = new BODomicilios();
            try
            {
                bo.UpdateBy("Verificacion", id, nValor);
            }
            catch (Exception ex)
            {
                
                throw;
            }

        }
    }
}