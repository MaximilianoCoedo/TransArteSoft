<%@ Page Language="C#" MasterPageFile="~/MasterPages/BackEnd.master" AutoEventWireup="true" CodeFile="SolicitudServicio.aspx.cs" Inherits="_Default" title="Home" culture="auto" meta:resourcekey="PageResource1" uiculture="auto"%>
<%@ MasterType VirtualPath="~/MasterPages/BackEnd.master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" Runat="Server">

<!-- Componentes -->
<div id="idioma" style="display:none;">

<asp:Label ID="legendTitle" Text="Solicitud de servicio:" runat="server"></asp:Label>
<asp:Label ID="legendDetalle" Text="Detalle del servicio:" runat="server"></asp:Label>
<asp:Label ID="legendConfirmarServicio" Text="Resumen del servicio:" runat="server"></asp:Label>

<asp:Label ID="lblFechaOrigen" Text="Fecha de salida:" runat="server"></asp:Label>
<asp:Label ID="lblHoraOrigen" Text="Hora de salida:" runat="server"></asp:Label>
<asp:Label ID="lblFechaDestino" Text="Fecha de entrega:" runat="server"></asp:Label>
<asp:Label ID="lblHoraDestino" Text="Hora de entrega:" runat="server"></asp:Label>
<asp:Label ID="lblDomicilioOrigen" Text="Domicilio de salida:" runat="server"></asp:Label>
<asp:Label ID="lblDomicilioDestino" Text="Domicilio de entrega:" runat="server"></asp:Label>


<asp:Label ID="lblNombre" Text="Nombre:" runat="server"></asp:Label>
<asp:Label ID="lblDescripcionObraArte" Text="Descripción de la obra de arte:" runat="server"></asp:Label>
<asp:Label ID="lblAncho" Text="Ancho (cm):" runat="server"></asp:Label>
<asp:Label ID="lblAlto" Text="Alto (cm):" runat="server"></asp:Label>
<asp:Label ID="lblLargo" Text="Largo (cm):" runat="server"></asp:Label>
<asp:Label ID="lblPeso" Text="Peso (kg):" runat="server"></asp:Label>
<asp:Label ID="lblValor" Text="Valor ($):" runat="server"></asp:Label>

<asp:Label ID="btnAltaObraArte" Text="Agregar obra de arte" runat="server"></asp:Label>
<asp:Label ID="btnModiObraArte" Text="Modificar obra de arte" runat="server"></asp:Label>
<asp:Label ID="btnBajaObraArte" Text="Eliminar obra de arte" runat="server"></asp:Label>

<asp:Label ID="gridObrasArte" Text="Obras de arte" runat="server"></asp:Label>
<asp:Label ID="gridObrasArteTOOL" Text="Esta grilla muestra todas las obras de arte que se van a transportar en el servicio" runat="server"></asp:Label>
<asp:Label ID="lblDescripcionServicio" Text="Descripción del servicio:" runat="server"></asp:Label>
<asp:Label ID="btnSolicitarPresupuesto" Text="Solicitar Presupuesto" runat="server"></asp:Label>
            
<asp:Label ID="gridServiciosExtras" Text="Servicios extras" runat="server"></asp:Label>
<asp:Label ID="gridServiciosExtrasTOOL" Text="Esta grilla muestra todos los Servicios extras que se pueden contratar ademas del servicio de translado" runat="server"></asp:Label>

<asp:Label ID="lblFormatoFechas" Text="dd/MM/yyyy" runat="server" ></asp:Label>
MM/dd/yyyy -- ingles
dd/MM/yyyy -- espanol

<asp:Label ID="lblregional" Text="es" runat="server" ></asp:Label>
en-GB -- ingles 
es    -- espanol

<!-- Tooltips -->



