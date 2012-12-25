<%@ Page Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="false"
    CodeFile="Ubicacion.aspx.cs" Inherits="Ubicacion" Title="Ubicacion de la Empresa"
    Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ MasterType VirtualPath="~/MasterPages/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="Server">
    <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAIKI1RJamIEvP7_Du5ZGi6xS4M_PhMYp3D1A5cqeLLIOnkUYWYhS8jdwSdUjZxBwswqHipWYzfju7fA"
        type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            if (GBrowserIsCompatible()) {
                var map = new GMap2(document.getElementById("map_canvas"));
                map.setCenter(new GLatLng(-34.67021034260053, -58.34191918373108), 15);
                map.setUIToDefault();
                var baseIcon = new GIcon(G_DEFAULT_ICON);
                baseIcon.shadow = "http://www.google.com/mapfiles/shadow50.png";
                baseIcon.iconSize = new GSize(20, 20);
                baseIcon.shadowSize = new GSize(20, 20);
                baseIcon.iconAnchor = new GPoint(9, 34);
                baseIcon.infoWindowAnchor = new GPoint(9, 2);
                var point = new GLatLng(-34.67021034260053, -58.34191918373108);
                var htmlVentana = "<img src='../images/logoMini.PNG'> <font size='1.5' face='verdana' color='blue'> <br><b>TransArte:</b> Empresa dedicada al transporte de arte<br><b>Telefono:</b> 4204-6552<br><b>Direccion:</b> Pasaje canning 3152<br> Email: <a href='mailto:TransArte@yahoo.com.ar'>TransArte@yahoo.com.ar</a><br> Web: <a href='http://localhost:1194/Website/staticPages/Inicio.aspx'>www.TransArte.com.ar</a></font>";
                var marker = createMarker(point, htmlVentana);
                map.addOverlay(marker);
            }

            function createMarker(point, htmlVentana) {
                var Icon = new GIcon(baseIcon);
                Icon.image = "../images/arte-y-cultura.png";
                markerOptions = { icon: Icon };
                var marker = new GMarker(point, markerOptions);
                GEvent.addListener(marker, "click", function () {
                    marker.openInfoWindowHtml(htmlVentana);
                });
                return marker;
            }
        });  //fin de Ready
    </script>
    <div class="sidebar-at-right" id="main">
        <div id="content">
            <fieldset class="ui-corner-all">
                <legend class="ui-widget ui-state-default ui-corner-all ui-button-text" style="text-align: left;
                    font-size: medium;">
                    <asp:Label ID="LabelUbicacionLegend" runat="server" Style="font-weight: bold;" meta:resourcekey="LabelUbicacionLegendResource1"></asp:Label>
                </legend>
                <table style="width: 100%;">
                    <tr>
                        <td style="text-align: left; font-size: medium;">
                            <div id="map_canvas" style="width: 100%; height: 281px"></div>
                            <ul id="list"></ul>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left;">
                            <asp:Label ID="LabelUbicacionDescripcion" runat="server" ForeColor="Black" meta:resourcekey="LabelUbicacionDescripcionResource1">
                            </asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left; text-align: justify;">
                            <asp:Label ID="LabelUbicacionPie" ForeColor="Black" runat="server" meta:resourcekey="LabelUbicacionPieResource1">
                            </asp:Label>
                        </td>
                    </tr>
                </table>
            </fieldset>
        </div>
        <div id="sidebar" style="text-align: left; text-align: justify;" class="ui-corner-all">
            <!-- ayuda -->
            <asp:Label ID="Label4" runat="server" ForeColor="Black" meta:resourcekey="LabelUbicacionTituloAyuda"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" ForeColor="Black" meta:resourcekey="LabelUbicacionDescripcionAyuda"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label6" runat="server" ForeColor="Black" meta:resourcekey="LabelUbicacionPieAyuda"></asp:Label>
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
