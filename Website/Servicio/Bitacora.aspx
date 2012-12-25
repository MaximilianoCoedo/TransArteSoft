<%@ Page Language="C#" MasterPageFile="~/MasterPages/BackEnd.master" AutoEventWireup="true" CodeFile="Bitacora.aspx.cs" Inherits="_Default" title="Home" culture="auto" meta:resourcekey="PageResource1" uiculture="auto"%>
<%@ MasterType VirtualPath="~/MasterPages/BackEnd.master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" Runat="Server">


<!-- Componentes -->
<div id="idioma" style="display:none;">
        
<asp:Label ID="legendTitle" Text="Administración de bítacora:" runat="server" 
        meta:resourcekey="legendTitleResource1" ></asp:Label>

<asp:Label ID="legendIntegridad" Text="Administración de Integridad:" runat="server" ></asp:Label>
         meta:resourcekey="legendIntegridadResource1"
        
<asp:Label ID="lblUsuario" Text="Usuario:" runat="server" 
        meta:resourcekey="lblUsuarioResource1" ></asp:Label>
<asp:Label ID="btnBuscarUsuario" Text="Buscar por usuario" runat="server" 
        meta:resourcekey="btnBuscarUsuarioResource1" ></asp:Label>
<asp:Label ID="btnBorrarUsuario" Text="Borrar por usuario" runat="server" 
        meta:resourcekey="btnBorrarUsuarioResource1" ></asp:Label>

<asp:Label ID="lblDescripcion" Text="Descripción:" runat="server" 
        meta:resourcekey="lblDescripcionResource1" ></asp:Label>
<asp:Label ID="btnBuscarDescripcion" Text="Buscar por descripción" runat="server" 
        meta:resourcekey="btnBuscarDescripcionResource1" ></asp:Label>
<asp:Label ID="btnBorrarDescripcion" Text="Borrar por descripción" runat="server" 
        meta:resourcekey="btnBorrarDescripcionResource1" ></asp:Label>

<asp:Label ID="lblCriticidad" Text="Criticidad:" runat="server" 
        meta:resourcekey="lblCriticidadResource1" ></asp:Label>
<asp:Label ID="btnBuscarCriticidad" Text="Buscar por Criticidad" runat="server" 
        meta:resourcekey="btnBuscarCriticidadResource1" ></asp:Label>
<asp:Label ID="btnBorrarCriticidad" Text="Borrar por Criticidad" runat="server" 
        meta:resourcekey="btnBorrarCriticidadResource1" ></asp:Label>

<asp:Label ID="lblFormatoFechas" Text="dd/MM/yyyy" runat="server" 
        meta:resourcekey="lblFormatoFechasResource1" ></asp:Label>
MM/dd/yyyy -- ingles
dd/MM/yyyy -- espanol

<asp:Label ID="lblregional" Text="es" runat="server" 
        meta:resourcekey="lblregionalResource1" ></asp:Label>
en-GB -- ingles 
es    -- espanol

<asp:Label ID="lblFechaDesde" Text="Fecha desde:" runat="server" 
        meta:resourcekey="lblFechaDesdeResource1" ></asp:Label>
<asp:Label ID="lblFechaHasta" Text="Fecha hasta:" runat="server" 
        meta:resourcekey="lblFechaHastaResource1" ></asp:Label>
<asp:Label ID="btnBuscarDesdeHasta" Text="Buscar por Fechas" runat="server" 
        meta:resourcekey="btnBuscarDesdeHastaResource1" ></asp:Label>
<asp:Label ID="btnBorrarDesdeHasta" Text="Borrar por Fechas" runat="server" 
        meta:resourcekey="btnBorrarDesdeHastaResource1" ></asp:Label>
<asp:Label ID="btnBuscarTodos" Text="Buscar todos" runat="server" 
        meta:resourcekey="btnBuscarTodosResource1" ></asp:Label>
<asp:Label ID="btnBorrarTodos" Text="Borrar todos" runat="server" 
        meta:resourcekey="btnBorrarTodosResource1" ></asp:Label>
<asp:Label ID="btnImprimirReporte" Text="Imprimir Registros" runat="server" 
        meta:resourcekey="btnImprimirReporteResource1" ></asp:Label>
<asp:Label ID="btnCorregirIntegridad" Text="Corregir integridad" runat="server" 
        meta:resourcekey="btnCorregirIntegridadResource1" ></asp:Label>
<asp:Label ID="idDeTabla" Text="Id de la tabla" runat="server" 
        meta:resourcekey="idDeTablaResource1" ></asp:Label>
<asp:Label ID="inconsistencia" Text="Inconsistencia" runat="server" 
        meta:resourcekey="inconsistenciaResource1" ></asp:Label>
<asp:Label ID="tablaAfectada" Text="Tabla afectada" runat="server" 
        meta:resourcekey="tablaAfectadaResource1" ></asp:Label>
<asp:Label ID="fecha" Text="Fecha" runat="server" 
        meta:resourcekey="fechaResource1" ></asp:Label>
<asp:Label ID="idUsuario" Text="Usuario Id" runat="server" 
        meta:resourcekey="idUsuarioResource1" ></asp:Label>
<asp:Label ID="usuario" Text="Usuario" runat="server" 
        meta:resourcekey="usuarioResource1" ></asp:Label>
<asp:Label ID="criticidadId" Text="Criticidad Id" runat="server" 
        meta:resourcekey="criticidadIdResource1" ></asp:Label>
<asp:Label ID="criticidad" Text="Criticidad" runat="server" 
        meta:resourcekey="criticidadResource1" ></asp:Label>
<asp:Label ID="descripcion" Text="Descripción" runat="server" 
        meta:resourcekey="descripcionResource1" ></asp:Label>
<asp:Label ID="integridad" Text="Integridad" runat="server" 
        meta:resourcekey="integridadResource1" ></asp:Label>
<asp:Label ID="bitacora" Text="Bitacora" runat="server" 
        meta:resourcekey="bitacoraResource1" ></asp:Label>
<asp:Label ID="btnBuscarPorParametros" Text="Buscar por parametros" runat="server" meta:resourcekey="btnBuscarPorParametrosResource1" ></asp:Label>
<asp:Label ID="btnBorrarPorParametros" Text="Borrar por parametros" runat="server" meta:resourcekey="btnBorrarPorParametrosResource1" ></asp:Label>
<asp:Label ID="btnVerErrores" Text="" runat="server" meta:resourcekey="btnVerErroresResource1" ></asp:Label>
        
        
        
        
        
<!-- Tooltips --> 

<asp:Label ID="jqBtnVerErroresTOOL" 
        Text="Abre una nueva ventana con el historial del LOG del sistema.-" runat="server" 
        meta:resourcekey="jqBtnVerErroresTOOLResource1"></asp:Label>
