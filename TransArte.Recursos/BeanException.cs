using System;
using System.Collections.Generic;
using System.Text;


namespace ProyTransArte.BeanObjetos
{
    public class BeanException : System.Exception
    {

        public static int Critico = 3;
        public static int Moderado = 2;
        public static int Leve = 1;

        private string sIdMessage ="errorDefault";
        private int iId;
        private String sDetalleError = "";
        private int iCriticidadError = 3;
        const string auxMessage = "Se ha producido un error";

        /// <summary>
        /// BeanException implementando Exception
        /// </summary>

        public BeanException(Exception ex, string auxMessage, int criticidad, string idMessage)
            : base(ex.Message, ex)
        {
            this.sIdMessage = idMessage;
            this.id = id;
            this.criticidadError = criticidad;
            this.detalleError = ex.Message;
        }

        public BeanException(Exception ex, int criticidad, string idMessage)
            : base(ex.Message, ex)
        {
            this.sIdMessage = idMessage;
            this.criticidadError = criticidad;
            this.detalleError = ex.Message;
        }
        public BeanException(Exception ex)
            : base(ex.Message, ex)
        {
            this.detalleError = ex.Message;
        }

        public string idMessage
        {
            set
            {
                this.sIdMessage = value;
            }

            get
            {
                return this.sIdMessage;
            }
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
        public String detalleError
        {
            set
            {
                this.sDetalleError = value;
            }

            get
            {
                return this.sDetalleError;
            }
        }
        public int criticidadError
        {
            set
            {
                this.iCriticidadError = value;
            }

            get
            {
                return this.iCriticidadError;
            }
        }
    }

}
