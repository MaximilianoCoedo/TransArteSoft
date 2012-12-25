using System;
using System.Collections.Generic;
using System.Text;

using ProyTransArte.AccesoDatos;



namespace ProyTransArte.ObjetosDeNegocio
{
    public class BOEstadoServicio :BusinessEntity
    {
        #region Propiedades Privadas
        /// <summary>
        /// Identifica a la entidad.
        /// Se usa para especificar a la clase de datos cual es la entidad que solicita servicio
        /// </summary>
        private const string _entidad = "TransArte_EstadoServicio";
        #endregion

        #region Constructores
        public BOEstadoServicio()
            : base(_entidad)
        {
        }
        #endregion
    }
}