using System;
using System.Collections;


namespace ProyTransArte.BeanObjetos
{
    /// <summary>
    /// Clase para retornar con los datos del usuario que abrio la sesión. Datos básicos.
    /// </summary>
    public class BeanUsuario
    {
        private int  iId;
        private String sUsuario;
        private String sNombre;
        private String sApellido;
        private String sFechaBaja;
        private String sEmail;
        private Boolean sBloqueado;
        private String sMotivo;
        private String sRazonSocial;
        private Boolean iEsCuil;
        private String sCuit_cuil;
        private Boolean sExiste;
        
        private ArrayList oPermisos;
        private ArrayList oTelefonos;
        private ArrayList oIntegridad;

        public BeanUsuario() { }
        public void testeo()
        {
            

            this.iId = 1;
            this.sUsuario = "MAXI";
            this.sNombre = "MaxiTEST_N";
            this.sApellido = "MaxiTEST_A";
            this.sBloqueado = false;
            int i = 0;
            BeanPermisos permiso = new BeanPermisos();
            permiso.id = i++;
            permiso.idForm = "SolicitarServicio";
            permiso.negado = false;
            this.permisos.Add(permiso);
            permiso = new BeanPermisos();
            permiso.id = i++;
            permiso.idForm = "ContactarServicio";
            permiso.negado = false;
            this.permisos.Add(permiso);
            permiso = new BeanPermisos();
            permiso.id = i++;
            permiso.idForm = "ConfirmarServicio";
            permiso.negado = false;
            this.permisos.Add(permiso);
            permiso = new BeanPermisos();
            permiso.id = i++;
            permiso.idForm = "EnrutarServicio";
            permiso.negado = false;
            this.permisos.Add(permiso);
            permiso = new BeanPermisos();
            permiso.id = i++;
            permiso.idForm = "FinalizarServicio";
            permiso.negado = false;
            this.permisos.Add(permiso);
            permiso = new BeanPermisos();
            permiso.id = i++;
            permiso.idForm = "FacturarServicio";
            permiso.negado = false;
            this.permisos.Add(permiso);
            permiso = new BeanPermisos();
            permiso.id = i++;
            permiso.idForm = "CobrarServicio";
            permiso.negado = false;
            this.permisos.Add(permiso);
            permiso = new BeanPermisos();
            permiso.id = i++;
            permiso.idForm = "AdminUsuarios";
            permiso.negado = false;
            this.permisos.Add(permiso);
            permiso = new BeanPermisos();
            permiso.id = i++;
            permiso.idForm = "Vehiculos";
            permiso.negado = false;
            this.permisos.Add(permiso);
            permiso = new BeanPermisos();
            permiso.id = i++;
            permiso.idForm = "AbmEstado";
            permiso.negado = false;
            this.permisos.Add(permiso);
            permiso = new BeanPermisos();
            permiso.id = i++;
            permiso.idForm = "AbmPermisos";
            permiso.negado = false;
            this.permisos.Add(permiso);
            permiso = new BeanPermisos();
            permiso.id = i++;
            permiso.idForm = "AbmServicios";
            permiso.negado = false;
            this.permisos.Add(permiso);
            permiso = new BeanPermisos();
            permiso.id = i++;
            permiso.idForm = "PerfilUsuario";
            permiso.negado = false;
            this.permisos.Add(permiso);
            permiso = new BeanPermisos();
            permiso.id = i++;
            permiso.idForm = "Calendario";
            permiso.negado = false;
            this.permisos.Add(permiso);
            permiso = new BeanPermisos();
            permiso.id = i++;
            permiso.idForm = "BackUp";
            permiso.negado = false;
            this.permisos.Add(permiso);
            permiso = new BeanPermisos();
            permiso.id = i++;
            permiso.idForm = "Restore";
            permiso.negado = false;
            this.permisos.Add(permiso);
            permiso = new BeanPermisos();
            permiso.id = i++;
            permiso.idForm = "Bitacora";
            permiso.negado = false;
            this.permisos.Add(permiso);
            permiso = new BeanPermisos();
            permiso.id = i++;
            permiso.idForm = "SeguimientoServicio";
            permiso.negado = false;
            this.permisos.Add(permiso);
            permiso = new BeanPermisos();
            permiso.id = i++;
            permiso.idForm = "SeguimientoServicio";
            permiso.negado = false;
            this.permisos.Add(permiso);

        }



