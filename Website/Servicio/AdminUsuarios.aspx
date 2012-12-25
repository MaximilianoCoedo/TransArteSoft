<%@ Page Language="C#" MasterPageFile="~/MasterPages/BackEnd.master" AutoEventWireup="true" CodeFile="AdminUsuarios.aspx.cs" Inherits="_Default" title="Home" culture="auto" meta:resourcekey="PageResource1" uiculture="auto"%>
<%@ MasterType VirtualPath="~/MasterPages/BackEnd.master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" Runat="Server">


<!-- Componentes -->
<div id="idioma" style="display:none;">

<asp:Label ID="legendTitle" Text="Administración de usuarios:" runat="server" 
        meta:resourcekey="legendTitleResource1"  ></asp:Label>
<asp:Label ID="lblUsuario" Text="Usuario:" runat="server" 
        meta:resourcekey="lblUsuarioResource1"  ></asp:Label>
<asp:Label ID="lblApellido" Text="Apellido:" runat="server" 
        meta:resourcekey="lblApellidoResource1"  ></asp:Label>
<asp:Label ID="lblRazonSocial" Text="Razón social:" runat="server" 
        meta:resourcekey="lblRazonSocialResource1"  ></asp:Label>
<asp:Label ID="btnBuscar" Text="Buscar por parametros" runat="server" 
        meta:resourcekey="btnBuscarResource1"  ></asp:Label>
<asp:Label ID="usuarios" Text="Usuarios" runat="server" 
        meta:resourcekey="usuariosResource1"  ></asp:Label>
<asp:Label ID="fechaAlta" Text="Fecha Alta" runat="server" 
        meta:resourcekey="fechaAltaResource1"  ></asp:Label>
<asp:Label ID="usuario" Text="Usuario" runat="server" 
        meta:resourcekey="usuarioResource1"  ></asp:Label>
<asp:Label ID="nombre" Text="Nombre" runat="server" 
        meta:resourcekey="nombreResource1"  ></asp:Label>
<asp:Label ID="apellido" Text="Apellido" runat="server" 
        meta:resourcekey="apellidoResource1"  ></asp:Label>
<asp:Label ID="email" Text="E-mail" runat="server" 
        meta:resourcekey="emailResource1"  ></asp:Label>
<asp:Label ID="esCuit" Text="Es Cuit" runat="server" 
        meta:resourcekey="esCuitResource1"  ></asp:Label>
<asp:Label ID="cuit_cuil" Text="Cuil o Cuit" runat="server" 
        meta:resourcekey="cuit_cuilResource1"  ></asp:Label>
<asp:Label ID="bloqueado" Text="Bloq." runat="server" 
        meta:resourcekey="bloqueadoResource1"  ></asp:Label>
<asp:Label ID="fechaBaja" Text="Fecha Baja" runat="server" 
        meta:resourcekey="fechaBajaResource1"  ></asp:Label>
<asp:Label ID="motivo" Text="Motivo" runat="server" 
        meta:resourcekey="motivoResource1"  ></asp:Label>
<asp:Label ID="razonSocial" Text="Razón social" runat="server" 
        meta:resourcekey="razonSocialResource1"  ></asp:Label>
<asp:Label ID="legendEdicionUsuarios" Text="Edición del usuario" runat="server" 
        meta:resourcekey="legendEdicionUsuariosResource1"  ></asp:Label>
<asp:Label ID="btnModiUsuario" Text="Modificar usuario" runat="server" 
        meta:resourcekey="btnModiUsuarioResource1"  ></asp:Label>
<asp:Label ID="btnAltaUsuario" Text="Alta usuario" runat="server" 
        meta:resourcekey="btnAltaUsuarioResource1"  ></asp:Label>
<asp:Label ID="lblABMContrasena" Text="Contraseña" runat="server" 
        meta:resourcekey="lblABMContrasenaResource1"  ></asp:Label>
<asp:Label ID="lblBloqueado" Text="Bloqueado" runat="server" 
        meta:resourcekey="lblBloqueadoResource1"  ></asp:Label>
<asp:Label ID="lblABMMotivo" Text="Motivo" runat="server" 
        meta:resourcekey="lblABMMotivoResource1"  ></asp:Label>
<asp:Label ID="lblBaja" Text="Baja" runat="server" 
        meta:resourcekey="lblBajaResource1"  ></asp:Label>
<asp:Label ID="lblABMEmail" Text="E-Mail" runat="server" 
        meta:resourcekey="lblABMEmailResource1"  ></asp:Label>
<asp:Label ID="gridNombreDelGrupo" Text="Nombre del grupo" runat="server" 
        meta:resourcekey="gridNombreDelGrupoResource1"></asp:Label>
<asp:Label ID="gridGrupos" Text="Grupos" runat="server" 
        meta:resourcekey="gridGruposResource1"  ></asp:Label>
<asp:Label ID="gridNombreDelPermiso" Text="Nombre del permiso" runat="server" 
        meta:resourcekey="gridNombreDelPermisoResource1"></asp:Label>
<asp:Label ID="gridPermisos" Text="Permisos" runat="server" 
        meta:resourcekey="gridPermisosResource1"  ></asp:Label>
            
<!-- Mensajes -->
<asp:Label ID="msgProcesando" Text="Aguarde un instante!!!"  runat="server" 
        meta:resourcekey="msgProcesandoResource1"  ></asp:Label>
<asp:Label ID="msgError" Text="Se ha producido un error"  runat="server" 
        meta:resourcekey="msgErrorResource1" ></asp:Label>
<asp:Label ID="msgEselPermiso" Text="Debe seleccionar al menos un permiso o grupo"  
        runat="server" meta:resourcekey="msgEselPermisoResource1" ></asp:Label>
<asp:Label ID="msgEformatEmailInvalid" Text="Formato de cuenta de e-mail INVALIDO"  
        runat="server" meta:resourcekey="msgEformatEmailInvalidResource1" ></asp:Label>
<asp:Label ID="msgEingEmail" Text="Debe ingresar una cuenta de e-mail"  
        runat="server" meta:resourcekey="msgEingEmailResource1" ></asp:Label>
