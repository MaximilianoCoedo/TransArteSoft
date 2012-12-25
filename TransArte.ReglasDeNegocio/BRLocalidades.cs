using System;
using System.Data;
using ProyTransArte.ObjetosDeNegocio;


namespace ProyTransArte.ReglasDeNegocio
{

    public class BRLocalidades
    {
        
        public static DataSet buscarPorDepartamento(int idDepartamento)
        {
            try
            {

                BOLocalidades bo = new BOLocalidades();
                return bo.GetByN("IdDepartamento", idDepartamento);
            }
            catch (Exception ex)
            {
                throw ;
            }
        }
    }
}