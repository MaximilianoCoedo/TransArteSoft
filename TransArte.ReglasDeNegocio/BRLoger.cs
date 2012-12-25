using System;
using ProyTransArte.BeanObjetos;

namespace ProyTransArte.ReglasDeNegocio

{
    public class BRLoger
    {
        /// <summary>
        /// Loguea Errores en bitacora
        /// </summary>
        /// <param name="ex"></param>
        public static void LogError(Exception ex)
        {
            // logueo en el repositorio 
            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
            BeanException exec;
            if (ex is BeanException)
            {
                exec = (BeanException) ex;
            }
            else {
                exec = new BeanException(ex);
            }
            BRBitacora.registrarEvento( "Error:" + (exec.detalleError != "" ? exec.detalleError : exec.Message), exec.criticidadError);
        }
    }

}