<asp:Label ID="gridBitacoraTOOL" 
        Text="Esta grilla muestra los registros en la bítacora" runat="server" 
        meta:resourcekey="gridBitacoraTOOLResource1"></asp:Label>
<asp:Label ID="gridInconcistenciaTOOL" 
        Text="Esta grilla muestra los registros que tienen problemas de inconcistencia" 
        runat="server" meta:resourcekey="gridInconcistenciaTOOLResource1"></asp:Label>
<asp:Label ID="jqTxtUsuarioTOOL" Text="Seleccione un usuario del combo" 
        runat="server" meta:resourcekey="jqTxtUsuarioTOOLResource1"></asp:Label>
<asp:Label ID="jqTxtDescripcionTOOL" 
        Text="Ingrese una descripción, mínimo 3 caracteres" runat="server" 
        meta:resourcekey="jqTxtDescripcionTOOLResource1"></asp:Label>
<asp:Label ID="jqTxtCriticidadTOOL" Text="Seleccione una criticidad del combo" 
        runat="server" meta:resourcekey="jqTxtCriticidadTOOLResource1"></asp:Label>
<asp:Label ID="jqTxtFechaDesdeTOOL" Text="Ingrese una fecha no mayor a Fecha Hasta" 
        runat="server" meta:resourcekey="jqTxtFechaDesdeTOOLResource1"></asp:Label>
<asp:Label ID="jqTxtFechaHastaTOOL" Text="Ingrese una fecha no menor a Fecha Desde" 
        runat="server" meta:resourcekey="jqTxtFechaHastaTOOLResource1"></asp:Label>
<asp:Label ID="jqBtnBuscarUsuarioTOOL" 
        Text="Busca los registros en la bítacora que corresponden al usuario seleccionado" 
        runat="server" meta:resourcekey="jqBtnBuscarUsuarioTOOLResource1"></asp:Label>
<asp:Label ID="jqBtnBorrarUsuarioTOOL" 
        Text="Borra los registros en la bítacora que corresponden al usuario seleccionado" 
        runat="server" meta:resourcekey="jqBtnBorrarUsuarioTOOLResource1"></asp:Label>
<asp:Label ID="jqBtnBuscarDescripcionTOOL" 
        Text="Busca los registros en la bítacora que contengan la descripción ingresada" 
        runat="server" meta:resourcekey="jqBtnBuscarDescripcionTOOLResource1"></asp:Label>
<asp:Label ID="jqBtnBorrarDescripcionTOOL" 
        Text="Borra los registros en la bítacora que contengan la descripción ingresada" 
        runat="server" meta:resourcekey="jqBtnBorrarDescripcionTOOLResource1"></asp:Label>
<asp:Label ID="jqBtnBuscarCriticidadTOOL" 
        Text="Busca los registros en la bítacora que corresponden a la criticidad seleccionada" 
        runat="server" meta:resourcekey="jqBtnBuscarCriticidadTOOLResource1"></asp:Label>
<asp:Label ID="jqBtnBorrarCriticidadTOOL" 
        Text="Borra los registros en la bítacora que corresponden a la criticidad seleccionada" 
        runat="server" meta:resourcekey="jqBtnBorrarCriticidadTOOLResource1"></asp:Label>
<asp:Label ID="jqBtnBuscarDesdeHastaTOOL" 
        Text="Busca los registros en la bítacora que corresponden al rango de fecha ingresado" 
        runat="server" meta:resourcekey="jqBtnBuscarDesdeHastaTOOLResource1"></asp:Label>
<asp:Label ID="jqBtnBorrarDesdeHastaTOOL" 
        Text="Borra los registros en la bítacora que corresponden al rango de fecha ingresado" 
        runat="server" meta:resourcekey="jqBtnBorrarDesdeHastaTOOLResource1"></asp:Label>
<asp:Label ID="jqBtnBuscarTodosTOOL" 
        Text="Busca todos los registros en la bítacora" runat="server" 
        meta:resourcekey="jqBtnBuscarTodosTOOLResource1"></asp:Label>
<asp:Label ID="jqBtnBorrarTodosTOOL" 
        Text="Borra todos los registros en la bítacora" runat="server" 
        meta:resourcekey="jqBtnBorrarTodosTOOLResource1"></asp:Label>
<asp:Label ID="jqBtnCorregirIntegridadTOOL" 
        Text="Corrige la integridad de las tablas en la base de datos" runat="server" 
        meta:resourcekey="jqBtnCorregirIntegridadTOOLResource1"></asp:Label>
<asp:Label ID="jqBtnImprimirReporteTOOL" Text="Imprimi el reporte de la bitacora" 
        runat="server" meta:resourcekey="jqBtnImprimirReporteTOOLResource1"></asp:Label>
<asp:Label ID="jqBtnBuscarPorParametrosTOOL" Text="" 
        runat="server" meta:resourcekey="jqBtnBuscarPorParametrosTOOLResource1"></asp:Label>
<asp:Label ID="jqBtnBorrarPorParametrosTOOL" Text="" 
        runat="server" meta:resourcekey="jqBtnBorrarPorParametrosTOOLResource1"></asp:Label>
<!-- Mensajes -->
<asp:Label ID="msgProcesando" Text="Aguarde un instante!!!"  runat="server" 
        meta:resourcekey="msgProcesandoResource1" ></asp:Label>
<asp:Label ID="msgError" Text="Se ha producido un error"  runat="server" 
        meta:resourcekey="msgErrorResource1" ></asp:Label>
<asp:Label ID="msgOkBorrar" Text="Se han borrado los registros con exito"  
        runat="server" meta:resourcekey="msgOkBorrarResource1" ></asp:Label>
<asp:Label ID="msgErrorUsuarioValido" Text="Debe seleccionar un usuario valido."  
        runat="server" meta:resourcekey="msgErrorUsuarioValidoResource1" ></asp:Label>
<asp:Label ID="msgErrorDescCaracteres" 
        Text="Debe al menos ingresar 3 letras en la descripción."  runat="server" 
        meta:resourcekey="msgErrorDescCaracteresResource1" ></asp:Label>
<asp:Label ID="msgErrorDescValida" Text="Debe ingresar una descipción."  
        runat="server" meta:resourcekey="msgErrorDescValidaResource1" ></asp:Label>
<asp:Label ID="msgErrorCriticidadValida" 
        Text="Debe seleccionar un nivel de criticidad."  runat="server" 
        meta:resourcekey="msgErrorCriticidadValidaResource1" ></asp:Label>
<asp:Label ID="msgErrorFechaDesdeValida" 
        Text="Debe ingresar una fecha desde valida."  runat="server" 
        meta:resourcekey="msgErrorFechaDesdeValidaResource1" ></asp:Label>
