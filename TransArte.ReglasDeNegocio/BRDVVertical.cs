using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using ProyTransArte.ObjetosDeNegocio;
using ProyTransArte.BeanObjetos;


namespace ProyTransArte.ReglasDeNegocio
{
    public class BRDVVertical
    {


        public static void actualizarBitacora(String sTabla)
        {
            try
            {
                BODVVertical bo = new BODVVertical();
                bo.UpdateBy("Bitacora", sTabla);
                Int32 idDVVertical = obtenerId(sTabla);
                Int32 nVerificacion = calcularDVH(idDVVertical);
                actualizarDVH(idDVVertical, nVerificacion);
                actualizarDVVerticales("TransArte_DVVerticales");
            }
            catch (Exception ex)
            {
                
                throw;
            }
        }
        public static void actualizarCodPostal(String sTabla)
        {
            try
            {
                BODVVertical bo = new BODVVertical();
                bo.UpdateBy("CodPostal", sTabla);
                Int32 idDVVertical = obtenerId(sTabla);
                Int32 nVerificacion = calcularDVH(idDVVertical);
                actualizarDVH(idDVVertical, nVerificacion);
                actualizarDVVerticales("TransArte_DVVerticales");
            }
            catch (Exception ex)
            {
                
                throw;
            }
        }

        public static void actualizarCriticidad(String sTabla)
        {
            try
            {
                BODVVertical bo = new BODVVertical();
                bo.UpdateBy("Criticidad", sTabla);
                Int32 idDVVertical = obtenerId(sTabla);
                Int32 nVerificacion = calcularDVH(idDVVertical);
                actualizarDVH(idDVVertical, nVerificacion);
                actualizarDVVerticales("TransArte_DVVerticales");
            }
            catch (Exception ex)
            {
                
                throw;
            }
        }

        public static void actualizarDepartamentos(String sTabla)
        {
            try
            {
                BODVVertical bo = new BODVVertical();
                bo.UpdateBy("Departamentos", sTabla);
                Int32 idDVVertical = obtenerId(sTabla);
                Int32 nVerificacion = calcularDVH(idDVVertical);
                actualizarDVH(idDVVertical, nVerificacion);
                actualizarDVVerticales("TransArte_DVVerticales");
            }
            catch (Exception ex)
            {
                
                throw;
            }
        }

