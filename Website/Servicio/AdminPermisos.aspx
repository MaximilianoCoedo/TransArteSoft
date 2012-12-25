<%@ Page Language="C#" MasterPageFile="~/MasterPages/BackEnd.master" AutoEventWireup="true" CodeFile="AdminPermisos.aspx.cs" Inherits="_Default" title="Home" culture="auto" meta:resourcekey="PageResource1" uiculture="auto"%>
<%@ MasterType VirtualPath="~/MasterPages/BackEnd.master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" Runat="Server">

<!-- Componentes -->
<div id="idioma" style="display:none;">
<asp:Label ID="lblGrupo" Text="Grupo:" runat="server" 
        meta:resourcekey="lblGrupoResource1"></asp:Label>
<asp:Label ID="jqTxtGrupoTOOL" Text="Ingrese el nombre del grupo" runat="server" 
        meta:resourcekey="jqTxtGrupoTOOLResource1"></asp:Label>
<asp:Label ID="btnAgregar" Text="Agregar" runat="server" 
        meta:resourcekey="btnAgregarResource1"></asp:Label>

<asp:Label ID="btnModificar" Text="Modificar" runat="server" 
        meta:resourcekey="btnModificarResource1"></asp:Label>
<asp:Label ID="btnBaja" Text="Baja" runat="server" 
        meta:resourcekey="btnBajaResource1"></asp:Label>
<asp:Label ID="gridPermisos" Text="Permisos" runat="server" 
        meta:resourcekey="gridPermisosResource1"></asp:Label>
<asp:Label ID="gridGrupos" Text="Grupos" runat="server" 
        meta:resourcekey="gridGruposResource1"></asp:Label>
<asp:Label ID="gridNombreDelGrupo" Text="Nombre del grupo" runat="server" 
        meta:resourcekey="gridNombreDelGrupoResource1"></asp:Label>
<asp:Label ID="gridNombreDelPermiso" Text="Nombre del permiso" runat="server" 
        meta:resourcekey="gridNombreDelPermisoResource1"></asp:Label>
<asp:Label ID="legendTitle" Text="Administrar Permisos:" runat="server" 
        meta:resourcekey="legendTitleResource1"></asp:Label>

<asp:Label ID="gridUsuarios" Text="Usuarios" runat="server" 
        meta:resourcekey="gridUsuariosResource1"></asp:Label>
<asp:Label ID="gridUsuario" Text="Usuario" runat="server" 
        meta:resourcekey="gridUsuarioResource1"></asp:Label>




<asp:Label ID="gridFechaAlta" Text="Fecha Alta" runat="server" meta:resourcekey="gridFechaAltaResource1"></asp:Label>
<asp:Label ID="gridHistory" Text="Historial del grupo" runat="server" meta:resourcekey="gridHistoryResource1"></asp:Label>
<asp:Label ID="gridFechabaja" Text="Fecha Baja" runat="server"  meta:resourcekey="gridFechabajaResource1"></asp:Label>

        

        
                 

<!-- Tooltips -->

<asp:Label ID="gridGruposTOOL" Text="Esta grilla muestra los grupos habilitados" 
        runat="server" meta:resourcekey="gridGruposTOOLResource1" ></asp:Label>
<asp:Label ID="gridPermisosTOOL" 
        Text="Esta grilla muestra los permisos del grupo seleccionado" runat="server" 
        meta:resourcekey="gridPermisosTOOLResource1" ></asp:Label>       
<asp:Label ID="btnAgregarTOOL" Text="Agrega un grupo en la grilla GRUPO" 
        runat="server" meta:resourcekey="btnAgregarTOOLResource1" ></asp:Label>
<asp:Label ID="btnModificarTOOL" Text="Modifica un grupo en la grilla GRUPO" 
        runat="server" meta:resourcekey="btnModificarTOOLResource1" ></asp:Label>
<asp:Label ID="btnBajaTOOL" Text="Elimina un grupo en la grilla GRUPO" 
        runat="server" meta:resourcekey="btnBajaTOOLResource1" ></asp:Label>
<!-- Mensajes -->
<asp:Label ID="msgError" Text="Se ha producido un error"  runat="server" 
        meta:resourcekey="msgErrorResource1" ></asp:Label>
