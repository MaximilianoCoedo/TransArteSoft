using System;
using System.Data;
using ProyTransArte.BeanObjetos;
using ProyTransArte.ObjetosDeNegocio;


namespace ProyTransArte.ReglasDeNegocio
{
    public class BRHojaDeRuta
    {
        /*public static int agregarHojaDeRuta(int idServicio, string descripcion, string viaticos, string tiempoDestino,string posicionX,string posicionY)
        {

            try
            {
                BOHojaDeRuta bo = new BOHojaDeRuta();
                int id = bo.Add("","");
                BRBitacora.registrarEvento(String.Format("Alta de HojaDeRuta {0}", ""));
                Int32 nVerificacion = calcularDVH(id);
                actualizarDVH(id, nVerificacion);
                BRDVVertical.actualizarHojaDeRuta("TransArte_HojaDeRuta");
                return id;

            }
            catch (Exception ex)
            {
                
                throw;
            }
        }*/
        /*public static void eliminarHojaDeRuta(int id)
        {
            try
            {
                BOHojaDeRuta bo = new BOHojaDeRuta();
                bo.Delete(id);
                Int32 nValor = calcularDVH(id);
                actualizarDVH(id, nValor);
                BRDVVertical.actualizarHojaDeRuta("TransArte_HojaDeRuta");
                BRBitacora.registrarEvento("HojaDeRuta (ID): " + Convert.ToString(id) + " Eliminado.");
            }
            catch (Exception ex)
            {
                
                throw;
            }
        }
        public static void modificarHojaDeRuta(int id, int idServicio, string descripcion, string viaticos, string tiempoDestino, string posicionX, string posicionY)
        {
            try
            {
                BOHojaDeRuta bo = new BOHojaDeRuta();
                bo.Update("", "");
                Int32 nValor = calcularDVH(id);
                actualizarDVH(id, nValor);
                BRDVVertical.actualizarHojaDeRuta("TransArte_HojaDeRuta");
            }
            catch (Exception ex)
            {
                
                throw;
            }
        }
        public static DataSet buscarPorServicio(int idServicio)
        {
            try
            {
                return new DataSet();
            }
            catch (Exception ex)
            {
                
                throw;
            }
        }
        public static DataSet buscarPorId(int id)
        {
            try
            {
                return new DataSet();
            }
            catch (Exception ex)
            {
                
                throw;
            }
        }

        public static DataSet buscarTodos()
        {
            try
            {
                return new DataSet();
            }
            catch (Exception ex)
            {
                
                throw;
            }
        }
        */


        private static Int32 calcularDVH(int id)
        {
            // Calcula el valor numerico de la suma de todos los caracteres de los campos.
            try
            {
                Int32 nVerificacion = 0;
                BOHojaDeRuta bo = new BOHojaDeRuta();
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
                BOHojaDeRuta bo = new BOHojaDeRuta();
                DataSet ds = bo.GetByN("Consistencia", "");
                String identificador = "";
                if (ds.Tables[0].Rows.Count == 0)
                    return true; // la tabla está vacía.

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
                        BRBitacora.registrarEvento("Consist. Horizontal incorrecta en Tabla: TransArte_HojaDeRuta id = " + ds.Tables[0].Rows[j]["id"], BeanException.Critico);
                        usuario.addIntegridad(new BeanIntegridad(identificador, "TransArte_HojaDeRuta"));
                    }
                    nSuma = nSuma + nVerificacion;
                    j = j + 1;

                } // Fin Recorro todas las filas de la tabla
                Int32 nIntVertical = BRDVVertical.consistenciaVertical("TransArte_HojaDeRuta");
                if (!nIntVertical.Equals(nSuma))
                {
                    BRBitacora.registrarEvento("Consist. Vertical incorrecta en Tabla: TransArte_HojaDeRuta", BeanException.Critico);
                    usuario.addIntegridad(new BeanIntegridad("", "TransArte_HojaDeRuta"));
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
                BOHojaDeRuta bo = new BOHojaDeRuta();
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

                Int32 nIntVertical = BRDVVertical.consistenciaVertical("TransArte_HojaDeRuta");
                if (!nIntVertical.Equals(nSuma))
                {
                    BRDVVertical.actualizarHojaDeRuta("TransArte_HojaDeRuta");
                    BRBitacora.registrarEvento("Rev. Consist. Vertical Tabla TransArte_HojaDeRuta:OK!", BeanException.Critico);
                }
                BRBitacora.registrarEvento("Rev. Consist. Horizontal Tabla TransArte_HojaDeRuta:OK!", BeanException.Critico);
                return true;
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        private static void actualizarDVH(int id, double nValor)
        {
            BOHojaDeRuta bo = new BOHojaDeRuta();
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