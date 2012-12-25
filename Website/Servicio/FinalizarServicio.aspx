<%@ Page Language="C#" MasterPageFile="~/MasterPages/BackEnd.master" AutoEventWireup="true" CodeFile="FinalizarServicio.aspx.cs" Inherits="_Default" title="Home" culture="auto" meta:resourcekey="PageResource1" uiculture="auto"%>
<%@ MasterType VirtualPath="~/MasterPages/BackEnd.master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" Runat="Server">
   <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAIKI1RJamIEvP7_Du5ZGi6xS4M_PhMYp3D1A5cqeLLIOnkUYWYhS8jdwSdUjZxBwswqHipWYzfju7fA" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        if (GBrowserIsCompatible()) {
            var directionsPanel;
            var directions;
           
            var map2 = new GMap2(document.getElementById("imgMapa2"));
            directionsPanel = document.getElementById("my_textual_div2");
            map2.setCenter(new GLatLng(-34.67021034260053, -58.34191918373108), 15);
            directions = new GDirections(map2, directionsPanel);
            directions.load("from: avenida san juan 1130, capital federal, buenos aires, to: avenida corrientes 1300, capital federal, buenos aires, to: Av. Infanta Isabel 555, Buenos Aires, to: avenida san juan 1150, capital federal, buenos aires");

        }
    });
</script>
<div class="sidebar-at-right" id="main">
<div id="content">
    <center>
    <fieldset>
        <legend>Finalizar Servicio:</legend>
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
        <legend>Hoja de ruta:</legend>
        <table>
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
    <fieldset>
        <legend>Resumen del servicio:</legend>
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
        <table align="left">
            <tr>
                <td>
                    <asp:Label ID="lblComentarios" runat="server" Text="Comentarios:"></asp:Label>
                </td>
                <td colspan="6">
                    <asp:TextBox ID="txtComentarios" Width="100%" runat="server" Rows="2" Columns="80"
                        TextMode="MultiLine" ></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="lblkmRecorridosReales" runat="server" Text="Km Recorridos Reales"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtKmRecorridosReales" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="lblViaticosReales" runat="server" Text="Viaticos Reales"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtViaticosReales" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
    </fieldset>
    <table>
        <tr>    
            <td>
                <asp:Button ID="btnFinalizarServicio" runat="server" Text="Finalizar servicio" />
            </td>
            <td>
                <asp:Button ID="btnGenerarCatalogo" runat="server" Text="Generar Catalogo electronico" />
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