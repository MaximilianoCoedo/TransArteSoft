<%@ Page Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="false" CodeFile="LaEmpresa.aspx.cs" Inherits="LaEmpresa" title="La Empresa" culture="auto" meta:resourcekey="PageResource2" uiculture="auto" %>
<%@ MasterType VirtualPath="~/MasterPages/MasterPage.master"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" Runat="Server">
    <div class="sidebar-at-right" id="main">
    <div id="content">
        <fieldset class="ui-corner-all">
                <legend class="ui-widget ui-state-default ui-corner-all ui-button-text" style="text-align: left;
                    font-size: medium;">
                    <asp:Label ID="LabelEmpresaLegend" runat="server" Style="font-weight: bold;" meta:resourcekey="LabelEmpresaLegendResource1">
                    </asp:Label>
                </legend>
                <table border="0" style="width: 100%;">
                     <tr>
                        <td style="text-align: left;">
                            <asp:Label ID="LabelEmpresaHeader" runat="server" ForeColor="Black" meta:resourcekey="LabelEmpresaHeaderResource1"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left;">
                            <asp:Label ID="LabelEmpresaDescripcion" runat="server" ForeColor="Black" meta:resourcekey="LabelEmpresaDescripcionResource1">
                            </asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left; text-align: justify;">
                            <asp:Label ID="LabelEmpresaPie" ForeColor="Black" runat="server" meta:resourcekey="LabelEmpresaPieResource1">
                            </asp:Label>
                        </td>
                    </tr>
                </table>
            </fieldset>
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
