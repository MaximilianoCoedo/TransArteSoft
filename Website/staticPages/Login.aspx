<%@ Page Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true"
    CodeFile="Login.aspx.cs" Inherits="_Default" Title="Login" Culture="auto" UICulture="auto" meta:resourcekey="PageResource1" %>

<%@ MasterType VirtualPath="~/MasterPages/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="Server">
    <div class="sidebar-at-right" id="main">
        <div id="content">
            <table style="width: 100%;">
                 <tr>
                    <td align="center" class="ui-widget ui-state-default ui-corner-all">
                        <fieldset class="ui-corner-all">
                            <legend class="ui-widget ui-state-default ui-corner-all ui-button-text" style="text-align: left;
                                font-size: medium;">
                                <asp:Label ID="LabelEmpresaLegend" runat="server" Style="font-weight: bold;" meta:resourcekey="LabelEmpresaLegendResource1">
                                </asp:Label>
                            </legend>
                            <table  align="center" cellpadding="2" cellspacing="0" class="ui-widget ui-state-default ui-corner-all">
                             <tr>
                                <td align="center" >
                                    <asp:Image ID="ImageHeader" runat="server" Width="375px" Height="65px" ImageUrl="~/images/header_logo.JPG"
                                        ImageAlign="Middle" BorderStyle="None" 
                                        meta:resourcekey="ImageHeaderResource1" />
                                </td>
                            </tr>
                             <tr>
                                <td align="center" >
                                     <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                                         <tr>
                                            <td>
                                                <img alt="usuario"  src="../images/1318301260_users.png" width="15" height="15"/>
                                                <asp:Label ID="lblLoginUsuario" runat="server" Text="Usuario:" meta:resourcekey="lblLoginUsuario"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtLoginUsuario" runat="server"  meta:resourcekey="txtLoginUsuario"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="rfvLoginUsuario" Visible="false"  runat="server"  ForeColor="Red" ControlToValidate="txtLoginUsuario"  
                                                ErrorMessage="* Usuario no válido" meta:resourcekey="rfvLoginUsuario"></asp:RequiredFieldValidator><br />
                                            </td>
                                        </tr>
                                         <tr>
                                            <td>
                                                <img alt="usuario"  src="../images/1318301260_users.png" width="15" height="15"/>
                                                <asp:Label ID="LblLoginPassword" runat="server" Text="Contraseña:" meta:resourcekey="LblLoginPassword"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtLoginPassword" runat="server"  TextMode="Password"  
                                                    meta:resourcekey="txtLoginPassword" ></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="rfvLoginPsw"  Visible="false" runat="server"  ForeColor="Red" ControlToValidate="txtLoginPassword" 
                                                ErrorMessage="* Contraseña no válida." meta:resourcekey="rfvLoginPsw"></asp:RequiredFieldValidator><br />
                                            </td>
                                        </tr>
                                        <tr>
                                           <td  colspan="3" align="center">
                                                <asp:Label ID="lblInvalido" runat="server" ForeColor="Red" 
                                                    Visible="false" Width="100%" 
                                                    meta:resourcekey="lblLoginInvalido"></asp:Label><br />
                                            </td>
                                        </tr>
                                        <tr>
                                           <td  colspan="3" align="center">
                                                <asp:Label ID="lblBloqueado" runat="server" ForeColor="Red" 
                                                    Visible="false" Width="100%" meta:resourcekey="lblLoginBloqueado"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                           <td  colspan="3" align="center">
                                                <asp:Label ID="lblBloqueado2" runat="server" ForeColor="Red" 
                                                    Visible="false" Width="100%" meta:resourcekey="lblLoginBloqueado2"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                           <td  colspan="3" align="center">
                                                <asp:Button ID="btnResetPass" Visible="false" runat="server" CssClass="botones" Text="" OnClick="btnResetPass_Click" meta:resourcekey="btnResetPass"></asp:Button>
                                            </td>
                                        </tr>
                                        <tr>
                                           <td  colspan="3" align="center">
                                            <asp:Button ID="btnIngresar" runat="server" CssClass="botones" Text="ingresar" OnClick="btnIngresar_Click" meta:resourcekey="btnLoginIngresar"></asp:Button>
                                            </td>
                                        </tr>
                                    </table>
                             </td>
                            </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>

                <tr>
                    <td>
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    </td>
                </tr>
               
            </table>
        </div>
        <div id="sidebar" style="text-align: left; text-align: justify;" class="ui-corner-all">
            <!-- ayuda -->
            <asp:Label ID="Label4" runat="server" ForeColor="Black" meta:resourcekey="LabelLoginTituloAyuda"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" ForeColor="Black" meta:resourcekey="LabelLoginDescripcionAyuda"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label6" runat="server" ForeColor="Black" meta:resourcekey="LabelLoginPieAyuda"></asp:Label>
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
