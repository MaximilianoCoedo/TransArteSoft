<%@ Page Language="C#" MasterPageFile="~/MasterPages/BackEnd.master" AutoEventWireup="true" CodeFile="Vehiculos.aspx.cs" Inherits="_Default" title="Home" culture="auto" meta:resourcekey="PageResource1" uiculture="auto"%>
<%@ MasterType VirtualPath="~/MasterPages/BackEnd.master"%>





<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" Runat="Server">
<!-- Componentes -->
<div id="idioma" style="display:none;">

<asp:Label ID="legendTitle" Text="Administración de vehículos:" runat="server" ></asp:Label>

<asp:Label ID="lblPatente" Text="Patente:" runat="server" ></asp:Label>
<asp:Label ID="lblDescripcion" Text="Descripción:" runat="server" ></asp:Label>
<asp:Label ID="lblModelo" Text="Modelo:" runat="server" ></asp:Label>
<asp:Label ID="lblAutonomia" Text="Autonomía:" runat="server" ></asp:Label>
<asp:Label ID="lblTara" Text="Tara:" runat="server" ></asp:Label>
<asp:Label ID="lblKilometraje" Text="Kilometraje:" runat="server" ></asp:Label>
<asp:Label ID="lblCargaALto" Text="Alto carga:" runat="server" ></asp:Label>
<asp:Label ID="lblCargaAncho" Text="Ancho carga:" runat="server" ></asp:Label>
<asp:Label ID="lblCargaLargo" Text="Largo carga:" runat="server" ></asp:Label>

<asp:Label ID="btnAltaVehiculo" Text="Alta de vehículo" runat="server" ></asp:Label>
<asp:Label ID="btnModiVehiculo" Text="Modificar el vehículo" runat="server" ></asp:Label>
<asp:Label ID="btnBajaVehiculo" Text="Baja de vehículo" runat="server" ></asp:Label>
<asp:Label ID="gridVehiculos" Text="Vehículos" runat="server" ></asp:Label>



    
    
<asp:Label ID="legendTitleMantenimiento" Text="Administración de mantenimientos:" runat="server" ></asp:Label>
<asp:Label ID="gridMantenimientos" Text="Mantenimientos" runat="server" ></asp:Label>
<asp:Label ID="lblDescripcionMant" Text="Descripción:" runat="server" ></asp:Label>
<asp:Label ID="lblKilometrosMant" Text="Kilometros" runat="server" ></asp:Label>
<asp:Label ID="lblFechaMant" Text="Fecha:" runat="server" ></asp:Label>

        
<asp:Label ID="btnAltaMantenimiento" Text="Alta de mantenimiento" runat="server" ></asp:Label>
<asp:Label ID="btnModiMantenimiento" Text="Modificar el mantenimiento" runat="server" ></asp:Label>
<asp:Label ID="btnBajaMantenimiento" Text="Baja de mantenimiento" runat="server" ></asp:Label>
        


<!-- Tooltips --> 

<asp:Label ID="gridVehiculosTOOL" Text="Esta grilla muestra todos los vehículos con los que cuenta la empresa para realizar los servicios" runat="server" ></asp:Label>
<asp:Label ID="gridMantenimientosTOOL" Text="Esta grilla muestra el mantenimiento del vehículo seleccionado" runat="server" ></asp:Label>
<!-- Mensajes -->



<asp:Label ID="msgProcesando" Text="Aguarde un instante!!!"  runat="server"  ></asp:Label>
<asp:Label ID="msgError" Text="Se ha producido un error"  runat="server" ></asp:Label>