        public static void actualizarDomicilios(String sTabla)
        {
            try
            {
                BODVVertical bo = new BODVVertical();
                bo.UpdateBy("Domicilios", sTabla);
                Int32 idDVVertical = obtenerId(sTabla);
                Int32 nVerificacion = calcularDVH(idDVVertical);
                actualizarDVH(idDVVertical, nVerificacion);
                actualizarDVVerticales("TransArte_DVVerticales");
            }
            catch (Exception ex)
            {

                throw;
            }
        }
        public static void actualizarDetalleFactura(String sTabla)
        {
            try
            {
                BODVVertical bo = new BODVVertical();
                bo.UpdateBy("DetalleFactura", sTabla);
                Int32 idDVVertical = obtenerId(sTabla);
                Int32 nVerificacion = calcularDVH(idDVVertical);
                actualizarDVH(idDVVertical, nVerificacion);
                actualizarDVVerticales("TransArte_DVVerticales");
            }
            catch (Exception ex)
            {
                
                throw;
            }
        }
        public static void actualizarDVVerticales(String sTabla)
        {
            try
            {
                BODVVertical bo = new BODVVertical();
                bo.UpdateBy("DVVerticales", sTabla);
                // no calculo el DVH porq si no entraria en un ciclico
            }
            catch (Exception ex)
            {
                
                throw;
            }
        }
        public static void actualizarEncabezadoFactura(String sTabla)
        {
            try
            {
                BODVVertical bo = new BODVVertical();
                bo.UpdateBy("EncabezadoFactura", sTabla);
                Int32 idDVVertical = obtenerId(sTabla);
                Int32 nVerificacion = calcularDVH(idDVVertical);
                actualizarDVH(idDVVertical, nVerificacion);
                actualizarDVVerticales("TransArte_DVVerticales");
            }
            catch (Exception ex)
            {
                
                throw;
            }
        }
        public static void actualizarEstadoServicio(String sTabla)
        {
            try
            {
                BODVVertical bo = new BODVVertical();
                bo.UpdateBy("EstadoServicio", sTabla);
                Int32 idDVVertical = obtenerId(sTabla);
                Int32 nVerificacion = calcularDVH(idDVVertical);
                actualizarDVH(idDVVertical, nVerificacion);
                actualizarDVVerticales("TransArte_DVVerticales");
            }
            catch (Exception ex)
            {
                
                throw;
            }
        }
        public static void actualizarGrupos(String sTabla)
        {
            try
            {
                BODVVertical bo = new BODVVertical();
                bo.UpdateBy("Grupos", sTabla);
                Int32 idDVVertical = obtenerId(sTabla);
                Int32 nVerificacion = calcularDVH(idDVVertical);
                actualizarDVH(idDVVertical, nVerificacion);
                actualizarDVVerticales("TransArte_DVVerticales");
            }
            catch (Exception ex)
            {
                
                throw;
            }
        }
        public static void actualizarGrupos_Permisos(String sTabla)
        {
            try
            {
                BODVVertical bo = new BODVVertical();
                bo.UpdateBy("Grupos_Permisos", sTabla);
                Int32 idDVVertical = obtenerId(sTabla);
                Int32 nVerificacion = calcularDVH(idDVVertical);
                actualizarDVH(idDVVertical, nVerificacion);
                actualizarDVVerticales("TransArte_DVVerticales");
            }
            catch (Exception ex)
            {
                
                throw;
            }
        }
        public static void actualizarHojaDeRuta(String sTabla)
        {
            try
            {
                BODVVertical bo = new BODVVertical();
                bo.UpdateBy("HojaDeRuta", sTabla);
                Int32 idDVVertical = obtenerId(sTabla);
                Int32 nVerificacion = calcularDVH(idDVVertical);
                actualizarDVH(idDVVertical, nVerificacion);
                actualizarDVVerticales("TransArte_DVVerticales");
            }
            catch (Exception ex)
            {
                
                throw;
            }
        }
        public static void actualizarLocalidades(String sTabla)
        {
            try
            {
                BODVVertical bo = new BODVVertical();
                bo.UpdateBy("Localidades", sTabla);
                Int32 idDVVertical = obtenerId(sTabla);
                Int32 nVerificacion = calcularDVH(idDVVertical);
                actualizarDVH(idDVVertical, nVerificacion);
                actualizarDVVerticales("TransArte_DVVerticales");
            }
            catch (Exception ex)
            {
                
                throw;
            }
        }
        public static void actualizarMantenimientos(String sTabla)
        {
            try
            {
                BODVVertical bo = new BODVVertical();
                bo.UpdateBy("Mantenimientos", sTabla);
                Int32 idDVVertical = obtenerId(sTabla);
                Int32 nVerificacion = calcularDVH(idDVVertical);
                actualizarDVH(idDVVertical, nVerificacion);
                actualizarDVVerticales("TransArte_DVVerticales");
            }
            catch (Exception ex)
            {
                
                throw;
            }
        }
        public static void actualizarObrasDeArte(String sTabla)
        {
            try
            {
                BODVVertical bo = new BODVVertical();
                bo.UpdateBy("ObrasDeArte", sTabla);
                Int32 idDVVertical = obtenerId(sTabla);
                Int32 nVerificacion = calcularDVH(idDVVertical);
                actualizarDVH(idDVVertical, nVerificacion);
                actualizarDVVerticales("TransArte_DVVerticales");
            }
            catch (Exception ex)
            {
                
                throw;
            }
        }
        public static void actualizarPermisos(String sTabla)
        {
            try
            {
                BODVVertical bo = new BODVVertical();
                bo.UpdateBy("Permisos", sTabla);
                Int32 idDVVertical = obtenerId(sTabla);
                Int32 nVerificacion = calcularDVH(idDVVertical);
                actualizarDVH(idDVVertical, nVerificacion);
                actualizarDVVerticales("TransArte_DVVerticales");
            }
            catch (Exception ex)
            {
                
                throw;
            }
        }
        public static void actualizarProvincias(String sTabla)
        {
            try
            {
                BODVVertical bo = new BODVVertical();
                bo.UpdateBy("Provincias", sTabla);
                Int32 idDVVertical = obtenerId(sTabla);
                Int32 nVerificacion = calcularDVH(idDVVertical);
                actualizarDVH(idDVVertical, nVerificacion);
                actualizarDVVerticales("TransArte_DVVerticales");
            }
            catch (Exception ex)
            {
                
                throw;
            }
        }
        public static void actualizarServicio_ServicioExtra(String sTabla)
        {
            try
            {
                BODVVertical bo = new BODVVertical();
                bo.UpdateBy("Servicio_ServicioExtra", sTabla);
                Int32 idDVVertical = obtenerId(sTabla);
                Int32 nVerificacion = calcularDVH(idDVVertical);
                actualizarDVH(idDVVertical, nVerificacion);
                actualizarDVVerticales("TransArte_DVVerticales");
            }
            catch (Exception ex)
            {
                
                throw;
            }
        }
        public static void actualizarServicios(String sTabla)
        {
            try
            {
                BODVVertical bo = new BODVVertical();
                bo.UpdateBy("Servicios", sTabla);
                Int32 idDVVertical = obtenerId(sTabla);
                Int32 nVerificacion = calcularDVH(idDVVertical);
                actualizarDVH(idDVVertical, nVerificacion);
                actualizarDVVerticales("TransArte_DVVerticales");
            }
            catch (Exception ex)
            {

                throw;
            }
        }
        public static void actualizarServicio_Domicilio(String sTabla)
        {
            try
            {
                BODVVertical bo = new BODVVertical();
                bo.UpdateBy("Servicio_Domicilio", sTabla);
                Int32 idDVVertical = obtenerId(sTabla);
                Int32 nVerificacion = calcularDVH(idDVVertical);
                actualizarDVH(idDVVertical, nVerificacion);
                actualizarDVVerticales("TransArte_DVVerticales");
            }
            catch (Exception ex)
            {

                throw;
            }
        }
        public static void actualizarServiciosExtra(String sTabla)
        {
            try
            {
                BODVVertical bo = new BODVVertical();
                bo.UpdateBy("ServiciosExtra", sTabla);
                Int32 idDVVertical = obtenerId(sTabla);
                Int32 nVerificacion = calcularDVH(idDVVertical);
                actualizarDVH(idDVVertical, nVerificacion);
                actualizarDVVerticales("TransArte_DVVerticales");
            }
            catch (Exception ex)
            {
                
                throw;
            }
        }
        public static void actualizarTipoFactura(String sTabla)
        {
            try
            {
                BODVVertical bo = new BODVVertical();
                bo.UpdateBy("TipoFactura", sTabla);
                Int32 idDVVertical = obtenerId(sTabla);
                Int32 nVerificacion = calcularDVH(idDVVertical);
                actualizarDVH(idDVVertical, nVerificacion);
                actualizarDVVerticales("TransArte_DVVerticales");
            }
            catch (Exception ex)
            {

                throw;
            }
        }
        public static void actualizarTelefonos(String sTabla)
        {
            try
            {
                BODVVertical bo = new BODVVertical();
                bo.UpdateBy("Telefonos", sTabla);
                Int32 idDVVertical = obtenerId(sTabla);
                Int32 nVerificacion = calcularDVH(idDVVertical);
                actualizarDVH(idDVVertical, nVerificacion);
                actualizarDVVerticales("TransArte_DVVerticales");
            }
            catch (Exception ex)
            {

                throw;
            }
        }
        public static void actualizarUsuarios(String sTabla)
        {
            try
            {
                BODVVertical bo = new BODVVertical();
                bo.UpdateBy("Usuarios", sTabla);
                Int32 idDVVertical = obtenerId(sTabla);
                Int32 nVerificacion = calcularDVH(idDVVertical);
                actualizarDVH(idDVVertical, nVerificacion);
                actualizarDVVerticales("TransArte_DVVerticales");
            }
            catch (Exception ex)
            {
                
                throw;
            }
        }
        public static void actualizarUsuarios_Grupos(String sTabla)
        {
            try
            {
                BODVVertical bo = new BODVVertical();
                bo.UpdateBy("Usuarios_Grupos", sTabla);
                Int32 idDVVertical = obtenerId(sTabla);
                Int32 nVerificacion = calcularDVH(idDVVertical);
                actualizarDVH(idDVVertical, nVerificacion);
                actualizarDVVerticales("TransArte_DVVerticales");
            }
            catch (Exception ex)
            {
                
                throw;
            }
        }
        public static void actualizarUsuarios_Permisos(String sTabla)
        {
            try
            {
                BODVVertical bo = new BODVVertical();
                bo.UpdateBy("Usuarios_Permisos", sTabla);
                Int32 idDVVertical = obtenerId(sTabla);
                Int32 nVerificacion = calcularDVH(idDVVertical);
                actualizarDVH(idDVVertical, nVerificacion);
                actualizarDVVerticales("TransArte_DVVerticales");
            }
            catch (Exception ex)
            {
                
                throw;
            }
        }
        public static void actualizarVehiculos(String sTabla)
        {
            try
            {
                BODVVertical bo = new BODVVertical();
                bo.UpdateBy("Vehiculos", sTabla);
                Int32 idDVVertical = obtenerId(sTabla);
                Int32 nVerificacion = calcularDVH(idDVVertical);
                actualizarDVH(idDVVertical, nVerificacion);
                actualizarDVVerticales("TransArte_DVVerticales");
            }
            catch (Exception ex)
            {
                
                throw;
            }
        }