<asp:Label ID="msgEingContrasenia" Text="Debe generar una contraseña"  
        runat="server" meta:resourcekey="msgEingContraseniaResource1" ></asp:Label>
<asp:Label ID="msgEingUsuario" Text="Debe ingresar un nombre de usuario"  
        runat="server" meta:resourcekey="msgEingUsuarioResource1" ></asp:Label>
<asp:Label ID="msgENombreUsuario" Text="Error con el nombre de usuario"  
        runat="server" meta:resourcekey="msgENombreUsuarioResource1" ></asp:Label>
<asp:Label ID="msgEmail" Text="Error al enviar el e-mail al usuario"  
        runat="server" meta:resourcekey="msgEmailResource1" ></asp:Label>
<asp:Label ID="msgEusuarioSelect" Text="Debe seleccionar un usuario de la grilla"  
        runat="server" meta:resourcekey="msgEusuarioSelectResource1" ></asp:Label>
<asp:Label ID="msgEMismoUsuario" 
        Text="El usuario logueado no puede modificar sus propios datos."  
        runat="server" meta:resourcekey="msgEMismoUsuarioResource1" ></asp:Label>
<asp:Label ID="msgEUniADMpermiso" 
        Text="No se saco el grupo o permiso independiente porque es el ultimo que tiene el permiso 'ABM de Usuario'." 
        runat="server" meta:resourcekey="msgEUniADMpermisoResource1"></asp:Label>
<asp:Label ID="msgEUniRestore" 
        Text="No se saco el grupo o permiso independiente  porque es el ultimo que tiene el permiso 'Restore'."  
        runat="server" meta:resourcekey="msgEUniRestoreResource1" ></asp:Label>
<asp:Label ID="msgEUniBackUp" 
        Text="No se saco el grupo o permiso independiente  porque es el ultimo que tiene el permiso 'Back Up'."  
        runat="server" meta:resourcekey="msgEUniBackUpResource1" ></asp:Label>
<asp:Label ID="msgEUniBitacora" 
        Text="No se saco el grupo o permiso independiente porque es el ultimo que tiene el permiso 'Bitacora'."  
        runat="server" meta:resourcekey="msgEUniBitacoraResource1"></asp:Label>

<!-- Tooltips --> 

<asp:Label ID="gridUsuariosTOOL" 
        Text="Esta grilla muestra los usuarios del sistema" runat="server" 
        meta:resourcekey="gridUsuariosTOOLResource1"></asp:Label>
<asp:Label ID="gridGruposTOOL" 
        Text="Esta grilla muestra los grupos asignados al usuario" runat="server" 
        meta:resourcekey="gridGruposTOOLResource1"></asp:Label>
<asp:Label ID="gridPermisosTOOL" 
        Text="Esta grilla muestra los permisos asignados al usuario" runat="server" 
        meta:resourcekey="gridPermisosTOOLResource1"></asp:Label>
<asp:Label ID="jqTxtUsuarioTOOL" Text="Ingrese un Usuario para buscar" 
        runat="server" meta:resourcekey="jqTxtUsuarioTOOLResource1"></asp:Label>
<asp:Label ID="jqTxtApellidoTOOL" Text="Ingrese un Nombre de usuario para buscar" 
        runat="server" meta:resourcekey="jqTxtApellidoTOOLResource1"></asp:Label>
<asp:Label ID="jqTxtRazonSocialTOOL" 
        Text="Ingrese la Razón Social del usuario para buscar al usuario" 
        runat="server" meta:resourcekey="jqTxtRazonSocialTOOLResource1"></asp:Label>
<asp:Label ID="jqBtnBuscarTOOL" 
        Text="Busca a los usuarios según los parámetros seteados" runat="server" 
        meta:resourcekey="jqBtnBuscarTOOLResource1"></asp:Label>
<asp:Label ID="jqCheckBloqueadoTOOL" 
        Text="Indica si el usuario está Bloqueado, no puede usar el sistema" 
        runat="server" meta:resourcekey="jqCheckBloqueadoTOOLResource1"></asp:Label>
<asp:Label ID="jqtextABMUsuarioTOOL" 
        Text="Nombre del usuario que se representa en el sistema" runat="server" 
        meta:resourcekey="jqtextABMUsuarioTOOLResource1"></asp:Label>
<asp:Label ID="jqTextABMContrasenaTOOL" Text="Contraseña del usuario" 
        runat="server" meta:resourcekey="jqTextABMContrasenaTOOLResource1"></asp:Label>
<asp:Label ID="jqBtnGenerarPassTOOL" Text="Genera una nueva contraseña" 
        runat="server" meta:resourcekey="jqBtnGenerarPassTOOLResource1"></asp:Label>
<asp:Label ID="passwordStrengthDivTOOL" 
        Text="Indica que tan FUERTE es la contraseña generada" runat="server" 
        meta:resourcekey="passwordStrengthDivTOOLResource1"></asp:Label>
<asp:Label ID="jqTextABMEmailTOOL" 
        Text="Dirección de e-mail del usuario al que le llegan los correos" 
        runat="server" meta:resourcekey="jqTextABMEmailTOOLResource1"></asp:Label>
<asp:Label ID="jqCheckBajaTOOL" 
        Text="Indica si el usuario esta dado de baja, no puede usar el sistema" 
        runat="server" meta:resourcekey="jqCheckBajaTOOLResource1"></asp:Label>
<asp:Label ID="jqTextABMMotivoTOOL" 
        Text="Motivo por el cual se Bloqueo o se dio de baja al usuario" runat="server" 
        meta:resourcekey="jqTextABMMotivoTOOLResource1"></asp:Label>
<asp:Label ID="jqBtnAltaUsuarioTOOL" 
        Text="Da de alta en el sistema a un nuevo usuario" runat="server" 
        meta:resourcekey="jqBtnAltaUsuarioTOOLResource1"></asp:Label>
