<%@ Page Language="C#" MasterPageFile="~/MasterPages/BackEnd.master" AutoEventWireup="true" CodeFile="EnrutarServicio.aspx.cs" Inherits="_Default" title="Home" culture="auto" meta:resourcekey="PageResource1" uiculture="auto"%>
<%@ MasterType VirtualPath="~/MasterPages/BackEnd.master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" Runat="Server">
   <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAIKI1RJamIEvP7_Du5ZGi6xS4M_PhMYp3D1A5cqeLLIOnkUYWYhS8jdwSdUjZxBwswqHipWYzfju7fA" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        if (GBrowserIsCompatible()) {
            var map;
            var directionsPanel;
            var directions;
            map = new GMap2(document.getElementById("imgMapa"));
            directionsPanel = document.getElementById("my_textual_div");
            map.setCenter(new GLatLng(-34.67021034260053, -58.34191918373108), 15);
            directions = new GDirections(map, directionsPanel);
            directions.load("from: san juan 1130, capital federal, buenos aires to: Av. Infanta Isabel 555, Buenos Aires");



            var map2 = new GMap2(document.getElementById("imgMapa2"));
            directionsPanel = document.getElementById("my_textual_div2");
            map2.setCenter(new GLatLng(-34.67021034260053, -58.34191918373108), 15);
            directions = new GDirections(map2, directionsPanel);
            directions.load("from: avenida san juan 1130, capital federal, buenos aires, to: avenida corrientes 1300, capital federal, buenos aires, to: Av. Infanta Isabel 555, Buenos Aires, to: avenida san juan 1150, capital federal, buenos aires");
            
            
            var point = new GPoint(-4, 40);
            var marker = new GMarker(point);
            map2.addOverlay(marker); 
            GEvent.addListener(map2, "click", function (overlay, point) {
                if (point) {
                    marker.setPoint(point);
                    $('#<%= lblHojaRutaX.ClientID %>').html(point.x);
                    $('#<%= lblHojaRutaY.ClientID %>').html(point.y);
                }
            });
        }
    });
</script>
<div class="sidebar-at-right" id="main">
<div id="content">
    <center>
    <fieldset>
        <legend>ENRUTAR SERVICIO:</legend>
        <table>
            <tr>
                <td>
                    <asp:GridView AutoGenerateColumns="False"  ID="gvNuevoServicio" runat="server" 
                        AllowPaging="True">
                        <Columns>
                            <asp:BoundField HeaderText="ID"  DataField="ID" />
                            <asp:BoundField HeaderText="Usuario"  DataField="Usuario"/>
                            <asp:BoundField HeaderText="Nombre"  DataField="Nombre"/>
                            <asp:BoundField HeaderText="Apellido"  DataField="Apellido"/>
                            <asp:BoundField HeaderText="Razón Social"  DataField="RazonSocial"/>
                            <asp:BoundField HeaderText="Domicilio"  DataField="Domicilio"/>
                            <asp:BoundField HeaderText="Mail" DataField="Mail"/>
                            <asp:BoundField HeaderText="Teléfono" DataField="Telefono"/>
                            <asp:BoundField HeaderText="Volumen" DataField="Volumen"/>
                            <asp:BoundField HeaderText="Peso" DataField="Peso"/>
                            <asp:BoundField HeaderText="Valor" DataField="Valor"/>
                            <asp:BoundField HeaderText="Cantidad" DataField="Cantidad"/>
                            <asp:BoundField HeaderText="Fecha Salida" DataField="FechaSalida"/>
                            <asp:BoundField HeaderText="Fecha Llegada" DataField="FechaLlegada"/>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
            </table>
    </fieldset>
