using ProyTransArte.AccesoDatos;



namespace ProyTransArte.ObjetosDeNegocio
{
    public class BODomicilios : BusinessEntity
    {
        #region Propiedades Privadas
		/// <summary>
		/// Identifica a la entidad.
		/// Se usa para especificar a la clase de datos cual es la entidad que solicita servicio
		/// </summary>
        private const string _entidad = "TransArte_Domicilios";
   
		#endregion
		
		#region Constructores
        public BODomicilios()
            : base(_entidad)
		{
		}

		#endregion
    }
}
