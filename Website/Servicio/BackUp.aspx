<%@ Page Language="C#" MasterPageFile="~/MasterPages/BackEnd.master" AutoEventWireup="true" CodeFile="BackUp.aspx.cs" Inherits="_Default" title="Home" culture="auto" meta:resourcekey="PageResource1" uiculture="auto"%>
<%@ MasterType VirtualPath="~/MasterPages/BackEnd.master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" Runat="Server">

<!-- Componentes -->
<div id="idioma"  style="display:none;">
<asp:Label ID="legendTitle" Text="Resguardo de la base de datos:" runat="server" 
        meta:resourcekey="legendTitleResource1" ></asp:Label>
<asp:Label ID="lblTamanio" Text="Tamaño:" runat="server" 
        meta:resourcekey="lblTamanioResource1" ></asp:Label>
<asp:Label ID="btnBackUp" Text="Resguardar Base de datos" runat="server" 
        meta:resourcekey="btnBackUpResource1" ></asp:Label>

<asp:Label ID="nombreBackUp" Text="Descripción Back-Up" runat="server" 
        meta:resourcekey="nombreBackUpResource1" ></asp:Label>
<asp:Label ID="cantidadVolumen" Text="Cantidad de particiones" runat="server" 
        meta:resourcekey="cantidadVolumenResource1" ></asp:Label>
<asp:Label ID="backUps" Text="Copias de seguridad" runat="server" 
        meta:resourcekey="backUpsResource1" ></asp:Label>
<asp:Label ID="lblTamanioBD" Text="Tamaño de la Base de datos: " runat="server" 
        meta:resourcekey="lblTamanioBDResource1" ></asp:Label>
<asp:Label ID="lblvol" Text=" Volumen/es: " runat="server" 
        meta:resourcekey="lblvolResource1" ></asp:Label>


<!-- Tooltips --> 


<asp:Label ID="gridBackUpsTOOL" Text="Esta grilla muestra los back up realizados" 
        runat="server" meta:resourcekey="gridBackUpsTOOLResource1" ></asp:Label>
<asp:Label ID="txtTamanioTOOL" 
        Text="Ingrese el tamaño en BYTES maximo a particionar la base de datos" 
        runat="server" meta:resourcekey="txtTamanioTOOLResource1" ></asp:Label>
<asp:Label ID="btnBackUpTOOL" 
        Text="Realiza el back up de la BD particionandola en la cantidad volumenes" 
        runat="server" meta:resourcekey="btnBackUpTOOLResource1" ></asp:Label>

<!-- Mensajes -->
<asp:Label ID="msgError" Text="Se ha producido un error"  runat="server" 
        meta:resourcekey="msgErrorResource1"  ></asp:Label>
<asp:Label ID="msgProcesando" Text="Aguarde un instante!!!"  runat="server" 
        meta:resourcekey="msgProcesandoResource1"  ></asp:Label>
<asp:Label ID="msgErrorTamanio" Text="Debe ingresar el tamaño máximo del back-up"  
        runat="server" meta:resourcekey="msgErrorTamanioResource1"  ></asp:Label>

        

