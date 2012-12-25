using System;
using System.Data;
using ProyTransArte.ObjetosDeNegocio;

namespace ProyTransArte.ReglasDeNegocio
{
    public class BRProvincias
    {
        
        public static DataSet buscarTodo()
        {
            try
            {
                BOProvincias bo = new BOProvincias();
                return bo.GetAll();
            }
            catch (Exception ex)
            {
                
                throw;
            }
        }
    }
}