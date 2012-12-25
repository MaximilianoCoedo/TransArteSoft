<%@ Page Language="C#" MasterPageFile="~/MasterPages/BackEnd.master" AutoEventWireup="true" CodeFile="ManejoEstados.aspx.cs" Inherits="_Default" title="Home" culture="auto" meta:resourcekey="PageResource1" uiculture="auto"%>
<%@ MasterType VirtualPath="~/MasterPages/BackEnd.master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" Runat="Server">
<div class="sidebar-at-right" id="main">
<div id="content">
    <center>
    <fieldset>
        <legend>Cambio de estado:</legend>
        <table  align="left">
            <tr>
                <td>
                    <asp:Label ID="lblServicio" runat="server" Text="Nro. de Servicio:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtServicio" runat="server" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblEstadoActual" runat="server" Text="Estado Actual:"></asp:Label>
                </td>
                <td>
                    <asp:CheckBoxList ID="cblEstadoActual" runat="server" BorderWidth="1" Width="180"></asp:CheckBoxList>
                </td>
                <td>
                    <asp:Label ID="lblEstadoFuturo" runat="server" Text="Estado Futuro:"></asp:Label>
                </td>
                <td>
                    <asp:CheckBoxList ID="cblEstadoFuturo" runat="server" BorderWidth="1" Width="180"></asp:CheckBoxList>
                </td>
                <td>
                    <asp:Button ID="btnConfirmar" runat="server" Text="Confirmar cambios" />
                </td>
            </tr>
        </table>
    </fieldset>
    <fieldset>
        <legend>Anulación de documentación:</legend>
        <table  align="left">
            <tr>
                <td>
                    <asp:Label ID="lblFactura" runat="server" Text="Nro. de Factura:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtFactura" runat="server" ></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="btnAnularFactura" runat="server" Text="Anular Factura" />
                </td>
                <td>
                    <asp:Label ID="lblPresupuesto" runat="server" Text="Nro. de Presupuesto:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPresupuesto" runat="server" ></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="btnAnularPresupuesto" runat="server" Text="Anular Presupuesto" />
                </td>
                <td>
                    <asp:Label ID="lblAnularRecibo" runat="server" Text="Nro. de Recibo:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtAnularRecibo" runat="server" ></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="btnAnularRecibo" runat="server" Text="Anular Recibo" />
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