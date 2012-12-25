using System;
using System.Data;
using ProyTransArte.ObjetosDeNegocio;

namespace ProyTransArte.ReglasDeNegocio
{
    public class BRDepartamentos
    {

        public static DataSet buscarPorProvincia(int idProvincia)
        {
            try
            {

                BODepartamentos bo = new BODepartamentos();
                return bo.GetByN("IdProvincia", idProvincia);
            }
            catch (Exception ex)
            {
                
                throw;
            }
        }
    }
}