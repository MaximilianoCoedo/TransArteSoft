<%@ Page Language="C#" MasterPageFile="~/MasterPages/BackEnd.master" AutoEventWireup="true" CodeFile="Errores.aspx.cs" Inherits="_Default" title="Inicio" culture="auto" uiculture="auto" meta:resourcekey="PageResource1"%>
<%@ MasterType VirtualPath="~/MasterPages/BackEnd.master"%>


<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="Server">

<div id="idioma" style="display:none;">


 <!-- recursos utilizados en el multiidioma -->
 <asp:Label ID="lblintBD" Visible="False" runat="server" 
        meta:resourcekey="lblintBD"></asp:Label>
 <asp:Label ID="labelIntVertical" Visible="False" runat="server" 
        meta:resourcekey="labelIntVertical"></asp:Label>
 <asp:Label ID="labelIntHorTabla" Visible="False" runat="server" 
        meta:resourcekey="labelIntHorTabla"></asp:Label>
 <asp:Label ID="labelIntHorIdentificador" Visible="False" runat="server" 
        meta:resourcekey="labelIntHorIdentificador"></asp:Label>
 
 <asp:TextBox ID="errorDefault" Visible="False" runat="server" 
        meta:resourcekey="labelErrorDefault">Se ha producido un error</asp:TextBox>
 <asp:TextBox ID="errorAcceso" Visible="False" runat="server" 
        meta:resourcekey="labelErrorAcceso">El usuario no tiene los permisos para acceder a esta pagina</asp:TextBox>
 <asp:TextBox ID="errorBajaDeUsuario" Visible="False" runat="server" 
        meta:resourcekey="labelErrorBajaDeUsuario">El usuario está dado de baja, contactese con personal de TransArte</asp:TextBox>
 <asp:TextBox ID="errorFueraSession" Visible="False" runat="server" 
        meta:resourcekey="labelErrorFueraSession">El usuario no tiene una sesión iniciada, debe iniciar una nueva sesión</asp:TextBox>
 
 

 <asp:TextBox ID="errorIntegridad" Visible="False" runat="server" 
        meta:resourcekey="labelErrorBajaDeUsuario">Error de integridad en al base de datos, contactese con personal de TransArte</asp:TextBox>
 
 
 <!-- Fin  de recursos utilizados en el multiidioma -->
<!-- Ayuda -->
    <asp:Label ID="help_dialog" Text=""  runat="server" meta:resourcekey="help_dialogResource1" ></asp:Label>
    <asp:Label ID="help_dialog_TOOL" 
            Text="Cuadro de ayuda de administración de errores"  runat="server" 
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
                <legend class="ui-widget ui-state-default ui-corner-all ui-button-text" style="text-align: left;
                    font-size: medium;">
                    <asp:Label ID="LabelEmpresaLegend" runat="server" Style="font-weight: bold;" meta:resourcekey="LabelEmpresaLegendResource1">
                    TransArte
                    </asp:Label>
                </legend>
                <asp:Table ID="imgError" runat="server"  border="0" style="width: 100%; border-spacing:0px" class="ui-widget ui-corner-all ui-button-text">
                    <asp:TableRow >
                        <asp:TableCell style="text-align: left;" RowSpan="2">
                            <asp:Image ID="imgCritico"  Visible="false" runat="server" Width="64px" Height="64px" ImageUrl="~/images/critica.PNG" ImageAlign="TextTop" />
                            <asp:Image ID="imgModerado" Visible="false" runat="server" Width="64px" Height="64px" ImageUrl="~/images/moderada.PNG" ImageAlign="TextTop"/>
                            <asp:Image ID="imgLeve" Visible="false" runat="server" Width="64px" Height="64px" ImageUrl="~/images/leve.PNG" ImageAlign="TextTop" />
                        </asp:TableCell >
                        <asp:TableCell style="text-align: left; font-family:Verdana; font-size:Large;" >
                            <asp:Label ID="LabelCritico" Visible="false" runat="server"  meta:resourcekey="LabelCritico" style="text-align: justify;"></asp:Label>
                            <asp:Label ID="LabelModerado" Visible="false" runat="server" meta:resourcekey="LabelModerado" style="text-align: justify;"></asp:Label>
                            <asp:Label ID="LabelLeve" Visible="false" runat="server"  meta:resourcekey="LabelLeve" style="text-align: justify;"></asp:Label>
                        </asp:TableCell >
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell style="text-align: left;">
                            <asp:Literal  ID="LabelError" Visible="true" runat="server"></asp:Literal>
                        </asp:TableCell >
                        <asp:TableCell   style="text-align: left; width: 50px;">
                        </asp:TableCell >
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell style="text-align: left;" ColumnSpan="2">
                            <hr/>
                        </asp:TableCell >
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell style="text-align: left;" ColumnSpan="2">
                          <asp:Literal ID="literalIntegridad" Visible="false" runat="server">
                          </asp:Literal>
                        </asp:TableCell >
                    </asp:TableRow>
                </asp:Table >
                <asp:Label ID="Label1" runat="server" 
                    meta:resourcekey="LabelEmpresaPieResource1">                
                </asp:Label>
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