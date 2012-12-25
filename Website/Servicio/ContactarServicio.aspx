<%@ Page Language="C#" MasterPageFile="~/MasterPages/BackEnd.master" AutoEventWireup="true" CodeFile="ContactarServicio.aspx.cs" Inherits="_Default" title="Home" culture="auto" meta:resourcekey="PageResource1" uiculture="auto"%>
<%@ MasterType VirtualPath="~/MasterPages/BackEnd.master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" Runat="Server">
<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAIKI1RJamIEvP7_Du5ZGi6xS4M_PhMYp3D1A5cqeLLIOnkUYWYhS8jdwSdUjZxBwswqHipWYzfju7fA" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        if (GBrowserIsCompatible()) {
            var map;
            var directionsPanel;
            var directions;
            map = new GMap2(document.getElementById("imgMapaOrigen"));
            directionsPanel = document.getElementById("my_textual_div");
            map.setCenter(new GLatLng(-34.67021034260053, -58.34191918373108), 15);
            directions = new GDirections(map, directionsPanel);
            directions.load("from: san juan 1130, capital federal, buenos aires to: Av. Infanta Isabel 555, Buenos Aires");
        }
    });
</script>
    <center>
    <fieldset>
        <legend>CONTACTAR SERVICIO:</legend>
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
                <td rowspan="2"  align="left" bgcolor="green" >
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
                    <div id="imgMapaOrigen" style="width: 250px; height: 250px"></div>
                </td>
                <td rowspan="8" style="width:250px; height:250px; overflow: scroll;">
                    <div id="my_textual_div" style="width: 250px; height: 250px"></div>
                </td>
            </tr>
            <tr> 
                <td>
                  <asp:Label ID="lblDomicilioOrigen" runat="server" Text="Domicilio Origen"></asp:Label>
                </td>
                <td>
                     <asp:TextBox ID="txtDomicilioOrigen" runat="server" ></asp:TextBox>
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
                <td rowspan="2" align="left" bgcolor="red">
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
        <legend>Resumen del servicio:</legend>
        <table>
            <tr>
                <td>
                    <asp:GridView AutoGenerateColumns="False"  ID="gvServicios" runat="server" 
                        AllowPaging="True" ShowFooter="True" >
                        <Columns>
                            <asp:BoundField HeaderText="ID" DataField="ID"/>
                            <asp:BoundField HeaderText="Descripción" DataField="Desc"/>
                            <asp:BoundField HeaderText="Alto" DataField="Alto"/>
                            <asp:BoundField HeaderText="Ancho" DataField="Ancho"/>
                            <asp:BoundField HeaderText="Largo" DataField="Largo"/>
                            <asp:BoundField HeaderText="Volumen" DataField="Volumen" FooterText="Total=57807,5"/>
                            <asp:BoundField HeaderText="Peso" DataField="Peso" FooterText="Total=94"/>
                            <asp:BoundField HeaderText="Valor" DataField="Valor" FooterText="Total=1800000000"/>
                            <asp:BoundField HeaderText="Foto" DataField="Foto"/>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
            </table>
    </fieldset>
    <table>
        <tr>    
            <td>
                <asp:Label ID="lblDescripcionServicio" runat="server" Text="Descripcion del servicio"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDescripcionServicio" Width="500" runat="server" TextMode="MultiLine" ></asp:TextBox>
            </td>
            <td>
                <asp:CheckBoxList ID="cblAdicionales" runat="server" BorderWidth="1" Width="200">
                </asp:CheckBoxList>
            </td>
            <td>
                <asp:Button ID="btnEnviarMail" runat="server" Text="Enviar Mail" />
                <asp:Button ID="btnContactado" runat="server" Text="Contactado" />
                <asp:Button ID="btnBaja" runat="server" Text="Descartado" />
             </td>
        </tr>
    </table>
    </center>
</asp:Content>