using System;
using System.Collections;


namespace ProyTransArte.BeanObjetos
{
    /// <summary>
    /// Clase con los permisos del usuario que abrio la sesión. Datos básicos.
    /// </summary>
    public class BeanPermisos
    {

        private int iId;
        private String sDescripcion;
        private String sIdForm;
        private Boolean bNegado;

        public BeanPermisos()
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

        public Boolean negado
        {
            set
            {
                this.bNegado = value;
            }

            get
            {
                return this.bNegado;
            }
        }

        public String idForm
        {
            set
            {
                this.sIdForm = value;
            }

            get
            {
                return this.sIdForm;
            }
        }

        public String descripcion
        {
            set
            {
                this.sDescripcion = value;
            }

            get
            {
                return this.sDescripcion;
            }
        }
    }






}