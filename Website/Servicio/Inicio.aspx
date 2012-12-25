<%@ Page Language="C#" MasterPageFile="~/MasterPages/BackEnd.master" AutoEventWireup="true" CodeFile="Inicio.aspx.cs" Inherits="_Default" title="Inicio" culture="auto" uiculture="auto" meta:resourcekey="PageResource1"%>
<%@ MasterType VirtualPath="~/MasterPages/BackEnd.master"%>


<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="Server">
<div id="idioma" style="display:none;">
<!-- Ayuda -->
    <asp:Label ID="help_dialog" Text=""  runat="server" meta:resourcekey="help_dialogResource1" ></asp:Label>
    <asp:Label ID="help_dialog_TOOL" 
            Text="Cuadro de ayuda de inicio de sesion"  runat="server" 
        meta:resourcekey="help_dialog_TOOLResource1" ></asp:Label>
    <asp:Label ID="help_dialog_content" Text=""  runat="server" meta:resourcekey="help_dialog_contentResource1" ></asp:Label>
    <div id="h_dialog" title="">
        <div>
            <div class="ui-state-highlight ui-corner-all" style="padding: 0 .5em; text-align:justify;">
            <p id="h_dialog_content"></p>
            </div>
        </div>
    </div>

</div>
    <fieldset class="ui-corner-all">
        <legend class="ui-widget ui-state-default ui-corner-all ui-button-text" style="text-align: left; font-size: medium;">
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
                    <asp:Label ID="LabelEmpresaDescripcion" runat="server" meta:resourcekey="LabelEmpresaDescripcionResource1" style="text-align: justify;">
                    </asp:Label>
                </td>
                <td>
                    <iframe title="TransArte" width="270px" height="200px" src="http://www.youtube.com/embed/yhP6zfFyi0w?rel=0&autoplay=1&wmode=opaque&autohide=1&version=3&egm=1&loop=1&enablejsapi=1&fs=0" frameborder="1"></iframe>
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
    
    <script type="text/javascript">
    //<![CDATA[
        jQuery(document).ready(function () {
            // cuadro de ayuda 
            $("#help_Icon").tooltip({
                bodyHandler: function () {
                    return $('#<%= help_dialog_TOOL.ClientID %>').text();
                },
                showURL: false
            });

            $("#h_dialog").dialog("destroy");
            $("#h_dialog").dialog({
                modal: false,
                height: 530,
                title: $('#<%= help_dialog.ClientID %>').html(),
                autoOpen: false,
                buttons: {
                    Ok: function () {
                        $(this).dialog("close");
                    }
                }
            });

            $("#h_dialog_content").html($('#<%= help_dialog_content.ClientID %>').html());

            $("#help_Icon").click(function () {
                $("#h_dialog").dialog("open");
                return false;
            });
        });  
    //]]>
    </script> 


</asp:Content>