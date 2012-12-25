<%@ Page Language="C#" MasterPageFile="~/MasterPages/BackEnd.master" AutoEventWireup="true" CodeFile="Restore.aspx.cs" Inherits="_Default" title="Home" culture="auto" meta:resourcekey="PageResource1" uiculture="auto"%>
<%@ MasterType VirtualPath="~/MasterPages/BackEnd.master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" Runat="Server">

<!-- Componentes -->
<div id="idioma"  style="display:none;">

<asp:Label ID="legendTitle" Text="Restauracón de la base de datos:" runat="server" 
        meta:resourcekey="legendTitleResource1" ></asp:Label>
<asp:Label ID="nombreBackUp" Text="Descripción Back-Up" runat="server" 
        meta:resourcekey="nombreBackUpResource1" ></asp:Label>
<asp:Label ID="cantidadVolumen" Text="Cantidad de particiones" runat="server" 
        meta:resourcekey="cantidadVolumenResource1"  ></asp:Label>
<asp:Label ID="btnRestore" Text="Restaurar Base de datos" runat="server" 
        meta:resourcekey="btnRestoreResource1" ></asp:Label>
<asp:Label ID="backUps" Text="Copias de seguridad o Back Up" runat="server" 
        meta:resourcekey="backUpsResource1" ></asp:Label>

<!-- Tooltips --> 


<asp:Label ID="gridBackUpsTOOL" Text="Esta grilla muestra los back up realizados" 
        runat="server" meta:resourcekey="gridBackUpsTOOLResource1" ></asp:Label>
<asp:Label ID="btnRestoreTOOL" Text="Realiza la restauracion de la BD" 
        runat="server" meta:resourcekey="btnRestoreTOOLResource1" ></asp:Label>

<!-- Mensajes -->
<asp:Label ID="msgError" Text="Se ha producido un error"  runat="server" 
        meta:resourcekey="msgErrorResource1" ></asp:Label>
<asp:Label ID="msgProcesando" Text="Aguarde un instante!!!"  runat="server" 
        meta:resourcekey="msgProcesandoResource1" ></asp:Label>
<asp:Label ID="msgErrorSeleccion" Text="Debe seleccionar un registro a restaurar" 
        runat="server" meta:resourcekey="msgErrorSeleccionResource1"></asp:Label>
<asp:Label ID="msgConfirmRestore" 
        Text="Está seguro que desea restaurar la Base de datos?" runat="server" 
        meta:resourcekey="msgConfirmRestoreResource1"></asp:Label>
<asp:Label ID="msgTitleConfirmRestore" Text="Confirmar restauración" runat="server" 
        meta:resourcekey="msgTitleConfirmRestoreResource1"></asp:Label>

        

<!-- Ayuda -->


    <asp:Label ID="jsGridLibrary" Text="../script/jquery.jqGrid-4.4.1/src/i18n/grid.locale-es.js"  runat="server" meta:resourcekey="jsGridLibraryResource" ></asp:Label>


    <asp:Label ID="help_dialog"  runat="server" meta:resourcekey="help_dialogResource1" ></asp:Label>
    <asp:Label ID="help_dialog_TOOL" Text="Cuadro de ayuda para la restauracion de la Base de datos"  runat="server" 
        meta:resourcekey="help_dialog_TOOLResource1"  ></asp:Label>
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
<table  align="left" >
<tr>
    <td width="650px">
        <fieldset class="ui-corner-all">
            <legend class="ui-widget ui-state-default ui-corner-all ui-button-text" style="text-align: left;" id="jqLegendTitle"></legend>
            <table align="left">
                <tr>
                    <td colspan="6">
                        <table id="tblBackUp">
                            <tr>
                                <td/>
                            </tr>
                        </table>
                        <div id="gridPagerBackUp"></div>​
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <div id="jqBtnRestore"></div>
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
            var _fileToRestore = "";

            $("#jqLegendTitle").html($('#<%= legendTitle.ClientID %>').text());

            $("#jqBtnRestore").button({
                icons: {
                    primary: "ui-icon-extlink"
                },
                label: $('#<%= btnRestore.ClientID %>').text()
            });
            $("#jqBtnRestore").click(function () {
                if (_fileToRestore == "") {
                    jError($('#<%= msgErrorSeleccion.ClientID %>').text());
                    return false;
                }
                jConfirm($('#<%= msgConfirmRestore.ClientID %>').text(), $('#<%= msgTitleConfirmRestore.ClientID %>').text(), function (r) {
                    if (r) {
                        realizarRestore();
                    }
                });
            });


            function traerBackUps() {
                $.ajax({
                    type: "post",
                    url: "/Website/WebServices/BackUp.asmx/getBackUp",
                    contentType: "application/json;charset=utf-8",
                    data: JSON.stringify(),
                    dataType: "json",
                    beforeSend: function () {
                        jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                    },
                    success: function (result) {
                        $.alerts._hide();
                        _registrosBackUp = result.d;
                        cargarGrilla();
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        $.alerts._hide();
                        jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
                        $("#tblBitacora").jqGrid('GridUnload');
                    }
                });
            };

            function cargarGrilla() {
                $("#tblBackUp").jqGrid('GridUnload');
                $("#tblBackUp").jqGrid({
                    datatype: "local",
                    data: _registrosBackUp,
                    colNames: ['id', $('#<%= nombreBackUp.ClientID %>').text(), $('#<%= cantidadVolumen.ClientID %>').text()],
                    colModel: [
                        { name: 'id', index: 'id', width: 30, sorttype: "int", align: "right" },
                        { name: 'nombreBackUp', index: 'nombreBackUp', width: 400, align: "left", sorttype: "text" },
                        { name: 'cantidadVolumen', index: 'cantidadVolumen', width: 150, align: "right", sorttype: "int" }
                    ],
                    rowNum: 10,
                    rowList: [10, 20, 30],
                    pager: '#gridPagerBackUp',
                    sortname: 'nombreBackUp',
                    viewrecords: true,
                    altRows: true,
                    sortorder: "desc",
                    caption: $('#<%= backUps.ClientID %>').text(),
                    height: "100%",
                    onSelectRow: function (id) {
                        _fileToRestore = jQuery('#tblBackUp').jqGrid('getCell', id, 'nombreBackUp');
                        _volumenes = jQuery('#tblBackUp').jqGrid('getCell', id, 'cantidadVolumen');
                    }
                });
            };

            function realizarRestore() {
                $.ajax({
                    type: "post",
                    url: "/Website/WebServices/BackUp.asmx/hacerRestore",
                    data: JSON.stringify({ fileToRestore: _fileToRestore, vol: _volumenes }),
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    beforeSend: function () {
                        jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                    },
                    success: function (result) {
                        $.alerts._hide();
                        traerBackUps();
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        $.alerts._hide();
                        jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
                        traerBackUps();
                    }
                });
            };



            $("#tblBackUp").tooltip({
                bodyHandler: function () {
                    return $('#<%= gridBackUpsTOOL.ClientID %>').text();
                },
                showURL: false
            });
            $("#jqBtnRestore").tooltip({
                bodyHandler: function () {
                    return $('#<%= btnRestoreTOOL.ClientID %>').text();
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

            $.getScript($('#<%= jsGridLibrary.ClientID %>').text(), function () {
                traerBackUps();
            });


        });            
    //]]>
    </script>
</asp:Content>