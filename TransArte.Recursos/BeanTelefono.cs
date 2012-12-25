using System;
using System.Collections;


namespace ProyTransArte.BeanObjetos
{
    /// <summary>
    /// Clase con los Telefonos del usuario que abrio la sesión. Datos básicos.
    /// </summary>
    public class BeanTelefono
    {

        private int iId;
        private String sTelefono;
        private String sFechaBaja;

        public BeanTelefono()
        {
        }
        public int id
        {
            set
            {
                this.iId = value;
            }

            get
            {
                return this.iId;
            }
        }

        public String telefono
        {
            set
            {
                this.sTelefono = value;
            }

            get
            {
                return this.sTelefono;
            }
        }

        public String fechaBaja
        {
            set
            {
                this.sFechaBaja = value;
            }

            get
            {
                return this.sFechaBaja;
            }
        }

    }






}