        public static void actualizarVehiculos_Servicios(String sTabla)
        {
            try
            {
                BODVVertical bo = new BODVVertical();
                bo.UpdateBy("Vehiculos_Servicios", sTabla);
                Int32 idDVVertical = obtenerId(sTabla);
                Int32 nVerificacion = calcularDVH(idDVVertical);
                actualizarDVH(idDVVertical, nVerificacion);
                actualizarDVVerticales("TransArte_DVVerticales");
            }
            catch (Exception ex)
            {
                
                throw;
            }
        }

        public static Int32 obtenerId(string sTabla)
        {
            try
            {
                BODVVertical bo = new BODVVertical();
                DataSet ds = bo.GetByN("Tabla", sTabla);
                if (ds.Tables[0].Rows.Count == 0)
                    return 0;
                else
                    return Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }
            catch (Exception ex)
            {

                throw;
            }
        }
        public static Int32 consistenciaHorizontal(string sTabla)
        {
            try
            {
                BODVVertical bo = new BODVVertical();
                DataSet ds = bo.GetByN("Tabla", sTabla);
                if (ds.Tables[0].Rows.Count == 0)
                    return 0;
                else
                    return Convert.ToInt32(ds.Tables[0].Rows[0][1]);                   
            }
            catch (Exception ex)
            {
                
            throw;
            }
        }