<asp:Label ID="jqBtnModiUsuarioTOOL" 
        Text="Modifica un usuario seleccionado de la grilla" runat="server" 
        meta:resourcekey="jqBtnModiUsuarioTOOLResource1"></asp:Label>

             
    <!-- Ayuda -->
    <asp:Label ID="help_dialog" Text="help_dialog_us"  runat="server" 
        meta:resourcekey="help_dialogResource1"></asp:Label>
    <asp:Label ID="help_dialog_TOOL" 
        Text="Cuadro de ayuda de administración de usuario"  runat="server" 
        meta:resourcekey="help_dialog_TOOLResource1"></asp:Label> 
    <asp:Label ID="help_dialog_content"  runat="server" 
        meta:resourcekey="help_dialog_contentResource1" ></asp:Label>
    <div id="h_dialog" title="">
        <div>
            <div class="ui-state-highlight ui-corner-all" style="padding: 0 .5em; text-align:justify;">
            <p id="h_dialog_content"></p>
            </div>
        </div>
    </div>
</div>
<!-- FIN -->

<style>
.is0{background:url(../images/progressImg1.png) no-repeat 0 0;width:138px;height:7px;}
.is10{background-position:0 -7px;}
.is20{background-position:0 -14px;}
.is30{background-position:0 -21px;}
.is40{background-position:0 -28px;}
.is50{background-position:0 -35px;}
.is60{background-position:0 -42px;}
.is70{background-position:0 -49px;}
.is80{background-position:0 -56px;}
.is90{background-position:0 -63px;}
.is100{background-position:0 -70px;}
</style>
<table  align="left" >
<tr>
    <td width="650px">
        <fieldset class="ui-corner-all">
            <legend class="ui-widget ui-state-default ui-corner-all ui-button-text" style="text-align: left;" id="jqLegendTitle"></legend>
            <table  align="left">
                <tr>
                    <td>
                        <div id="jqLblUsuario"></div>
                    </td>
                    <td align="right">
                        <input type="text" id="jqTxtUsuario" size="20px" maxlength="20" style="text-transform: uppercase;"/>
                    </td>
                    <td>
                        <div id="jqLblApellido"></div>
                    </td>
                    <td align="right">
                        <input type="text" id="jqTxtApellido" size="20px" maxlength="20" style="text-transform: uppercase;"/>
                    </td>
                    <td>
                        <div id="jqLblRazonSocial"></div>
                    </td>
                    <td align="right">
                        <input type="text" id="jqTxtRazonSocial" size="20px" maxlength="20" style="text-transform: uppercase;"/>
                    </td>
                    <td align="right">
                        <div id="jqBtnBuscar"></div>
                    </td>
                </tr>
                <tr>
                    <td colspan="7" align="left">
                        <table id="tblUsuarios">
                            <tr>
                                <td/>
                            </tr>
                        </table>
                        <div id="gridPagerUsuarios"></div>​
                    </td>
                </tr>
            </table>
        </fieldset>
        <fieldset class="ui-corner-all">
            <legend class="ui-widget ui-state-default ui-corner-all ui-button-text" style="text-align: left;" id="jqLegendEdicionUsuarios"></legend>
            <table  align="left">
                <tr>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td>
                        <div id="jqLblABMUsuario"></div>
                    </td>
                    <td>
                        <input type="text" id="jqtextABMUsuario" size="20px" maxlength="20" style="text-transform: uppercase;"/>
                    </td>
                    <td>
                        <div id="jqLblABMContrasena"></div>
                    </td>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <input type="password" id="jqTextABMContrasena" size="20px" maxlength="20" readonly/>
                                </td>
                                <td align="left">
                                    <div id="jqBtnGenerarPass"></div>
                                </td>
                            </tr>
                            <tr align="left">
                                <td colspan="2" rowspan="2">
                                    <div id="passwordStrengthDiv" class="is0"></div>
                                </td>
                             </tr>
                        </table>
                    </td>
                    <td>
                        <div id="jqLblABMEmail"></div>
                    </td>
                    <td>
                        <input type="text" id="jqTextABMEmail" size="28px" maxlength="40" style="text-transform: uppercase;"/>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <input type="checkbox" id="jqCheckBloqueado" size="20px"/> 
                        <input type="checkbox" id="jqCheckBaja" size="20px"/>
                    </td>
                    <td>
                        <div id="jqLblBloqueado"></div>
                        <div id="jqLblBaja"></div>
                    </td>
                    
                    <td>
                        <div id="jqLblABMMotivo"></div> 
                    </td>
                    <td colspan="4">
                        <textarea rows="3" cols="80" id="jqTextABMMotivo" maxlength="200" style="text-transform: uppercase;"></textarea>
                    </td>
                    <td colspan="2">
                        <div id="jqBtnAltaUsuario"></div>
                        <div id="jqBtnModiUsuario"></div>
                    </td>
                </tr>

                <tr>
                    <td colspan="5" align="center">
                        <table id="tblGrupos">
                            <tr>
                                <td/>
                            </tr>
                        </table>
                        <div id="gridPagerGrupos"></div>​
                    </td>
                    <td colspan="3" align="center">
                        <table id="tblPermisos"></table>
                    </td>
                </tr>
            </table>
        </fieldset>
        
    </td>
