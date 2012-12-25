using System;
using System.Collections;  //Para el ArrayList
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Mail;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using ProyTransArte.BeanObjetos;
using ProyTransArte.ReglasDeNegocio;
using WService;
using System.IO;


public partial class _Default : System.Web.UI.Page
{
    
    protected override void InitializeCulture()
    {
        base.InitializeCulture();
        if (Session["lenguaje"] != null){
            this.UICulture = Convert.ToString(Session["lenguaje"]);
            this.Culture = Convert.ToString(Session["lenguaje"]);

        }else{
            this.Culture = "auto";
            this.UICulture = "auto";
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {

        
        
        DataTable dtVehiculos = new DataTable();
        dtVehiculos.Columns.Add("ID");
        dtVehiculos.Columns.Add("Patente");
        dtVehiculos.Columns.Add("descripcion");
        dtVehiculos.Columns.Add("modelo");
        dtVehiculos.Columns.Add("autonomia");
        dtVehiculos.Columns.Add("Tara");
        dtVehiculos.Columns.Add("Kilometraje");
        dtVehiculos.Columns.Add("cargaAncho");
        dtVehiculos.Columns.Add("cargaAlto");
        dtVehiculos.Columns.Add("cargaLargo");
        dtVehiculos.Columns.Add("Volumen");

        DataRow drVehiculos = dtVehiculos.NewRow();
        drVehiculos["ID"] = "1";
        drVehiculos["Patente"] = "AAA935";
        drVehiculos["descripcion"] = "camion de carga";
        drVehiculos["modelo"] = "1999";
        drVehiculos["autonomia"] = "300km";
        drVehiculos["Tara"] = "4000kg";
        drVehiculos["Kilometraje"] = "100.000km";
        drVehiculos["cargaAncho"] = "2500";
        drVehiculos["cargaAlto"] = "4000";
        drVehiculos["cargaLargo"] = "8000";
        drVehiculos["Volumen"] = 25 * 40 * 80 + "cm3";
        dtVehiculos.Rows.Add(drVehiculos);
        drVehiculos = dtVehiculos.NewRow();
        drVehiculos["ID"] = "2";
        drVehiculos["Patente"] = "DXT687";
        drVehiculos["descripcion"] = "Camioneta tipo Furgon";
        drVehiculos["modelo"] = "1996";
        drVehiculos["autonomia"] = "200km";
        drVehiculos["Tara"] = "1500kg";
        drVehiculos["Kilometraje"] = "150.000km";
        drVehiculos["cargaAncho"] = "1000";
        drVehiculos["cargaAlto"] = "2000";
        drVehiculos["cargaLargo"] = "2500";
        drVehiculos["Volumen"] = 10 * 20 * 25 + "cm3";
        dtVehiculos.Rows.Add(drVehiculos);

        

        DataTable dt = new DataTable();
        dt.Columns.Add("ID");
        dt.Columns.Add("Desc");
        dt.Columns.Add("kil");
        dt.Columns.Add("fecha");
        DataRow dr = dt.NewRow();
        dr["ID"] = "1";
        dr["Desc"] = "Frenos delanteros";
        dr["kil"] = "10.000";
        dr["fecha"] = "";
        dt.Rows.Add(dr);
        dr = dt.NewRow();
        dr["ID"] = "2";
        dr["Desc"] = "Frenos traseros";
        dr["kil"] = "15.000";
        dr["fecha"] = "";
        dt.Rows.Add(dr);
        dr = dt.NewRow();
        dr["ID"] = "3";
        dr["Desc"] = "Neumatico Del. Izquierdo";
        dr["kil"] = "100.000";
        dr["fecha"] = "";
        dt.Rows.Add(dr);
        dt.AcceptChanges();

    }
















    public static Byte[] CargarImagen(string rutaArchivo)
    {
        if (rutaArchivo != "")
        {
            try
            {
                FileStream Archivo = new FileStream(rutaArchivo, FileMode.Open);//Creo el archivo
                BinaryReader binRead = new BinaryReader(Archivo);//Cargo el Archivo en modo binario
                Byte[] imagenEnBytes = new Byte[(Int64)Archivo.Length]; //Creo un Array de Bytes donde guardare la imagen
                binRead.Read(imagenEnBytes, 0, (int)Archivo.Length);//Cargo la imagen en el array de Bytes
                binRead.Close();
                Archivo.Close();
                return imagenEnBytes;//Devuelvo la imagen convertida en un array de bytes
            }
            catch
            {
                return new Byte[0];
            }
        }
        return new byte[0];
    }



    protected void btnPresupuesto_Click(object sender, EventArgs e)
    {

        /*
        
        DataSet dss = BRBitacora.buscarPorFiltro("","","","","");
        DataTable dt = dss.Tables[0];
        //dt.Columns.Add("id");

        //TransArteReport report = new TransArteReport();
        //DataTable _tabla = report.DataTable1;
        
        
        ReportDocument rpt = new ReportDocument();



        rpt.Load(Server.MapPath("../Reportes/ReportBitacora.rpt"));
        rpt.SetDataSource(dt);
        */

        ReportDocument rpt = new ReportDocument();
        String szFileName = "";
        String strServerPath = "";
        rpt.PrintOptions.PaperOrientation = PaperOrientation.DefaultPaperOrientation;
        rpt.PrintOptions.PaperSize = PaperSize.DefaultPaperSize;
        rpt.PrintOptions.PaperSource = PaperSource.Upper;
        rpt.PrintOptions.PrinterDuplex = PrinterDuplex.Default;
        DataSet dss = BRBitacora.buscarPorFiltro("", "", "", "", "");
        DataTable dt = dss.Tables[0];


        dt.Columns.Add("Logo", System.Type.GetType("System.Byte[]"));//Agrego la columna con el tipo de dato "System.Byte[]",donde guardare mi imagen.
        dt.Rows[0]["Logo"] = CargarImagen("C:\\TransArte\\Website\\images\\logoMini.PNG");//Cargo La imagen

        dt.Columns.Add("UsuarioFiltro", System.Type.GetType("System.String"));//Agrego la columna con el tipo de dato "System.Byte[]",donde guardare mi imagen.
        dt.Rows[0]["UsuarioFiltro"] = "MAXIMILIANO";//Cargo La imagen
        
                
        rpt.Load(Server.MapPath("../Reportes/ReportBitacora.rpt"));
        rpt.SetDataSource(dt);
        szFileName = "bitacora.pdf";
        strServerPath = Server.MapPath("~") + "\\Reportes\\";

        DiskFileDestinationOptions dfdoFile = new DiskFileDestinationOptions();
        dfdoFile.DiskFileName = strServerPath + szFileName;

        rpt.ExportOptions.ExportDestinationType = ExportDestinationType.DiskFile;
        rpt.ExportOptions.ExportFormatType = ExportFormatType.PortableDocFormat;
        rpt.ExportOptions.DestinationOptions = dfdoFile;
        rpt.Export();
        Response.Redirect("../Reportes/" + szFileName, false);







        /*
         * 
          http://localhost:49173/website/Servicio/Reportes.aspx
         * 
         * */

    }
    protected void btnFactura_Click(object sender, EventArgs e)
    {

    }
    protected void btnHojaDeRuta_Click(object sender, EventArgs e)
    {

    }
    protected void btnBitacora_Click(object sender, EventArgs e)
    {

    }
    protected void btnMantenimiento_Click(object sender, EventArgs e)
    {

    }
    protected void btnRecibo_Click(object sender, EventArgs e)
    {


        // ENVIO DE MAIL http://csharp.net-informations.com/crystal-reports/csharp-crystal-reports-email.htm
        /*
        ReportDocument cryRpt;
        string pdfFile = "c:\\csharp.net-informations.pdf";
        
        cryRpt = new ReportDocument();
        cryRpt.Load("PUT CRYSTAL REPORT PATH HERE\\CrystalReport1.rpt");
        CrystalReportViewer1.ReportSource = cryRpt;
        CrystalReportViewer1.RefreshReport(); 


        ExportOptions CrExportOptions;
        DiskFileDestinationOptions CrDiskFileDestinationOptions = new DiskFileDestinationOptions();
        PdfRtfWordFormatOptions CrFormatTypeOptions = new PdfRtfWordFormatOptions();
        CrDiskFileDestinationOptions.DiskFileName = pdfFile;
        CrExportOptions = cryRpt.ExportOptions;
        CrExportOptions.ExportDestinationType = ExportDestinationType.DiskFile;
        CrExportOptions.ExportFormatType = ExportFormatType.PortableDocFormat;
        CrExportOptions.DestinationOptions = CrDiskFileDestinationOptions;
        CrExportOptions.FormatOptions = CrFormatTypeOptions;
        cryRpt.Export();

        SmtpMail.SmtpServer.Insert(0, "your hostname");
        MailMessage Msg = new MailMessage();
        Msg.To = "to address here";
        Msg.From = "from address here";
        Msg.Subject = "Crystal Report Attachment ";
        Msg.Body = "Crystal Report Attachment ";
        Msg.Attachments.Add(new MailAttachment(pdfFile));
        System.Web.Mail.SmtpMail.Send(Msg);
        */
    }
}
