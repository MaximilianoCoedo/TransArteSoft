<%@ Page Language="C#" MasterPageFile="~/MasterPages/BackEnd.master" AutoEventWireup="true" CodeFile="FacturarServicio.aspx.cs" Inherits="_Default" title="Home" culture="auto" meta:resourcekey="PageResource1" uiculture="auto"%>
<%@ MasterType VirtualPath="~/MasterPages/BackEnd.master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" Runat="Server">
<div class="sidebar-at-right" id="main">
<div id="content">
 <center>
    <fieldset>
        <legend>Facturar Servicio:</legend>
        <table>
            <tr>
                <td>
                    <asp:GridView AutoGenerateColumns="False"  ID="gvFacturar" runat="server" 
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
                <asp:Label ID="lblDescripcionServicio" runat="server" Text="Descripcion del servicio"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDescripcionServicio" Width="500" runat="server" TextMode="MultiLine" ></asp:TextBox>
            </td>
            <td>
                <asp:CheckBoxList ID="cblAdicionales" runat="server" BorderWidth="1" Width="200">
                </asp:CheckBoxList>
            </td>
        </tr>
    </table>
    </fieldset>
    <fieldset>
        <legend>Factura del servicio:</legend>
        <fieldset>
            <legend>Encabezado:</legend>
                <table>
                    <tr>    
                        <td>
                            <asp:Label ID="lblNombre" runat="server" Text="Nombre"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtNombre"  runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblApellido" runat="server" Text="Apellido"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtApellido"  runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblDomicilio" runat="server" Text="Domicilio"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtDomicilio"  runat="server"></asp:TextBox>
                        </td>
                        <td rowspan="4">
                            <asp:CheckBoxList ID="cblIVA" runat="server" BorderWidth="1" Width="200">
                            </asp:CheckBoxList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblTelefono" runat="server" Text="Teléfono"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtTelefono"  runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblRazonSocial" runat="server" Text="Razon Social"></asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="txtRazonSocial" Width="100%" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblFecha" runat="server" Text="Fecha"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtFecha"  runat="server"></asp:TextBox>
                        </td>
                        <td colspan="2">
                            <asp:RadioButton ID="RadioButton1" GroupName="cuit" name="CUIT" runat="server" Text="CUIT"/>
                            <asp:RadioButton ID="RadioButton2" GroupName="cuit" name="CUIL" runat="server" Text="CUIL"/>
                        </td>
                        <td>
                            <asp:TextBox ID="txtCUIT" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblNroFactura" runat="server" Text="Nro Factura"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtNroFactura" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblServicio" runat="server" Text="Nro Servicio"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtServicio"  runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </table>
        </fieldset>
        <fieldset>
            <legend>Items:</legend>
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblCantidad" runat="server" Text="cantidad"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtCantidad"  runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblDescripcion" runat="server" Text="Descripción"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtDescripcion"  runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblPrecio" runat="server" Text="Precio"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPrecio"  runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblTotal" runat="server" Text="Total"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtTotal"  runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Button ID="btnAgregarItem" runat="server" Text="Agregar item" />
                            <asp:Button ID="btnBorrarFactura" runat="server" Text="Limpiar Factura" />
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <asp:GridView AutoGenerateColumns="False"  ID="gvDetalleFactura" runat="server" 
                                AllowPaging="True" ShowFooter="True" >
                                <Columns>
                                    <asp:BoundField HeaderText="ID" DataField="ID"/>
                                    <asp:BoundField HeaderText="Cantidad" DataField="cantidad"/>
                                    <asp:BoundField HeaderText="Descripción" DataField="descripcion"/>
                                    <asp:BoundField HeaderText="Precio" DataField="precio"/>
                                    <asp:BoundField HeaderText="Total" DataField="total" FooterText="Total=$56.000"/>
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
        </fieldset>
        <table>
            <tr>
                <td>
                    <asp:Button ID="btnGenerarFactura" runat="server" Text="Generar Factura" />
                    <asp:Button ID="btnImprimirFactura" runat="server" Text="Imprimir Factura" />
                    <asp:Button ID="btnEnviarFactura" runat="server" Text="Enviar Factura" />
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