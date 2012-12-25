<%@ Page Language="C#" MasterPageFile="~/MasterPages/BackEnd.master" AutoEventWireup="true" CodeFile="Reportes.aspx.cs" Inherits="_Default" title="Home" culture="auto" meta:resourcekey="PageResource1" uiculture="auto"%>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<%@ MasterType VirtualPath="~/MasterPages/BackEnd.master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" Runat="Server">
    <div class="sidebar-at-right" id="main">
<div id="content">
    <center>
    <fieldset>
        <legend>Reportes:</legend>
        <table  align="left">
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnPresupuesto" runat="server" Text="Presupuesto" 
                        onclick="btnPresupuesto_Click" />
                </td>
                <td colspan="2">
                    <asp:Button ID="btnFactura" runat="server" Text="Factura" 
                        onclick="btnFactura_Click" />
                </td>
                <td colspan="2">
                    <asp:Button ID="btnHojaDeRuta" runat="server" Text="Hoja De Ruta" 
                        onclick="btnHojaDeRuta_Click" />
                </td>
                <td colspan="2">
                    <asp:Button ID="btnBitacora" runat="server" Text="Bitacora" 
                        onclick="btnBitacora_Click" />
                </td>
                <td colspan="2">
                    <asp:Button ID="btnMantenimiento" runat="server" Text="Mantenimiento" 
                        onclick="btnMantenimiento_Click" />
                </td>
                <td colspan="2">
                    <asp:Button ID="btnRecibo" runat="server" Text="recibo" 
                        onclick="btnRecibo_Click" />
                </td>
                <td colspan="2">
                    <asp:Button ID="btnServicios" runat="server" Text="servicios" />
                </td>
            </tr>
        </table>
        <CR:CrystalReportViewer ID="CrystalReportViewer2" runat="server" AutoDataBind="True" />
    </fieldset>
    </center>
</div>
      <div id="sidebar" style="text-align: left; text-align: justify;" class="ui-corner-all">
            <!-- ayuda -->
            <asp:Label ID="Label4" runat="server" ForeColor="Black" meta:resourcekey="LabelEmpresaTituloAyuda"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" ForeColor="Black" meta:resourcekey="LabelEmpresaDescripcionAyuda"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label6" runat="server" ForeColor="Black" meta:resourcekey="LabelEmpresaPieAyuda"></asp:Label>
        </div>
        <a id="separator" href="#" style="text-decoration: none;">
            <asp:Image ID="Image2" Style="padding-left: 1px;" runat="server" Height="15px" Width="15px"
                ImageUrl="~/images/help.png" meta:resourcekey="Image2Resource1" />
            <div style="padding-left: 5px; color: black; font-weight: bold;">
                <asp:Label ID="LabelAyuda" runat="server" meta:resourcekey="LabelAyudaResource1" />
            </div>
        </a>
        <div class="clearer">
            &nbsp;
        </div>
    </div>
</asp:Content>