<!-- Ayuda -->


    <asp:Label ID="jsGridLibrary" Text="../script/jquery.jqGrid-4.4.1/src/i18n/grid.locale-es.js"  runat="server"></asp:Label>

    <asp:Label ID="help_dialog" Text=""  runat="server" meta:resourcekey="help_dialogResource1" ></asp:Label>
    <asp:Label ID="help_dialog_TOOL" 
            Text="Cuadro de ayuda de administración de servcicios"  runat="server" 
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
        <fieldset class="ui-corner-all">
            <legend class="ui-widget ui-state-default ui-corner-all ui-button-text" style="text-align: left;" id="jqLegendTitle"></legend>
             <table  align="left" width="100%">
                <tr>
                    <td colspan="6" align="center">
                        <table id="tblVehiculos">
                            <tr>
                                <td/>
                            </tr>
                        </table>
                        <div id="gridPagerVehiculos"></div>​
                    </td>
                </tr>    
                <tr>
                    <td>
                        <div id="jqLblPatente"></div>
                    </td>
                    <td align="right">
                        <input type="text" id="jqTxtPatente" size="10px" maxlength="10" style="text-transform: uppercase; text-align:right;"/>
                    </td>    
                    <td>
                        <div id="jqLblDescripcion"></div>
                    </td>
                    <td align="left">
                        <input type="text" id="jqTxtDescripcion" size="40px" maxlength="100" style="text-transform: uppercase;"/>
                    </td>    
                    <td>
                        <div id="jqLblModelo"></div>
                    </td>
                    <td align="left">
                        <input type="text" id="jqTxtModelo" size="10px" maxlength="10" style="text-transform: uppercase; height: 13pt;"/>
                    </td>   
                </tr>
                <tr>
                    <td>
                        <div id="jqLblAutonomia"></div>
                    </td>
                    <td align="right">
                        <input type="text" id="jqTxtAutonomia" size="10px" maxlength="10" style="text-transform: uppercase; text-align:right;"/>
                    </td>    
                    <td>
                        <div id="jqLblTara"></div>
                    </td>
                    <td align="left">
                        <input type="text" id="jqTxtTara" size="10px" maxlength="100" style="text-transform: uppercase; text-align:right;"/>
                    </td>    
                    <td>
                        <div id="jqLblKilometraje"></div>
                    </td>
                    <td align="left">
                        <input type="text" id="jqTxtKilometraje" size="10px" maxlength="10" style="text-transform: uppercase; text-align:right;"/>
                    </td>   
                </tr>
                <tr>
                    <td>
                        <div id="jqLblCargaALto"></div>
                    </td>
                    <td align="right">
                        <input type="text" id="jqTxtCargaALto" size="10px" maxlength="10" style="text-transform: uppercase; text-align:right;"/>
                    </td>    
                    <td>
                        <div id="jqLblCargaAncho" style="width:100%;"></div>
                    </td>
                    <td align="left">
                        <input type="text" id="jqTxtCargaAncho" size="10px" maxlength="100" style="text-transform: uppercase; text-align:right;"/>
                    </td>    
                    <td>
                        <div id="jqLblCargaLargo"></div>
                    </td>
                    <td align="left">
                        <input type="text" id="jqTxtCargaLargo" size="10px" maxlength="10" style="text-transform: uppercase; text-align:right;"/>
                    </td>   
                </tr>
                <tr>                 
                    <td align="center" colspan="2">
                        <div id="jbBtnAltaVehiculo" style="width:80%"/>
                    </td> 
                 
                    <td align="center" colspan="2">
                        <div id="jbBtnModiVehiculo" style="width:50%"/>
                    </td> 
                 
                    <td align="center" colspan="2">
                        <div id="jbBtnBajaVehiculo" style="width:80%"/>
                    </td> 
                </tr>
                <tr>
                    <td colspan="6">
                        <fieldset class="ui-corner-all">
                            <legend class="ui-widget ui-state-default ui-corner-all ui-button-text" style="text-align: left;" id="jqLegendTitleMantenimiento"></legend>
                             <table  align="left" width="100%">
                                <tr>
                                    <td colspan="6" align="center">
                                        <table id="tblMantenimiento">
                                            <tr>
                                                <td/>
                                            </tr>
                                        </table>
                                        <div id="gridPagerMantenimiento"></div>​
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div id="jqLblDescripcionMant"></div>
                                    </td>
                                    <td align="left">
                                        <input type="text" id="jqTxtDescripcionMant" size="20px" maxlength="100" style="text-transform: uppercase;"/>
                                    </td>    
                                    <td>
                                        <div id="jqLblKilometrosMant" style="width:100%;"></div>
                                    </td>
                                    <td align="left">
                                        <input type="text" id="jqTxtKilometrosMant" size="10px" maxlength="10" style="text-transform: uppercase; text-align:right;"/>
                                    </td>    
                                    <td>
                                        <div id="jqLblFechaMant"></div>
                                    </td>
                                    <td align="left">
                                        <input type="text" id="jqTxtFechaMant" size="10px" maxlength="11" style="text-transform: uppercase; text-align:right; "/>
                                    </td>   
                                </tr>
                                <tr>                 
                                    <td align="center" colspan="2">
                                        <div id="jbBtnAltaMantenimiento" style="width:80%"/>
                                    </td> 
                 
                                    <td align="center" colspan="2">
                                        <div id="jbBtnModiMantenimiento" style="width:80%"/>
                                    </td> 
                 
                                    <td align="center" colspan="2">
                                        <div id="jbBtnBajaMantenimiento" style="width:80%"/>
                                    </td> 
                                </tr>
                            </table>
                        </fieldset>
                    </td> 
                </tr>
            </table>
        </fieldset>
    </td>
