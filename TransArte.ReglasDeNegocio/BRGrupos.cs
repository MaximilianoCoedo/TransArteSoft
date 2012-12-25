using System;
using System.Data;
using ProyTransArte.BeanObjetos;
using ProyTransArte.ObjetosDeNegocio;


namespace ProyTransArte.ReglasDeNegocio
{
    public class BRGrupos
    {

        public static int agregarGrupo(string descripcion )
        {
            try
            {

                BOGrupos bo = new BOGrupos();
                int id = bo.Add(descripcion);
                Int32 nVerificacion = calcularDVH(id);
                actualizarDVH(id, nVerificacion);
                BRDVVertical.actualizarGrupos("TransArte_Grupos");
                BRBitacora.registrarEvento("Alta de grupo :" + descripcion + " Id: " + id, BeanException.Critico);
                return id;

            }
            catch (Exception ex)
            {
                throw ;
            }
        }
        public static void eliminarPorIdGrupo(int idGrupo)
        {
            try
            {
                BOGrupos bo = new BOGrupos();
                bo.Delete(idGrupo);
                Int32 nValor = calcularDVH(idGrupo);
                actualizarDVH(idGrupo, nValor);
                BRDVVertical.actualizarGrupos("TransArte_Grupos");
                BRBitacora.registrarEvento("Grupo (ID): " + Convert.ToString(idGrupo) + " Eliminado.", BeanException.Critico);
            }
            catch (Exception ex)
            {
                throw ;
            }
        }


        public static DataSet getGruposPorIdusuario(int idUsuario)
        {
            try
            {
                BOGrupos bo = new BOGrupos();
                return bo.GetByN("IdUsuario", idUsuario);
            }
            catch (Exception ex)
            {
                throw ;
            }
        }

        public static void modificarGrupo(int idGrupo, string descGrupo)
        {
            try
            {
                BOGrupos bo = new BOGrupos();
                bo.UpdateBy("IdGrupo", idGrupo, descGrupo);
                Int32 nValor = calcularDVH(idGrupo);
                actualizarDVH(idGrupo, nValor);
                BRDVVertical.actualizarGrupos("TransArte_Grupos");
                BRBitacora.registrarEvento("Grupo (ID): " + Convert.ToString(idGrupo) + " Modificado.", BeanException.Moderado);
            }
            catch (Exception ex)
            {
                throw ;
            }
        }

        public static DataSet buscarTodosActivos()
        {
            try
            {
                
                BOGrupos bo = new BOGrupos();
                return bo.GetByN("AllActivos","");
            }
            catch (Exception ex)
            {
                throw ;
            }
        }

        public static DataSet buscarPorNombre(string nombreGrupo)
        {
            try
            {
                BOGrupos bo = new BOGrupos();
                return bo.GetByN("PorNombre", nombreGrupo);
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
                BOGrupos bo = new BOGrupos();
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
                BOGrupos bo = new BOGrupos();
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
                        BRBitacora.registrarEvento("Consist. Horizontal incorrecta en Tabla: TransArte_Grupos id = " + ds.Tables[0].Rows[j]["id"], BeanException.Critico);
                        usuario.addIntegridad(new BeanIntegridad(identificador, "TransArte_Grupos"));
                    }
                    nSuma = nSuma + nVerificacion;
                    j = j + 1;

                } // Fin Recorro todas las filas de la tabla
                Int32 nIntVertical = BRDVVertical.consistenciaVertical("TransArte_Grupos");
                if (!nIntVertical.Equals(nSuma))
                {
                    BRBitacora.registrarEvento("Consist. Vertical incorrecta en Tabla: TransArte_Grupos", BeanException.Critico);
                    usuario.addIntegridad(new BeanIntegridad("", "TransArte_Grupos"));
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
                BOGrupos bo = new BOGrupos();
                DataSet ds = bo.GetByN("Consistencia", "");
                int y, j;


                if (ds.Tables[0].Rows.Count == 0)
                    return true; // la tabla está vacía.

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

                Int32 nIntVertical = BRDVVertical.consistenciaVertical("TransArte_Grupos");
                if (!nIntVertical.Equals(nSuma))
                {
                    BRDVVertical.actualizarGrupos("TransArte_Grupos");
                    BRBitacora.registrarEvento("Rev. Consist. Vertical Tabla TransArte_Grupos:OK!", BeanException.Critico);
                }
                BRBitacora.registrarEvento("Rev. Consist. Horizontal Tabla TransArte_Grupos:OK!", BeanException.Critico);
                return true;
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        private static void actualizarDVH(int id, double nValor)
        {
            BOGrupos bo = new BOGrupos();
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