</tr>
</table>

    <script type="text/javascript">
        $.fn.passwordStrength = function (options) {
            return this.each(function () {
                var that = this; that.opts = {};
                that.opts = $.extend({}, $.fn.passwordStrength.defaults, options);

                that.div = $(that.opts.targetDiv);
                that.defaultClass = that.div.attr('class');

                that.percents = (that.opts.classes.length) ? 100 / that.opts.classes.length : 100;

                v = $(this).keyup(function () {
                    if (typeof el == "undefined")
                        this.el = $(this);
                    var s = getPasswordStrength(this.value);
                    var p = this.percents;
                    var t = Math.floor(s / p);

                    if (100 <= s)
                        t = this.opts.classes.length - 1;

                    this.div
			.removeAttr('class')
			.addClass(this.defaultClass)
			.addClass(this.opts.classes[t]);

                })
            });

            function getPasswordStrength(H) {
                var D = (H.length);
                if (D > 5) {
                    D = 5
                }
                var F = H.replace(/[0-9]/g, "");
                var G = (H.length - F.length);
                if (G > 3) { G = 3 }
                var A = H.replace(/\W/g, "");
                var C = (H.length - A.length);
                if (C > 3) { C = 3 }
                var B = H.replace(/[A-Z]/g, "");
                var I = (H.length - B.length);
                if (I > 3) { I = 3 }
                var E = ((D * 10) - 20) + (G * 10) + (C * 15) + (I * 10);
                if (E < 0) { E = 0 }
                if (E > 100) { E = 100 }
                return E
            }

            function randomPassword() {
                var chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$_+";
                var size = 10;
                var i = 1;
                var ret = ""
                while (i <= size) {
                    $max = chars.length - 1;
                    $num = Math.floor(Math.random() * $max);
                    $temp = chars.substr($num, 1);
                    ret += $temp;
                    i++;
                }
                return ret;
            }
        };

        $.fn.passwordStrength.defaults = {
            classes: Array('is10', 'is20', 'is30', 'is40', 'is50', 'is60', 'is70', 'is80', 'is90', 'is100'),
            targetDiv: '#passwordStrengthDiv',
            cache: {}
        }