<asp:Label ID="msgErrorFechaHastaValida" 
        Text="Debe ingresar una fecha hasta valida."  runat="server" 
        meta:resourcekey="msgErrorFechaHastaValidaResource1" ></asp:Label>
<asp:Label ID="msgErrorMayorValida" 
        Text="Debe ingresar una fecha hasta mayor a la fecha desde."  runat="server" 
        meta:resourcekey="msgErrorMayorValidaResource1" ></asp:Label>
<asp:Label ID="msgOkIntegridad" 
        Text="Se corrigio la integridad de todas las tablas"  runat="server" 
        meta:resourcekey="msgOkIntegridadResource1" ></asp:Label>
<asp:Label ID="msgReporteGenerado" 
        Text="El reporte se genero correctamente."  runat="server" 
        meta:resourcekey="msgOkReporteGeneradoResource1" ></asp:Label>

        

<!-- Ayuda -->
    <asp:Label ID="jsGridLibrary" Text="../script/jquery.jqGrid-4.4.1/src/i18n/grid.locale-es.js"  runat="server" meta:resourcekey="jsGridLibraryResource" ></asp:Label>
    <asp:Label ID="help_dialog" Text=""  runat="server" meta:resourcekey="help_dialogResource1" ></asp:Label>
    <asp:Label ID="help_dialog_TOOL" 
            Text="Cuadro de ayuda de administración de usuario"  runat="server" 
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

<!-- FIN -->


<table  align="left" >
<tr>
    <td width="650px">
        <fieldset class="ui-corner-all ui-state-error " id="verIntegridad" style="display:none;">
            <legend class="ui-widget  ui-state-error ui-corner-all ui-button-text" style="text-align: left;" id="jqLegendIntegridad"></legend>
                <table  align="left">
                    <tr>
                        <td colspan="3" align="center">
                            <table id="tblIntegridad">
                                <tr>
                                    <td/>
                                </tr>
                            </table>
                            <div id="gridPagerIntegridad"></div>​
                        </td>
                        <td colspan="2" style="width:200px">
                            <div id="jqBtnCorregirIntegridad"></div>
                        </td>
                    </tr>
            </table>
        </fieldset>


        <fieldset class="ui-corner-all" id="verBitacora" style="display:none;">
            <legend class="ui-widget ui-state-default ui-corner-all ui-button-text" style="text-align: left;" id="jqLegendTitle"></legend>
            <table  align="left">
               
                <tr>
                    <td>
                        <div id="jqLblUsuario"></div>
                    </td>
                    <td>
                        <input type="text" id="jqTxtUsuario" size="20px" maxlength="20" style="text-transform: uppercase;"/>
                    </td>
                    <td>
                        <div id="jqBtnBuscarUsuario"></div>
                    </td>
                    <td>
                        <div id="jqBtnBorrarUsuario"></div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div id="jqLblDescripcion"></div>
                    </td>
                    <td>
                        <input type="text" id="jqTxtDescripcion" size="20px" maxlength="20" style="text-transform: uppercase;"/>
                    </td>
                    <td>
                        <div id="jqBtnBuscarDescripcion"></div>
                    </td>
                    <td>
                        <div id="jqBtnBorrarDescripcion"></div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div id="jqLblCriticidad"></div>
                    </td>
                    <td>
                        <input type="text" id="jqTxtCriticidad" size="15px" maxlength="20" style="text-transform: uppercase;"/>
                   </td>
                    <td>
                         <div id="jqBtnBuscarCriticidad"></div>
                    </td>
                    <td>
                        <div id="jqBtnBorrarCriticidad"></div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div id="jqLblFechaDesde"></div>
                    </td>
                    <td>
                        <input type="text" id="jqTxtFechaDesde" size="11px" maxlength="9" style="text-transform: uppercase;"/>
                    </td>
                    <td rowspan="2">
                       <div id="jqBtnBuscarDesdeHasta"></div>
                     </td>
                    <td rowspan="2">
                       <div id="jqBtnBorrarDesdeHasta"></div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div id="jqLblFechaHasta"></div>
                        
                    </td>
                    <td>
                       <input type="text" id="jqTxtFechaHasta" size="11px" maxlength="9" style="text-transform: uppercase;"/>
                    </td>
                </tr>

                <tr>
                    <td style="width:300;">
                       <div id="jqBtnBuscarPorParametros" ></div>
                        
                    </td>
                    <td>
                        <div id="jqBtnBorrarPorParametros"></div>
                    </td>
                    <td style="width:300;">
                       <div id="jqBtnBuscarTodos" ></div>
                        
                    </td>
                    <td>
                        <div id="jqBtnBorrarTodos"></div>
                    </td>
                </tr>

                <tr>
                    <td colspan="6">
                        <table id="tblBitacora">
                            <tr>
                                <td/>
                            </tr>
                        </table>
                        <div id="gridPagerBitacora"></div>​
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <div id="jqBtnImprimirReporte"></div>
                    </td>
                    <td colspan="2"  align="center">
                        <div id="jqBtnVerErrores"></div>
                    </td>
                </tr>
            </table>
        </fieldset>
    </td>