        public void usuarioInicio()
        {


            this.iId = 1;
            this.sUsuario = "INICIO";
            this.sNombre = "INICIO Nombre";
            this.sApellido = "INICIO Nombre";
            this.sBloqueado = false;
            BeanPermisos permiso = new BeanPermisos();
            permiso.id = 8;
            permiso.idForm = "AdminUsuarios";
            permiso.negado = false;
            this.permisos.Add(permiso);
            permiso = new BeanPermisos();
            permiso.id = 11;
            permiso.idForm = "AbmPermisos";
            permiso.negado = false;
            this.permisos.Add(permiso);
            permiso = new BeanPermisos();
            permiso.id = 15;
            permiso.idForm = "BackUp";
            permiso.negado = false;
            this.permisos.Add(permiso);
            permiso = new BeanPermisos();
            permiso.id = 16;
            permiso.idForm = "Restore";
            permiso.negado = false;
            this.permisos.Add(permiso);
            permiso = new BeanPermisos();
            permiso.id = 17;
            permiso.idForm = "Bitacora";
            permiso.negado = false;
            this.permisos.Add(permiso);

        }

       /// <summary>
       /// Almacena un arrayList con todos los permisos asignados a ese usuario
       /// </summary>
       /// 



        public void addIntegridad(BeanIntegridad integridad)
        {
            if (this.oIntegridad == null)
            {
                this.oIntegridad = new ArrayList();
            }
            this.oIntegridad.Add(integridad);

        }

        public ArrayList integridad
        {
            get
            {
                if (this.oIntegridad == null)
                {
                    this.oIntegridad = new ArrayList();
                }
                return this.oIntegridad;
            }
        }
        public void addPermiso(BeanPermisos permiso)
        {
            if (this.oPermisos == null)
            {
                this.oPermisos = new ArrayList();
            }
            this.oPermisos.Add(permiso);

        }
        public void addPermisoIndependiente(BeanPermisos permiso)
        {
            // agrega si no esta en la colleccion o bloquea el permiso si esta en la colleccion

            IEnumerator _oPermisos = permisos.GetEnumerator();
            while (_oPermisos.MoveNext())// utilizo el patron iterator para recorrer la lista
            {
                BeanPermisos _per = (BeanPermisos)_oPermisos.Current;
                if (permiso.negado && _per.id == permiso.id )
                {// el permiso ya esta en la lista y es negado
                    this.oPermisos.Remove(_per);
                    return; // salgo 
                }
            }
            // si llego aca es q no lo encontro en la lista entonces lo agrego
            this.oPermisos.Add(permiso);

        }

        public ArrayList permisos
        {
            get
            {
                if (this.oPermisos == null)
                {
                    this.oPermisos = new ArrayList();
                }
                return this.oPermisos;
            }
        }

        public void addTelefono(BeanTelefono telefono ){
            if (this.oTelefonos == null)
            {
                this.oTelefonos = new ArrayList();
            }
            this.oTelefonos.Add(telefono);
        
        } 
       
        public ArrayList telefonos
        {
            get
            {
                if (this.oTelefonos == null)
                {
                    this.oTelefonos = new ArrayList();
                }
                return this.oTelefonos;
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
       public String usuario
       {
           set
           {
               this.sUsuario = value;
           }

           get
           {
               return this.sUsuario;
           }
       }

       public String nombre
       {
           set
           {
               this.sNombre = value;
           }

           get
           {
               return this.sNombre;
           }
       }
       public String apellido
       {
           set
           {
               this.sApellido = value;
           }

           get
           {
               return this.sApellido;
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
       public String email
       {
           set
           {
               this.sEmail = value;
           }

           get
           {
               return this.sEmail;
           }
       }
       public Boolean bloqueado
       {
           set
           {
               this.sBloqueado = value;
           }

           get
           {
               return this.sBloqueado;
           }
       }
       public Boolean existe
       {
           set
           {
               this.sExiste = value;
           }

           get
           {
               return this.sExiste;
           }
       }
        

       public String motivo
       {
           set
           {
               this.sMotivo = value;
           }

           get
           {
               return this.sMotivo;
           }
       }


       public Boolean esCuil
       {
           set
           {
               this.iEsCuil = value;
           }

           get
           {
               return this.iEsCuil;
           }
       }
       public String cuit_cuil
       {
           set
           {
               this.sCuit_cuil = value;
           }

           get
           {
               return this.sCuit_cuil;
           }
       }

       public String razonSocial
       {
           set
           {
               this.sRazonSocial = value;
           }

           get
           {
               return this.sRazonSocial;
           }
       }
    }
}