</tr>
</table>

<script type="text/javascript">
//<![CDATA[
    // variables locales

    $("#jqLegendTitle").html($('#<%= legendTitle.ClientID %>').text());

    var _vehiculos = [];
    var _idVehiculoSeleccionado;
        









    function buscarVehiculos() {
        _idVehiculoSeleccionado = 0;
        $("#jqTxtPatente").val("");
        $("#jqTxtDescripcion").val("");
        $("#jqTxtModelo").val("");
        $("#jqTxtAutonomia").val("");
        $("#jqTxtTara").val("");
        $("#jqTxtKilometraje").val("");
        $("#jqTxtCargaALto").val("");
        $("#jqTxtCargaAncho").val("");
        $("#jqTxtCargaLargo").val("");

        $.ajax({
            type: "post",
            url: "/Website/WebServices/Vehiculos.asmx/getVehiculos",
            data: JSON.stringify({}),
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            beforeSend: function () {
                jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
            },
            success: function (result) {
                $.alerts._hide();
                _vehiculos = result.d;
                console.dir(_vehiculos);
                cargarVehiculos();
            },
            error: function (xhr, ajaxOptions, thrownError) {
                $.alerts._hide();
                jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
            }
        });
    };

    function cargarVehiculos() {
        $("#tblVehiculos").jqGrid('GridUnload');
        $("#tblVehiculos").jqGrid({
            datatype: "local",
            data: _vehiculos,
            colNames: ['Id',
                    'Patente',
                    'Descripción',
                    'Modelo',
                    'Autonomía',
                    'Tara',
                    'Kilometraje',
                    'Carga Alto',
                    'Carga Ancho',
                    'Carga Largo',
                    'Volumen'
            ],
            colModel: [
                        { name: 'id', key: true, index: 'id', width: 30, sorttype: "int", align: "right" },
                        { name: 'patente', index: 'patente', width: 80, align: "center" },
                        { name: 'descripcion', index: 'descripcion', width: 200 },
                        { name: 'modelo', index: 'Anio', width: 80, align: "center" },
                        { name: 'autonomia', index: 'autonomia', width: 120, align: "right" },
                        { name: 'tara', index: 'tara', width: 80, align: "right" },
                        { name: 'kilometraje', index: 'kilometraje', width: 120, align: "right" },
                        { name: 'cargaAlto', index: 'cargaAlto', width: 80, align: "right" },
                        { name: 'cargaAncho', index: 'cargaAncho', width: 80, align: "right" },
                        { name: 'cargaLargo', index: 'cargaLargo', width: 80, align: "right" },
                        { name: 'volumen', index: 'volumen', width: 120, align: "right" }
                    ],
            rowNum: 5,
            rowList: [10, 20, 30],
            pager: '#gridPagerVehiculos',
            sortname: 'id',
            viewrecords: true,
            altRows: true,
            sortorder: "desc",
            caption: $('#<%= gridVehiculos.ClientID %>').text(),
            height: "100%",
            width: "750",
            shrinkToFit: false,
            onSelectRow: function (id) {
                _idVehiculoSeleccionado = id;
                buscarMantenimientos();
                seleccionarVehiculo();
            }
        });
        $("#tblVehiculos").tooltip({
            bodyHandler: function () {
                return $('#<%= gridVehiculosTOOL.ClientID %>').text();
            },
            top: -15,
            left: 5,
            showURL: false
        });
    };

    function seleccionarVehiculo() {
        for (z = 0; z < _vehiculos.length; z++) {
            if (_vehiculos[z].id == _idVehiculoSeleccionado) {
                $("#jqTxtDescripcion").val(_vehiculos[z].descripcion);
                $("#jqTxtAutonomia").val(_vehiculos[z].autonomia);
                $("#jqTxtCargaALto").val(_vehiculos[z].cargaAlto);
                $("#jqTxtCargaAncho").val(_vehiculos[z].cargaAncho);
                $("#jqTxtCargaLargo").val(_vehiculos[z].cargaLargo);
                $("#jqTxtKilometraje").val(_vehiculos[z].kilometraje);
                $("#jqTxtModelo").val(_vehiculos[z].modelo);
                $("#jqTxtPatente").val(_vehiculos[z].patente);
                $("#jqTxtTara").val(_vehiculos[z].tara);
            }
        };
    };
    


    $("#jqLblPatente").html($('#<%= lblPatente.ClientID %>').text());
    $("#jqTxtPatente").addClass("ui-state-default ui-combobox-input ui-corner-all");
    $("#jqLblDescripcion").html($('#<%= lblDescripcion.ClientID %>').text());
    $("#jqTxtDescripcion").addClass("ui-state-default ui-combobox-input ui-corner-all");
    $("#jqLblModelo").html($('#<%= lblModelo.ClientID %>').text());
    $("#jqTxtModelo").addClass("ui-state-default ui-combobox-input ui-corner-left");
    $('#jqTxtModelo').spinner({ min: 1980, max: 2013 });


    $("#jqLblAutonomia").html($('#<%= lblAutonomia.ClientID %>').text());
    $("#jqTxtAutonomia").addClass("ui-state-default ui-combobox-input ui-corner-all");
    $("#jqLblTara").html($('#<%= lblTara.ClientID %>').text());
    $("#jqTxtTara").addClass("ui-state-default ui-combobox-input ui-corner-all");
    $("#jqLblKilometraje").html($('#<%= lblKilometraje.ClientID %>').text());
    $("#jqTxtKilometraje").addClass("ui-state-default ui-combobox-input ui-corner-all");

    $("#jqLblCargaALto").html($('#<%= lblCargaALto.ClientID %>').text());
    $("#jqTxtCargaALto").addClass("ui-state-default ui-combobox-input ui-corner-all");
    $("#jqLblCargaAncho").html($('#<%= lblCargaAncho.ClientID %>').text());
    $("#jqTxtCargaAncho").addClass("ui-state-default ui-combobox-input ui-corner-all");
    $("#jqLblCargaLargo").html($('#<%= lblCargaLargo.ClientID %>').text());
    $("#jqTxtCargaLargo").addClass("ui-state-default ui-combobox-input ui-corner-all");




    
    $("#jbBtnAltaVehiculo").button({
        icons: {
            primary: "ui-icon-plus"
        },
        label: $('#<%= btnAltaVehiculo.ClientID %>').text()
    });
    $("#jbBtnAltaVehiculo").click(function () {
        //if (validarDescripcionServcicio() && validarCostoServcicio()) {
            altaVehiculo();
        //}
    });
    
    $("#jbBtnModiVehiculo").button({
        icons: {
            primary: "ui-icon-pencil"
        },
        label: $('#<%= btnModiVehiculo.ClientID %>').text()
    });
    $("#jbBtnModiVehiculo").click(function () {
        //if (validarServicioSelect() && validarDescripcionServcicio() && validarCostoServcicio()) {
            modiVehiculo();
        //}
    });

    $("#jbBtnBajaVehiculo").button({
        icons: {
            primary: "ui-icon-minus"
        },
        label: $('#<%= btnBajaVehiculo.ClientID %>').text()
    });
    $("#jbBtnBajaVehiculo").click(function () {
        //if (validarServicioSelect() && validarServicioBloqueado()) {
            bajaVehiculo();
        //}
    });

    
    function altaVehiculo() {
        $.ajax({
            type: "post",
            url: "/Website/WebServices/Vehiculos.asmx/altaVehiculo",
            contentType: "application/json;charset=utf-8",
            data: JSON.stringify({
                patente: $.trim($('#jqTxtPatente').val().toUpperCase()),
                descripcion: $.trim($('#jqTxtDescripcion').val().toUpperCase()),
                modelo: $.trim($('#jqTxtModelo').val().toUpperCase()),
                autonomia: $.trim($('#jqTxtAutonomia').val().toUpperCase()),
                tara: $.trim($('#jqTxtTara').val().toUpperCase()),
                kilometraje: $.trim($('#jqTxtKilometraje').val().toUpperCase()),
                cargaAlto: $.trim($('#jqTxtCargaALto').val().toUpperCase()),
                cargaAncho: $.trim($('#jqTxtCargaAncho').val().toUpperCase()),
                cargaLargo: $.trim($('#jqTxtCargaLargo').val().toUpperCase())
            }),
            dataType: "json",
            beforeSend: function () {
                jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
            },
            success: function (result) {
                $.alerts._hide();
                buscarVehiculos()
            },
            error: function (xhr, ajaxOptions, thrownError) {
                $.alerts._hide();
                jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
            }
        });
    };
    
    
    function modiVehiculo() {
        $.ajax({
            type: "post",
            url: "/Website/WebServices/Vehiculos.asmx/modiVehiculo",
            contentType: "application/json;charset=utf-8",
            data: JSON.stringify({
                idVehiculo: _idVehiculoSeleccionado,
                patente: $.trim($('#jqTxtPatente').val().toUpperCase()),
                descripcion: $.trim($('#jqTxtDescripcion').val().toUpperCase()),
                modelo: $.trim($('#jqTxtModelo').val().toUpperCase()),
                autonomia: $.trim($('#jqTxtAutonomia').val().toUpperCase()),
                tara: $.trim($('#jqTxtTara').val().toUpperCase()),
                kilometraje: $.trim($('#jqTxtKilometraje').val().toUpperCase()),
                cargaAlto: $.trim($('#jqTxtCargaALto').val().toUpperCase()),
                cargaAncho: $.trim($('#jqTxtCargaAncho').val().toUpperCase()),
                cargaLargo: $.trim($('#jqTxtCargaLargo').val().toUpperCase())
            }),
            dataType: "json",
            beforeSend: function () {
                jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
            },
            success: function (result) {
                $.alerts._hide();
                buscarVehiculos()
            },
            error: function (xhr, ajaxOptions, thrownError) {
                $.alerts._hide();
                jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
            }
        });
    };
    function bajaVehiculo() {
        $.ajax({
            type: "post",
            url: "/Website/WebServices/Vehiculos.asmx/bajaVehiculo",
            contentType: "application/json;charset=utf-8",
            data: JSON.stringify({ 
                idVehiculo: _idVehiculoSeleccionado
            }),
            dataType: "json",
            beforeSend: function () {
                jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
            },
            success: function (result) {
                $.alerts._hide();
                buscarVehiculos()
            },
            error: function (xhr, ajaxOptions, thrownError) {
                $.alerts._hide();
                jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
            }
        });
    };





    //----------------------start mantenimiento ------------------------------


    $("#jqLegendTitleMantenimiento").html($('#<%= legendTitleMantenimiento.ClientID %>').text());

    var _mantenimientos = [];
    var _idMantenimientoSeleccionado = "";

    function buscarMantenimientos() {
        _idMantenimientoSeleccionado = "";
        $("#jqTxtDescripcionMant").val("");
        $("#jqTxtKilometrosMant").val("");
        $("#jqTxtFechaMant").val("");
        $.ajax({
            type: "post",
            url: "/Website/WebServices/Vehiculos.asmx/getMantenimientos",
            data: JSON.stringify({
                idVehiculo: _idVehiculoSeleccionado
            }),
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            beforeSend: function () {
                jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
            },
            success: function (result) {
                $.alerts._hide();
                _mantenimientos = result.d;
                console.dir(_mantenimientos);
                cargarMantenimientos();
            },
            error: function (xhr, ajaxOptions, thrownError) {
                $.alerts._hide();
                jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
            }
        });
    };

    function cargarMantenimientos() {
        $("#tblMantenimiento").jqGrid('GridUnload');
        $("#tblMantenimiento").jqGrid({
            datatype: "local",
            data: _mantenimientos,
            colNames: ['Id',
                    'Descripción',
                    'Kilómetros',
                    'Prox. mantenimiento'
            ],
            colModel: [
                        { name: 'id', key: true, index: 'id', width: 35, sorttype: "int", align: "right" },
                        { name: 'descripcion', index: 'descripcion', width: 300},
                        { name: 'kilometros', index: 'kilometros', width: 120, align: "right" },
                        { name: 'fechaMantenimiento', index: 'fechaMantenimiento', width: 150, align: "center" }
                    ],
            rowNum: 5,
            rowList: [10, 20, 30],
            pager: '#gridPagerMantenimiento',
            sortname: 'id',
            viewrecords: true,
            altRows: true,
            sortorder: "desc",
            caption: $('#<%= gridMantenimientos.ClientID %>').text(),
            height: "100%",
            width: "100%",
            onSelectRow: function (id) {
                _idMantenimientoSeleccionado = id;
                seleccionarMantenimiento();
            }
        });
        $("#tblMantenimiento").tooltip({
            bodyHandler: function () {
                return $('#<%= gridMantenimientosTOOL.ClientID %>').text();
            },
            top: -15,
            left: 5,
            showURL: false
        });
    };

    function seleccionarMantenimiento() {
        for (z = 0; z < _mantenimientos.length; z++) {
            if (_mantenimientos[z].id == _idMantenimientoSeleccionado) {
                $("#jqTxtDescripcionMant").val(_mantenimientos[z].descripcion);
                $("#jqTxtKilometrosMant").val(_mantenimientos[z].kilometros);
                $("#jqTxtFechaMant").val(_mantenimientos[z].fechaMantenimiento);
            }
        };
    };

    
    $("#jqLblDescripcionMant").html($('#<%= lblDescripcionMant.ClientID %>').text());
    $("#jqTxtDescripcionMant").addClass("ui-state-default ui-combobox-input ui-corner-all");
    $("#jqLblKilometrosMant").html($('#<%= lblKilometrosMant.ClientID %>').text());
    $("#jqTxtKilometrosMant").addClass("ui-state-default ui-combobox-input ui-corner-all");
    $("#jqLblFechaMant").html($('#<%= lblFechaMant.ClientID %>').text());
    $("#jqTxtFechaMant").addClass("ui-state-default ui-combobox-input ui-corner-all");

    $("#jbBtnAltaMantenimiento").button({
        icons: {
            primary: "ui-icon-plus"
        },
        label: $('#<%= btnAltaMantenimiento.ClientID %>').text()
    });
    $("#jbBtnAltaMantenimiento").click(function () {
        //if (validarDescripcionServcicio() && validarCostoServcicio()) {
            altaMantenimiento();
            //}
    });

    $("#jbBtnModiMantenimiento").button({
        icons: {
            primary: "ui-icon-pencil"
        },
        label: $('#<%= btnModiMantenimiento.ClientID %>').text()
    });
    $("#jbBtnModiMantenimiento").click(function () {
        //if (validarServicioSelect() && validarDescripcionServcicio() && validarCostoServcicio()) {
        modiMantenimiento();
            //}
    });

    $("#jbBtnBajaMantenimiento").button({
        icons: {
            primary: "ui-icon-minus"
        },
        label: $('#<%= btnBajaMantenimiento.ClientID %>').text()
    });
    $("#jbBtnBajaMantenimiento").click(function () {
        //if (validarServicioSelect() && validarServicioBloqueado()) {
        bajaMantenimiento();
            //}
    });


    function altaMantenimiento() {
        $.ajax({
            type: "post",
            url: "/Website/WebServices/Vehiculos.asmx/altaMantenimiento",
            contentType: "application/json;charset=utf-8",
            data: JSON.stringify({
                idVehiculo: _idVehiculoSeleccionado,
                descripcion: $.trim($('#jqTxtDescripcionMant').val().toUpperCase()),
                kilometros: $.trim($('#jqTxtKilometrosMant').val().toUpperCase()),
                fechaMantenimiento: $.trim($('#jqTxtFechaMant').val().toUpperCase())
            }),
            dataType: "json",
            beforeSend: function () {
                jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
            },
            success: function (result) {
                $.alerts._hide();
                buscarMantenimientos()
            },
            error: function (xhr, ajaxOptions, thrownError) {
                $.alerts._hide();
                jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
            }
        });
    };


    function modiMantenimiento() {
        $.ajax({
            type: "post",
            url: "/Website/WebServices/Vehiculos.asmx/modiMantenimiento",
            contentType: "application/json;charset=utf-8",
            data: JSON.stringify({
                id:_idMantenimientoSeleccionado,
                idVehiculo: _idVehiculoSeleccionado,
                descripcion: $.trim($('#jqTxtDescripcionMant').val().toUpperCase()),
                kilometros: $.trim($('#jqTxtKilometrosMant').val().toUpperCase()),
                fechaMantenimiento: $.trim($('#jqTxtFechaMant').val().toUpperCase())
            }),
            dataType: "json",
            beforeSend: function () {
                jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
            },
            success: function (result) {
                $.alerts._hide();
                buscarMantenimientos()
            },
            error: function (xhr, ajaxOptions, thrownError) {
                $.alerts._hide();
                jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
            }
        });
    };
    function bajaMantenimiento() {
        $.ajax({
            type: "post",
            url: "/Website/WebServices/Vehiculos.asmx/bajaMantenimiento",
            contentType: "application/json;charset=utf-8",
            data: JSON.stringify({
                idMantenimiento: _idMantenimientoSeleccionado
            }),
            dataType: "json",
            beforeSend: function () {
                jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
            },
            success: function (result) {
                $.alerts._hide();
                buscarMantenimientos()
            },
            error: function (xhr, ajaxOptions, thrownError) {
                $.alerts._hide();
                jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
            }
        });
    };


    $.getScript($('#<%= jsGridLibrary.ClientID %>').text(), function () {
        buscarVehiculos();
        buscarMantenimientos();
    });



    //]]>
    </script>
    
</asp:Content>