<!-- Mensajes -->
<asp:Label ID="msgError" Text="Se ha producido un error"  runat="server" 
        meta:resourcekey="msgErrorResource1" ></asp:Label>

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
                        <div id="jqLblFechaOrigen"></div>
                    </td>
                    <td align="right">
                        <input type="text" id="jqTxtFechaOrigen" size="14px" style="text-transform: uppercase;"/>
                    </td>     
                    <td>
                        <div style="width:80px" id="jqLblHoraOrigen"></div>
                    </td>
                    <td align="right">
                        <input type="text" id="jqTxtHoraOrigen" size="8px" style="text-transform: uppercase;"/>
                    </td>             

                    <td>
                        <div style="width:100px" id="jqLblFechaDestino"></div>
                    </td>
                    <td align="right">
                        <input type="text" id="jqTxtFechaDestino" size="14px" style="text-transform: uppercase;"/>
                    </td>      
                    <td>
                        <div style="width:100px" id="jqLblHoraDestino"></div>
                    </td>
                    <td align="right">
                        <input type="text" id="JqTxtHoraDestino" size="8px" style="text-transform: uppercase;"/>
                    </td>    
              </tr>
              <tr >                                
                    <td colspan="1">
                        <div style="width:100px" id="jqLblDomicilioOrigen"></div>
                    </td>
                    <td align="left" colspan="7">
                        <input type="text" id="jqTxtDomicilioOrigen" size="120px" maxlength="400" style="text-transform: uppercase;"/>
                    </td>   
              </tr>
              <tr>              
                    <td>
                        <div style="width:120px"  id="jqLblDomicilioDestino"></div>
                    </td>    
                    <td align="left" colspan="7">
                        <input type="text" id="jqTxtDomicilioDestino" size="120px" maxlength="400" style="text-transform: uppercase;"/>
                    </td>    
              </tr> 

              <tr>
                <td colspan="6" rowspan="2">
                    <div id="imgMapa" style="width: 100%; height: 300px"></div>
                </td>     
                <td colspan="2">
                    <table>
                        <tr>
                            <td style="width:200px; height:250px; overflow: scroll;">
                                <div id="my_textual_div" style="width: 190px; height: 250px"></div>
                            </td>     
                        </tr>
                        <tr>
                            <td style="width:200px;" align="center">
                                <div id="total"></div>
                            </td>     
                        </tr>
                    </table>
                </td>     
            </tr>
        </table>
        <fieldset  class="ui-corner-all">
            <legend class="ui-widget ui-state-default ui-corner-all ui-button-text" style="text-align: left;" id="jqLegendDetalle"></legend>
            <table  align="center" border="0">
                <tr>
                    <td>
                        <div id="jqLblNombre"></div>
                    </td>
                    <td align="left" >
                        <input type="text" id="jqTxtNombreObraArte"  size="14px" style="text-transform: uppercase;"/>
                    </td>     
                    <td colspan="2">
                        <div id="jqLblDescripcionObraArte"></div>
                    </td>
                    <td align="left" colspan="6">
                        <textarea id="jqTxtDescripcionObraArte" rows="3" cols="70" style="text-transform: uppercase;"></textarea>
                    </td>     
                </tr>
                <tr>
                    <td>
                        <div id="jqLblAncho"></div>
                    </td>
                    <td align="left">
                        <input type="text" id="jqTxtAncho"  size="14px" style="text-transform: uppercase;"/>
                    </td>     
                    <td>
                        <div id="jqLblAlto"></div>
                    </td>
                    <td align="left">
                        <input type="text" id="jqTxtAlto"  size="14px" style="text-transform: uppercase;"/>
                    </td>     
                    <td>
                        <div id="jqLblLargo"></div>
                    </td>
                    <td align="left">
                        <input type="text" id="jqTxtLargo"  size="14px" style="text-transform: uppercase;"/>
                    </td>     
                    <td>
                        <div id="jqLblPeso"></div>
                    </td>
                    <td align="left">
                        <input type="text" id="jqTxtPeso"  size="14px" style="text-transform: uppercase;"/>
                    </td>     
                    <td>
                        <div id="jqLblValor"></div>
                    </td>
                    <td align="left">
                        <input type="text" id="jqTxtValor"  size="14px"  style="text-transform: uppercase;"/>
                    </td>     
                </tr>
                <tr>
                    <td colspan="10" align="center">
                        <div id="jqBtnAltaObraArte"></div>
                        <div id="jqBtnModiObraArte"></div>
                        <div id="jqBtnBajaObraArte"></div>
                    </td>   
                </tr> 
                <tr>
                   <td colspan="10" align="center">
                        <table id="tblObrasArte">
                            <tr>
                                <td/>
                            </tr>
                        </table>
                        <div id="gridPagerObrasArte"></div>​
                    </td>
                </tr>
            </table>
        </fieldset>
        <fieldset  class="ui-corner-all">
            <legend class="ui-widget ui-state-default ui-corner-all ui-button-text" style="text-align: left;" id="jqLegendConfirmarServicio"></legend>
            <table  align="center" border="0">
                <tr>
                    <td rowspan="2" colspan="5" align="center">
                        <table id="tblServiciosExtras">
                            <tr>
                                <td/>
                            </tr>
                        </table>
                        <div id="gridPagerServiciosExtras"></div>​
                    </td>
                    <td>
                        <div id="jqLblDescripcionServicio"></div>
                    </td>
                    <td align="left" colspan="2">
                        <textarea id="jqTxtDescripcionServicio" rows="5" cols="50" style="text-transform: uppercase;"></textarea>
                    </td>   
                </tr>
                <tr>
                    <td align="center" colspan="2">
                        <div id="jqBtnSolicitarPresupuesto"></div>
                    </td>                    
                </tr>
                <tr>
                </tr>
            </table>
        </fieldset>
    </fieldset>
