<%@ Page Language="C#" MasterPageFile="~/MasterPages/BackEnd.master" AutoEventWireup="true" CodeFile="AdminServicios.aspx.cs" Inherits="_Default" title="Home" culture="auto" meta:resourcekey="PageResource1" uiculture="auto"%>
<%@ MasterType VirtualPath="~/MasterPages/BackEnd.master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" Runat="Server">
<!-- Componentes -->
<div id="idioma" style="display:none;">

<asp:Label ID="legendTitle" Text="Administración de servicios:" runat="server" 
        meta:resourcekey="legendTitleResource1" ></asp:Label>
<asp:Label ID="lblDescripcion" Text="Servicio:" runat="server" 
        meta:resourcekey="lblDescripcionResource1" ></asp:Label>
<asp:Label ID="lblCosto" Text="Costo:" runat="server" 
        meta:resourcekey="lblCostoResource1" ></asp:Label>
<asp:Label ID="gridServicios" Text="Servicios" runat="server" 
        meta:resourcekey="gridServiciosResource1" ></asp:Label>
<asp:Label ID="gridDescripcion" Text="Descripción del servicio" runat="server" 
        meta:resourcekey="gridDescripcionResource1" ></asp:Label>

<asp:Label ID="gridCosto" Text="Costo" runat="server" 
        meta:resourcekey="gridCostoResource1" ></asp:Label>
<asp:Label ID="btnBajaServicio" Text="Baja del servicio" runat="server" 
        meta:resourcekey="btnBajaServicioResource1" ></asp:Label>
<asp:Label ID="btnModiServicio" Text="Modificación del servicio" runat="server" 
        meta:resourcekey="btnModiServicioResource1" ></asp:Label>
<asp:Label ID="btnAltaServicio" Text="Alta de servicio" runat="server" 
        meta:resourcekey="btnAltaServicioResource1" ></asp:Label>

         
<!-- Tooltips --> 
<asp:Label ID="gridServicioTOOL" 
        Text="Grilla que muestra todos los servicios disponibles" runat="server" 
        meta:resourcekey="gridServicioTOOLResource1" ></asp:Label>
<asp:Label ID="jqTxtDescripcionTOOL" 
        Text="Descripción del servicio, detalla que es lo que hace el servicio" 
        runat="server" meta:resourcekey="jqTxtDescripcionTOOLResource1" ></asp:Label>
<asp:Label ID="jqTxtCostoTOOL" 
        Text="Costo del servicio, detalla el valor del servicio" runat="server" 
        meta:resourcekey="jqTxtCostoTOOLResource1" ></asp:Label>
<asp:Label ID="jbBtnAltaServicioTOOL" Text="Da de alta un nuevo servicio" 
        runat="server" meta:resourcekey="jbBtnAltaServicioTOOLResource1" ></asp:Label>
<asp:Label ID="jbBtnModiServicioTOOL" 
        Text="Modifica un servicio seleccionado de la grilla servicios" runat="server" 
        meta:resourcekey="jbBtnModiServicioTOOLResource1" ></asp:Label>
<asp:Label ID="jbBtnBajaServicioTOOL" 
        Text="Da de baja un servicio seleccionado de la grilla servicios" 
        runat="server" meta:resourcekey="jbBtnBajaServicioTOOLResource1" ></asp:Label>

<!-- Mensajes -->

<asp:Label ID="msgProcesando" Text="Aguarde un instante!!!"  runat="server" 
        meta:resourcekey="msgProcesandoResource1" ></asp:Label>
<asp:Label ID="msgError" Text="Se ha producido un error"  runat="server" 
        meta:resourcekey="msgErrorResource1" ></asp:Label>
<asp:Label ID="msgEselServicio" Text="Debe seleccionar un servicio de la grilla"  
        runat="server" meta:resourcekey="msgEselServicioResource1" ></asp:Label>