<asp:Label ID="msgEingNomGru" Text="Debe ingresar un nombre de grupo."  
        runat="server" meta:resourcekey="msgEingNomGruResource1"></asp:Label>
<asp:Label ID="msgEselPermiso" Text="Debe seleccionar algun permiso."  
        runat="server" meta:resourcekey="msgEselPermisoResource1"></asp:Label>
<asp:Label ID="msgOkPerGru" Text="El grupo y los permisos se agregaron con exito."  
        runat="server" meta:resourcekey="msgOkPerGruResource1"></asp:Label>
<asp:Label ID="msgECambNGrupo"  Text="Ya existe el grupo cambie el nombre del grupo e intente nuevamente."  
        runat="server" meta:resourcekey="msgECambNGrupoResource1"></asp:Label>
<asp:Label ID="msgEAltaGrupo" Text="Error al agregar el grupo."  
        runat="server" meta:resourcekey="msgEAltaGrupoResource1"></asp:Label>
<asp:Label ID="msgEModGrupo" Text="Error al modificar el grupo."  
        runat="server" meta:resourcekey="msgEModificarGrupoResource1"></asp:Label>
<asp:Label ID="msgEBajaGrupo" Text="Error al dar de baja el grupo."  
        runat="server" meta:resourcekey="msgEBajaGrupoResource1"></asp:Label>
<asp:Label ID="msgESelGrupo" Text="Debe seleccionar un grupo de la grilla."  
        runat="server" meta:resourcekey="msgESelGrupoResource1"></asp:Label>
<asp:Label ID="msgOkElimGrupo" Text="Se elimino con exito el grupo."  
        runat="server" meta:resourcekey="msgOkElimGrupoResource1"></asp:Label>
<asp:Label ID="msgEUniADMpermiso" 
        Text="No se saco, el permiso 'ABM de Usuario' es el unico que tiene este permiso."  
        runat="server" meta:resourcekey="msgEUniADMpermisoResource1"></asp:Label>
<asp:Label ID="msgEUniRestore" 
        Text="No se saco, el permiso 'Restore' es el unico que tiene este permiso."  
        runat="server" meta:resourcekey="msgEUniRestoreResource1"></asp:Label>
<asp:Label ID="msgEUniBitacora" 
        Text="No se saco, el permiso 'Bitacora' es el unico que tiene este permiso."  
        runat="server" meta:resourcekey="msgEUniBitacoraResource1"></asp:Label>
<asp:Label ID="msgOkModGrupo" Text="Se modifico con exito el grupo."  
        runat="server" meta:resourcekey="msgOkModGrupoResource1"></asp:Label>
<asp:Label ID="msgOkModPermisos" 
        Text="Se modifico con exito los permisos del grupo."  runat="server" 
        meta:resourcekey="msgOkModPermisosResource1"></asp:Label>