<!-- Ayuda -->



    <asp:Label ID="jsGridLibrary" Text="../script/jquery.jqGrid-4.4.1/src/i18n/grid.locale-es.js"  runat="server" meta:resourcekey="jsGridLibraryResource" ></asp:Label>

    <asp:Label ID="help_dialog"  runat="server" 
        meta:resourcekey="help_dialogResource1" ></asp:Label>
    <asp:Label ID="help_dialog_TOOL" 
        Text="Cuadro de ayuda para el Back up de la Base de datos"  runat="server" 
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
                    <td colspan="2" align="left">
                        <table><tr><td><div id="jqlblTamanioBD"></div></td><td><b><div id="jqlblsizeBD"></div></b></td><td><b> Bytes</b></td></tr></table>                        
                    </td>
                    <td colspan="3" align="right">
                        <table><tr><td><div id="jqlblvol"></div></td><td><b><div id="jqlblvolumentes"></div></b></td></tr></table>                        
                    </td>
                </tr>
                <tr>
                    <td>
                        <div id="jqlblTamanio"></div>
                    </td>
                    <td>
                        <input type="text" id="jqTxtTamanio" size="20px" maxlength="20" style="text-transform: uppercase;"/>
                    </td>
                    <td>
                        <div id="jqBtnBackUp"></div>
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
            var _tamanio = 0;
            var _tamanioBD = 0;
            var _registrosBackUp;
            var _volumenes = 1;

            $("#jqLegendTitle").html($('#<%= legendTitle.ClientID %>').text());
            $("#jqlblTamanio").html($('#<%= lblTamanio.ClientID %>').text());
            $("#jqlblTamanioBD").html($('#<%= lblTamanioBD.ClientID %>').text());
            $("#jqlblvol").html($('#<%= lblvol.ClientID %>').text());
            $("#jqlblvolumentes").html(_volumenes);

            $("#jqTxtTamanio").addClass("ui-state-default ui-combobox-input ui-corner-all");

            $("#jqBtnBackUp").button({
                icons: {
                    primary: "ui-icon-disk"
                },
                label: $('#<%= btnBackUp.ClientID %>').text()
            });
            $("#jqBtnBackUp").click(function () {
                realizarBackUp();
            });

            _tamanoCombo = [{ "id": "1", "tipo": "Disco 5 1/4", "image": "514.JPG", "capacidad": "360 KB", "capacidadBytes": "368640" },
            { "id": "2", "tipo": "Disco 3 1/2", "image": "floppy.png", "capacidad": "1,44 MB ", "capacidadBytes": "1509950" },
            { "id": "3", "tipo": "ZIP", "image": "ZIP.png", "capacidad": "100 MB", "capacidadBytes": "104857600" },
            { "id": "4", "tipo": "CD Writer", "image": "cd_rw.png", "capacidad": "700 MB", "capacidadBytes": "734003200" },
            { "id": "5", "tipo": "Memory Card", "image": "Memory.png", "capacidad": "4 GB", "capacidadBytes": "4294967296" },
            { "id": "6", "tipo": "DVD Writer", "image": "dvd_r.png", "capacidad": "4,7 GB", "capacidadBytes": "5046586573" },
            { "id": "7", "tipo": "Pen Drive", "image": "USB.png", "capacidad": "8 GB", "capacidadBytes": "8589934592" },
            { "id": "8", "tipo": "Disco Rigido", "image": "Hard_Disck.png", "capacidad": "500 GB", "capacidadBytes": "536870912000" }
            ];
            $("#jqTxtTamanio").ZaeAutocomplete(_tamanoCombo, {
                minChars: 0,
                width: 200,
                matchContains: true,
                autoFill: false,
                formatItem: function (row, i, max) {
                    return "<img src='../images/capacity/" + row.image + "'  width='24' height='24' /> " + row.tipo + " - " + row.capacidad;
                },
                formatMatch: function (row, i, max) {
                    return row.tipo;
                },
                formatResult: function (row) {
                    return row.capacidadBytes;
                }
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
                        { name: 'cantidadVolumen', index: 'cntidadVolumen', width: 150, align: "right", sorttype: "int" }
                    ],
                    rowNum: 10,
                    rowList: [10, 20, 30],
                    pager: '#gridPagerBackUp',
                    sortname: 'nombreBackUp',
                    viewrecords: true,
                    altRows: true,
                    sortorder: "desc",
                    caption: $('#<%= backUps.ClientID %>').text(),
                    height: "100%"
                });
            };
            $('#jqTxtTamanio').keyup(function () {
                if ($('#jqTxtTamanio').val() != '') {
                    $('#jqTxtTamanio').val($('#jqTxtTamanio').val().replace(/[^0-9\.]/g, ''));
                }
                calcularVolumenes();
            });

            function replaceAll(text, busca, reemplaza) {
                while (text.toString().indexOf(busca) != -1)
                    text = text.toString().replace(busca, reemplaza);
                return text;
            }
            function calcularVolumenes() {
                tam = replaceAll($('#jqTxtTamanio').val(), ".", "");
                tam = Number(tam);
                _tamanioBD = Number(_tamanioBD);
                if (tam == "" || tam < 1) {
                    _volumenes = 1;
                } else {
                    if (tam < _tamanioBD) {
                        _volumenes = Math.ceil(_tamanioBD / tam);
                    } else {
                        _volumenes = 1;
                    }
                }
                $("#jqlblvolumentes").html(_volumenes);
            };

            function realizarBackUp() {
                $.ajax({
                    type: "post",
                    url: "/Website/WebServices/BackUp.asmx/hacerBackUp",
                    data: JSON.stringify({ vol: _volumenes }),
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    beforeSend: function () {
                        jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                    },
                    success: function (result) {
                        $.alerts._hide();
                        jInfo('back Up ok');
                        traerBackUps();
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        $.alerts._hide();
                        jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
                        traerBackUps();
                    }
                });

            };
            function convertMillar(tamanio) {
                var number = new String(tamanio);
                var result = '';
                while (number.length > 3) {
                    result = '.' + number.substr(number.length - 3) + result;
                    number = number.substring(0, number.length - 3);
                }
                result = number + result;
                return result;
            };

            function mostrarTamanio() {
                $.ajax({
                    type: "post",
                    url: "/Website/WebServices/BackUp.asmx/obtenerTamanio",
                    data: JSON.stringify(),
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    beforeSend: function () {
                        jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                    },
                    success: function (result) {
                        $.alerts._hide();
                        _tamanioBD = result.d;
                        $("#jqlblsizeBD").html(convertMillar(_tamanioBD));

                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        $.alerts._hide();
                        jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
                        traerBackUps();
                    }
                });
            };
            mostrarTamanio();

            $("#tblBackUp").tooltip({
                bodyHandler: function () {
                    return $('#<%= gridBackUpsTOOL.ClientID %>').text();
                },
                showURL: false
            });
            $("#jqTxtTamanio").tooltip({
                bodyHandler: function () {
                    return $('#<%= txtTamanioTOOL.ClientID %>').text();
                },
                showURL: false
            });
            $("#jqBtnBackUp").tooltip({
                bodyHandler: function () {
                    return $('#<%= btnBackUpTOOL.ClientID %>').text();
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