<asp:Label ID="msgEingDescripcion" 
        Text="Debe ingresar una descripción al servicio"  runat="server" 
        meta:resourcekey="msgEingDescripcionResource1" ></asp:Label>
<asp:Label ID="msgEingCosto" Text="Debe ingresar un costo al servicio"  
        runat="server" meta:resourcekey="msgEingCostoResource1" ></asp:Label>
<asp:Label ID="msgEingCostoValido" 
        Text="Debe ingresar un costo VÁLIDO (solo números)"  runat="server" 
        meta:resourcekey="msgEingCostoValidoResource1" ></asp:Label>
<asp:Label ID="msgEbloqueadoServicio" 
        Text="El permiso se encuentra bloqueado para dar de baja"  runat="server" 
        meta:resourcekey="msgEbloqueadoServicioResource1" ></asp:Label>

           

<!-- Ayuda -->

    <asp:Label ID="jsGridLibrary" 
        Text="../script/jquery.jqGrid-4.4.1/src/i18n/grid.locale-es.js"  runat="server" 
        meta:resourcekey="jsGridLibraryResource1"></asp:Label>



    <asp:Label ID="help_dialog"  runat="server" 
        meta:resourcekey="help_dialogResource1"></asp:Label>
    <asp:Label ID="help_dialog_TOOL" 
            Text="Cuadro de ayuda de administración de servcicios"  runat="server" 
        meta:resourcekey="help_dialog_TOOLResource1" ></asp:Label>
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



