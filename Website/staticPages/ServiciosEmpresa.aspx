<%@ Page Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="false"
    CodeFile="ServiciosEmpresa.aspx.cs" Inherits="ServiciosEmpresa" Title="Servicios de la Empresa"
    Culture="auto" UICulture="auto" meta:resourcekey="PageResource1" %>

<%@ MasterType VirtualPath="~/MasterPages/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="Server">
    <div class="sidebar-at-right" id="main">
        <div id="content">
            <fieldset class="  ui-corner-all">
                <legend class="ui-widget ui-state-default ui-corner-all ui-button-text" style="text-align: left;
                    font-size: medium;">
                    <asp:Label ID="LabelServiciosLegend" runat="server" Style="font-weight: bold;" meta:resourcekey="LabelServiciosLegendResource1">
                    </asp:Label>
                </legend>
                <table border="0">
                    <tr>
                        <td style="text-align: left; font-size: medium;" colspan="2">
                            <asp:Label ID="Label1" runat="server" Style="color: black; font-weight: bold;" meta:resourcekey="LabelServiciosTituloResource1">
                            </asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left;"  colspan="2">
                            <asp:Label ID="LabelServiciosDescripcion" runat="server" ForeColor="Black"
                                 meta:resourcekey="LabelServiciosDescripcionResource1"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left;"  colspan="2">
                            <asp:Label ID="Label2" runat="server" ForeColor="Black"
                                meta:resourcekey="LabelServiciosDescripcionItemsResource1"></asp:Label>
                        </td>
                    </tr>
                    <tr align="center"  >
                        <td colspan="2" style="padding : 10px 0 0; position :relative; margin : 0 0 20px 20px;" >
                            <div class="carruselClass">
                                <ul>
                                    <li style="overflow: hidden; float: left; width: 170px; height: 145px;">
                                        <img  border="2" src="../images/carrusel/carrusel0.jpg" alt="" width="150" height="110"/></li>
                                    <li style="overflow: hidden; float: left; width: 170px; height: 145px;">
                                        <img border="2" src="../images/carrusel/carrusel1.jpg" alt="" width="150" height="110"/></li>
                                    <li style="overflow: hidden; float: left; width: 170px; height: 145px;">
                                        <img border="2" src="../images/carrusel/carrusel2.jpg" alt="" width="150" height="110"/></li>
                                    <li style="overflow: hidden; float: left; width: 170px; height: 145px;">
                                        <img border="2" src="../images/carrusel/carrusel3.jpg" alt="" width="150" height="110"/></li>
                                    <li style="overflow: hidden; float: left; width: 170px; height: 145px;">
                                        <img border="2" src="../images/carrusel/carrusel4.jpg" alt="" width="150" height="110"/></li>
                                    <li style="overflow: hidden; float: left; width: 170px; height: 145px;">
                                        <img border="2" src="../images/carrusel/carrusel5.jpg" alt="" width="150" height="110"/></li>
                                    <li style="overflow: hidden; float: left; width: 170px; height: 145px;">
                                        <img border="2" src="../images/carrusel/carrusel6.jpg" alt="" width="150" height="110"/></li>
                                    <li style="overflow: hidden; float: left; width: 170px; height: 145px;">
                                        <img border="2" src="../images/carrusel/carrusel7.jpg" alt="" width="150" height="110"/></li>
                                    <li style="overflow: hidden; float: left; width: 170px; height: 145px;">
                                        <img border="2" src="../images/carrusel/carrusel8.jpg" alt="" width="150" height="110"/></li>
                                    <li style="overflow: hidden; float: left; width: 170px; height: 145px;">
                                        <img border="2" src="../images/carrusel/carrusel9.jpg" alt="" width="150" height="110"/></li>
                                    <li style="overflow: hidden; float: left; width: 170px; height: 145px;">
                                        <img border="2" src="../images/carrusel/carrusel10.jpg" alt="" width="150" height="110"/></li>
                                    <li style="overflow: hidden; float: left; width: 170px; height: 145px;">
                                        <img border="2" src="../images/carrusel/carrusel11.jpg" alt="" width="150" height="110"/></li>
                                    <li style="overflow: hidden; float: left; width: 170px; height: 145px;">
                                        <img border="2" src="../images/carrusel/carrusel12.jpg" alt="" width="150" height="110"/></li>
                                    <li style="overflow: hidden; float: left; width: 170px; height: 145px;">
                                        <img border="2" src="../images/carrusel/carrusel13.jpg" alt="" width="150" height="110"/></li>
                                </ul>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: left; text-align: justify;">
                            <asp:Label ID="LabelServiciosPie" ForeColor="Black" runat="server" meta:resourcekey="LabelServiciosPieResource1"></asp:Label>
                        </td>
                    </tr>
                </table>
            </fieldset>
        </div>
        <div id="sidebar"style="text-align: left; text-align: justify;" class="ui-corner-all">
            <!-- ayuda -->
            <asp:Label ID="Label3" runat="server" ForeColor="Black" meta:resourcekey="LabelServiciosTituloAyuda"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" ForeColor="Black" meta:resourcekey="LabelServiciosDescripcionAyuda"></asp:Label>
             <br />
             <br />
            <asp:Label ID="Label5" runat="server" ForeColor="Black" meta:resourcekey="LabelServiciosPieAyuda"></asp:Label>
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
