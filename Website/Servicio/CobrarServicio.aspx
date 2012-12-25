<%@ Page Language="C#" MasterPageFile="~/MasterPages/BackEnd.master" AutoEventWireup="true" CodeFile="CobrarServicio.aspx.cs" Inherits="_Default" title="Home" culture="auto" meta:resourcekey="PageResource1" uiculture="auto"%>
<%@ MasterType VirtualPath="~/MasterPages/BackEnd.master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" Runat="Server">
    <center>
    <fieldset>
        <legend>Cobrar Servicio:</legend>
        <table>
            <tr>
                <td>
                    <asp:GridView AutoGenerateColumns="False"  ID="gvServicio" runat="server" 
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
        <legend>Buscar por factura:</legend>
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblNroFactura" runat="server" Text="Nro. de factura:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtNroFactura" runat="server" ></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="lblServicio" runat="server" Text="Nro. de Servicio:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtServicio" runat="server" ></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="lblImporte" runat="server" Text="Importe:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtImporte" runat="server" ></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="btnVizualizarFactura" runat="server" Text="visualizar Factura" />
                </td>
                <td>
                    <asp:Button ID="btnGenerarRecibo" runat="server" Text="Generar Recibo" />
                </td>
                <td>
                    <asp:Button ID="btnCobrado" runat="server" Text="Cobrar Factura" />
                </td>
            </tr>
        </table>
    </fieldset>
    </center>
</asp:Content>