using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using ProyTransArte.AccesoDatos;



namespace ProyTransArte.ObjetosDeNegocio
{
    public class BOLocalidades : BusinessEntity
    {
        #region Propiedades Privadas
		/// <summary>
		/// Identifica a la entidad.
		/// Se usa para especificar a la clase de datos cual es la entidad que solicita servicio
		/// </summary>
        private const string _entidad = "TransArte_Localidades";
   
		#endregion
		
		#region Constructores
        public BOLocalidades() : base(_entidad)
		{
		}

		#endregion
    }
}