</tr>
</table>
    <script type="text/javascript">
    //<![CDATA[
        jQuery(document).ready(function () {



            var _grillaObrasArte = [];
            var idObrasArteGridSelected = "";

            var _grillaServiciosExtra = [];
            var serviciosExtraSelected =  [];


            $("#jqLegendTitle").html($('#<%= legendTitle.ClientID %>').text());
            $("#jqLegendDetalle").html($('#<%= legendDetalle.ClientID %>').text());
            $("#jqLegendConfirmarServicio").html($('#<%= legendConfirmarServicio.ClientID %>').text());



            $("#jqLblFechaOrigen").html($('#<%= lblFechaOrigen.ClientID %>').text());
            $("#jqLblHoraOrigen").html($('#<%= lblHoraOrigen.ClientID %>').text());
            $("#jqLblFechaDestino").html($('#<%= lblFechaDestino.ClientID %>').text());
            $("#jqLblHoraDestino").html($('#<%= lblHoraDestino.ClientID %>').text());
            $("#jqLblDomicilioOrigen").html($('#<%= lblDomicilioOrigen.ClientID %>').text());
            $("#jqLblDomicilioDestino").html($('#<%= lblDomicilioDestino.ClientID %>').text());


            $("#jqTxtFechaOrigen").addClass("ui-state-default ui-combobox-input ui-corner-all");
            $("#jqTxtHoraOrigen").addClass("ui-state-default ui-combobox-input ui-corner-all");
            $("#jqTxtFechaDestino").addClass("ui-state-default ui-combobox-input ui-corner-all");
            $("#JqTxtHoraDestino").addClass("ui-state-default ui-combobox-input ui-corner-all");
            $("#jqTxtDomicilioOrigen").addClass("ui-state-default ui-combobox-input ui-corner-all");
            $("#jqTxtDomicilioDestino").addClass("ui-state-default ui-combobox-input ui-corner-all");



            var dates = $("#jqTxtFechaOrigen, #jqTxtFechaDestino").datepicker({
                width: "50",
                changeMonth: true,
                showOn: "button",
                buttonImage: "../images/calendar.gif",
                buttonImageOnly: true,
                onSelect: function (selectedDate) {
                    var option = this.id == "jqTxtFechaOrigen" ? "minDate" : "maxDate",
                    instance = $(this).data("datepicker"),
                    date = $.datepicker.parseDate(instance.settings.dateFormat || $.datepicker._defaults.dateFormat, selectedDate, instance.settings);
                    dates.not(this).datepicker("option", option, date);
                }
            }).addClass("ui-state-default ui-combobox-input ui-corner-all");
            $("#jqTxtFechaOrigen, #jqTxtFechaDestino").mask("99/99/9999");
            $("#jqTxtFechaOrigen, #jqTxtFechaDestino").unbind("keyup");
            $("#jqTxtFechaOrigen, #jqTxtFechaDestino").datepicker("option", $.datepicker.regional[$('#<%= lblregional.ClientID %>').text()]);
            var fecha_actual = new Date();
            var dateFormat = $('#<%= lblFormatoFechas.ClientID %>').text();
            var _fecha_desde = formatDate(fecha_actual, dateFormat);
            var fecha_hasta = new Date(fecha_actual.getTime() + (5 * 24 * 3600 * 1000)); // sumo 5 dias aprox
            var _fecha_hasta = formatDate(fecha_hasta, dateFormat);
            $('#jqTxtFechaOrigen').attr('value', _fecha_desde);
            $('#jqTxtFechaDestino').attr('value', _fecha_hasta);



            var addresspickerOrigen = $("#jqTxtDomicilioOrigen").addresspicker();
            var addresspickerDestino = $("#jqTxtDomicilioDestino").addresspicker();

            $("#jqTxtDomicilioOrigen").val("AV BARTOLOMÉ MITRE 3352, SARANDÍ, BUENOS AIRES, ARGENTINA");
            $("#jqTxtDomicilioDestino").val("AV BARTOLOMÉ MITRE 3152, SARANDÍ, BUENOS AIRES, ARGENTINA");
            $("#jqTxtDomicilioOrigen").blur(function () {
                mostrarRuta();
            });
            $("#jqTxtDomicilioDestino").blur(function () {
                mostrarRuta();
            });

            var map, _directionsRenderer, _directionsService;
            var data = {};
            function mostrarRuta() {
                map = new google.maps.Map(document.getElementById('imgMapa'), {
                    'zoom': 12,
                    'mapTypeId': google.maps.MapTypeId.ROADMAP,
                    'center': new google.maps.LatLng(-34.67021034260053, -58.34191918373108)
                })
                _directionsRenderer = new google.maps.DirectionsRenderer({ 'draggable': true });
                _directionsRenderer.setMap(map);
                /*var waypts = [
                {'location': new google.maps.LatLng(26.05678288577881, -80.30236816615798)},
                {'location': new google.maps.LatLng(26.104887637199948, -80.39231872768141)},
                {'location': new google.maps.LatLng(25.941991877144947, -80.16160583705641)},
                {'location': new google.maps.LatLng(25.67021034260053, -80.34191918373108)}
                ];
                console.dir(waypts);*/

                _directionsService = new google.maps.DirectionsService();
                _directionsService.route({
                    //'waypoints': waypts,
                    //'origin': new google.maps.LatLng(25.941991877144947, -80.16160583705641),
                    //'destination': new google.maps.LatLng(25.67021034260053, -80.34191918373108),
                    'origin': $("#jqTxtDomicilioOrigen").val(), //'san juan 1130, capital federal, buenos aires',
                    'destination': $("#jqTxtDomicilioDestino").val(), //'Av. Infanta Isabel 555, Buenos Aires',
                    'optimizeWaypoints': true,
                    'travelMode': google.maps.DirectionsTravelMode.DRIVING
                }, function (response, status) {
                    if (status == 'OK') _directionsRenderer.setDirections(response);
                });
                google.maps.event.addListener(_directionsRenderer, 'directions_changed', function () {
                    console.dir(_directionsRenderer.directions.routes[0].legs);
                    $("#my_textual_div").val("");
                    _directionsRenderer.setPanel(document.getElementById('my_textual_div'));
                    $("#jqTxtDomicilioOrigen").val(_directionsRenderer.directions.routes[0].legs[0].start_address);
                    $("#jqTxtDomicilioDestino").val(_directionsRenderer.directions.routes[0].legs[0].end_address);
                    computeTotalDistance(_directionsRenderer.directions);
                });
            };
            function computeTotalDistance(result) {
                var total = 0;
                var myroute = result.routes[0];
                for (i = 0; i < myroute.legs.length; i++) {
                    total += myroute.legs[i].distance.value;
                }
                total = total / 1000.
                $("#total").html('<b> Distancia total: ' + total + ' km</b>');
            }
            mostrarRuta();

            $("#jqLblNombre").html($('#<%= lblNombre.ClientID %>').text());
            $("#jqLblDescripcionObraArte").html($('#<%= lblDescripcionObraArte.ClientID %>').text());
            $("#jqLblAncho").html($('#<%= lblAncho.ClientID %>').text());
            $("#jqLblAlto").html($('#<%= lblAlto.ClientID %>').text());
            $("#jqLblLargo").html($('#<%= lblLargo.ClientID %>').text());
            $("#jqLblPeso").html($('#<%= lblPeso.ClientID %>').text());
            $("#jqLblValor").html($('#<%= lblValor.ClientID %>').text());

            $("#jqTxtNombreObraArte").addClass("ui-state-default ui-combobox-input ui-corner-all");
            $("#jqTxtDescripcionObraArte").addClass("ui-state-default ui-combobox-input ui-corner-all");
            $("#jqTxtAncho").addClass("ui-state-default ui-combobox-input ui-corner-all");
            $("#jqTxtAlto").addClass("ui-state-default ui-combobox-input ui-corner-all");
            $("#jqTxtLargo").addClass("ui-state-default ui-combobox-input ui-corner-all");
            $("#jqTxtPeso").addClass("ui-state-default ui-combobox-input ui-corner-all");
            $("#jqTxtValor").addClass("ui-state-default ui-combobox-input ui-corner-all");


            $("#jqBtnAltaObraArte").button({
                icons: {
                    primary: "ui-icon-plus"
                },
                label: $('#<%= btnAltaObraArte.ClientID %>').text()
            });

            $("#jqBtnAltaObraArte").click(function () {
                agregarObraArte();
            });
            function agregarObraArte() {
                var cantReg = _grillaObrasArte.length + 1;
                _grillaObrasArte.push({
                    ID: cantReg,
                    nombre: $.trim($("#jqTxtNombreObraArte").val()),
                    descripcion: $.trim($("#jqTxtDescripcionObraArte").val()),
                    ancho: $.trim($("#jqTxtAncho").val()),
                    alto: $.trim($("#jqTxtAlto").val()),
                    largo: $.trim($("#jqTxtLargo").val()),
                    peso: $.trim($("#jqTxtPeso").val()),
                    valor: $.trim($("#jqTxtValor").val())
                });
                $("#jqTxtNombreObraArte").val("");
                $("#jqTxtDescripcionObraArte").val("");
                $("#jqTxtAncho").val("");
                $("#jqTxtAlto").val("");
                $("#jqTxtLargo").val("");
                $("#jqTxtPeso").val("");
                $("#jqTxtValor").val("");
                cargarGrillaObraArte();
            };

            $("#jqBtnModiObraArte").button({
                icons: {
                    primary: "ui-icon-pencil"
                },
                label: $('#<%= btnModiObraArte.ClientID %>').text()
            });

            $("#jqBtnModiObraArte").click(function () {
                modificarObraArte();
            });

            function modificarObraArte() {
                if (idObrasArteGridSelected) {
                    for (z = 0; z < _grillaObrasArte.length; z++) {
                        if (_grillaObrasArte[z].ID == idObrasArteGridSelected) {
                            _grillaObrasArte[z].nombre = $.trim($("#jqTxtNombreObraArte").val());
                            _grillaObrasArte[z].descripcion = $.trim($("#jqTxtDescripcionObraArte").val());
                            _grillaObrasArte[z].ancho = $.trim($("#jqTxtAncho").val());
                            _grillaObrasArte[z].alto = $.trim($("#jqTxtAlto").val());
                            _grillaObrasArte[z].largo = $.trim($("#jqTxtLargo").val());
                            _grillaObrasArte[z].peso = $.trim($("#jqTxtPeso").val());
                            _grillaObrasArte[z].valor = $.trim($("#jqTxtValor").val());
                            cargarGrillaObraArte();
                        }
                    }
                } else {
                    alert("Debe seleccionar un registro en la grilla de obras de arte");
                }
            };

            $("#jqBtnBajaObraArte").button({
                icons: {
                    primary: "ui-icon-minus"
                },
                label: $('#<%= btnBajaObraArte.ClientID %>').text()
            });

            $("#jqBtnBajaObraArte").click(function () {
                eliminarObraArte();
            });
            function eliminarObraArte() {
                if (idObrasArteGridSelected) {
                    for (z = 0; z < _grillaObrasArte.length; z++) {
                        if (_grillaObrasArte[z].ID == idObrasArteGridSelected) {
                            _grillaObrasArte.splice(z, 1);
                            $("#jqTxtNombreObraArte").val("");
                            $("#jqTxtDescripcionObraArte").val("");
                            $("#jqTxtAncho").val("");
                            $("#jqTxtAlto").val("");
                            $("#jqTxtLargo").val("");
                            $("#jqTxtPeso").val("");
                            $("#jqTxtValor").val("");
                            cargarGrillaObraArte();
                        }
                    }
                } else {
                    alert("Debe seleccionar un registro en la grilla de obras de arte");
                }
            };


            function cargarGrillaObraArte() {
                $("#tblObrasArte").jqGrid('GridUnload');
                $("#tblObrasArte").jqGrid({
                    datatype: "local",
                    data: _grillaObrasArte,
                    colNames: ['ID', 'Nombre', 'Descripción', 'Ancho', 'Alto', 'Largo', 'Peso', 'Valor'],
                    colModel: [
   		                { name: 'ID', key: true, index: 'ID', sortable: true, width: 30, align: "right", hidden: false },
   		                { name: 'nombre', index: 'nombre', sortable: true, width: 100, align: "left" },
   		                { name: 'descripcion', index: 'descripcion', sortable: true, width: 300, align: "left" },
   		                { name: 'ancho', index: 'ancho', sortable: true, width: 80, align: "right" },
   		                { name: 'alto', index: 'alto', sortable: true, width: 80, align: "right" },
   		                { name: 'largo', index: 'largo', sortable: true, width: 80, align: "right" },
   		                { name: 'peso', index: 'peso', sortable: true, width: 80, align: "right" },
   		                { name: 'valor', index: 'valor', sortable: true, width: 80, align: "right" }
   	                ],
                    rowNum: 4,
                    rowList: [10, 20, 30],
                    pager: '#gridPagerObrasArte',
                    sortname: 'id',
                    viewrecords: true,
                    altRows: true,
                    sortorder: "desc",
                    caption: $('#<%= gridObrasArte.ClientID %>').text(),
                    height: "100%",
                    width: "800",
                    shrinkToFit: false,
                    onSelectRow: function (id) {
                        seleccionarObraArte(id);
                    }
                });
                $("#tblObrasArte").tooltip({
                    bodyHandler: function () {
                        return $('#<%= gridObrasArteTOOL.ClientID %>').text();
                    },
                    top: -15,
                    left: 5,
                    showURL: false
                });

            };
            cargarGrillaObraArte();

            function seleccionarObraArte(id) {
                idObrasArteGridSelected = id;
                for (z = 0; z < _grillaObrasArte.length; z++) {
                    if (_grillaObrasArte[z].ID == idObrasArteGridSelected) {
                        $("#jqTxtNombreObraArte").val(_grillaObrasArte[z].nombre);
                        $("#jqTxtDescripcionObraArte").val(_grillaObrasArte[z].descripcion);
                        $("#jqTxtAncho").val(_grillaObrasArte[z].ancho);
                        $("#jqTxtAlto").val(_grillaObrasArte[z].alto);
                        $("#jqTxtLargo").val(_grillaObrasArte[z].largo);
                        $("#jqTxtPeso").val(_grillaObrasArte[z].peso);
                        $("#jqTxtValor").val(_grillaObrasArte[z].valor);
                    }
                }
            };





            $("#jqLblDescripcionServicio").html($('#<%= lblDescripcionServicio.ClientID %>').text());

            $("#jqTxtDescripcionServicio").addClass("ui-state-default ui-combobox-input ui-corner-all");

            function traerServicioExtras() {
                $.ajax({
                    type: "post",
                    url: "/Website/WebServices/SolicitudServicio.asmx/getServicios",
                    data: JSON.stringify({}),
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    beforeSend: function () {
                        jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                    },
                    success: function (result) {
                        $.alerts._hide();
                        _grillaServiciosExtra = result.d;
                        cargarGrillaServicioExtras();
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        $.alerts._hide();
                        jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
                    }
                });
            };


            function cargarGrillaServicioExtras() {
                $("#tblServiciosExtras").jqGrid('GridUnload');
                $("#tblServiciosExtras").jqGrid({
                    datatype: "local",
                    data: _grillaServiciosExtra,
                    colNames: ['ID', 'Descripción', 'Costo'],
                    colModel: [
   		                { name: 'id', key: true, index: 'id', sortable: true, width: 30, align: "right", hidden: false },
   		                { name: 'descripcion', index: 'descripcion', sortable: true, width: 150, align: "left" },
   		                { name: 'costoBase', index: 'costoBase', sortable: true, width: 80, align: "right" }
   	                ],
                    multiselect: true,
                    viewrecords: true,
                    gridview: true,
                    loadonce: false,
                    height: 100,
                    caption: $('#<%= gridServiciosExtras.ClientID %>').text(),
                    width: "260"
                });
                $("#tblServiciosExtras").tooltip({
                    bodyHandler: function () {
                        return $('#<%= gridServiciosExtrasTOOL.ClientID %>').text();
                    },
                    top: -15,
                    left: 5,
                    showURL: false
                });

            };
            traerServicioExtras();

            $("#jqBtnSolicitarPresupuesto").button({
                icons: {
                    primary: "ui-icon-script"
                },
                label: $('#<%= btnSolicitarPresupuesto.ClientID %>').text()
            });

            $("#jqBtnSolicitarPresupuesto").click(function () {
                solicitarPresupuesto();
            });


            function solicitarPresupuesto() {
                serviciosExtraSelected = $("#tblServiciosExtras").getGridParam('selarrrow');
                $.ajax({
                    type: "post",
                    url: "/Website/WebServices/SolicitudServicio.asmx/solicitarPresupuesto",
                    data: JSON.stringify({
                        fechaSalida : $.trim($("#jqTxtFechaOrigen").val()),
                        horaSalida : $.trim($("#jqTxtHoraOrigen").val()),
                        domicilioSalida: $.trim($("#jqTxtDomicilioOrigen").val()),
                        latitudSalida: "",
                        longitudSalida: "",
                        fechaDestino : $.trim($("#jqTxtFechaDestino").val()), 
                        horaDestino : $.trim($("#JqTxtHoraDestino").val()),
                        domicilioDestino: $.trim($("#jqTxtDomicilioDestino").val()), 
                        latitudDestino : "",
                        longitudDestino : "",
                        descripcionServicio : $.trim($("#jqTxtDescripcionServicio").val()),  
                        serviciosExtra : serviciosExtraSelected, 
                        obrasArte :  _grillaObrasArte                   
                    }),
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    beforeSend: function () {
                        jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                    },
                    success: function (result) {
                        $.alerts._hide();
                        _grillaServiciosExtra = result.d;
                        cargarGrillaServicioExtras();
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        $.alerts._hide();
                        jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
                    }
                });
            };
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