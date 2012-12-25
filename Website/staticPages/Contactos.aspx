<%@ Page Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="false"
    CodeFile="Contactos.aspx.cs" Inherits="QuienesSomos" Title="Contactos" Culture="auto"
    meta:resourcekey="PageTitle" UICulture="auto" %>

<%@ MasterType VirtualPath="~/MasterPages/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="Server">
    <div class="sidebar-at-right" id="main">
        <div id="content">
            <fieldset class="  ui-corner-all">
                <legend class="ui-widget ui-state-default ui-corner-all ui-button-text" style="text-align:left; font-size: medium;">
                    <asp:Label ID="LabelUbicacionLegend" runat="server" Style="font-weight: bold;" meta:resourcekey="LabelContactosLegendResource1">
                    </asp:Label>
                </legend>
                <table border="0" width ="100%">
                    <tr>
                        <td style="text-align: left;" colspan="2">
                            <asp:Label ID="Label3" runat="server" ForeColor="Black" meta:resourcekey="LabelContactosDescripcionResource1"></asp:Label>
                        </td>
                    </tr>
                    <tr align="left" >
                        <td >
                        <asp:Label ID="lblNombre" runat="server" ForeColor="Black" meta:resourcekey="LabelContactosNombre"></asp:Label>
                        </td>
                        <td >
                            <asp:TextBox ID="txtNombre" runat="server" 
                                class="ui-widget ui-state-default ui-corner-all ui-button-text"   Width="270px" 
                                Style="color: black; font-weight: bold; " CausesValidation="True"/>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtNombre" ErrorMessage=""  style="color:Red" 
                                meta:resourcekey="RequiredFieldValidatorNombre"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr align="left">
                        <td >
                        <asp:Label ID="Label1" runat="server" ForeColor="Black" meta:resourcekey="LabelContactosApellidos"></asp:Label>

                        </td>
                        <td >
<asp:TextBox ID="txtApellidos" runat="server" class="ui-widget ui-state-default ui-corner-all ui-button-text"  Width="270px" Style="color: black; font-weight: bold;" meta:resourcekey="txtContactoslblApellidos"/>
                        </td>
                    </tr>
                    <tr align="left">
                        <td >
                        <asp:Label ID="Label2" runat="server" ForeColor="Black" meta:resourcekey="LabelContactosTelefono"></asp:Label>
                        </td>
                        <td >
<asp:TextBox ID="txtTelefono" runat="server" class="ui-widget ui-state-default ui-corner-all ui-button-text"  Width="270px" Style="text-align: right ; color: black; font-weight: bold;" meta:resourcekey="txtContactoslblTelefono"/>
                        </td>
                    </tr>
                    <tr align="left">
                        <td style="height: 30px" >
<asp:Label ID="Label7" runat="server" ForeColor="Black" meta:resourcekey="LabelContactosCorreo"></asp:Label>
                        </td>
                        <td style="height: 30px" >
<asp:TextBox ID="txtCorreo" runat="server" class="ui-widget ui-state-default ui-corner-all ui-button-text"  Width="270px" Style="color: black; font-weight: bold;" meta:resourcekey="txtContactosLblCorreo"/>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="txtCorreo" ErrorMessage="" style="color:Red" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                meta:resourcekey="RegularExpressionValidatorMail"></asp:RegularExpressionValidator>
<br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtCorreo" ErrorMessage=""  style="color:Red" 
                                meta:resourcekey="RequiredFieldValidatorMail"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr align="left">
                        <td style="vertical-align :top">
<asp:Label ID="Label8" runat="server" ForeColor="Black" meta:resourcekey="LabelContactosComentarios"></asp:Label>

                        </td>
                        <td>
<asp:TextBox ID="txtComentarios" runat="server" class="ui-widget ui-state-default ui-corner-all ui-button-text"  Height="140px" Width="75%" TextMode="MultiLine" Style="color: black; font-weight: bold;" meta:resourcekey="txtContactoslblComentarios"/>
<br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" style="color:Red; vertical-align :top"
                                ControlToValidate="txtComentarios" ErrorMessage="RequiredFieldValidator"
                                meta:resourcekey="RequiredFieldValidatorComentario"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: left; text-align: center ;" align="center" >
                            <asp:Label ID="LabelContactosPie" ForeColor="Black" runat="server" meta:resourcekey="LabelContactosPieResource1"></asp:Label>
<asp:Label ID="lblRespuestaOk" runat="server" visible = "False"  Text=""  style="color:Green;" 
                                meta:resourcekey="lblContactosRespuestaOk"></asp:Label>
<asp:Label ID="lblRespuestaError" runat="server" visible = "False"   Text="
"  style="color:Red" 
                                meta:resourcekey="lblContactosRespuestaError"></asp:Label>
<br />
<asp:Button ID="Btn_enviar_mail" runat="server" OnClick="Btn_enviar_mail_Click" Text="Envíar mail"  meta:resourcekey="btnContactosEnviar"/>
                        </td>
                    </tr>
                </table>
            </fieldset>
        </div>
        <div id="sidebar" style="text-align: left; text-align: justify;" class="ui-corner-all">
            <!-- ayuda -->
            <asp:Label ID="Label4" runat="server" ForeColor="Black" meta:resourcekey="LabelContactosTituloAyuda"></asp:Label>
            
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" ForeColor="Black" meta:resourcekey="LabelContactosDescripcionAyuda"></asp:Label>

            <br />
            <br />
            <asp:Label ID="Label6" runat="server" ForeColor="Black" meta:resourcekey="LabelContactosPieAyuda"></asp:Label>

        </div>
        <a id="separator" href="#" style="text-decoration: none;">
            <asp:Image ID="Image2" Style="padding-left: 1px;" runat="server" Height="15px" Width="15px"
                ImageUrl="~/images/help.png" meta:resourcekey="Image2Resource1" />
            <div style="padding-left: 5px; color: black; font-weight: bold;">
                <asp:Label ID="LabelAyuda" runat="server" meta:resourcekey="LabelAyudaResource1"/>
            </div>
        </a>
        <div class="clearer">
            &nbsp;
        </div>
    </div>
</asp:Content>