<asp:Label ID="msgProcesando" Text="Aguarde un instante!!!"  runat="server" 
        meta:resourcekey="msgProcesandoResource1"></asp:Label>
    <!-- Ayuda -->
    <asp:Label ID="jsGridLibrary" Text="../script/jquery.jqGrid-4.4.1/src/i18n/grid.locale-es.js"  runat="server" meta:resourcekey="jsGridLibraryResource" ></asp:Label>

    <asp:Label ID="help_dialog" Text=""  runat="server" meta:resourcekey="help_dialogResource1" ></asp:Label>
    <asp:Label ID="help_dialog_TOOL" 
            Text="Cuadro de ayuda de administración de permisos"  runat="server" 
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
<tr><td width="95%">
    <fieldset  class="ui-corner-all">
        <legend class="ui-widget ui-state-default ui-corner-all ui-button-text" style="text-align: left;" id="jqLegendTitle"></legend>
        <table  align="center">
            <tr>
                <td>
                    <div id="jqLblGrupo"></div>
                </td>
                <td>
                    <input type="text" id="jqTxtGrupo" size="20px" maxlength="20" style="text-transform: uppercase;"/>
                </td>
                <td>
                    <div id="jqBtnAgregar"></div>
                </td>
                <td>
                    <div id="jqBtnModificar"></div>
                </td>
                <td>
                    <div id="jqBtnBaja"></div>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <table id="tblGrupos">
                        <tr>
                            <td/>
                        </tr>
                    </table>
                    <div id="gridPagerGrupos"></div>​
                </td>
                <td colspan="2">
                    <table id="tblPermisos">
                        <tr>
                            <td/>
                        </tr>
                     </table>
                    <div id="Div1"></div>​
                </td>
                <td colspan="1">
                    <table id="tblUsuarios">
                        <tr>
                            <td/>
                        </tr>
                    </table>
                    <div id="gridPagerUsuarios"></div>​
                </td>
                <td colspan="1">
                    <table id="tblHistory">
                        <tr>
                            <td/>
                        </tr>
                    </table>
                    <div id="gridPagerHistory"></div>​
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

            var _GruposGrilla;
            var _GruposUsuarios;
            var _GruposHistory;

            $("#jqLblGrupo").html($('#<%= lblGrupo.ClientID %>').text());
            $("#jqLegendTitle").html($('#<%= legendTitle.ClientID %>').text());

            $("#jqTxtGrupo").addClass("ui-state-default ui-combobox-input ui-corner-all");
            $("#jqTxtGrupo").focus(function () {
                crearGrillaPermisos();
            });


            $("#jqBtnAgregar").button({
                icons: {
                    primary: "ui-icon-plusthick"
                },
                label: $('#<%= btnAgregar.ClientID %>').text()
            });
            $("#jqBtnAgregar").click(function () {
                agregarGrupo();
            });

            $("#jqBtnModificar").button({
                icons: {
                    primary: "ui-icon-pencil"
                },
                label: $('#<%= btnModificar.ClientID %>').text()
            }).click(function () {
                modificarGrupo();
            });

            $("#jqBtnBaja").button({
                icons: {
                    primary: "ui-icon-minusthick"
                },
                label: $('#<%= btnBaja.ClientID %>').text()
            }).click(function () {
                bajaGrupo();
            });

            function cargargrupos() {

                console.log("entro por cargar grupos");
                $.ajax({
                    type: "post",
                    url: "/Website/WebServices/AdminPermisos.asmx/getGrupos",
                    contentType: "application/json;charset=utf-8",
                    data: JSON.stringify(),
                    dataType: "json",
                    beforeSend: function () {
                        jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                    },
                    success: function (result) {
                        $.alerts._hide();
                        _GruposGrilla = result.d;
                        crearGrillaGrupo();
                        _GruposUsuarios = [];
                        crearGrillaUsuarios();
                        _GruposHistory = [];
                        crearGrillaHistory();
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        $.alerts._hide();
                        jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
                        $("#tblGrupos").jqGrid('GridUnload');
                    }
                });
            }

            function crearGrillaGrupo() {
                $("#tblGrupos").jqGrid('GridUnload');
                $("#tblGrupos").jqGrid({
                    datatype: "local",
                    data: _GruposGrilla,
                    colNames: ['ID', $('#<%= gridNombreDelGrupo.ClientID %>').text()],
                    colModel: [
   		                { name: 'ID', index: 'ID', sortable: true, key: true, width: 25, align: "right", hidden: false },
   		                { name: 'DescGrupo', index: 'DescGrupo', sortable: true, width: 150, align: "left" }
   	                ],
                    rowNum: 10,
                    rowList: [10, 20, 30],
                    pager: '#gridPagerGrupos',
                    sortname: 'id',
                    viewrecords: true,
                    sortorder: "desc",
                    caption: $('#<%= gridGrupos.ClientID %>').text(),
                    height: 230,
                    onSelectRow: function (id) {
                        seleccionarGrupo(id);
                        cargarUsuarios(id);
                        cargarHistory(id);
                    }
                });
            };
            function cargarUsuarios(_idGrupo) {
                $.ajax({
                    type: "post",
                    url: "/Website/WebServices/AdminPermisos.asmx/getUsuarios",
                    contentType: "application/json;charset=utf-8",
                    data: JSON.stringify({ idGrupo: _idGrupo }),
                    dataType: "json",
                    beforeSend: function () {
                        jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                    },
                    success: function (result) {
                        $.alerts._hide();
                        _GruposUsuarios = result.d;
                        crearGrillaUsuarios();
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        $.alerts._hide();
                        jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
                        $("#tblUsuarios").jqGrid('GridUnload');
                    }
                });
            }
            function crearGrillaHistory() {

                console.log("entro");
                $("#tblHistory").jqGrid('GridUnload');
                $("#tblHistory").jqGrid({
                    datatype: "local",
                    data: _GruposHistory,
                    colNames: ['ID', $('#<%= gridFechaAlta.ClientID %>').text(), $('#<%= gridFechabaja.ClientID %>').text(), $('#<%= gridNombreDelPermiso.ClientID %>').text()],
                    colModel: [
   		                { name: 'ID', index: 'ID', sortable: true, key: true, width: 25, align: "right", hidden: true },
   		                { name: 'fechaAlta', index: 'fechaAlta', width: 70, align: 'center', sorttype: 'date', formatter: 'date', formatoptions: { srcformat: "d/m/Y H:i A", newformat: 'd/m/Y'} },
   		                { name: 'fechaBaja', index: 'fechaBaja', width: 70, align: 'center', sorttype: 'date', formatter: 'date', formatoptions: { srcformat: "d/m/Y H:i A", newformat: 'd/m/Y'} },
                        { name: 'descripcion', index: 'descripcion', sortable: true, width: 130, align: "left" }
   	                ],
                    rowNum: 10,
                    rowList: [10, 20, 30, 30],
                    pager: '#gridPagerHistory',
                    sortname: 'id',
                    viewrecords: true,
                    sortorder: "desc",
                    caption: $('#<%= gridHistory.ClientID %>').text(),
                    height: 230,
                    beforeSelectRow: function (rowid, e) {
                        return false;
                    }
                });
            };

            function cargarHistory(_idGrupo) {

                console.log("entro");
                $.ajax({
                    type: "post",
                    url: "/Website/WebServices/AdminPermisos.asmx/getHistory",
                    contentType: "application/json;charset=utf-8",
                    data: JSON.stringify({ idGrupo: _idGrupo }),
                    dataType: "json",
                    beforeSend: function () {
                        jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                    },
                    success: function (result) {
                        $.alerts._hide();
                        _GruposHistory = result.d;
                        crearGrillaHistory();
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        $.alerts._hide();
                        jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
                        $("#tblHistory").jqGrid('GridUnload');
                    }
                });
            }

            function crearGrillaUsuarios() {
                $("#tblUsuarios").jqGrid('GridUnload');
                $("#tblUsuarios").jqGrid({
                    datatype: "local",
                    data: _GruposUsuarios,
                    colNames: ['ID', $('#<%= gridUsuario.ClientID %>').text()],
                    colModel: [
   		                { name: 'ID', index: 'ID', sortable: true, key: true, width: 25, align: "right", hidden: true },
   		                { name: 'usuario', index: 'usuario', sortable: true, width: 150, align: "left" }
   	                ],
                    sortname: 'id',
                    viewrecords: true,
                    sortorder: "desc",
                    caption: $('#<%= gridUsuarios.ClientID %>').text(),
                    height: 255,
                    beforeSelectRow: function (rowid, e) {
                        return false;
                    }
                });
            };
            function crearGrillaPermisos() {
                $("#tblPermisos").jqGrid('GridUnload');
                $("#tblPermisos").jqGrid({
                    url: '/Website/WebServices/AdminPermisos.asmx/getPermisos',
                    datatype: 'json',
                    mtype: 'POST',
                    ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },
                    serializeGridData: function (postData) {
                        return JSON.stringify(postData);
                    },
                    jsonReader: { repeatitems: false, root: "d.rows", page: "d.page", total: "d.total", records: "d.records" },
                    colModel: [
                        { name: 'ID', label: 'ID', key: true, width: 25, align: "center", hidden: true },
                        { name: 'descripcion', label: $('#<%= gridNombreDelPermiso.ClientID %>').text(), width: 150, sortable: true, hidden: false }
                    ],
                    multiselect: true,
                    viewrecords: true,
                    gridview: true,
                    loadonce: false,
                    height: 255,
                    caption: $('#<%= gridPermisos.ClientID %>').text()
                });
                $("#tblPermisos").jqGrid('hideCol', 'cb');

            };
            function seleccionarGrupo(idGrup) {
                var dataFromCellByColumnName = jQuery('#tblGrupos').jqGrid('getCell', idGrup, 'DescGrupo');
                $('#jqTxtGrupo').val(dataFromCellByColumnName);
                $.ajax({
                    type: "post",
                    url: "/Website/WebServices/AdminPermisos.asmx/getPermisosPoridGrupo",
                    data: JSON.stringify({ idGrupo: idGrup }),
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    beforeSend: function () {
                        jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                    },
                    success: function (result) {
                        $.alerts._hide();
                        $("#tblPermisos").jqGrid('resetSelection');
                        for (var i = 0; i < result.d.length; i++) {
                            $("#tblPermisos").jqGrid('setSelection', result.d[i].ID);
                        }
                    }
                });
            };
            function agregarGrupo() {
                var grupo = $('#jqTxtGrupo').val();
                var _idsPermisos = $("#tblPermisos").jqGrid('getGridParam', 'selarrrow');
                if (validarNombreGrupo() && validarPermisosSelect()) {
                    $.ajax({
                        type: "post",
                        url: "/Website/WebServices/AdminPermisos.asmx/agregarGrupo",
                        data: JSON.stringify({ descGrupo: grupo, idPermisos: _idsPermisos }),
                        contentType: "application/json;charset=utf-8",
                        dataType: "json",
                        beforeSend: function () {
                            jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                        },
                        success: function (result) {
                            $.alerts._hide();
                            if (result.d.error) {
                                jError($('#<%= msgEAltaGrupo.ClientID %>').text() + "<br> " + result.d.error, 'Error');
                            } else if (result.d.errorNombreGrupo) {// Error por nombre grupo
                                jError($('#<%= msgECambNGrupo.ClientID %>').text(), 'Error');
                            } else {
                                jInfo($('#<%= msgOkPerGru.ClientID %>').text(), 'Info');
                            }
                            $("#tblGrupos").jqGrid('GridUnload');
                            cargargrupos();
                        },
                        error: function (xhr, ajaxOptions, thrownError) {
                            $.alerts._hide();
                            jError($('#<%= msgEAltaGrupo.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
                            $("#tblGrupos").jqGrid('GridUnload');
                            cargargrupos();
                        }
                    });
                }
                return false;
            };



            function bajaGrupo() {
                var _idGrupo = $("#tblGrupos").jqGrid('getGridParam', 'selrow');

                console.log("baja al grupo _idGrupo" + _idGrupo);
                if (validarGrupoSelect()) {
                    $.ajax({
                        type: "post",
                        url: "/Website/WebServices/AdminPermisos.asmx/eliminarPoridGrupo",
                        data: JSON.stringify({ idGrupo: _idGrupo }),
                        contentType: "application/json;charset=utf-8",
                        dataType: "json",
                        beforeSend: function () {
                            jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                        },
                        success: function (result) {
                            $.alerts._hide();
                            if (result.d.error) {
                                jError($('#<%= msgEBajaGrupo.ClientID %>').text() + "<br> " + result.d.error, 'Error');
                            } else if (result.d.descripcion == 13) {// abm usuarios
                                jError($('#<%= msgEUniADMpermiso.ClientID %>').text(), 'Error');
                            } else if (result.d.descripcion == 16) {// restore
                                jError($('#<%= msgEUniRestore.ClientID %>').text(), 'Error');
                            } else if (result.d.descripcion == 17) {// bitacora
                                jError($('#<%= msgEUniBitacora.ClientID %>').text(), 'Error');
                            } else {
                                jInfo($('#<%= msgOkElimGrupo.ClientID %>').text(), 'Info');
                            }
                            $("#tblGrupos").jqGrid('GridUnload');
                            cargargrupos();
                        },
                        error: function (xhr, ajaxOptions, thrownError) {
                            $.alerts._hide();
                            jError($('#<%= msgEBajaGrupo.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
                            $("#tblGrupos").jqGrid('GridUnload');
                            cargargrupos();
                        }
                    });
                }
            };

            function modificarGrupo() {
                var grupo = $('#jqTxtGrupo').val();
                var _idsPermisos = $("#tblPermisos").jqGrid('getGridParam', 'selarrrow');
                var _idGrupo = $("#tblGrupos").jqGrid('getGridParam', 'selrow');
                if (validarGrupoSelect() && validarNombreGrupo()) {
                    console.log("click en modificarGrupo");
                    $.ajax({
                        type: "post",
                        url: "/Website/WebServices/AdminPermisos.asmx/modificarGrupo",
                        data: JSON.stringify({ idGrupo: _idGrupo, descGrupo: grupo, idPermisosCliente: _idsPermisos }),
                        contentType: "application/json;charset=utf-8",
                        dataType: "json",
                        beforeSend: function () {
                            jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                        },
                        success: function (result) {
                            $.alerts._hide();
                            if (result.d.error) {
                                jError($('#<%= msgEModGrupo.ClientID %>').text() + "<br> " + result.d.error, 'Error');
                            } else if (result.d.errorNombreGrupo) {// Error por nombre grupo
                                jError($('#<%= msgECambNGrupo.ClientID %>').text(), 'Error');
                            } else if (result.d.errorABMUsuario) {// abm usuarios
                                jError($('#<%= msgEUniADMpermiso.ClientID %>').text(), 'Error');
                            } else if (result.d.errorRestore) {// restore
                                jError($('#<%= msgEUniRestore.ClientID %>').text(), 'Error');
                            } else if (result.d.errorBitacora) {// bitacora
                                jError($('#<%= msgEUniBitacora.ClientID %>').text(), 'Error');
                            } else {
                                jInfo($('#<%= msgOkModGrupo.ClientID %>').text(), 'Info');
                            }
                            $("#tblGrupos").jqGrid('GridUnload');
                            cargargrupos();
                            crearGrillaUsuarios();
                            crearGrillaPermisos()
                        },
                        error: function (xhr, ajaxOptions, thrownError) {
                            $.alerts._hide();
                            jError($('#<%= msgEModGrupo.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
                            $("#tblGrupos").jqGrid('GridUnload');
                            cargargrupos();
                        }
                    });
                    $("#tblGrupos").jqGrid('GridUnload');
                    cargargrupos();
                }
            };

            // validaciones 
            function validarNombreGrupo() {
                if ($.trim($('#jqTxtGrupo').val()) == "") {
                    jError($('#<%= msgEingNomGru.ClientID %>').text());
                    return false;
                }
                return true;
            }

            function validarPermisosSelect() {
                var ids = $("#tblPermisos").jqGrid('getGridParam', 'selarrrow');
                if (ids == "") {
                    jError($('#<%= msgEselPermiso.ClientID %>').text());
                    return false;
                }
                return true;
            }
            function validarGrupoSelect() {
                var ids = $("#tblGrupos").jqGrid('getGridParam', 'selrow');
                if (ids == null) {
                    jError($('#<%= msgESelGrupo.ClientID %>').text());
                    return false;
                }
                return true;
            }

            $.getScript($('#<%= jsGridLibrary.ClientID %>').text(), function () {
                cargargrupos();
                crearGrillaPermisos();
                crearGrillaUsuarios();
                crearGrillaHistory();
            });


        });
         // cargo los tooltips
            $("#tblGrupos").tooltip({
                bodyHandler: function () {
                    return $('#<%= gridGruposTOOL.ClientID %>').text();
                },
                top: -15,
                left: 5,
                showURL: false
            });
            $("#tblPermisos").tooltip({
                bodyHandler: function () {
                    return $('#<%= gridPermisosTOOL.ClientID %>').text();
                },
                top: -15,
                left: 5,
                showURL: false
            });
            $("#jqTxtGrupo").tooltip({
                bodyHandler: function () {
                    return $('#<%= jqTxtGrupoTOOL.ClientID %>').text();
                },
                showURL: false
            });
            $("#jqBtnAgregar").tooltip({
                bodyHandler: function () {
                    return $('#<%= btnAgregarTOOL.ClientID %>').text();
                },
                showURL: false
            });

            $("#jqBtnBaja").tooltip({
                bodyHandler: function () {
                    return $('#<%= btnBajaTOOL.ClientID %>').text();
                },
                showURL: false
            });
            $("#jqBtnModificar").tooltip({
                bodyHandler: function () {
                    return $('#<%= btnModificarTOOL.ClientID %>').text();
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
                title:$('#<%= help_dialog.ClientID %>').html(),
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