using System;
using System.Collections.Generic;
//Para el ArrayList
using System.Collections.Specialized;
using System.Configuration;
using System.IO;



namespace ProyTransArte.ReglasDeNegocio
{
    public class BRReportes
    {

        public static List<Reporte> traerReportes(string usuarioActual)
        {
             try
            {
            DirectoryInfo dirReport = new DirectoryInfo(GetDirReportes() + "\\" + usuarioActual);
            if(!dirReport.Exists){ // crea la carpeta si no existe
                dirReport.Create();
            }
            List<Reporte> reportes = new List<Reporte>();
            for (int i = 0; i < dirReport.GetFiles().Length; i++)
            {

                FileInfo _fileInfo = dirReport.GetFiles()[i];
                string nombre = _fileInfo.Name;
                string[] name = nombre.Split('.');
                string[] words = name[0].Split('_');
                reportes.Add(new Reporte()
                {
                    id = i + 1,
                    nombreReporte = Convert.ToString(words[0] +  _fileInfo.Extension),
                    fechaReporte = Convert.ToString(words[1] + "/" + words[2] + "/" + words[3] + " " + words[4] + ":" + words[5] + ":" + words[6]),
                    tamanopReporte = Convert.ToString(_fileInfo.Length),
                    linkReporte = Convert.ToString(usuarioActual + "\\" + _fileInfo.Name)
                });
            }
            return reportes;
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public class Reporte
        {
            public int id { set; get; }
            public string nombreReporte { set; get; }
            public string fechaReporte { set; get; }
            public string tamanopReporte { set; get; }
            public string linkReporte { set; get; }
        }

        private static string GetDirReportes()
        {
            string reportFolder = string.Empty;
            NameValueCollection section = (NameValueCollection)ConfigurationManager.GetSection("ConfigReportes");
            if (section != null)
            {
                reportFolder = section.GetValues("reportFolder")[0].ToString();
            }
            return reportFolder;
        }
    }
}