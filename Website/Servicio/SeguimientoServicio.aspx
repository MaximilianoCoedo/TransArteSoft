<%@ Page Language="C#" MasterPageFile="~/MasterPages/BackEnd.master" AutoEventWireup="true" CodeFile="SeguimientoServicio.aspx.cs" Inherits="_Default" title="Home" culture="auto" meta:resourcekey="PageResource1" uiculture="auto"%>
<%@ MasterType VirtualPath="~/MasterPages/BackEnd.master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" Runat="Server">
<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAIKI1RJamIEvP7_Du5ZGi6xS4M_PhMYp3D1A5cqeLLIOnkUYWYhS8jdwSdUjZxBwswqHipWYzfju7fA" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        if (GBrowserIsCompatible()) {
            var directionsPanel;
            var directions;

            var map2 = new GMap2(document.getElementById("imgMapa"));
            directionsPanel = document.getElementById("my_textual_div");
            map2.setCenter(new GLatLng(-34.67021034260053, -58.34191918373108), 15);
            directions = new GDirections(map2, directionsPanel);
            directions.load("from: avenida san juan 1130, capital federal, buenos aires, to: avenida corrientes 1300, capital federal, buenos aires, to: Av. Infanta Isabel 555, Buenos Aires, to: avenida san juan 1150, capital federal, buenos aires");
            var point = new GPoint(-4, 40);
            var marker = new GMarker(point);
            map2.addOverlay(marker);
            GEvent.addListener(map2, "click", function (overlay, point) {
                if (point) {
                    marker.setPoint(point);
                }
            });
        }
    });
</script>
<div class="sidebar-at-right" id="main">
<div id="content">
    <center>
    <fieldset>
        <legend>Seguimiento del servicios:</legend>
        <table>
            <tr>
                <td rowspan="8">
                    <div id="imgMapa" style="width: 450px; height: 250px"></div>
                </td>
                <td>
                </td>
                <td rowspan="8" style="width:400px; height:250px; overflow: scroll;">
                    <div id="my_textual_div" style="width: 390px; height: 250px"></div>
                </td>
            </tr>
        </table>
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