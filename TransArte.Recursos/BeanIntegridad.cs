using System;
using System.Collections;


namespace ProyTransArte.BeanObjetos
{
    /// <summary>
    /// Clase con los Integridad del usuario que abrio la sesión. Datos básicos.
    /// </summary>
    public class BeanIntegridad
    {

        private String sIdentificador;
        private String sTabla;

        public BeanIntegridad()
        {
        }
        public BeanIntegridad(String identificador, String tabla)
        {
            this.sIdentificador = identificador;
            this.sTabla = tabla;
        }
        public String identificador
        {
            set
            {
                this.sIdentificador = value;
            }

            get
            {
                return this.sIdentificador;
            }
        }

        public String Tabla
        {
            set
            {
                this.sTabla = value;
            }

            get
            {
                return this.sTabla;
            }
        }
    }
}