        public static Int32 consistenciaVertical(string sTabla)
        {
            try
            {
                BODVVertical bo = new BODVVertical();
                DataSet ds = bo.GetByN("Tabla", sTabla);
                if (ds.Tables[0].Rows.Count == 0)
                    return 0;
                else
                    return Convert.ToInt32(ds.Tables[0].Rows[0][1]);
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        //PARA LA VERIFICACION DE LA INTEGRIDAD DE LA TABLA DVVERTICALES
        //NO ESTARÁ IMPLEMENTADA EN ESTA APLICACIÓN.

        private static Int32 calcularDVH(int id)
        {
            // Calcula el valor numerico de la suma de todos los caracteres de los campos.
            try
            {
                Int32 nVerificacion = 0;
                BODVVertical bo = new BODVVertical();
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
                BODVVertical bo = new BODVVertical();
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
                    if ( identificador!= "7") // SALTEO EL REGISTRO DE DVVERTICAL. 
                    {   //La suma de verificación Horizontal no corresponde. 
                        if ( nVerificacion != y ) 
                        {   //La suma de verificación Horizontal no corresponde. 
                            BRBitacora.registrarEvento("Consist. Horizontal incorrecta en Tabla: TransArte_DVVerticales id = " + ds.Tables[0].Rows[j]["id"], BeanException.Critico);
                            usuario.addIntegridad(new BeanIntegridad(identificador, "TransArte_DVVerticales"));
                        }
                        nSuma = nSuma + nVerificacion;
                    }
                    j = j + 1;

                } // Fin Recorro todas las filas de la tabla
                Int32 nIntVertical = BRDVVertical.consistenciaVertical("TransArte_DVVerticales");
                if (!nIntVertical.Equals(nSuma))
                {
                    BRBitacora.registrarEvento("Consist. Vertical incorrecta en Tabla: TransArte_DVVerticales ", BeanException.Critico);
                    usuario.addIntegridad(new BeanIntegridad("", "TransArte_DVVerticales"));
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
                BODVVertical bo = new BODVVertical();
                DataSet ds = bo.GetByN("Consistencia", "");
                int y, j;


                if (ds.Tables[0].Rows.Count == 0)
                    return true; // la tabla de usuarios está vacía.

                String identificador = "";
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
                    if (identificador != "7") // SALTEO EL REGISTRO DE DVVERTICAL. 
                    {
                        bo.UpdateBy("Verificacion", dr[0], nVerificacion);
                    }
                    y = Convert.ToInt32(ds.Tables[0].Rows[j]["Verificacion"]);
                    nSuma = nSuma + nVerificacion;
                    j = j + 1;
                } // Fin Recorro todas las filas de la tabla

                Int32 nIntVertical = BRDVVertical.consistenciaVertical("TransArte_DVVerticales");
                if (!nIntVertical.Equals(nSuma))
                {
                    BRDVVertical.actualizarDVVerticales("TransArte_DVVerticales");
                    BRBitacora.registrarEvento("Rev. Consist. Vertical Tabla TransArte_DVVerticales:OK!", BeanException.Critico);
                }
                BRBitacora.registrarEvento("Rev. Consist. Horizontal Tabla TransArte_DVVerticales:OK!", BeanException.Critico);
                return true;
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        
        private static void actualizarDVH(int id, double nValor)
        {
            BODVVertical bo = new BODVVertical();
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