<fieldset>
        <legend>Ubicacion del servicio:</legend>
        <table  align="left">
            <tr>
                <td rowspan="4"  align="left" bgcolor="green">
                    <asp:Label ID="lblOrigen" runat="server" Text="Origen"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblFechaOrigen" runat="server" Text="Fecha Origen"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtFechaOrigen" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="lblHoraOrigen" runat="server" Text="Hora Origen"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtHoraOrigen" runat="server"></asp:TextBox>
                </td>
                <td rowspan="8">
                    <div id="imgMapa" style="width: 250px; height: 250px"></div>
                </td>
                <td rowspan="8" style="width:200px; height:250px; overflow: scroll;">
                    <div id="my_textual_div" style="width: 190px; height: 250px"></div>
                </td>
            </tr>
            <tr>
                <td>
                  <asp:Label ID="lblDomicilio" runat="server" Text="Domicilio Origen"></asp:Label>
                </td>
                <td>
                     <asp:TextBox ID="txtDomicilio" runat="server" ></asp:TextBox>
                </td>
                <td>
                  <asp:Label ID="lblProvincia" runat="server" Text="Provincia"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlProvincia" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                  <asp:Label ID="lblLocalidad" runat="server" Text="Localidad"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlLocalidad" runat="server"></asp:DropDownList>
                </td>
                <td>
                  <asp:Label ID="lblPartido" runat="server" Text="Partido"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlPartido" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblCodPostalOrigen" runat="server" Text="Cod.Postal"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtCodPostalOrigen" runat="server" ></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="lblMapaXOrigen" runat="server" Text="X="></asp:Label>
                    <br/>
                    <asp:Label ID="lblMapaYOrigen" runat="server" Text="Y="></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblZoomOrigen" runat="server" Text="ZOOM="></asp:Label>
                </td>
            </tr>
            <tr>
                <td rowspan="4" align="left" bgcolor="red">
                    <asp:Label ID="lblDestino" runat="server" Text="Destino"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblFechaDestino" runat="server" Text="Fecha Destino"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtFechaDestino" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="lblHoraDestino" runat="server" Text="Hora Destino"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtHoraDestino" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                  <asp:Label ID="lblDomicilioDestino" runat="server" Text="Domicilio Destino"></asp:Label>
                </td>
                <td>
                     <asp:TextBox ID="txtDomicilioDestino" runat="server" ></asp:TextBox>
                </td>
                <td>
                  <asp:Label ID="lblProvinciaDestino" runat="server" Text="Provincia"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlPRovinciaDestino" runat="server"></asp:DropDownList>
                </td>
            </tr>

            <tr>
                <td>
                  <asp:Label ID="lblLocalidadDestino" runat="server" Text="Localidad"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlLocalidadDestino" runat="server"></asp:DropDownList>
                </td>
                <td>
                  <asp:Label ID="lblPartidoDestino" runat="server" Text="Partido"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlPartidoDestino" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblCodPostalDestino" runat="server" Text="Cod.Postal"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtCodPostalDestino" runat="server" ></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="lblMapaXDestino" runat="server" Text="X="></asp:Label>
                    <br/>
                    <asp:Label ID="lblMapaYDestino" runat="server" Text="Y="></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblMapaZoomDestino" runat="server" Text="ZOOM="></asp:Label>
                </td>
            </tr>
        </table>
    </fieldset>
    <fieldset>
        <legend>vehículos:</legend>
        <table>
            <tr>
                <td>
                    <asp:GridView AutoGenerateColumns="False"  ID="gvVehiculos" runat="server" 
                        AllowPaging="True">
                        <Columns> 
                            <asp:TemplateField HeaderText="Select">
                                <ItemTemplate>
                                   <asp:CheckBox ID="chkSelect" runat="server"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="ID"  DataField="ID" />
                            <asp:BoundField HeaderText="Patente"  DataField="Patente"/>
                            <asp:BoundField HeaderText="Descripción"  DataField="descripcion"/>
                            <asp:BoundField HeaderText="Modelo"  DataField="modelo"/>
                            <asp:BoundField HeaderText="Autonomía"  DataField="autonomia"/>
                            <asp:BoundField HeaderText="Tara"  DataField="Tara"/>
                            <asp:BoundField HeaderText="Kilometraje"  DataField="Kilometraje"/>
                            <asp:BoundField HeaderText="Carga Ancho"  DataField="cargaAncho"/>
                            <asp:BoundField HeaderText="Carga Alto"  DataField="cargaAlto"/>
                            <asp:BoundField HeaderText="Carga Largo"  DataField="cargaLargo"/>
                            <asp:BoundField HeaderText="Volumen" DataField="Volumen"/>
                        </Columns>
                    </asp:GridView>
                </td>
                <td>
                <asp:Button ID="btnVerificarCarga" runat="server" Text="Verificar Carga" />
                </td>
            </tr>
        </table>
    </fieldset>
    <fieldset>
        <legend>Hoja de ruta:</legend>
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblHojaRutaDescripcion" Width="60" runat="server" Text="Descripción"></asp:Label>
                    <asp:TextBox ID="txtHojaRutaDescripcion" runat="server" ></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="Label1" runat="server"  Width="60" Text="Viaticos"></asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="lblHojaRuta_X" runat="server" Text="X="></asp:Label>
                    <asp:Label ID="lblHojaRutaX"  Width="100" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblHojaRuta_Y" runat="server" Text="Y="></asp:Label>
                    <asp:Label ID="lblHojaRutaY" Width="100" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblTiempoDestino" runat="server" Text="Tiempo Destino"></asp:Label>
                    <asp:TextBox ID="txtTiempoDestino" runat="server" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                   <asp:Button ID="btnAgregarRecorrido" runat="server" Text="Agregar recorrido" />
                </td>
                <td>
                   <asp:Button ID="btnModificarRecorrido" runat="server" Text="Modificar recorrido" />
                </td>
                <td>
                   <asp:Button ID="btnEliminarRecorrido" runat="server" Text="Eliminar recorrido" />
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td colspan="5">
                    <asp:GridView AutoGenerateColumns="False"  ID="gvHojaRuta" runat="server" AllowPaging="True" ShowFooter="True" >
                        <Columns>
                            <asp:BoundField HeaderText="ID" DataField="ID"/>
                            <asp:BoundField HeaderText="Descripción " DataField="descripcion"/>
                            <asp:BoundField HeaderText="Viaticos " DataField="viaticos"/>
                            <asp:BoundField HeaderText="Ubicación X" DataField="puntoX"/>
                            <asp:BoundField HeaderText="Ubicación Y" DataField="puntoY"/>
                            <asp:BoundField HeaderText="Tiempo recorrido" DataField="tiempoRecorrido"/>
                            <asp:BoundField HeaderText="Distancia recorrida" DataField="distanciaRecorrida"/>
                            <asp:BoundField HeaderText="Tiempo en destino" DataField="tiempoDestino"/>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <div id="imgMapa2" style="width: 500px; height: 250px"></div>
                </td>
                <td colspan="2" style="width:250px; height:250px; overflow: scroll;">
                    <div id="my_textual_div2" style="width: 249px; height: 250px"></div>
                </td>
            </tr>
        </table>
    </fieldset>
    <table>
        <tr>    
            <td>
                <asp:Label ID="lblHoraInicioServicio" runat="server" Text="Hora Inicio Servicio"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtHoraInicioServicio" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="lblFechaInicioServicio" runat="server" Text="Fecha Inicio Servicio"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtFechaInicioServicio" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="lblHoraFinServicio" runat="server" Text="hora de fin de servicio"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtHoraFinServicio" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="lblFechaFinServicio" runat="server" Text="Fecha Fin Servicio"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtFechaFinServicio" runat="server"></asp:TextBox>
            </td>
        </tr>
    </table>
    <table>
        <tr>    
            <td>
                <asp:Label ID="lblDescripcionServicio" runat="server" Text="Descripción del servicio"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDescripcionServicio" Width="400" runat="server" TextMode="MultiLine" ></asp:TextBox>
            </td>
            <td>
                <asp:CheckBoxList ID="cblAdicionales" runat="server" BorderWidth="1" Width="180"></asp:CheckBoxList>
            </td>
            <td>
                <asp:Label ID="lblCosto" runat="server" Text="Costo del servicio"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtCosto" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Button ID="btnCalendario" runat="server" Text="Calendario" />
            </td>
            <td>
               <asp:Button ID="btnImprimirHojaRuta" runat="server" Text="Imprimir hoja de ruta" />
            </td>
            <td>
                <asp:Button ID="btnEnrutado" runat="server" Text="Enrutado" />
            </td>
            <td>
                <asp:Button ID="btnEnCurso" runat="server" Text="En curso" />
            </td>
        </tr>
    </table>
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