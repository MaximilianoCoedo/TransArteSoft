<%@ Page Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="Inicio.aspx.cs" Inherits="_Default" title="Inicio" culture="auto" uiculture="auto" meta:resourcekey="PageResource1"%>
<%@ MasterType VirtualPath="~/MasterPages/MasterPage.master"%>


<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="Server">
    <div class="sidebar-at-right" id="main">
    <div id="content">
    <fieldset class="ui-corner-all">
                <legend class="ui-widget ui-state-default ui-corner-all ui-button-text" style="text-align: left;
                    font-size: medium;">
                    <asp:Label ID="LabelEmpresaLegend" runat="server" Style="font-weight: bold;" meta:resourcekey="LabelEmpresaLegendResource1">
                    </asp:Label>
                </legend>
                <table border="0" style="width: 100%;">
                     <tr >
                        <td style="text-align: left; vertical-align: top" >
                         <asp:Image ID="InicioImageHeader"  runat="server" Width="71px" Height="45px" 
                                ImageUrl="~/images/logoMini.PNG" ImageAlign="Top" 
                                meta:resourcekey="InicioImageHeaderResource1" />
                        </td>
                        <td  style="text-align: justify;">
                          <asp:Label ID="LabelEmpresaDescripcion" runat="server" ForeColor="Black" meta:resourcekey="LabelEmpresaDescripcionResource1" style="text-align: justify;">
                            </asp:Label>
                        </td>
                        <td>
                            <!--iframe title="TransArte" width="270px" height="200px" src="http://www.youtube.com/embed/yhP6zfFyi0w?rel=0&autoplay=1&wmode=opaque&autohide=1&version=3&egm=1&loop=1&enablejsapi=1&fs=0" frameborder="1"></iframe-->
                        </td>
                    </tr>
                    <tr >
                        <td style="text-align: justify;" colspan="3">
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