</script>
    <script type="text/javascript">
    //<![CDATA[
        // variables locales
        var _usuarios;
        var _usuarioSeleccionado;
        var _idUsuario;
        var _permisosIndependientes;
        var _gruposDelUsuario;
        var _grillaGrupos;
        var _COLLECTIONGrupos;
        var _grillaPermisos;
        var _COLLECTIONPermisos;


            $("#jqLegendTitle").html($('#<%= legendTitle.ClientID %>').text());


            // traigo los usuarios
            function traerUsuarios() {
                $.ajax({
                    type: "post",
                    url: "/Website/WebServices/AdminUsuarios.asmx/getUsuarios",
                    data: JSON.stringify({ usuario: $.trim($('#jqTxtUsuario').val()), apellido: $.trim($('#jqTxtApellido').val()), razonSocial: $.trim($('#jqTxtRazonSocial').val()) }),
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    beforeSend: function () {
                        jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                    },
                    success: function (result) {
                        $.alerts._hide();
                        _usuarios = result.d;
                        cargarUsuarios();
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        $.alerts._hide();
                        jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
                    }
                });
            };
            traerUsuarios();


            $("#jqBtnBuscar").button({
                icons: {
                    primary: "ui-icon-search"
                },
                label: $('#<%= btnBuscar.ClientID %>').text()
            });
            $("#jqBtnBuscar").click(function () {
                traerUsuarios();
            });

            //--- busquedas
            $("#jqLblUsuario").html($('#<%= lblUsuario.ClientID %>').text());
            $("#jqLblApellido").html($('#<%= lblApellido.ClientID %>').text());
            $("#jqLblRazonSocial").html($('#<%= lblRazonSocial.ClientID %>').text());
            $("#jqTxtUsuario").addClass("ui-state-default ui-combobox-input ui-corner-all");
            $("#jqTxtApellido").addClass("ui-state-default ui-combobox-input ui-corner-all");
            $("#jqTxtRazonSocial").addClass("ui-state-default ui-combobox-input ui-corner-all");
            //--- fin busquedas
            //--- ABM
            $("#jqLblABMUsuario").html($('#<%= lblUsuario.ClientID %>').text());
            $("#jqtextABMUsuario").addClass("ui-state-default ui-combobox-input ui-corner-all");
            $("#jqLegendEdicionUsuarios").html($('#<%= legendEdicionUsuarios.ClientID %>').text());
            $("#jqLblABMContrasena").html($('#<%= lblABMContrasena.ClientID %>').text());
            $("#jqTextABMContrasena").addClass("ui-state-default ui-combobox-input ui-corner-all");
            $("#jqTextABMMotivo").addClass("ui-state-default ui-combobox-input ui-corner-all");
            $("#jqLblABMEmail").html($('#<%= lblABMEmail.ClientID %>').text());
            $("#jqTextABMEmail").addClass("ui-state-default ui-combobox-input ui-corner-all");
            //--- fin ABM
           
            $("#jqBtnAltaUsuario").button({
                icons: {
                    primary: "ui-icon-plus"
                },
                label: $('#<%= btnAltaUsuario.ClientID %>').text()
            });

            $("#jqBtnAltaUsuario").click(function () {
                if (validarUsuario() && validarContrasena() && validarCuentaEmail() && validarPermisosSelect()) {
                    altaUsuario();
                }
            });
            // validaciones 
            function validarUsuario() {
                if ($.trim($('#jqtextABMUsuario').val()) == "") {
                    jError($('#<%= msgEingUsuario.ClientID %>').text());
                    return false;
                }
                return true;
            };
            function validarContrasena() {
                if ($.trim($('#jqTextABMContrasena').val()) == "") {
                    jError($('#<%= msgEingContrasenia.ClientID %>').text());
                    return false;
                }
                return true;
            };
            function validarUsuarioSeleccionado() {
                if (! _idUsuario) {
                    jError($('#<%= msgEusuarioSelect.ClientID %>').text());
                    return false;
                }
                return true;
            };
            function validarCuentaEmail() {
                if ($.trim($('#jqTextABMEmail').val()) == "") {
                    jError($('#<%= msgEingEmail.ClientID %>').text());
                    return false;
                } else if (!validar_email($.trim($('#jqTextABMEmail').val()))) {
                    jError($('#<%= msgEformatEmailInvalid.ClientID %>').text());
                    return false;
                }
                return true;
            };
            function validar_email(valor) {
                // creamos nuestra regla con expresiones regulares.
                var filter = /[\w-\.]{3,}@([\w-]{2,}\.)*([\w-]{2,}\.)[\w-]{2,4}/;
                // utilizamos test para comprobar si el parametro valor cumple la regla
                if (filter.test(valor))
                    return true;
                else
                    return false;
            };
            function validarPermisosSelect() {
                var ids = $("#tblPermisos").jqGrid('getGridParam', 'selarrrow');
                if (ids == "") {
                    jError($('#<%= msgEselPermiso.ClientID %>').text());
                    return false;
                }
                return true;
            };

            //--------------- fin validaciones
            function altaUsuario() {
                var _grillaGruposSeleccionados = $("#tblGrupos").jqGrid('getGridParam', 'selarrrow');
                $.ajax({
                    type: "post",
                    url: "/Website/WebServices/AdminUsuarios.asmx/altaUsuario",
                    contentType: "application/json;charset=utf-8",
                    data: JSON.stringify({ usuario: $.trim($('#jqtextABMUsuario').val()), contrasena: $.trim($('#jqTextABMContrasena').val()), email: $.trim($('#jqTextABMEmail').val()), grupos: _grillaGruposSeleccionados, permisos: _grillaPermisos }),
                    dataType: "json",
                    beforeSend: function () {
                        jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                    },
                    success: function (result) {
                        $.alerts._hide();
                        if (result.d.error) {
                            jError($('#<%= msgError.ClientID %>').text() + "<br> " + result.d.error, 'Error');
                        } else if (result.d.errorNombreUsuario) {// Error por nombre usuario
                            jError($('#<%= msgENombreUsuario.ClientID %>').text() , 'Error');
                        } else if (result.d.errorEnviarMail) {// Error por enviar el mail
                            jError($('#<%= msgEmail.ClientID %>').text() , 'Error');
                        } else {
                            jInfo('ok alta usuario', 'Info');
                            traerUsuarios();
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        $.alerts._hide();
                        jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
                    }
                });
            };
            $("#jqBtnModiUsuario").button({
                icons: {
                    primary: "ui-icon-pencil"
                },
                label: $('#<%= btnModiUsuario.ClientID %>').text()
            });

            function modiUsuario() {
                var _grillaGruposSeleccionados = $("#tblGrupos").jqGrid('getGridParam', 'selarrrow');
                $.ajax({
                    type: "post",
                    url: "/Website/WebServices/AdminUsuarios.asmx/modiUsuario",
                    contentType: "application/json;charset=utf-8",
                    data: JSON.stringify({ idUsuario: _idUsuario,
                        usuario: $.trim($('#jqtextABMUsuario').val()),
                        contrasena: $.trim($('#jqTextABMContrasena').val()),
                        email: $.trim($('#jqTextABMEmail').val()),
                        grupos: _grillaGruposSeleccionados, permisos: _grillaPermisos,
                        bloqueado: $("#jqCheckBloqueado").is(":checked"),
                        baja: $("#jqCheckBaja").is(":checked"),
                        motivo: $.trim($('#jqTextABMMotivo').val()) 
                     }),
                    dataType: "json",
                    beforeSend: function () {
                        jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                    },
                    success: function (result) {
                        $.alerts._hide();
                        console.dir(result.d);
                        if (result.d.error) {
                            jError($('#<%= msgError.ClientID %>').text() + "<br> " + result.d.error, 'Error');
                        } else if (result.d.errorMismoUsuario) {// Error por nombre usuario
                            jError($('#<%= msgEMismoUsuario.ClientID %>').text() , 'Error');
                        } else if (result.d.errorNombreUsuario) {// Error por nombre usuario
                            jError($('#<%= msgENombreUsuario.ClientID %>').text() , 'Error');
                        } else if (result.d.errorEnviarMail) {// Error por enviar el mail
                            jError($('#<%= msgEmail.ClientID %>').text(), 'Error');
                        } else if (result.d.errorABMUsuario) {// abm usuarios
                            jError($('#<%= msgEUniADMpermiso.ClientID %>').text(), 'Error');
                        } else if (result.d.errorRestore) {// restore
                            jError($('#<%= msgEUniRestore.ClientID %>').text(), 'Error');
                        } else if (result.d.errorBackUp) {// bitacora
                            jError($('#<%= msgEUniBackUp.ClientID %>').text(), 'Error');
                        } else if (result.d.errorBitacora) {// bitacora
                            jError($('#<%= msgEUniBitacora.ClientID %>').text(), 'Error');
                        } else {
                            jInfo('ok modi usuario', 'Info');
                            traerUsuarios();
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        $.alerts._hide();
                        jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
                    }
                });

            };
            $("#jqBtnModiUsuario").click(function () {
                if (validarUsuarioSeleccionado() && validarUsuario() && validarCuentaEmail()) {
                    modiUsuario();
                }
            });

            $("#jqBtnGenerarPass").button({
                icons: {
                    primary: "ui-icon-refresh"
                },
                label: "G"
            });

            function randomPassword() {
                var chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$_+";
                var size = 10;
                var i = 1;
                var ret = ""
                while (i <= size) {
                    $max = chars.length - 1;
                    $num = Math.floor(Math.random() * $max);
                    $temp = chars.substr($num, 1);
                    ret += $temp;
                    i++;
                }
                return ret;
            }
            $("#jqTextABMContrasena").passwordStrength();
            $("#jqBtnGenerarPass").click(function () {
                $("#jqTextABMContrasena").val(randomPassword()).trigger('keyup');
                return false;
            });

            $("#jqLblBloqueado").html($('#<%= lblBloqueado.ClientID %>').text());
            $("#jqLblABMMotivo").html($('#<%= lblABMMotivo.ClientID %>').text());
            $("#jqLblBaja").html($('#<%= lblBaja.ClientID %>').text());


            
            function cargarUsuarios() {
                $("#tblUsuarios").jqGrid('GridUnload');
                $("#tblUsuarios").jqGrid({
                    datatype: "local",
                    data: _usuarios,
                    colNames: ['Id', $('#<%= fechaAlta.ClientID %>').text(),
                    $('#<%= usuario.ClientID %>').text(),
                    $('#<%= nombre.ClientID %>').text(),
                    $('#<%= apellido.ClientID %>').text(),
                        $('#<%= email.ClientID %>').text(),
                    $('#<%= bloqueado.ClientID %>').text(),
                    $('#<%= fechaBaja.ClientID %>').text(),
                    'motivo',
                        $('#<%= razonSocial.ClientID %>').text()],
                    colModel: [
                        { name: 'id', key: true, index: 'id', width: 35, sorttype: "int", align: "right" },
                        { name: 'fechaAlta', index: 'fechaAlta', width: 70, align: 'center', sorttype: 'date', formatter: 'date', formatoptions: { srcformat: "d/m/Y H:i A", newformat: 'd/m/Y'} },
                        { name: 'usuario', index: 'usuario', width: 170 },
                        { name: 'nombre', index: 'nombre', width: 200 },
                        { name: 'apellido', index: 'apellido', width: 200 },
                        { name: 'email', index: 'email', width: 250 },
                        { name: 'bloqueado', index: 'bloqueado', width: 40, align: 'right', formatter: bolqueadoFormatter },
                        { name: 'fechaBaja', index: 'fechaBaja', width: 70, align: 'center', sorttype: 'date', formatter: 'date', formatoptions: { srcformat: "d/m/Y H:i A", newformat: 'd/m/Y'} },
                        { name: 'motivo', index: 'motivo', width: 70, hidden: true },
                        { name: 'razonSocial', index: 'razonSocial', width: 300 }
                    ],
                    rowNum: 4,
                    rowList: [10, 20, 30],
                    pager: '#gridPagerUsuarios',
                    sortname: 'id',
                    viewrecords: true,
                    altRows: true,
                    sortorder: "desc",
                    caption: $('#<%= usuarios.ClientID %>').text(),
                    height: "100%",
                    width: "800",
                    shrinkToFit: false,
                    onSelectRow: function (id) {
                        seleccionarUsuario(id);
                    }
                });
                $("#tblUsuarios").tooltip({
                    bodyHandler: function () {
                        return $('#<%= gridUsuariosTOOL.ClientID %>').text();
                    },
                    top: -15,
                    left: 5,
                    showURL: false
                });
            };
            function bolqueadoFormatter(cellvalue, options, rowObject) {
                if (cellvalue == 1) {
                    return "<span class='ui-icon ui-icon-circle-check'></span>";
                } else {
                    return "<span class='ui-icon ui-icon-circle-close'></span>";
                }
            };


            function traerGrillaGrupos() {
                $.ajax({
                    type: "post",
                    url: "/Website/WebServices/AdminUsuarios.asmx/getGrupos",
                    contentType: "application/json;charset=utf-8",
                    data: JSON.stringify(),
                    dataType: "json",
                    beforeSend: function () {
                        jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                    },
                    success: function (result) {
                        $.alerts._hide();
                        _COLLECTIONGrupos = result.d;
                        _grillaGrupos = $.extend(true, [], _COLLECTIONGrupos);
                        cargarGrillaGrupos();
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        $.alerts._hide();
                        jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
                        $("#tblGrupos").jqGrid('GridUnload');
                    }
                });
            };
            function cargarGrillaGrupos() {
                $("#tblGrupos").jqGrid('GridUnload');
                $("#tblGrupos").jqGrid({
                    datatype: "local",
                    data: _grillaGrupos,
                    colNames: ['ID', 'Id Grupo', $('#<%= gridNombreDelGrupo.ClientID %>').text()],
                    colModel: [
   		                { name: 'ID', index: 'ID', sortable: true, width: 25, align: "right", hidden: false },
   		                { name: 'idGrupo', key: true, index: 'idGrupo', sortable: true, width: 55, align: "right" },
   		                { name: 'DescGrupo', index: 'DescGrupo', sortable: true, width: 250, align: "left" }
   	                ],
                    rowNum: 10000,
                    sortname: 'DescGrupo',
                    multiselect: true,
                    viewrecords: true,
                    sortorder: "asc",
                    caption: $('#<%= gridGrupos.ClientID %>').text(),
                    height: 255,
                    onSelectRow: function (id, status) {
                        if (status) { // seleccionada
                            agregarPermisosDelGrupo(id);
                        } else {// deSeleccionada
                            eliminarPermisosDelGrupo(id);
                        };
                    }
                });
                $("#tblGrupos").jqGrid('hideCol', 'cb');
                $("#tblGrupos").tooltip({
                    bodyHandler: function () {
                        return $('#<%= gridGruposTOOL.ClientID %>').text();
                    },
                    top: -15,
                    left: 5,
                    showURL: false
                });

            };
            traerGrillaGrupos();


            function agregarPermisosDelGrupo(_idGrupo) {
                $.ajax({
                    type: "post",
                    url: "/Website/WebServices/AdminUsuarios.asmx/getPermisosPoridGrupo",
                    contentType: "application/json;charset=utf-8",
                    data: JSON.stringify({ idGrupo: _idGrupo }),
                    dataType: "json",
                    beforeSend: function () {
                        jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                    },
                    success: function (result) {
                        $.alerts._hide();
                        _permisosDelGrupos = $.extend(true, [], result.d);
                        cargarPermisosDelGrupo(_permisosDelGrupos);
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        $.alerts._hide();
                        jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
                    }
                });
            };
            function cargarPermisosDelGrupo(_permisosDelGrupos) {
                for (j = 0; j < _permisosDelGrupos.length; j++) {
                    for (z = 0; z < _grillaPermisos.length; z++) {
                        if (_grillaPermisos[z].idPermiso == _permisosDelGrupos[j].idPermiso) {
                            _grillaPermisos[z].cant = _grillaPermisos[z].cant + 1;
                            _grillaPermisos[z].grupo = true;
                        }
                    }
                };
                cargarGrillaPermisos();
            };


            function eliminarPermisosDelGrupo(_idGrupo) {
                $.ajax({
                    type: "post",
                    url: "/Website/WebServices/AdminUsuarios.asmx/getPermisosPoridGrupo",
                    contentType: "application/json;charset=utf-8",
                    data: JSON.stringify({ idGrupo: _idGrupo }),
                    dataType: "json",
                    beforeSend: function () {
                        jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                    },
                    success: function (result) {
                        $.alerts._hide();
                        _permisosDelGrupos = $.extend(true, [], result.d);
                        sacarPermisosDelGrupo(_permisosDelGrupos);
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        $.alerts._hide();
                        jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
                    }
                });
            };
            function sacarPermisosDelGrupo(_permisosDelGrupos) {
                for (j = 0; j < _permisosDelGrupos.length; j++) {
                    for (z = 0; z < _grillaPermisos.length; z++) {
                        if (_grillaPermisos[z].idPermiso == _permisosDelGrupos[j].idPermiso) {
                            _grillaPermisos[z].cant = _grillaPermisos[z].cant - 1;
                            if ((_grillaPermisos[z].cant == "0") || (_grillaPermisos[z].cant == "1" && _grillaPermisos[z].individual == true)) {
                                _grillaPermisos[z].grupo = false;
                            }
                        }
                    }
                };
                cargarGrillaPermisos();
            };
            


            function traerGrillaPermisos() {
                $.ajax({
                    type: "post",
                    url: "/Website/WebServices/AdminUsuarios.asmx/getPermisos",
                    contentType: "application/json;charset=utf-8",
                    data: JSON.stringify(),
                    dataType: "json",
                    beforeSend: function () {
                        jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                    },
                    success: function (result) {
                        $.alerts._hide();
                        _COLLECTIONPermisos = result.d;
                        _grillaPermisos = $.extend(true, [], _COLLECTIONPermisos);
                        cargarGrillaPermisos();
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        $.alerts._hide();
                        jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
                        $("#tblPermisos").jqGrid('GridUnload');
                    }
                });
            };
            function cargarGrillaPermisos() {
                $("#tblPermisos").jqGrid('GridUnload');
                $("#tblPermisos").jqGrid({
                    datatype: "local",
                    data: _grillaPermisos,
                    colNames: ['ID', 'Id Permiso', 'Cant', $('#<%= gridNombreDelPermiso.ClientID %>').text(), '<span class="ui-icon ui-icon-person" style="float: left; margin-right: .3em;"></span><span class="ui-icon ui-icon-person" style="float: left; margin-right: .3em;"></span>', '<span class="ui-icon ui-icon-person" style="float: left; margin-right: .3em;"></span>', '<span class="ui-icon ui-icon-circle-minus" style="float: left; margin-right: .3em;"></span>'],
                    colModel: [
                        { name: 'ID', width: 15, align: "right", hidden: false },
                        { name: 'idPermiso', key: true, width: 55, align: "right", hidden: false },
                        { name: 'cant', width: 35, align: "center" },
                        { name: 'descripcion', width: 180, sortable: false, hidden: false },
                        { name: 'grupo', width: 45, align: "center", hidden: false, formatter: 'checkbox' },
                        { name: 'individual', width: 22, align: "center", hidden: false, formatter: cboxFormatter },
                        { name: 'bloqueado', width: 22, align: "center", hidden: false, formatter: cboxFormatter }
                    ],
                    rowNum: 10000,
                    sortname: 'descripcion',
                    viewrecords: true,
                    multiselect: true,
                    sortorder: "asc",
                    caption: $('#<%= gridPermisos.ClientID %>').text(),
                    height: 255,
                    onSelectRow: function (id) {
                        for (z = 0; z < _grillaPermisos.length; z++) {
                            if (_grillaPermisos[z].idPermiso == id) {
                                if (_grillaPermisos[z].individual) {
                                    _grillaPermisos[z].cant = _grillaPermisos[z].cant - 1;
                                } else {
                                    _grillaPermisos[z].cant = _grillaPermisos[z].cant + 1;
                                }
                                _grillaPermisos[z].individual = !_grillaPermisos[z].individual;
                                _grillaPermisos[z].bloqueado = false;
        
                            }
                        }
                        cargarGrillaPermisos();
                    },
                    gridComplete: function () {
                        var grid_ids = $("#tblPermisos").jqGrid('getDataIDs');
                        for (var i = 0; i < grid_ids.length; i++) {
                            var dataCant = jQuery('#tblPermisos').jqGrid('getCell', grid_ids[i], 'cant');
                            if (dataCant > 0) {
                                $("#tblPermisos").jqGrid('setSelection', grid_ids[i], false);
                            }
                        }
                    }
                });
                $("#tblPermisos").jqGrid('hideCol', 'cb');
                $("#tblPermisos").tooltip({
                    bodyHandler: function () {
                        return $('#<%= gridPermisosTOOL.ClientID %>').text();
                    },
                    top: -15,
                    left: 5,
                    showURL: false
                });
            };
            function cboxFormatter(cellvalue, options, rowObject) {
                return '<input type="checkbox"' + (cellvalue ? ' checked="checked"' : '') + 'onclick="selecionoPermiso(' + '\'' + options.rowId + '\',\'' + options.pos + '\',\'' + rowObject + '\'' + ')"/>';
            }
            traerGrillaPermisos();
            function selecionoPermiso(rowId, posi, rowObject) {
                for (z = 0; z < _grillaPermisos.length; z++) {
                    if (_grillaPermisos[z].idPermiso == rowId) {
                        if (posi == 6) { // individual
                            if (_grillaPermisos[z].individual) {
                                _grillaPermisos[z].cant = _grillaPermisos[z].cant - 1;
                            } else {
                                _grillaPermisos[z].cant = _grillaPermisos[z].cant + 1;
                            }
                            _grillaPermisos[z].individual = !_grillaPermisos[z].individual;
                            _grillaPermisos[z].bloqueado = false;
                        } else if (posi == 7) {//bloqueado
                            if (!_grillaPermisos[z].individual) {
                                _grillaPermisos[z].cant = _grillaPermisos[z].cant + 1;
                            }
                            _grillaPermisos[z].individual = true;
                            _grillaPermisos[z].bloqueado = !_grillaPermisos[z].bloqueado;
                        }
                    }
                };
                cargarGrillaPermisos();
            };
            function seleccionarUsuario(id) {
                _idUsuario = id;
                for (z = 0; z < _usuarios.length; z++) {
                    if (_usuarios[z].id == id) {
                        $("#jqtextABMUsuario").val(_usuarios[z].usuario);
                        $("#jqTextABMEmail").val(_usuarios[z].email);
                        $("#jqTextABMMotivo").val(_usuarios[z].motivo);
                        if (_usuarios[z].bloqueado == "1") {
                            $("#jqCheckBloqueado").attr('checked', true);
                        } else {
                            $("#jqCheckBloqueado").attr('checked', false);
                        };
                        if (_usuarios[z].fechaBaja == "") {
                            $("#jqCheckBaja").attr('checked', false);
                        } else {
                            $("#jqCheckBaja").attr('checked', true);
                        };

                    }
                };
                traerGruposPermisosPorUsuario();
            };

            function traerGruposPermisosPorUsuario() {
                $.ajax({
                    type: "post",
                    url: "/Website/WebServices/AdminUsuarios.asmx/getGruposPermisosPorIdusuario",
                    data: JSON.stringify({ idUsuario: _idUsuario }),
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    beforeSend: function () {
                        jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                    },
                    success: function (result) {
                        $.alerts._hide();
                        _gruposDelUsuario = result.d;
                        traerPermisosIndependientes();
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        $.alerts._hide();
                        jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
                    }
                });
            };

            function traerPermisosIndependientes() {
                $.ajax({
                    type: "post",
                    url: "/Website/WebServices/AdminUsuarios.asmx/getPermisosIndependientesPorIdusuario",
                    data: JSON.stringify({ idUsuario: _idUsuario }),
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    beforeSend: function () {
                        jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                    },
                    success: function (result) {
                        $.alerts._hide();
                        _permisosIndependientes = result.d;
                        setearGruposPermisos();
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        $.alerts._hide();
                        jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
                    }
                });
            };



            function setearGruposPermisos() {
                $("#tblPermisos").jqGrid('resetSelection');
                $("#tblGrupos").jqGrid('resetSelection');
                _grillaPermisos = $.extend(true, [], _COLLECTIONPermisos);
                _grillaGrupos = $.extend(true, [], _COLLECTIONGrupos);
                for (i = 0; i < _gruposDelUsuario.length; i++) {
                    $("#tblGrupos").jqGrid('setSelection', _gruposDelUsuario[i].idGrupo, false);
                    for (j = 0; j < _gruposDelUsuario[i].permisos.length; j++) {
                        for (z = 0; z < _grillaPermisos.length; z++) {
                            if (_grillaPermisos[z].idPermiso == _gruposDelUsuario[i].permisos[j].idPermiso) {
                                _grillaPermisos[z].cant = _grillaPermisos[z].cant + 1;
                                _grillaPermisos[z].grupo = true;
                            }
                        }
                    };
                };
                for (p = 0; p < _permisosIndependientes.length; p++) {
                    for (z = 0; z < _grillaPermisos.length; z++) {
                        if (_grillaPermisos[z].idPermiso == _permisosIndependientes[p].idPermiso) {
                            _grillaPermisos[z].cant = _grillaPermisos[z].cant + 1;
                            _grillaPermisos[z].individual = true;
                            _grillaPermisos[z].bloqueado = (_permisosIndependientes[p].negado == 1 ? true : false);
                        }
                    }
                };
                cargarGrillaPermisos();
            };





            // ToolTips

            $("#jqTxtUsuario").tooltip({
                bodyHandler: function () {
                    return $('#<%= jqTxtUsuarioTOOL.ClientID %>').text();
                },
                showURL: false
            });
            $("#jqTxtApellido").tooltip({
                bodyHandler: function () {
                    return $('#<%= jqTxtApellidoTOOL.ClientID %>').text();
                },
                showURL: false
            });
            $("#jqTxtRazonSocial").tooltip({
                bodyHandler: function () {
                    return $('#<%= jqTxtRazonSocialTOOL.ClientID %>').text();
                },
                showURL: false
            });
            $("#jqBtnBuscar").tooltip({
                bodyHandler: function () {
                    return $('#<%= jqBtnBuscarTOOL.ClientID %>').text();
                },
                showURL: false
            });
            $("#jqCheckBloqueado").tooltip({
                bodyHandler: function () {
                    return $('#<%= jqCheckBloqueadoTOOL.ClientID %>').text();
                },
                showURL: false
            });
            $("#jqtextABMUsuario").tooltip({
                bodyHandler: function () {
                    return $('#<%= jqtextABMUsuarioTOOL.ClientID %>').text();
                },
                showURL: false
            });
            $("#jqTextABMContrasena").tooltip({
                bodyHandler: function () {
                    return $('#<%= jqTextABMContrasenaTOOL.ClientID %>').text();
                },
                showURL: false
            });
            $("#jqBtnGenerarPass").tooltip({
                bodyHandler: function () {
                    return $('#<%= jqBtnGenerarPassTOOL.ClientID %>').text();
                },
                showURL: false
            });
            $("#passwordStrengthDiv").tooltip({
                bodyHandler: function () {
                    return $('#<%= passwordStrengthDivTOOL.ClientID %>').text();
                },
                showURL: false
            });
            $("#jqTextABMEmail").tooltip({
                bodyHandler: function () {
                    return $('#<%= jqTextABMEmailTOOL.ClientID %>').text();
                },
                showURL: false
            });
            $("#jqCheckBaja").tooltip({
                bodyHandler: function () {
                    return $('#<%= jqCheckBajaTOOL.ClientID %>').text();
                },
                showURL: false
            });
            $("#jqTextABMMotivo").tooltip({
                bodyHandler: function () {
                    return $('#<%= jqTextABMMotivoTOOL.ClientID %>').text();
                },
                showURL: false
            });
            $("#jqBtnAltaUsuario").tooltip({
                bodyHandler: function () {
                    return $('#<%= jqBtnAltaUsuarioTOOL.ClientID %>').text();
                },
                showURL: false
            });
            $("#jqBtnModiUsuario").tooltip({
                bodyHandler: function () {
                    return $('#<%= jqBtnModiUsuarioTOOL.ClientID %>').text();
                },
                showURL: false
            });


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
                position: ['right', ' top'],
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
       
    //]]>
    </script>
</asp:Content>