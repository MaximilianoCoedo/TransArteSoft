using System;
using System.Collections;  //Para el ArrayList
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using ProyTransArte.ObjetosDeNegocio;
using ProyTransArte.BeanObjetos;



namespace ProyTransArte.ReglasDeNegocio
{
    public class BRBackUp
    {
        public static string obtenerTamanio()
        {
            try
            {
                string dataBase = GetCatalog();
                string location = "";
                BOBackUp bo = new BOBackUp();
                DataSet ds = bo.GetByN("LocationDB", dataBase);
                if (ds.Tables[0].Rows.Count != 0)
                {
                    int nCantColumnas = ds.Tables[0].Rows.Count - 1;
                    location = Convert.ToString(ds.Tables[0].Rows[0]["location"]);
                }
                FileInfo dir = new FileInfo(location);
                return "" +  dir.Length;
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    
        public static Hashtable traerBackUps()
        {

            DirectoryInfo dir = new DirectoryInfo(GetDirBackUp());


            Hashtable backups = new Hashtable();
            string archivo = "";
            int vol = 1;
            for (int i = 0; i < dir.GetFiles().Length; i++)
            {
                FileInfo _fileInfo =  dir.GetFiles()[i];
                string nombre = _fileInfo.FullName;
                string[] words = nombre.Split('.');
                string archivoFile = words[0];
                if (archivoFile != archivo)
                {
                    archivo = archivoFile;
                    vol = 1;
                }
                else {
                    vol++;
                }
                backups[archivo] = vol;
            }
            return backups;

        }


        public static Boolean generarRestore(string fileToRestore , int vol)
        {
            try
            {

                DirectoryInfo dir = new DirectoryInfo(GetDirBackUp());
                string source = GetSource();
                string catalog = GetCatalog();
                string cadena = string.Empty;
                string _fileRestore = string.Empty;
                
                SqlCommand cmd = new SqlCommand();
                int fileAfect = 0;

                cadena = " USE [master]";
                cadena += " ALTER DATABASE [" + catalog  + "] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE";
                cadena += " EXEC master.dbo.sp_detach_db @dbname = N'" + catalog + "', @keepfulltextindexfile=N'true' ";
                for (int i = 1; i <= vol; i++)
                {
                    _fileRestore = fileToRestore + "."+  i + ".bkp";
                    if (i == 1) {
                        cadena += " RESTORE DATABASE [" + catalog + "] FROM  DISK = N'" + _fileRestore + "'"; 
                    } else {
                        cadena += ", DISK = N'" + _fileRestore + "'";  
                    }
                }
                cadena += " WITH  FILE = 1,  NOUNLOAD,  REPLACE,  STATS = 10";
                cadena += " ALTER DATABASE [" + catalog + "] SET  MULTI_USER WITH ROLLBACK IMMEDIATE";
                SqlConnection conn = new SqlConnection("Data Source=" + source + "; Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=" + catalog);
                cmd.CommandText = cadena;
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conn;
                conn.Open();

                fileAfect = cmd.ExecuteNonQuery();
                conn.Close();
                BRBitacora.registrarEvento("Se realizó la restauración de la base de datos ", BeanException.Critico);
                return true;
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public static Boolean generarBackUp(int volumenes)
        {
            try
            {
                DirectoryInfo dir = new DirectoryInfo(GetDirBackUp());
                if (!dir.Exists)
                {
                    dir.Create();
                } 
                string source = GetSource();                
                string catalog = GetCatalog();
                string cadena = string.Empty;
                SqlCommand cmd = new SqlCommand();
                int fileAfect = 0;
                string filebackup = string.Empty;
                cadena = dir.ToString();
                cadena += "\\" + catalog;
                cadena += (DateTime.Now.Day.ToString().Length > 1 ? "" + DateTime.Now.Day : "0" + DateTime.Now.Day) + "-" + (DateTime.Now.Month.ToString().Length > 1 ? "" + DateTime.Now.Month : "0" + DateTime.Now.Month) + "-" + DateTime.Now.Year + " " + (DateTime.Now.Hour.ToString().Length > 1 ? "" + DateTime.Now.Hour : "0" + DateTime.Now.Hour) + "_" + (DateTime.Now.Minute.ToString().Length > 1 ? "" + DateTime.Now.Minute : "0" + DateTime.Now.Minute) + "_" + (DateTime.Now.Second.ToString().Length > 1 ? "" + DateTime.Now.Second : "0" + DateTime.Now.Second);
                SqlConnection conn = new SqlConnection("Data Source=" + source + "; Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=" + catalog);
                for (int i = 1; i <= volumenes; i++)
                {
                    filebackup = cadena + "."+  i + ".bkp";
                    if (i == 1) {
                        cmd.CommandText = " BACKUP DATABASE [" + catalog + "] TO  DISK = '" + filebackup + "'";
                    } else {
                        cmd.CommandText = cmd.CommandText + ", DISK = '" + filebackup + "'";
                    }
                }
                cmd.CommandText = cmd.CommandText + " WITH NOFORMAT, NOINIT, NAME = N'" + catalog + "-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10";
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conn;
                conn.Open();
                fileAfect = cmd.ExecuteNonQuery();
                conn.Close();
                BRBitacora.registrarEvento("Se realizó un BackUp de la base de datos ", BeanException.Leve);
                return true;
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        private static string GetCatalog()
        {
            string catalog = string.Empty;
            NameValueCollection section = (NameValueCollection)ConfigurationManager.GetSection("ConfigBackUpRestore");
            if (section != null)
            {
                catalog = section.GetValues("catalog")[0].ToString();
            }
            return catalog;
        }


        private static string GetSource()
        {
            string source = string.Empty;
            NameValueCollection section = (NameValueCollection)ConfigurationManager.GetSection("ConfigBackUpRestore");
            if (section != null)
            {
                source = section.GetValues("source")[0].ToString();
            }
            return source;
        }

        private static string GetDirBackUp()
        {
            string folder = string.Empty;
            NameValueCollection section = (NameValueCollection) ConfigurationManager.GetSection("ConfigBackUpRestore");
            if (section != null)
            {
                folder = section.GetValues("folder")[0].ToString();
            }
            return folder;
        }
    }
}