</tr>
</table>

    <script type="text/javascript">
    //<![CDATA[
        jQuery(document).ready(function () {
            /*
            pendientes 
            --boton imprimir 
            */




            // variables locales
            var _usuarios;
            var _criticidad;
            var _registrosGrilla;
            var _registrosIntegridad;
            var _idCriticidadSeleccionada = "";
            var _idUsusarioSeleccionado = "";

            var _reportUsuario = "TODOS";
            var _reportDescrip = "TODOS";
            var _reportFecDesde = "TODOS";
            var _reportFecHasta = "TODOS";
            var _reportCriticidad = "TODOS";

            // visualiso Integridad o Bitacora segun permisos

            if ($("#example14 - item -Integridad")) {
                $("#verIntegridad").show();
            }
            if ($("#example14 - item -Bitacora")) {
                $("#verBitacora").show();
            }
            $("#jqLegendTitle").html($('#<%= legendTitle.ClientID %>').text());
            $("#jqLegendIntegridad").html($('#<%= legendIntegridad.ClientID %>').text());

            //---------- usuario
            // traigo los usuarios
             
            $.ajax({
                type: "post",
                url: "/Website/WebServices/Bitacora.asmx/getUsuarios",
                data: JSON.stringify(),
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                beforeSend: function () {
                    jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                },
                success: function (result) {
                    $.alerts._hide();
                    _usuarios = result.d;
                    cargarComboUsuarios();
                }
            });
            function cargarComboUsuarios() {
                var __UsuarioTemp = "";
                $('#jqTxtUsuario').focus(function () {
                    __UsuarioTemp = $('#jqTxtUsuario').val();
                    $('#jqTxtUsuario').val("");
                });
                $('#jqTxtUsuario').blur(function () {
                    if ($('#jqTxtUsuario').val() == "") {
                        $('#jqTxtUsuario').val(__UsuarioTemp);
                    }
                });
                $("#jqTxtUsuario").ZaeAutocomplete(_usuarios, {
                    minChars: 0,
                    width: 250,
                    matchContains: true,
                    mustMatch: true,
                    autoFill: false,
                    formatItem: function (row, i, max) {
                        return row.id + " - " + row.usuario + " - " + row.fechaBaja;
                    },
                    formatMatch: function (row, i, max) {
                        return row.id + " - " + row.usuario;
                    },
                    formatResult: function (row) {
                        return row.usuario;
                    }
                });
                $("#jqTxtUsuario").result(function (event, data, formatted) {
                    _idUsusarioSeleccionado = ((data != undefined) ? data.id : "");
                });
            };





            $("#jqLblUsuario").html($('#<%= lblUsuario.ClientID %>').text());
            $("#jqTxtUsuario").addClass("ui-state-default ui-combobox-input ui-corner-all");
            $("#jqBtnBuscarUsuario").button({
                icons: {
                    primary: "ui-icon-search"
                },
                label: $('#<%= btnBuscarUsuario.ClientID %>').text()
            });
            $("#jqBtnBuscarUsuario").click(function () {
                if (validarPorUsuario()) {
                    _reportUsuario = (jQuery.trim($('#jqTxtUsuario').val()) != "" ? jQuery.trim($('#jqTxtUsuario').val()) : "TODOS");
                    _reportDescrip = "TODOS";
                    _reportFecDesde = "TODOS";
                    _reportFecHasta = "TODOS";
                    _reportCriticidad = "TODOS";
                    filtrarGrilla(' ', ' ', _idUsusarioSeleccionado, ' ', ' ');
                };
            });
            $("#jqBtnBorrarUsuario").button({
                icons: {
                    primary: "ui-icon-minusthick"
                },
                label: $('#<%= btnBorrarUsuario.ClientID %>').text()
            });
            $("#jqBtnBorrarUsuario").click(function () {
                if (validarPorUsuario()) {
                    _reportUsuario = (jQuery.trim($('#jqTxtUsuario').val()) != "" ? jQuery.trim($('#jqTxtUsuario').val()) : "TODOS");
                    _reportDescrip = "TODOS";
                    _reportFecDesde = "TODOS";
                    _reportFecHasta = "TODOS";
                    _reportCriticidad = "TODOS";
                    borrarPorUsuario();
                };
            });
            function validarPorUsuario() {
                if (_idUsusarioSeleccionado != "" || _idUsusarioSeleccionado == "0") {
                    return true;
                };
                jAlert($('#<%= msgErrorUsuarioValido.ClientID %>').text());
                return false;
            };




            //---------- descripcion

            $("#jqLblDescripcion").html($('#<%= lblDescripcion.ClientID %>').text());
            $("#jqTxtDescripcion").addClass("ui-state-default ui-combobox-input ui-corner-all");
            $("#jqBtnBuscarDescripcion").button({
                icons: {
                    primary: "ui-icon-search"
                },
                label: $('#<%= btnBuscarDescripcion.ClientID %>').text()
            });
            $("#jqBtnBuscarDescripcion").click(function () {
                if (validarPorDescripcion()) {
                    _reportUsuario = "TODOS";
                    _reportDescrip = jQuery.trim($('#jqTxtDescripcion').val());
                    _reportFecDesde = "TODOS";
                    _reportFecHasta = "TODOS";
                    _reportCriticidad = "TODOS";
                    filtrarGrilla(' ', ' ', ' ', ' ', jQuery.trim($('#jqTxtDescripcion').val()));
                };
            });
            $("#jqBtnBorrarDescripcion").button({
                icons: {
                    primary: "ui-icon-minusthick"
                },
                label: $('#<%= btnBorrarDescripcion.ClientID %>').text()
            });
            $("#jqBtnBorrarDescripcion").click(function () {
                if (validarPorDescripcion()) {
                    _reportUsuario = "TODOS";
                    _reportDescrip = jQuery.trim($('#jqTxtDescripcion').val()); 
                    _reportFecDesde = "TODOS";
                    _reportFecHasta = "TODOS";
                    _reportCriticidad = "TODOS";
                    borrarPorDescripcion(jQuery.trim($('#jqTxtDescripcion').val()));
                };
            });

            function validarPorDescripcion() {
                if (jQuery.trim($('#jqTxtDescripcion').val()) == "") {
                    jAlert($('#<%= msgErrorDescValida.ClientID %>').text());
                    return false;
                } else if (jQuery.trim($('#jqTxtDescripcion').val()).length < 3) {
                    jAlert($('#<%= msgErrorDescCaracteres.ClientID %>').text());
                    return false;
                };
                return true;
            };
            //---------- criticidad
            // traigo las criticidades
            $("#jqLblCriticidad").html($('#<%= lblCriticidad.ClientID %>').text());
            $("#jqTxtCriticidad").addClass("ui-state-default ui-combobox-input ui-corner-all");
            $("#jqBtnBuscarCriticidad").button({
                icons: {
                    primary: "ui-icon-search"
                },
                label: $('#<%= btnBuscarCriticidad.ClientID %>').text()
            });
            $("#jqBtnBuscarCriticidad").click(function () {
                if (validarPorCriticidad()) {
                    _reportUsuario = "TODOS";
                    _reportDescrip = "TODOS";
                    _reportFecDesde = "TODOS";
                    _reportFecHasta = "TODOS";
                    _reportCriticidad = jQuery.trim($('#jqTxtCriticidad').val());
                    filtrarGrilla(' ', ' ', ' ', _idCriticidadSeleccionada, ' ');
                }
            });
            $("#jqBtnBorrarCriticidad").button({
                icons: {
                    primary: "ui-icon-minusthick"
                },
                label: $('#<%= btnBorrarCriticidad.ClientID %>').text()
            });
            $("#jqBtnBorrarCriticidad").click(function () {
                if (validarPorCriticidad()) {
                    _reportUsuario = "TODOS";
                    _reportDescrip = "TODOS";
                    _reportFecDesde = "TODOS";
                    _reportFecHasta = "TODOS";
                    _reportCriticidad = jQuery.trim($('#jqTxtCriticidad').val());
                    borrarPorCriticidad();
                }
            });


            function validarPorCriticidad() {
                if (_idCriticidadSeleccionada == "") {
                    jAlert($('#<%= msgErrorCriticidadValida .ClientID %>').text());
                    return false;
                };
                return true;
            };
            $.ajax({
                type: "post",
                url: "/Website/WebServices/Bitacora.asmx/getCriticidades",
                data: JSON.stringify(),
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                beforeSend: function () {
                    jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                },
                success: function (result) {
                    $.alerts._hide();
                    _criticidad = result.d;
                    cargarComboCriticidades();
                }
            });
            function cargarComboCriticidades() {
                var __CriticidadTemp = "";
                $('#jqTxtCriticidad').focus(function () {
                    __CriticidadTemp = $('#jqTxtCriticidad').val();
                    $('#jqTxtCriticidad').val("");
                });
                $('#jqTxtCriticidad').blur(function () {
                    if ($('#jqTxtCriticidad').val() == "") {
                        $('#jqTxtCriticidad').val(__CriticidadTemp);
                    }
                });
                $("#jqTxtCriticidad").ZaeAutocomplete(_criticidad, {
                    minChars: 0,
                    width: 120,
                    matchContains: true,
                    mustMatch: true,
                    autoFill: false,
                    formatItem: function (row, i, max) {
                        return row.id + " - " + jQuery.trim(row.descripcion);
                    },
                    formatMatch: function (row, i, max) {
                        return row.id + " - " + jQuery.trim(row.descripcion);
                    },
                    formatResult: function (row) {
                        return jQuery.trim(row.descripcion);
                    }
                });
                $("#jqTxtCriticidad").result(function (event, data, formatted) {
                    _idCriticidadSeleccionada = ((data) ? data.id : "");
                });
            };

            //---------- fecha desde hasta

            $("#jqLblFechaDesde").html($('#<%= lblFechaDesde.ClientID %>').text());
            $("#jqLblFechaHasta").html($('#<%= lblFechaHasta.ClientID %>').text());
            $("#jqBtnBuscarDesdeHasta").button({
                icons: {
                    primary: "ui-icon-search"
                },
                label: $('#<%= btnBuscarDesdeHasta.ClientID %>').text()
            });
            $("#jqBtnBuscarDesdeHasta").click(function () {
                if (validarFechas()) {
                    filtrarGrilla(($("#jqTxtFechaDesde").datepicker('getDate') != null ? formatDate($("#jqTxtFechaDesde").datepicker('getDate'), 'yyyyMMdd') : ""), ($("#jqTxtFechaHasta").datepicker('getDate') != null ? formatDate($("#jqTxtFechaHasta").datepicker('getDate'), 'yyyyMMdd') : ""), '', '', '');
                    _reportUsuario = "TODOS";
                    _reportDescrip = "TODOS";
                    _reportFecDesde = ($("#jqTxtFechaDesde").datepicker('getDate') != null ? formatDate($("#jqTxtFechaDesde").datepicker('getDate'), 'dd/MM/yyyy') : "TODOS");
                    _reportFecHasta = ($("#jqTxtFechaHasta").datepicker('getDate') != null ? formatDate($("#jqTxtFechaHasta").datepicker('getDate'), 'dd/MM/yyyy') : "TODOS");
                    _reportCriticidad = "TODOS";
                }
            });
            $("#jqBtnBorrarDesdeHasta").button({
                icons: {
                    primary: "ui-icon-minusthick"
                },
                label: $('#<%= btnBorrarDesdeHasta.ClientID %>').text()
            });
            $("#jqBtnBorrarDesdeHasta").click(function () {
                if (validarFechas()) {
                    borrarPorFechas(($("#jqTxtFechaDesde").datepicker('getDate') != null ? formatDate($("#jqTxtFechaDesde").datepicker('getDate'), 'yyyyMMdd') : ""), ($("#jqTxtFechaHasta").datepicker('getDate') != null ? formatDate($("#jqTxtFechaHasta").datepicker('getDate'), 'yyyyMMdd') : ""));
                    _reportUsuario = "TODOS";
                    _reportDescrip = "TODOS";
                    _reportFecDesde = ($("#jqTxtFechaDesde").datepicker('getDate') != null ? formatDate($("#jqTxtFechaDesde").datepicker('getDate'), 'dd/MM/yyyy') : "TODOS");
                    _reportFecHasta = ($("#jqTxtFechaHasta").datepicker('getDate') != null ? formatDate($("#jqTxtFechaHasta").datepicker('getDate'), 'dd/MM/yyyy') : "TODOS");
                    _reportCriticidad = "TODOS";
                }
            });
            var dates = $("#jqTxtFechaDesde, #jqTxtFechaHasta").datepicker({
                width: "50",
                changeMonth: true,
                showOn: "button",
                buttonImage: "../images/calendar.gif",
                buttonImageOnly: true,
                onSelect: function (selectedDate) {
                    var option = this.id == "jqTxtFechaDesde" ? "minDate" : "maxDate",
                    instance = $(this).data("datepicker"),
                    date = $.datepicker.parseDate(instance.settings.dateFormat || $.datepicker._defaults.dateFormat, selectedDate, instance.settings);
                    dates.not(this).datepicker("option", option, date);
                }
            }).addClass("ui-state-default ui-combobox-input ui-corner-all");
            $("#jqTxtFechaDesde, #jqTxtFechaHasta").mask("99/99/9999");
            $("#jqTxtFechaDesde, #jqTxtFechaHasta").unbind("keyup");
            $("#jqTxtFechaDesde, #jqTxtFechaHasta").datepicker("option", $.datepicker.regional[$('#<%= lblregional.ClientID %>').text()]);
            var fecha_actual = new Date();
            var dateFormat = $('#<%= lblFormatoFechas.ClientID %>').text();
            var _fecha_hasta = formatDate(fecha_actual, dateFormat);
            var fecha_desde = new Date(fecha_actual.getTime() - (5 * 24 * 3600 * 1000)); // resto 5 dias aprox
            var _fecha_desde = formatDate(fecha_desde, dateFormat);
            $('#jqTxtFechaDesde').attr('value', _fecha_desde);
            $('#jqTxtFechaHasta').attr('value', _fecha_hasta);

            function validarFechas() {
                var _fecha_hasta = $('#jqTxtFechaHasta').datepicker('getDate');
                var _fecha_desde = $("#jqTxtFechaDesde").datepicker('getDate');
                if (!$('#jqTxtFechaDesde').val() && $('#jqTxtFechaDesde').val() != '' && getDateFromFormat($('#jqTxtFechaDesde').val(), $('#<%= lblFormatoFechas.ClientID %>').text()) == 0) {
                    jError($('#<%= msgErrorFechaDesdeValida .ClientID %>').text());
                    return false;
                } else if (!$('#jqTxtFechaHasta').val() && $('#jqTxtFechaHasta').val() != '' && getDateFromFormat($('#jqTxtFechaHasta').val(), $('#<%= lblFormatoFechas.ClientID %>').text()) == 0) {
                    //console.log(" H 3D" + _fecha_hasta + _fecha_desde);
                    jError($('#<%= msgErrorFechaHastaValida .ClientID %>').text());
                    return false;
                } else if ($('#jqTxtFechaHasta').val() != '' &&  _fecha_hasta < _fecha_desde) {
                    //console.log(" H 1D" + _fecha_hasta + _fecha_desde);
                    jError($('#<%= msgErrorMayorValida .ClientID %>').text());
                    return false;
                }
                return true;
            };
            function filtrarGrilla(fechaDesdePar, fechaHastaPar, idUsuarioPar, idCriticidadPar, descEventoPar) {
                $.ajax({
                    type: "post",
                    url: "/Website/WebServices/Bitacora.asmx/getRegistrosBitacora",
                    contentType: "application/json;charset=utf-8",
                    data: JSON.stringify({ fechaDesde: fechaDesdePar, fechaHasta: fechaHastaPar, idUsuario: idUsuarioPar, idCriticidad: idCriticidadPar, descEvento: descEventoPar }),
                    dataType: "json",
                    beforeSend: function () {
                        jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                    },
                    success: function (result) {
                        $.alerts._hide();
                        _registrosGrilla = result.d;
                        cargarGrilla();
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        $.alerts._hide();
                        jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
                        $("#tblBitacora").jqGrid('GridUnload');
                    }
                });
            };
            function borrarPorUsuario() {
                $.ajax({
                    type: "post",
                    url: "/Website/WebServices/Bitacora.asmx/borrarPorUsuario",
                    contentType: "application/json;charset=utf-8",
                    data: JSON.stringify({ idUsuario: _idUsusarioSeleccionado }),
                    dataType: "json",
                    beforeSend: function () {
                        jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                    },
                    success: function (result) {
                        $.alerts._hide();
                        jInfo($('#<%= msgOkBorrar.ClientID %>').text(), 'Info');
                        $("#tblBitacora").jqGrid('GridUnload');
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        $.alerts._hide();
                        jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
                        $("#tblBitacora").jqGrid('GridUnload');
                    }
                });

            };
            function borrarPorDescripcion(descEventoPar) {
                $.ajax({
                    type: "post",
                    url: "/Website/WebServices/Bitacora.asmx/borrarPorDescripcion",
                    contentType: "application/json;charset=utf-8",
                    data: JSON.stringify({ descEvento: descEventoPar }),
                    dataType: "json",
                    beforeSend: function () {
                        jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                    },
                    success: function (result) {
                        $.alerts._hide();
                        jInfo($('#<%= msgOkBorrar.ClientID %>').text(), 'Info');
                        $("#tblBitacora").jqGrid('GridUnload');
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        $.alerts._hide();
                        jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
                        $("#tblBitacora").jqGrid('GridUnload');
                    }
                });

            };
            function borrarPorFechas(fechaDesdePar, fechaHastaPar) {
                $.ajax({
                    type: "post",
                    url: "/Website/WebServices/Bitacora.asmx/borrarPorFechas",
                    contentType: "application/json;charset=utf-8",
                    data: JSON.stringify({ fechaDesde: fechaDesdePar, fechaHasta: fechaHastaPar }),
                    dataType: "json",
                    beforeSend: function () {
                        jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                    },
                    success: function (result) {
                        $.alerts._hide();
                        jInfo($('#<%= msgOkBorrar.ClientID %>').text(), 'Info');
                        $("#tblBitacora").jqGrid('GridUnload');
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        $.alerts._hide();
                        jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
                        $("#tblBitacora").jqGrid('GridUnload');
                    }
                });

            };
            function borrarPorCriticidad() {
                $.ajax({
                    type: "post",
                    url: "/Website/WebServices/Bitacora.asmx/borrarPorCriticidad",
                    contentType: "application/json;charset=utf-8",
                    data: JSON.stringify({ idCriticidad: _idCriticidadSeleccionada }),
                    dataType: "json",
                    beforeSend: function () {
                        jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                    },
                    success: function (result) {
                        $.alerts._hide();
                        jInfo($('#<%= msgOkBorrar.ClientID %>').text(), 'Info');
                        $("#tblBitacora").jqGrid('GridUnload');

                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        $.alerts._hide();
                        jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
                        $("#tblBitacora").jqGrid('GridUnload');
                    }
                });

            };
            function borrarTodos() {
                $.ajax({
                    type: "post",
                    url: "/Website/WebServices/Bitacora.asmx/borrarTodos",
                    contentType: "application/json;charset=utf-8",
                    data: JSON.stringify({}),
                    dataType: "json",
                    beforeSend: function () {
                        jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                    },
                    success: function (result) {
                        $.alerts._hide();
                        jInfo($('#<%= msgOkBorrar.ClientID %>').text(), 'Info');
                        $("#tblBitacora").jqGrid('GridUnload');
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        $.alerts._hide();
                        jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
                        $("#tblBitacora").jqGrid('GridUnload');
                    }
                });

            };
            function corregirIntegridad() {
                $.ajax({
                    type: "post",
                    url: "/Website/WebServices/Bitacora.asmx/corregirIntegridad",
                    contentType: "application/json;charset=utf-8",
                    data: JSON.stringify({}),
                    dataType: "json",
                    beforeSend: function () {
                        jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                    },
                    success: function (result) {
                        $.alerts._hide();
                        recargarMenu();
                        jInfo($('#<%= msgOkIntegridad.ClientID %>').text());
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        $.alerts._hide();
                        jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
                        verificarIntegridad();
                    }
                });
            };
            function recargarMenu() {
                $.ajax({
                    type: "post",
                    url: "/Website/WebServices/Bitacora.asmx/recargarMenu",
                    contentType: "application/json;charset=utf-8",
                    data: JSON.stringify({}),
                    dataType: "json",
                    beforeSend: function () {
                        jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                    },
                    success: function (result) {
                        $.alerts._hide();
                        $('#form1').submit();
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        $.alerts._hide();
                        jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
                        verificarIntegridad();
                    }
                });
            };

            function buscarTodos() {
                _reportUsuario = "TODOS";
                _reportDescrip = "TODOS";
                _reportFecDesde = "TODOS";
                _reportFecHasta = "TODOS";
                _reportCriticidad = "TODOS";
                filtrarGrilla("", "", "", "", "");
            };
            function verificarIntegridad() {
                $.ajax({
                    type: "post",
                    url: "/Website/WebServices/Bitacora.asmx/verificarIntegridad",
                    contentType: "application/json;charset=utf-8",
                    data: JSON.stringify({}),
                    dataType: "json",
                    beforeSend: function () {
                        jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                    },
                    success: function (result) {
                        $.alerts._hide();
                        if (result.d != '') {
                            if ($("#example14 - item -Integridad")) {
                                $("#verIntegridad").show();
                            }
                            _registrosIntegridad = result.d;
                            cargarGrillaIntegridad();
                        } else {
                            $("#verIntegridad").hide();
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        $.alerts._hide();
                        jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
                    }
                });

            };



            function cargarGrillaIntegridad() {
                $("#tblIntegridad").jqGrid('GridUnload');
                $("#tblIntegridad").jqGrid({
                    datatype: "local",
                    data: _registrosIntegridad,
                    colNames: [$('#<%= idDeTabla.ClientID %>').text(), $('#<%= inconsistencia.ClientID %>').text(), $('#<%= tablaAfectada.ClientID %>').text()],
                    colModel: [
                        { name: 'id', index: 'id', width: 90, sorttype: "int", align: "right" },
                        { name: 'inconsistencia', index: 'inconsistencia', width: 190 },
                        { name: 'tabla', index: 'tabla', width: 190 }
                    ],
                    rowNum: 10,
                    rowList: [10, 20, 30, 50, 100],
                    pager: '#gridPagerIntegridad',
                    sortname: 'id',
                    viewrecords: true,
                    altRows: true,
                    sortorder: "desc",
                    caption: $('#<%= integridad.ClientID %>').text(),
                    height: "100%"
                });

                $("#tblIntegridad").tooltip({
                    bodyHandler: function () {
                        return $('#<%= gridInconcistenciaTOOL.ClientID %>').text();
                    },
                    top: -15,
                    left: 5,
                    showURL: false
                });
            };

            function cargarGrilla() {
                $("#tblBitacora").jqGrid('GridUnload');
                $("#tblBitacora").jqGrid({
                    datatype: "local",
                    data: _registrosGrilla,
                    colNames: ['Id', $('#<%= fecha.ClientID %>').text(), $('#<%= idUsuario.ClientID %>').text(), $('#<%= usuario.ClientID %>').text(), $('#<%= criticidadId.ClientID %>').text(), $('#<%= criticidad.ClientID %>').text(), $('#<%= descripcion.ClientID %>').text()],
                    colModel: [
                        { name: 'id', index: 'id', width: 45, sorttype: "int", align: "right" },
                        { name: 'fecha', index: 'fecha', width: 120, align: 'center', sorttype: 'date', formatter: 'date', formatoptions: { srcformat: "d/m/Y H:i A", newformat: 'd/m/Y H:i A'} },
                        { name: 'idUsuario', index: 'idUsuario', width: 90, hidden: true },
                        { name: 'usuario', index: 'usuario', width: 200 },
                        { name: 'idCriticidad', index: 'idCriticidad', width: 10, hidden: true },
                        { name: 'descCriticidad', index: 'descCriticidad', width: 90 },
                        { name: 'accion', index: 'accion', width: 550 }
                    ],
                    rowNum: 10,
                    rowList: [10, 20, 30, 50, 100],
                    pager: '#gridPagerBitacora',
                    sortname: 'id',
                    viewrecords: true,
                    altRows: true,
                    sortorder: "desc",
                    width: "800",
                    shrinkToFit: false,
                    caption: $('#<%= bitacora.ClientID %>').text(),
                    height: "100%"
                });

                $("#tblBitacora").tooltip({
                    bodyHandler: function () {
                        return $('#<%= gridBitacoraTOOL.ClientID %>').text();
                    },
                    top: -15,
                    left: 5,
                    showURL: false
                });
            };

            function imprimirReporte() {
                $.ajax({
                    type: "post",
                    url: "/Website/WebServices/Bitacora.asmx/generarReporte",
                    contentType: "application/json;charset=utf-8",
                    data: JSON.stringify({ fechaDesde: _reportFecDesde, fechaHasta: _reportFecHasta, usuarioFiltro: _reportUsuario, criticidadFiltro: _reportCriticidad, descEvento: _reportDescrip, registrosGrilla: _registrosGrilla }),
                    dataType: "json",
                    beforeSend: function () {
                        jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                    },
                    success: function (result) {
                        $.alerts._hide();
                        jInfo($('#<%= msgReporteGenerado.ClientID %>').text(), 'Info');
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        $.alerts._hide();
                        jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
                    }
                });
            };

            //---------- botones genericos
            $("#jqBtnBuscarTodos").button({
                icons: {
                    primary: "ui-icon-search"
                },
                label: $('#<%= btnBuscarTodos.ClientID %>').text()
            });
            $("#jqBtnBuscarTodos").click(function () {
                buscarTodos();
            });
            $("#jqBtnBorrarTodos").button({
                icons: {
                    primary: "ui-icon-trash"
                },
                label: $('#<%= btnBorrarTodos.ClientID %>').text()
            });
            $("#jqBtnBorrarTodos").click(function () {
                _reportUsuario = "TODOS";
                _reportDescrip = "TODOS";
                _reportFecDesde = "TODOS";
                _reportFecHasta = "TODOS";
                _reportCriticidad = "TODOS";
                borrarTodos();
            });

            $("#jqBtnBuscarPorParametros").button({
                icons: {
                    primary: "ui-icon-search"
                },
                label: $('#<%= btnBuscarPorParametros.ClientID %>').text()
            });
            $("#jqBtnBuscarPorParametros").click(function () {
                buscarPorParametros();
            });
            $("#jqBtnBorrarPorParametros").button({
                icons: {
                    primary: "ui-icon-trash"
                },
                label: $('#<%= btnBorrarPorParametros.ClientID %>').text()
            });
            $("#jqBtnBorrarPorParametros").click(function () {
                borrarPorParametros();

            });
            function buscarPorParametros() {
                if (validarFechas()) {
                    _reportUsuario = (jQuery.trim($('#jqTxtUsuario').val()) != "" ? jQuery.trim($('#jqTxtUsuario').val()) : "TODOS");
                    _reportDescrip = (jQuery.trim($('#jqTxtDescripcion').val()) != "" ? jQuery.trim($('#jqTxtDescripcion').val()) : "TODOS");
                    _reportFecDesde = ($("#jqTxtFechaDesde").datepicker('getDate') != null ? formatDate($("#jqTxtFechaDesde").datepicker('getDate'), 'dd/MM/yyyy') : "TODOS");
                    _reportFecHasta = ($("#jqTxtFechaHasta").datepicker('getDate') != null ? formatDate($("#jqTxtFechaHasta").datepicker('getDate'), 'dd/MM/yyyy') : "TODOS");
                    _reportCriticidad = (jQuery.trim($('#jqTxtCriticidad').val()) != "" ? jQuery.trim($('#jqTxtCriticidad').val()) : "TODOS");
                    filtrarGrilla(($("#jqTxtFechaDesde").datepicker('getDate') != null ? formatDate($("#jqTxtFechaDesde").datepicker('getDate'), 'yyyyMMdd') : ""), ($("#jqTxtFechaHasta").datepicker('getDate') != null ? formatDate($("#jqTxtFechaHasta").datepicker('getDate'), 'yyyyMMdd') : ""), _idUsusarioSeleccionado, _idCriticidadSeleccionada, jQuery.trim($('#jqTxtDescripcion').val()));
                }
            };
            function borrarPorParametros() {
                if (validarFechas()) {
                    $.ajax({
                        type: "post",
                        url: "/Website/WebServices/Bitacora.asmx/borrarPorParametros",
                        contentType: "application/json;charset=utf-8",
                        data: JSON.stringify({ fechaDesde: ($("#jqTxtFechaDesde").datepicker('getDate') != null ? formatDate($("#jqTxtFechaDesde").datepicker('getDate'), 'yyyyMMdd') : ""), fechaHasta: ($("#jqTxtFechaHasta").datepicker('getDate') != null ? formatDate($("#jqTxtFechaHasta").datepicker('getDate'), 'yyyyMMdd') : ""), idUsuario: _idUsusarioSeleccionado, idCriticidad: _idCriticidadSeleccionada, descEvento: jQuery.trim($('#jqTxtDescripcion').val()) }),
                        dataType: "json",
                        beforeSend: function () {
                            jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                        },
                        success: function (result) {
                            $.alerts._hide();
                            jInfo($('#<%= msgOkBorrar.ClientID %>').text(), 'Info');
                        },
                        error: function (xhr, ajaxOptions, thrownError) {
                            $.alerts._hide();
                            jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
                            $("#tblBitacora").jqGrid('GridUnload');
                        }
                    });
                }
            };

            $("#jqBtnImprimirReporte").button({
                icons: {
                    primary: "ui-icon-document"
                },
                label: $('#<%= btnImprimirReporte.ClientID %>').text()
            });
            $("#jqBtnImprimirReporte").click(function () {
                imprimirReporte();
            });

            $("#jqBtnCorregirIntegridad").button({
                icons: {
                    primary: "ui-icon-check"
                },
                label: $('#<%= btnCorregirIntegridad.ClientID %>').text()
            });
            $("#jqBtnCorregirIntegridad").click(function () {
                corregirIntegridad();
            });

            
            $("#jqBtnVerErrores").button({
                label: "<a href='../elmah.axd' target='_blank'><span class='ui-icon ui-icon-extlink' style='float: left; margin-right: .3em;'></span> " + $('#<%= btnVerErrores.ClientID %>').text()  + "</a>"
            });


            $.getScript($('#<%= jsGridLibrary.ClientID %>').text(), function () {
                cargarGrilla();
                verificarIntegridad();
            });

        });



        $("#jqBtnVerErrores").tooltip({
            bodyHandler: function () {
                return $('#<%= jqBtnVerErroresTOOL.ClientID %>').text();
            },
            showURL: false
        });

        $("#jqBtnBuscarPorParametros").tooltip({
            bodyHandler: function () {
                return $('#<%= jqBtnBuscarPorParametrosTOOL.ClientID %>').text();
            },
            showURL: false
        });

        $("#jqBtnBorrarPorParametros").tooltip({
            bodyHandler: function () {
                return $('#<%= jqBtnBorrarPorParametrosTOOL.ClientID %>').text();
            },
            showURL: false
        });
        $("#jqTxtUsuario").tooltip({
            bodyHandler: function () {
                return $('#<%= jqTxtUsuarioTOOL.ClientID %>').text();
            },
            showURL: false
        });
        $("#jqTxtDescripcion").tooltip({
            bodyHandler: function () {
                return $('#<%= jqTxtDescripcionTOOL.ClientID %>').text();
            },
            showURL: false
        });
        $("#jqTxtCriticidad").tooltip({
            bodyHandler: function () {
                return $('#<%= jqTxtCriticidadTOOL.ClientID %>').text();
            },
            showURL: false
        });
        $("#jqTxtFechaDesde").tooltip({
            bodyHandler: function () {
                return $('#<%= jqTxtFechaDesdeTOOL.ClientID %>').text();
            },
            showURL: false
        });
        $("#jqTxtFechaHasta").tooltip({
            bodyHandler: function () {
                return $('#<%= jqTxtFechaHastaTOOL.ClientID %>').text();
            },
            showURL: false
        });
        $("#jqBtnBuscarUsuario").tooltip({
            bodyHandler: function () {
                return $('#<%= jqBtnBuscarUsuarioTOOL.ClientID %>').text();
            },
            showURL: false
        });
        $("#jqBtnBorrarUsuario").tooltip({
            bodyHandler: function () {
                return $('#<%= jqBtnBorrarUsuarioTOOL.ClientID %>').text();
            },
            showURL: false
        });
        $("#jqBtnBuscarDescripcion").tooltip({
            bodyHandler: function () {
                return $('#<%= jqBtnBuscarDescripcionTOOL.ClientID %>').text();
            },
            showURL: false
        });
        $("#jqBtnBorrarDescripcion").tooltip({
            bodyHandler: function () {
                return $('#<%= jqBtnBorrarDescripcionTOOL.ClientID %>').text();
            },
            showURL: false
        });
        $("#jqBtnBuscarCriticidad").tooltip({
            bodyHandler: function () {
                return $('#<%= jqBtnBuscarCriticidadTOOL.ClientID %>').text();
            },
            showURL: false
        });
        $("#jqBtnBorrarCriticidad").tooltip({
            bodyHandler: function () {
                return $('#<%= jqBtnBorrarCriticidadTOOL.ClientID %>').text();
            },
            showURL: false
        });
        $("#jqBtnBuscarDesdeHasta").tooltip({
            bodyHandler: function () {
                return $('#<%= jqBtnBuscarDesdeHastaTOOL.ClientID %>').text();
            },
            showURL: false
        });
        $("#jqBtnBorrarDesdeHasta").tooltip({
            bodyHandler: function () {
                return $('#<%= jqBtnBorrarDesdeHastaTOOL.ClientID %>').text();
            },
            showURL: false
        });
        $("#jqBtnBuscarTodos").tooltip({
            bodyHandler: function () {
                return $('#<%= jqBtnBuscarTodosTOOL.ClientID %>').text();
            },
            showURL: false
        });
        $("#jqBtnBorrarTodos").tooltip({
            bodyHandler: function () {
                return $('#<%= jqBtnBorrarTodosTOOL.ClientID %>').text();
            },
            showURL: false
        });
        $("#jqBtnCorregirIntegridad").tooltip({
            bodyHandler: function () {
                return $('#<%= jqBtnCorregirIntegridadTOOL.ClientID %>').text();
            },
            showURL: false
        });
        $("#jqBtnImprimirReporte").tooltip({
            bodyHandler: function () {
                return $('#<%= jqBtnImprimirReporteTOOL.ClientID %>').text();
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
            position: ['right', ' top'],
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
    //]]>
    </script>
</asp:Content>