<table  align="left" >
    <tr>
        <td width="650px">
            <fieldset class="ui-corner-all">
                <legend class="ui-widget ui-state-default ui-corner-all ui-button-text" style="text-align: left;" id="jqLegendTitle"></legend>
                <table  align="left" width="100%">
                    <tr>
                        <td colspan="4" align="center">
                            <table id="tblServicios">
                                <tr>
                                    <td/>
                                </tr>
                            </table>
                            <div id="gridPagerServicios"></div>​
                        </td>
                    </tr>
                
                    <tr>
                        <td>
                            <div id="jqLblDescripcion"></div>
                        </td>  
                        <td>
                            <input type="text" id="jqTxtDescripcion" size="40px" maxlength="100"  style="text-transform: uppercase;"/>
                        </td> 
                        <td>
                            <div id="jqLblCosto"></div>
                        </td>  
                        <td>
                            <input type="text" id="jqTxtCosto" size="10px" maxlength="20"  style="text-transform: uppercase; text-align:right;"/>
                        </td>     
                    </tr>
                    <tr>
                        <td colspan="4" align="center">
                            <table  width="100%">
                                <tr>
                                    <td align="center">
                                        <div id="jbBtnAltaServicio" style="width:100%"/>
                                    </td> 
                                    <td align="center">
                                        <div id="jbBtnModiServicio"  style="width:100%"/>
                                    </td> 
                                    <td align="center">
                                        <div id="jbBtnBajaServicio"  style="width:100%"/>
                                    </td> 
                                </tr>
                            </table>
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
    var _servicios = [];
    var _idServiciosSeleccionado = "";
    $("#jqLegendTitle").html($('#<%= legendTitle.ClientID %>').text());
    $("#jqLblDescripcion").html($('#<%= lblDescripcion.ClientID %>').text());
    $("#jqLblCosto").html($('#<%= lblCosto.ClientID %>').text());
    $("#jqTxtDescripcion").addClass("ui-state-default ui-combobox-input ui-corner-all");
    $("#jqTxtCosto").addClass("ui-state-default ui-combobox-input ui-corner-all");

    function buscarServicios() {
        _idServiciosSeleccionado="";
        $("#jqTxtDescripcion").val("");
        $("#jqTxtCosto").val("");
        $.ajax({
            type: "post",
            url: "/Website/WebServices/AdminServicios.asmx/getServicios",
            data: JSON.stringify({}),
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            beforeSend: function () {
                jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
            },
            success: function (result) {
                $.alerts._hide();
                _servicios = result.d;

                console.dir(_servicios);
                cargarServicios();
            },
            error: function (xhr, ajaxOptions, thrownError) {
                $.alerts._hide();
                jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
            }
        });
    };

    function cargarServicios() {
        $("#tblServicios").jqGrid('GridUnload');
        $("#tblServicios").jqGrid({
            datatype: "local",
            data: _servicios,
            colNames: ['Id', '<span class="ui-icon ui-icon-locked" style="float: left; margin-right: .3em;"></span>', $('#<%= gridDescripcion.ClientID %>').text(), $('#<%= gridCosto.ClientID %>').text()],
            colModel: [
                        { name: 'id', key: true, index: 'id', width: 30, sorttype: "int", align: "right" },
                        { name: 'esFijo', index: 'esFijo', width: 25, formatter: bolqueadoFormatter },
                        { name: 'descripcion', index: 'descripcion', width: 300 },
                        { name: 'costoBase', index: 'costoBase', width: 120, align: 'right', formatter: 'currency', formatoptions: { decimalSeparator: ",", thousandsSeparator: ".", decimalPlaces: 2, prefix: "$ "} }
                    ],
            rowNum: 10,
            rowList: [10, 20, 30],
            pager: '#gridPagerServicios',
            sortname: 'id',
            viewrecords: true,
            altRows: true,
            sortorder: "desc",
            caption: $('#<%= gridServicios.ClientID %>').text(),
            height: "100%",
            width: "100%",
            onSelectRow: function (id) {
                seleccionarServicio(id);
            }
        });
        $("#tblServicios").tooltip({
            bodyHandler: function () {
                return $('#<%= gridServicioTOOL.ClientID %>').text();
            },
            top: -15,
            left: 5,
            showURL: false
        });
    };
    
    function bolqueadoFormatter(cellvalue, options, rowObject) {
        console.log(cellvalue);
        if (cellvalue == "1") {
            return "<span class='ui-icon ui-icon-circle-check'></span>";
        } else {
            return "<span class='ui-icon ui-icon-circle-close'></span>";
        }
    };
    function seleccionarServicio(id) {
        for (z = 0; z < _servicios.length; z++) {
            if (_servicios[z].id == id) {
                _idServiciosSeleccionado = id;
                $("#jqTxtDescripcion").val(_servicios[z].descripcion);
                $("#jqTxtCosto").val(_servicios[z].costoBase);
                if(_servicios[z].esFijo == "1"){
                    $("#jqTxtDescripcion").prop("readonly",true);
                }else{
                    $("#jqTxtDescripcion").prop("readonly",false);
                }
            }
        };
    };
    
    function validarServicioSelect() {
        if (_idServiciosSeleccionado == "") {
            jError($('#<%= msgEselServicio.ClientID %>').text());
            return false;
        }
        return true;
    };
    function validarServicioBloqueado() {
        if ($("#jqTxtDescripcion").prop("readonly")) {
            jError($('#<%= msgEbloqueadoServicio.ClientID %>').text());
            return false;
        }
        return true;
    };
    function validarDescripcionServcicio() {
        if ($.trim($('#jqTxtDescripcion').val()) == "") {
            jError($('#<%= msgEingDescripcion.ClientID %>').text());
            return false;  
        }
        return true;
    };
    function validarCostoServcicio() {
        if ($.trim($('#jqTxtCosto').val()) == "") {
            jError($('#<%= msgEingCosto.ClientID %>').text());
            return false;
        }
        if (isNaN($.trim($('#jqTxtCosto').val()))) {
            jError($('#<%= msgEingCostoValido.ClientID %>').text());
            return false;
        }
        return true;
    };

    $("#jbBtnAltaServicio").button({
        icons: {
            primary: "ui-icon-plus"
        },
        label: $('#<%= btnAltaServicio.ClientID %>').text()
    });
    $("#jbBtnAltaServicio").click(function () {
        if (validarDescripcionServcicio() && validarCostoServcicio()) {
            altaServicio();
        }
    });
    $("#jbBtnModiServicio").button({
        icons: {
            primary: "ui-icon-pencil"
        },
        label: $('#<%= btnModiServicio.ClientID %>').text()
    });
    $("#jbBtnModiServicio").click(function () {
        if (validarServicioSelect() && validarDescripcionServcicio() && validarCostoServcicio()) {
            modiServicio();
        }
    });

    $("#jbBtnBajaServicio").button({
        icons: {
            primary: "ui-icon-minus"
        },
        label: $('#<%= btnBajaServicio.ClientID %>').text()
    });
    $("#jbBtnBajaServicio").click(function () {
        if (validarServicioSelect() && validarServicioBloqueado()) {
            bajaServicio();
        }
    });

    function altaServicio() {
        $.ajax({
            type: "post",
            url: "/Website/WebServices/AdminServicios.asmx/altaServicio",
            contentType: "application/json;charset=utf-8",
            data: JSON.stringify({ 
                descServicio: $.trim($('#jqTxtDescripcion').val().toUpperCase()),
                costo: $.trim($('#jqTxtCosto').val().toUpperCase()),
            }),
            dataType: "json",
            beforeSend: function () {
                jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
            },
            success: function (result) {
                $.alerts._hide();
                buscarServicios()
            },
            error: function (xhr, ajaxOptions, thrownError) {
                $.alerts._hide();
                jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
            }
        });
    };
    function modiServicio() {
        $.ajax({
            type: "post",
            url: "/Website/WebServices/AdminServicios.asmx/modiServicio",
            contentType: "application/json;charset=utf-8",
            data: JSON.stringify({ 
                idServicio: _idServiciosSeleccionado,
                descServicio: $.trim($('#jqTxtDescripcion').val().toUpperCase()),
                costo: $.trim($('#jqTxtCosto').val().toUpperCase()),
            }),
            dataType: "json",
            beforeSend: function () {
                jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
            },
            success: function (result) {
                $.alerts._hide();
                buscarServicios()
            },
            error: function (xhr, ajaxOptions, thrownError) {
                $.alerts._hide();
                jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
            }
        });
    };
    function bajaServicio() {
        $.ajax({
            type: "post",
            url: "/Website/WebServices/AdminServicios.asmx/bajaServicio",
            contentType: "application/json;charset=utf-8",
            data: JSON.stringify({ 
                idServicio: _idServiciosSeleccionado
            }),
            dataType: "json",
            beforeSend: function () {
                jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
            },
            success: function (result) {
                $.alerts._hide();
                buscarServicios()
            },
            error: function (xhr, ajaxOptions, thrownError) {
                $.alerts._hide();
                jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
            }
        });


    };





    // ToolTips

    $("#jqTxtDescripcion").tooltip({
        bodyHandler: function () {
            return $('#<%= jqTxtDescripcionTOOL.ClientID %>').text();
        },
        showURL: false
    });
    $("#jqTxtCosto").tooltip({
        bodyHandler: function () {
            return $('#<%= jqTxtCostoTOOL.ClientID %>').text();
        },
        showURL: false
    });


    $("#jbBtnAltaServicio").tooltip({
        bodyHandler: function () {
            return $('#<%= jbBtnAltaServicioTOOL.ClientID %>').text();
        },
        showURL: false
    });



    $("#jbBtnModiServicio").tooltip({
        bodyHandler: function () {
            return $('#<%= jbBtnModiServicioTOOL.ClientID %>').text();
        },
        showURL: false
    });
    $("#jbBtnBajaServicio").tooltip({
        bodyHandler: function () {
            return $('#<%= jbBtnBajaServicioTOOL.ClientID %>').text();
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
    
        $.getScript($('#<%= jsGridLibrary.ClientID %>').text(), function () {
            buscarServicios();
        });




    //]]>
    </script>
</asp:Content>
