<%@ Page Language="C#" MasterPageFile="~/MasterPages/BackEnd.master" AutoEventWireup="true" CodeFile="PerfilUsuario.aspx.cs" Inherits="_Default" title="Home" culture="auto" meta:resourcekey="PageResource1" uiculture="auto"%>
<%@ MasterType VirtualPath="~/MasterPages/BackEnd.master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" Runat="Server">

<!-- Componentes -->
<div id="idioma" style="display:none;">

<asp:Label ID="legendTitle" Text="Perfil de usuario:" runat="server" ></asp:Label>
<asp:Label ID="legendUbicacion" Text="Ubicación:" runat="server" ></asp:Label>
<asp:Label ID="lblUsuario" Text="Usuario:" runat="server" ></asp:Label>
<asp:Label ID="lblNombre" Text="Nombre:" runat="server" ></asp:Label>
<asp:Label ID="lblContrasena" Text="Contraseña:" runat="server" ></asp:Label>
<asp:Label ID="lblEmail" Text="E-mail:" runat="server" ></asp:Label>
<asp:Label ID="lblApellido" Text="Apellido:" runat="server" ></asp:Label>
<asp:Label ID="lblRazonSocial" Text="Razón social:" runat="server" ></asp:Label>
<asp:Label ID="lblCuit" Text="CUIT:" runat="server" ></asp:Label>
<asp:Label ID="lblCuil" Text="CUIL:" runat="server" ></asp:Label>
<asp:Label ID="lblTelefonos" Text="Teléfonos:" runat="server" ></asp:Label>
<asp:Label ID="lblCodPostal" Text="Cod. postal:" runat="server" ></asp:Label>
<asp:Label ID="lblDomicilio" Text="Domicilios :" runat="server" ></asp:Label>
<asp:Label ID="lblDomicilioABM" Text="Domicilio nuevo:" runat="server" ></asp:Label>
<asp:Label ID="lblProvincia" Text="Provincia:" runat="server" ></asp:Label>
<asp:Label ID="lblDepartamento" Text="Departamento:" runat="server" ></asp:Label>
<asp:Label ID="lblPartido" Text="Partido / localidad:" runat="server" ></asp:Label>

<asp:Label ID="lblLocality" Text="Localidad:" runat="server" ></asp:Label>
<asp:Label ID="lblDistrict" Text="Distrito:" runat="server" ></asp:Label>
<asp:Label ID="lblStateProvince" Text="Estado / Provincia:" runat="server" ></asp:Label>
<asp:Label ID="lblCountry" Text="Pais:" runat="server" ></asp:Label>
<asp:Label ID="lblPostalCode" Text="Cod. Postal:" runat="server" ></asp:Label>
<asp:Label ID="lblLat" Text="Latitud:" runat="server" ></asp:Label>
<asp:Label ID="lblLng" Text="Longitud:" runat="server" ></asp:Label>
<asp:Label ID="lblType" Text="Tipo:" runat="server" ></asp:Label>


<!-- Tooltips --> 

<!-- Mensajes -->
<asp:Label ID="msgProcesando" Text="Aguarde un instante!!!"  runat="server"  ></asp:Label>
<asp:Label ID="msgError" Text="Se ha producido un error"  runat="server" ></asp:Label>
<asp:Label ID="msgESelTelefono" Text="Debe seleccionar un teléfono.-"  runat="server" ></asp:Label>
<asp:Label ID="msgEingrTelefono" Text="Debe ingresar un número de teléfono.-"  runat="server" ></asp:Label>
<asp:Label ID="msgAltaTel" Text="Se dio de alta el teléfono.-"  runat="server" ></asp:Label>
<asp:Label ID="msgModiTel" Text="Se modifico el teléfono.-"  runat="server" ></asp:Label>
<asp:Label ID="msgBajaTel" Text="Se dio de baja el teléfono.-"  runat="server" ></asp:Label>
<asp:Label ID="msgESelDomicilio" Text="Debe seleccionar un domicilio.-"  runat="server" ></asp:Label>
<asp:Label ID="msgEingrDomicilio" Text="Debe ingresar un domicilio.-"  runat="server" ></asp:Label>
<asp:Label ID="msgESelLocalidad" Text="Debe seleccionar un partido/localidad, recuerde que para seleccionar un partido/localidad debe seleccionar una provincia y un departamento"  runat="server" ></asp:Label>
<asp:Label ID="msgESelCodPostal" Text="Debe seleccionar una Código postal"  runat="server" ></asp:Label>
<asp:Label ID="msModiDomicilioOk" Text="Se modifico el domicilio.-"  runat="server" ></asp:Label>
<asp:Label ID="msBajaDomicilioOk" Text="Se dio de baja el domicilio.-"  runat="server" ></asp:Label>
<asp:Label ID="msAltaDomicilioOk" Text="Se dio de alta el domicilio"  runat="server" ></asp:Label>
<asp:Label ID="msgConfirmBajaDomicilio" Text="Está seguro que quiere dar de baja el domicilio"  runat="server" ></asp:Label>
<asp:Label ID="msgConfirmModiDomicilio" Text="Está seguro que quiere modificar el domicilio"  runat="server" ></asp:Label>
<asp:Label ID="msgEingrContrasena" Text="Debe ingresar una Contraseña mayor a 3 caracteres.-"  runat="server" ></asp:Label>
<asp:Label ID="msgEingrEmail" Text="Debe ingresar una cuenta de e-mail"  runat="server" ></asp:Label>
<asp:Label ID="msgEingrNombre" Text="Debe ingresar un Nombre"  runat="server" ></asp:Label>
<asp:Label ID="msgEingrApellido" Text="Debe ingresar un Apellido"  runat="server" ></asp:Label>
<asp:Label ID="msgEingrRazonSocial" Text="Debe ingresar una Razón Social"  runat="server" ></asp:Label>
<asp:Label ID="msgEingrCuilCuit" Text="Debe ingresar un número de CUIT o CUIL"  runat="server" ></asp:Label>
<asp:Label ID="msgEingrIsCuil" Text="Debe seleccionar si es CUIL o CUIT"  runat="server" ></asp:Label>
<asp:Label ID="msgConfirmModificarUsuario" Text="Está seguro que quiere modificar el usuario"  runat="server" ></asp:Label>
<asp:Label ID="msgEformatEmailInvalid" Text="Debe ingresar un formato de cuenta de e-mail valido"  runat="server" ></asp:Label>


<!-- Ayuda -->




    
</div>
<!-- FIN -->
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
</script>    
<style type="text/css">
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
/*
#map {
  border: 1px solid #DDD; 
  width:300px;
  height: 300px;
  float:left;  
  margin: 0px 0 0 10px;
  -webkit-box-shadow: #AAA 0px 0px 15px;
}
*/
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
                        <input type="text" id="jqTxtUsuario" readonly="readonly" size="20px" style="text-transform: uppercase;"/>
                    </td>                    
                    <td>
                        <div id="jqLblContrasena"></div>
                    </td>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <input type="text" id="jqTextContrasena" size="20px" maxlength="30" style="display:none;"/>
                                    <input type="password" id="jqTextContrasena_PSW" size="20px" maxlength="30" />
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
                    <td >
                        <div id="jqLblEmail"></div>
                    </td>
                    <td align="right">
                        <input type="text" id="jqTxtEmail" size="28px" maxlength="40" style="text-transform: uppercase;"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div id="jqLblNombre"></div>
                    </td>
                    <td align="right">
                        <input type="text" id="jqTxtNombre" size="20px" maxlength="40" style="text-transform: uppercase;"/>
                    </td>     
                    <td>
                        <div id="jqLblApellido"></div>
                    </td>
                    <td align="right">
                        <input type="text" id="JqTxtApellido" size="20px" maxlength="40" style="text-transform: uppercase;"/>
                    </td>     
                    <td>
                        <div id="jqLblRazonSocial"></div>
                    </td>
                    <td align="right">
                        <input type="text" id="JqTxtRazonSocial" size="20px" maxlength="40" style="text-transform: uppercase;"/>
                    </td>     
                </tr>
                <tr>
                    <td colspan="2" align="right">
                        <table>
                            <tr>
                                <td>
                                    <div id="jqLblCuit"></div>
                                </td>
                                <td>
                                    <input type="radio" id="jqRdCuit" maxlength="15"  name="CuilCuit" value="1"/> 
                                </td>
                                <td>
                                    <div id="jqLblCuil"></div>
                                </td>     
                                <td>
                                    <input type="radio" id="jqRdCuil" name="CuilCuit" value="0"/> 
                                </td>
                                <td >
                                    <input type="text" id="jqTxtCuilCuit" size="20px" style="text-transform: uppercase;"/>
                                </td>     
                            </tr>
                        </table>
                    </td>
                    <td>
                        <div id="jqLblTelefonos"></div>
                    </td>
                    <td align="right">
                        <input type="text" id="jqTxtTelefonos" size="20px" maxlength="40" style="text-transform: uppercase;"/>
                    </td>
                    <td colspan="2" align="left">
                         <div id="jqBtnAltaTelefonos"></div>
                         <div id="jqBtnModiTelefonos"></div>
                         <div id="jqBtnBajaTelefonos"></div>
                    </td>     
                </tr>
                <tr>
                    <td colspan="6">
                        <fieldset class="ui-corner-all">
                        <legend class="ui-widget ui-state-default ui-corner-all ui-button-text" style="text-align: left;" id="jqLegendUbicacion"></legend>
                            <table>
                                <tr>
                                    <td>
                                        <div style="width:70px" id="jqLblCodPostal"></div>
                                    </td>
                                    <td align="right">
                                        <input type="text" id="jqTxtCodPostal" size="5px" maxlength="5"  style="text-transform: uppercase;"/>
                                    </td>  
                                    <td>
                                        <div id="jqLblProvincia"></div>
                                    </td>
                                    <td align="right">
                                        <input type="text" id="jqTxtProvincia" size="20px" maxlength="40" style="text-transform: uppercase;"/>
                                    </td>     
                                    <td>
                                        <div id="jqLblDepartamento"></div>
                                    </td>
                                    <td align="right">
                                        <input type="text" id="jqTxtDepartamento" size="20px" maxlength="40" style="text-transform: uppercase;"/>
                                    </td>     
                                    <td>
                                        <div id="jqLblPartido"></div>
                                    </td>
                                    <td align="left">
                                        <input type="text" id="jqTxtPartido" size="20px" maxlength="40"  style="text-transform: uppercase;"/>
                                    </td>     
                                </tr>
                                <tr>
                                    <td colspan="8">
                                        <table>
                                            <tr>
                                                <td>
                                                    <div id="jqLblDomicilio"></div>
                                                </td>
                                                <td align="right">
                                                    <input type="text" id="jqTxtDomicilio" size="90px" maxlength="400" style="text-transform: uppercase;" readonly="readonly"/>
                                                </td> 
                                                <td align="center" >
                                                    <div id="jbBtnBajaDom" />
                                                </td> 
                                                <td align="center" >
                                                    <div id="jbBtnModiDom"/>
                                                </td> 
                                            </tr>       
                                            <tr>  
                                                <td>
                                                    <div style="width:100px"  id="jqLblDomicilioABM"></div>
                                                </td>
                                                <td align="center">
                                                    <input type="text" id="jqTxtDomicilioABM" size="90px"  maxlength="400" style="text-transform: uppercase;"/>
                                                </td> 
                                                <td align="center" colspan="2">
                                                    <div id="jbBtnAltaDom" />
                                                </td> 
                                            </tr>
                                        </table>
                                    </td> 
                                </tr>
                                <tr>
                                    <td colspan="6" rowspan="2">
                                        <div id="imgMapa" style="width: 100%; height: 300px"></div>
                                    </td>     
                                    <td colspan="2">
                                        <table>
                                            <tr>
                                                <td>
                                                    <div id="jqLblLocality"></div>
                                                </td>     
                                                <td>
			                                        <input id="locality" disabled="disabled"/>  
                                                </td>     
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div id="jqLblDistrict"></div>
                                                </td>   
                                                <td>
			                                        <input id="administrative_area_level_2" disabled="disabled"/> 
                                                </td>     
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div id="jqLblStateProvince"></div>
                                                </td>   
                                                <td>
		                                            <input id="administrative_area_level_1" disabled="disabled"/>  
                                                </td>     
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div id="jqLblCountry"></div>
                                                </td>  
                                                <td>
			                                        <input id="country" disabled="disabled"/>  
                                                </td>     
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div id="jqLblPostalCode"></div>
                                                </td>  
                                                <td>
			                                        <input id="postal_code" disabled="disabled"/> 
                                                </td>     
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div id="jqLblLat" ></div>
                                                </td>  
                                                <td>
			                                        <input id="lat" disabled="disabled"/>  
                                                </td>     
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div id="jqLblLng" ></div>
                                                </td>  
                                                <td>
			                                        <input id="lng" disabled="disabled"/>
                                                </td>     
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div id="jqLblType"></div>
                                                </td>
                                                <td>
                                                    <input id="type" disabled="disabled" />
                                                </td>     
                                            </tr>
                                        </table>
                                    </td>     
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        <div id="jqBtnGuardarCambios"></div>
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
<br />
<br />
<br />            
<script type="text/javascript">
//<![CDATA[
    // variables locales


        var _usuario;
        var _telefonos = [];
        var _idTelefonoSeleccionado ="";
        var _domicilios = [];
        var _idDomicilioSeleccionado ="";
        var _codPostales = [];
        var _idCodPostalSeleccionado="";
        var _provincias= [];
        var _idProvinciaSeleccionado="";
        var _departamentos = [];
        var _idDepartamentoSeleccionado="";
        var _Localidades = [];
        var _idLocalidadSeleccionado="";
    
        $("#jqLegendTitle").html($('#<%= legendTitle.ClientID %>').text());
        $("#jqLblUsuario").html($('#<%= lblUsuario.ClientID %>').text());
        $("#jqLblNombre").html($('#<%= lblNombre.ClientID %>').text());
        $("#jqLblContrasena").html($('#<%= lblContrasena.ClientID %>').text());
        $("#jqLblEmail").html($('#<%= lblEmail.ClientID %>').text());
        $("#jqLblApellido").html($('#<%= lblApellido.ClientID %>').text());
        $("#jqLblRazonSocial").html($('#<%= lblRazonSocial.ClientID %>').text());
        $("#jqLblCuit").html($('#<%= lblCuit.ClientID %>').text());
        $("#jqLblCuil").html($('#<%= lblCuil.ClientID %>').text());
        $("#jqLblTelefonos").html($('#<%= lblTelefonos.ClientID %>').text());


        $("#jqTxtUsuario").addClass("ui-state-default ui-combobox-input ui-corner-all");
        $("#jqTextContrasena").addClass("ui-state-default ui-combobox-input ui-corner-all");
        $("#jqTextContrasena_PSW").addClass("ui-state-default ui-combobox-input ui-corner-all");
        $("#jqTxtEmail").addClass("ui-state-default ui-combobox-input ui-corner-all");
        $("#jqTxtNombre").addClass("ui-state-default ui-combobox-input ui-corner-all");
        $("#JqTxtRazonSocial").addClass("ui-state-default ui-combobox-input ui-corner-all");
        $("#jqTxtCuilCuit").addClass("ui-state-default ui-combobox-input ui-corner-all");
        $("#jqTxtCuilCuit").mask("99-99999999-9");
        $("#jqTxtTelefonos").addClass("ui-state-default ui-combobox-input ui-corner-all");
        $("#JqTxtApellido").addClass("ui-state-default ui-combobox-input ui-corner-all");

        $("#jqLegendUbicacion").html($('#<%= legendUbicacion.ClientID %>').text());

        $("#jqLblCodPostal").html($('#<%= lblCodPostal.ClientID %>').text());
        $("#jqLblDomicilio").html($('#<%= lblDomicilio.ClientID %>').text());
        $("#jqLblDomicilioABM").html($('#<%= lblDomicilioABM.ClientID %>').text());
        $("#jqLblProvincia").html($('#<%= lblProvincia.ClientID %>').text());
        $("#jqLblDepartamento").html($('#<%= lblDepartamento.ClientID %>').text());
        $("#jqLblPartido").html($('#<%= lblPartido.ClientID %>').text());

        $("#jqTxtCodPostal").addClass("ui-state-default ui-combobox-input ui-corner-all");
        $("#jqTxtDomicilio").addClass("ui-state-default ui-combobox-input ui-corner-all");
        $("#jqTxtDomicilioABM").addClass("ui-state-default ui-combobox-input ui-corner-all");
    
        $("#jqTxtProvincia").addClass("ui-state-default ui-combobox-input ui-corner-all");
    
        $("#jqTxtDepartamento").addClass("ui-state-default ui-combobox-input ui-corner-all");
    


        $("#jqTxtPartido").addClass("ui-state-default ui-combobox-input ui-corner-all");
    
        $("#imgMapa").addClass("ui-state-default ui-combobox-input ui-corner-all");
        $("#jqLblLocality").html($('#<%= lblLocality.ClientID %>').text());
        $("#locality").addClass("ui-state-default ui-combobox-input ui-corner-all");
        $("#jqLblDistrict").html($('#<%= lblDistrict.ClientID %>').text());
        $("#administrative_area_level_2").addClass("ui-state-default ui-combobox-input ui-corner-all");
        $("#jqLblStateProvince").html($('#<%= lblStateProvince.ClientID %>').text());
        $("#administrative_area_level_1").addClass("ui-state-default ui-combobox-input ui-corner-all");
        $("#jqLblCountry").html($('#<%= lblCountry.ClientID %>').text());
        $("#country").addClass("ui-state-default ui-combobox-input ui-corner-all");
        $("#jqLblPostalCode").html($('#<%= lblPostalCode.ClientID %>').text());
        $("#postal_code").addClass("ui-state-default ui-combobox-input ui-corner-all");
        $("#jqLblLat").html($('#<%= lblLat.ClientID %>').text());
        $("#lat").addClass("ui-state-default ui-combobox-input ui-corner-all");
        $("#jqLblLng").html($('#<%= lblLng.ClientID %>').text());
        $("#lng").addClass("ui-state-default ui-combobox-input ui-corner-all");
        $("#jqLblType").html($('#<%= lblType.ClientID %>').text());
        $("#type").addClass("ui-state-default ui-combobox-input ui-corner-all");

        var addresspicker = $("#addresspicker").addresspicker();
        var addresspickerMap = $("#jqTxtDomicilioABM").addresspicker({
            regionBias: "ar",
            language: "es",
            elements: {
                adressTarget: "#jqTxtDomicilioABM",
                map: "#imgMapa",
                lat: "#lat",
                lng: "#lng",
                locality: '#locality',
                administrative_area_level_2: '#administrative_area_level_2',
                administrative_area_level_1: '#administrative_area_level_1',
                country: '#country',
                postal_code: '#postal_code',
                type: '#type'
            }
        });
        var gmarker = addresspickerMap.addresspicker("marker");
        gmarker.setVisible(true);
        addresspickerMap.addresspicker("updatePosition");

        $('#jqTextContrasena_PSW').focus(function () {
            $('#jqTextContrasena_PSW').hide();
            $('#jqTextContrasena').val($('#jqTextContrasena_PSW').val());
            $('#jqTextContrasena').show().focus();
        });
        $('#jqTextContrasena').blur(function () {
            $('#jqTextContrasena').hide();
            $('#jqTextContrasena_PSW').show();
            $('#jqTextContrasena_PSW').val($('#jqTextContrasena').val());
        });

        $("#jqBtnGuardarCambios").button({
            icons: {
                primary: "ui-icon-check"
            },
            label: "Guardar cambios"
        });

        function validar_email(valor) {
            // creamos nuestra regla con expresiones regulares.
            var filter = /[\w-\.]{3,}@([\w-]{2,}\.)*([\w-]{2,}\.)[\w-]{2,4}/;
            // utilizamos test para comprobar si el parametro valor cumple la regla
            if (filter.test(valor))
                return true;
            else
                return false;
        };
        $("#jqBtnGuardarCambios").click(function () {

            if (jQuery.trim($('#jqTextContrasena').val()) == "" || jQuery.trim($('#jqTextContrasena').val()).length < 3) {
                jError($('#<%= msgEingrContrasena.ClientID %>').text(), 'Error');
                return;
            } else if (jQuery.trim($('#jqTxtEmail').val()) == "") {
                jError($('#<%= msgEingrEmail.ClientID %>').text(), 'Error');
                return;
            } else if (!validar_email($.trim($('#jqTxtEmail').val()))) {
                jError($('#<%= msgEformatEmailInvalid.ClientID %>').text());
                return false;
            } else if (jQuery.trim($('#jqTxtNombre').val()) == "") {
                jError($('#<%= msgEingrNombre.ClientID %>').text(), 'Error');
                return;
            } else if (jQuery.trim($('#JqTxtApellido').val()) == "") {
                jError($('#<%= msgEingrApellido.ClientID %>').text(), 'Error');
                return;
            } else if (jQuery.trim($('#JqTxtRazonSocial').val()) == "") {
                jError($('#<%= msgEingrRazonSocial.ClientID %>').text(), 'Error');
                return;
            } else if (jQuery.trim($('#jqTxtCuilCuit').val()) == "") {
                jError($('#<%= msgEingrCuilCuit.ClientID %>').text(), 'Error');
                return;

            } else if (!$("#jqRdCuit").is(':checked') && !$("#jqRdCuil").is(':checked')) {
                jError($('#<%= msgEingrIsCuil.ClientID %>').text(), 'Error');
                return;
            } else {
                jConfirm($('#<%= msgConfirmModificarUsuario.ClientID %>').text(), "Confirmar", function (r) {
                    if (r) {
                        modificarUsuario();
                    }
                });
            }
        });
        $("#jqTextContrasena_PSW").passwordStrength();
        $("#jqTextContrasena").passwordStrength();
        $("#jqBtnGenerarPass").button({
            icons: {
                primary: "ui-icon-refresh"
            },
            label: "G"
        });
        $("#jqBtnGenerarPass").click(function () {
            $("#jqTextContrasena_PSW").val(randomPassword()).trigger('keyup');
            $("#jqTextContrasena").val($("#jqTextContrasena_PSW").val());
            return false;
        });

        $("#jqBtnAltaTelefonos").button({
            icons: {
                primary: "ui-icon-plus"
            },
            label: "A"
        });
        $("#jqBtnAltaTelefonos").click(function () {
            if (jQuery.trim($('#jqTxtTelefonos').val()) != "") {
                altaTelefono();
            } else {
                jError($('#<%= msgEingrTelefono.ClientID %>').text(), 'Error');
            }
        });
        $("#jqBtnModiTelefonos").button({
            icons: {
                primary: "ui-icon-pencil"
            },
            label: "M"
        });
        $("#jqBtnModiTelefonos").click(function () {
            if (_idTelefonoSeleccionado) {
                modificarTelefono();
            } else {
                jError($('#<%= msgESelTelefono.ClientID %>').text(), 'Error');
            }
        });
     
        $("#jqBtnBajaTelefonos").button({
            icons: {
                primary: "ui-icon-minus"
            },
            label: "B"
        });
        $("#jqBtnBajaTelefonos").click(function () {
            if (_idTelefonoSeleccionado) {
                bajaTelefono();
            } else {
                jError($('#<%= msgESelTelefono.ClientID %>').text(), 'Error');
            }
        });
    
        $("#jbBtnAltaDom").button({
            icons: {
                primary: "ui-icon-plus"
            },
            label: "A"
        });
        $("#jbBtnAltaDom").click(function () {
            if(jQuery.trim($('#jqTxtDomicilioABM').val()) == "" ){
                jError($('#<%= msgEingrDomicilio.ClientID %>').text(), 'Error');
                return;
            } else {
                altaDomicilio();
            }
        });
        $("#jbBtnModiDom").button({
            icons: {
                primary: "ui-icon-pencil"
            },
            label: "M"
        });



        $("#jbBtnModiDom").click(function () {
            if (_idDomicilioSeleccionado == "") {
                jError($('#<%= msgESelDomicilio.ClientID %>').text(), 'Error');
            } else {
                jConfirm($('#<%= msgConfirmModiDomicilio.ClientID %>').text() + "<br>" + $("#jqTxtDomicilio").val(), "Confirmar", function (r) {
                    if (r) {
                        modificarDomicilio()
                    }
                });
            }
        });
     
        $("#jbBtnBajaDom").button({
            icons: {
                primary: "ui-icon-minus"
            },
            label: "B"
        });
        $("#jbBtnBajaDom").click(function () {
            if (_idDomicilioSeleccionado != "") {
                jConfirm($('#<%= msgConfirmBajaDomicilio.ClientID %>').text()+ "<br>" + $("#jqTxtDomicilio").val(), "Confirmar", function (r) {
                    if (r) {
                        bajaDomicilio()
                    }
                });
            } else {
                jError($('#<%= msgESelDomicilio.ClientID %>').text(), 'Error');
            }
        });



        $.ajax({
            type: "post",
            url: "/Website/WebServices/PerfilUsuario.asmx/getUsuario",
            data: JSON.stringify(),
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            beforeSend: function () {
                jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
            },
            success: function (result) {
                $.alerts._hide();
                _usuario = result.d;
                cargarDatosUsuario();
            },
            error: function (xhr, ajaxOptions, thrownError) {
                $.alerts._hide();
                jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
            }
        });

        function cargarDatosUsuario() {
            $("#jqTxtUsuario").val(_usuario.usuario);
            $("#jqTextContrasena_PSW").val(_usuario.pass);
            $("#jqTxtEmail").val(_usuario.email);
            $("#jqTxtNombre").val(_usuario.nombre);
            $("#JqTxtApellido").val(_usuario.apellido);
            $("#JqTxtRazonSocial").val(_usuario.razonSocial);
            if (_usuario.esCuit == "1") {
                $("#jqRdCuit").attr('checked', true);
            } else if (_usuario.esCuit == "0") {
                $("#jqRdCuil").attr('checked', true);
            }
            $("#jqTxtCuilCuit").val(_usuario.cuit_cuil);
        };
        function traerTelefonos() {
            $.ajax({
                type: "post",
                url: "/Website/WebServices/PerfilUsuario.asmx/getTelefonos",
                data: JSON.stringify(),
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                beforeSend: function () {
                    jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                },
                success: function (result) {
                    $.alerts._hide();
                    _telefonos = result.d;
                    cargarComboTelefonos();
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    $.alerts._hide();
                    jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
                }
            });
        };

        function cargarComboTelefonos() {
            $("#jqTxtTelefonos").unautocomplete();
            var __TelTemp = "";
            $('#jqTxtTelefonos').focus(function () {
                __TelTemp = $('#jqTxtTelefonos').val();
                $('#jqTxtTelefonos').val("");
            });
            $('#jqTxtTelefonos').blur(function () {
                if ($('#jqTxtTelefonos').val() == "") {
                    $('#jqTxtTelefonos').val(__TelTemp);
                }
            });
            $("#jqTxtTelefonos").ZaeAutocomplete(_telefonos, {
                minChars: 0,
                width: 150,
                matchContains: true,
                autoFill: false,
                formatItem: function (row, i, max) {
                    return row.id + " - " + row.telefono;
                },
                formatMatch: function (row, i, max) {
                    return row.id + " - " + row.telefono;
                },
                formatResult: function (row) {
                    return row.telefono;
                }
            });
            $("#jqTxtTelefonos").result(function (event, data, formatted) {
                console.dir(data);
                _idTelefonoSeleccionado = ((data != undefined) ? data.idTelefono : "");
            });
            if (_telefonos.length > 0) {
                $("#jqTxtTelefonos").val(_telefonos[0].telefono);
                _idTelefonoSeleccionado = _telefonos[0].idTelefono;
            }
        };
        traerTelefonos();


        function altaTelefono() {
            $.ajax({
                type: "post",
                url: "/Website/WebServices/PerfilUsuario.asmx/AltaTelefono",
                data: JSON.stringify({ telefono: jQuery.trim($('#jqTxtTelefonos').val()) }),
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                beforeSend: function () {
                    jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                },
                success: function (result) {
                    $.alerts._hide();
                    jInfo($('#<%= msgAltaTel.ClientID %>').text(), 'Info');
                    traerTelefonos();
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    $.alerts._hide();
                    jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
                }
            });
        };


        function modificarTelefono() {
            $.ajax({
                type: "post",
                url: "/Website/WebServices/PerfilUsuario.asmx/ModiTelefono",
                data: JSON.stringify({ idTelefono : _idTelefonoSeleccionado,  telefono: jQuery.trim($('#jqTxtTelefonos').val()) }),
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                beforeSend: function () {
                    jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                },
                success: function (result) {
                    $.alerts._hide();
                    jInfo($('#<%= msgModiTel.ClientID %>').text(), 'Info');
                    traerTelefonos();
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    $.alerts._hide();
                    jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
                }
            });
        };
        function bajaTelefono() {
            $.ajax({
                type: "post",
                url: "/Website/WebServices/PerfilUsuario.asmx/BajaTelefono",
                data: JSON.stringify({ idTelefono: _idTelefonoSeleccionado}),
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                beforeSend: function () {
                    jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                },
                success: function (result) {
                    $.alerts._hide();
                    jInfo($('#<%= msgBajaTel.ClientID %>').text(), 'Info');
                    traerTelefonos();
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    $.alerts._hide();
                    jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
                }
            });
        };

        function buscarCodPostales() {
            $.ajax({
                type: "post",
                url: "/Website/WebServices/PerfilUsuario.asmx/getCodPostales",
                data: JSON.stringify({ codPostal: jQuery.trim($('#jqTxtCodPostal').val()) }),
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                beforeSend: function () {
                    jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                },
                success: function (result) {
                    $.alerts._hide();
                    _codPostales = result.d;
                    cargarComboCodPostales();
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    $.alerts._hide();
                    jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
                }
            });
        };

        $("#jqTxtCodPostal").keyup(function (event) {
            if ($("#jqTxtCodPostal").val().length > 2 && event.keyCode != 13 && event.keyCode != 40 && event.keyCode != 38 && event.keyCode != 37 && event.keyCode != 39 && event.keyCode != 34 && event.keyCode != 33 && event.keyCode != 27) {
                buscarCodPostales();
            }
        });
        function cargarComboCodPostales() {
            $("#jqTxtCodPostal").unautocomplete();
            var __CodPostalTemp = "";
            $('#jqTxtCodPostal').focus(function () {
                __CodPostalTemp = $('#jqTxtCodPostal').val();
                $('#jqTxtCodPostal').val("");
            });
            $('#jqTxtCodPostal').blur(function () {
                if ($('#jqTxtCodPostal').val() == "") {
                    $('#jqTxtCodPostal').val(__CodPostalTemp);
                }
            });
            $("#jqTxtCodPostal").keyup(function (event) {
                if ($("#jqTxtCodPostal").val().length > 2 && event.keyCode != 13 && event.keyCode != 40 && event.keyCode != 38 && event.keyCode != 37 && event.keyCode != 39 && event.keyCode != 34 && event.keyCode != 33 && event.keyCode != 27) {
                    buscarCodPostales();
                }
            });
            $("#jqTxtCodPostal").ZaeAutocomplete(_codPostales, {
                minChars: 3,
                width: 300,
                max: 300,
                matchContains: true,
                autoFill: false,
                formatItem: function (row, i, max) {
                    return "ID " + row.id + " / " + row.codigoPostal + " - " + row.nombreLocalidad + " - " + row.provincia;
                },
                formatMatch: function (row, i, max) {
                    return row.codigoPostal ;
                },
                formatResult: function (row) {
                    return row.codigoPostal;
                }
            });
            $("#jqTxtCodPostal").result(function (event, data, formatted) {
                _idCodPostalSeleccionado = ((data != undefined) ? data.id : "");
                if(data != undefined){
                    $("#lat").val(((data != undefined) ? data.latitude : ""));
                    $("#lng").val(((data != undefined) ? data.longitude : ""));
                    addresspickerMap.addresspicker("reloadPosition");
                    for (i = 0; i < _provincias.length; i++) {
                        if (_provincias[i].nombre.toUpperCase() == data.provincia.toUpperCase()) {
                            _idProvinciaSeleccionado = _provincias[i].id;
                            $("#jqTxtProvincia").val(data.provincia.toUpperCase());
                            $("#jqTxtDepartamento").val("");
                            $("#jqTxtDepartamento").unautocomplete();
                            _idDepartamentoSeleccionado = '';
                            $("#jqTxtPartido").val("");
                            _Localidades="";
                            _idLocalidadSeleccionado = '';
                            $("#jqTxtPartido").unautocomplete();
                            buscarDepartamentos();
                            procesarDomicilio();
                        }
                     }
                }
            });
        };


        // combos combinados prov departamento localidades
        function buscarProvincias() {
            $.ajax({
                type: "post",
                url: "/Website/WebServices/PerfilUsuario.asmx/getProvincias",
                data: JSON.stringify(),
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                beforeSend: function () {
                    jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                },
                success: function (result) {
                    $.alerts._hide();
                    _provincias = result.d;
                    cargarComboProvincias();
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    $.alerts._hide();
                    jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
                }
            });
        };
        function cargarComboProvincias() {
            var __ProvinciaTemp = "";
            $('#jqTxtProvincia').focus(function () {
                __ProvinciaTemp = $('#jqTxtProvincia').val();
                $('#jqTxtProvincia').val("");
            });
            $('#jqTxtProvincia').blur(function () {
                if ($('#jqTxtProvincia').val() == "") {
                    $('#jqTxtProvincia').val(__ProvinciaTemp);
                }
            });
            $("#jqTxtProvincia").ZaeAutocomplete(_provincias, {
                minChars: 0,
                width: 150,
                max: 300,
                mustMatch: true,
                matchContains: true,
                autoFill: false,
                formatItem: function (row, i, max) {
                    return row.nombre;
                },
                formatMatch: function (row, i, max) {
                    return row.nombre;
                },
                formatResult: function (row) {
                    return row.nombre;
                }
            });
            $("#jqTxtProvincia").result(function (event, data, formatted) {
                _idProvinciaSeleccionado = ((data != undefined) ? data.id : "");
                $("#jqTxtDepartamento").val("");
                _idDepartamentoSeleccionado = '';
                $("#jqTxtPartido").val("");
                _Localidades = [];
                _idLocalidadSeleccionado = '';
                 buscarDepartamentos();
                 procesarDomicilio();
            });
        };
        buscarProvincias();
     
        function buscarDepartamentos() {
            $.ajax({
                type: "post",
                url: "/Website/WebServices/PerfilUsuario.asmx/getDepartamentos",
                data: JSON.stringify({ idProvincia: _idProvinciaSeleccionado }),
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                beforeSend: function () {
                    jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                },
                success: function (result) {
                    $.alerts._hide();
                    _departamentos = result.d;
                    _Localidades = [];
                    _idLocalidadSeleccionado = '';
                    $("#jqTxtPartido").unautocomplete();
                    $("#jqTxtPartido").val("");
                    cargarComboDepartamentos();
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    $.alerts._hide();
                    jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
                }
            });
        };

        function cargarComboDepartamentos() {
            $("#jqTxtDepartamento").unautocomplete();
            var __DepartamentoTemp = "";
            $('#jqTxtDepartamento').focus(function () {
                __DepartamentoTemp = $('#jqTxtDepartamento').val();
                $('#jqTxtDepartamento').val("");
            });
            $('#jqTxtDepartamento').blur(function () {
                if ($('#jqTxtDepartamento').val() == "") {
                    $('#jqTxtDepartamento').val(__DepartamentoTemp);
                }
            });
            $("#jqTxtDepartamento").ZaeAutocomplete(_departamentos, {
                minChars: 0,
                width: 150,
                max: 300,
                mustMatch: true,
                matchContains: true,
                autoFill: false,
                formatItem: function (row, i, max) {
                    return row.nombre;
                },
                formatMatch: function (row, i, max) {
                    return row.nombre;
                },
                formatResult: function (row) {
                    return row.nombre;
                }
            });
            $("#jqTxtDepartamento").result(function (event, data, formatted) {
                _idDepartamentoSeleccionado = ((data != undefined) ? data.id : "");
                _idLocalidadSeleccionado = '';
                _Localidades=[];
                $("#jqTxtPartido").unautocomplete();
                buscarLocalidades();
                procesarDomicilio()
            });
        };

        function buscarLocalidades() {
            $.ajax({
                type: "post",
                url: "/Website/WebServices/PerfilUsuario.asmx/getLocalidades",
                data: JSON.stringify({ idDepartamento: _idDepartamentoSeleccionado }),
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                beforeSend: function () {
                    jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                },
                success: function (result) {
                    $.alerts._hide();
                    _Localidades = result.d;
                    cargarComboLocalidades();
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    $.alerts._hide();
                    jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
                }
            });
        };

        function cargarComboLocalidades() {
            $("#jqTxtPartido").unautocomplete();
            var __PartidoTemp = "";
            $('#jqTxtPartido').focus(function () {
                __PartidoTemp = $('#jqTxtPartido').val();
                $('#jqTxtPartido').val("");
            });
            $('#jqTxtPartido').blur(function () {
                if ($('#jqTxtPartido').val() == "") {
                    $('#jqTxtPartido').val(__PartidoTemp);
                }
            });
            $("#jqTxtPartido").ZaeAutocomplete(_Localidades, {
                minChars: 0,
                width: 150,
                max: 300,
                mustMatch: true,
                matchContains: true,
                autoFill: false,
                formatItem: function (row, i, max) {
                    return row.nombre;
                },
                formatMatch: function (row, i, max) {
                    return row.nombre;
                },
                formatResult: function (row) {
                    return row.nombre;
                }
            });
            $("#jqTxtPartido").result(function (event, data, formatted) {
                _idLocalidadSeleccionado = ((data != undefined) ? data.id : "");
                procesarDomicilio()
            });
        };
    
        function procesarDomicilio() {
            var _calle ="";
            $("#jqTxtDomicilioABM").val(_calle + " , " + $("#jqTxtPartido").val() + " , " + $("#jqTxtDepartamento").val() + " , " + $("#jqTxtProvincia").val());
            addresspickerMap.focus();
            addresspickerMap.addresspicker("reloadPosition");
        };
        function buscarDomicilios() {
            $.ajax({
                type: "post",
                url: "/Website/WebServices/PerfilUsuario.asmx/getDomicilios",
                data: JSON.stringify(),
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                beforeSend: function () {
                    jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                },
                success: function (result) {
                    $.alerts._hide();
                    _domicilios = result.d;
                    cargarComboDomicilios();
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    $.alerts._hide();
                    jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
                }
            });
        };

        function cargarComboDomicilios() {
            $("#jqTxtDomicilio").unautocomplete();
            var __domicilioTemp = "";
            $('#jqTxtDomicilio').focus(function () {
                __domicilioTemp = $('#jqTxtDomicilio').val();
                $('#jqTxtDomicilio').val("");
            });
            $('#jqTxtDomicilio').blur(function () {
                if ($('#jqTxtDomicilio').val() == "") {
                    $('#jqTxtDomicilio').val(__domicilioTemp);
                }
            });
            $("#jqTxtDomicilio").ZaeAutocomplete(_domicilios, {
                minChars: 0,
                width: 500,
                max: 50,
                autoFill: false,
                formatItem: function (row, i, max) {
                    return row.descripcion;
                },
                formatMatch: function (row, i, max) {
                    return row.descripcion;
                },
                formatResult: function (row) {
                    return row.descripcion;
                }
            });
            $("#jqTxtDomicilio").result(function (event, data, formatted) {
                if(data != undefined){
                    _idCodPostalSeleccionado = data.idCodPostal;
                    $("#jqTxtCodPostal").val(data.codigoPostal);
                    _idDomicilioSeleccionado = data.id;
                    $("#jqTxtDomicilioABM").val(data.descripcion);
                    _idDepartamentoSeleccionado = data.idDepartamento;
                    $("#jqTxtDepartamento").val(data.departamento);
                    _idLocalidadSeleccionado = data.idLocalidad;
                    $("#jqTxtPartido").val(data.localidad);
                    _idProvinciaSeleccionado = data.idProvincia;
                    $("#jqTxtProvincia").val(data.provincia);

                    var gmarker = addresspickerMap.addresspicker("marker");
                    gmarker.setPosition(new google.maps.LatLng(data.latitud, data.longitud));
                    gmarker.setVisible(true);
                    addresspickerMap.addresspicker("updatePosition");
                    addresspickerMap.addresspicker("reloadPosition");
                
                }else{
                    limpiarDomicilios();
                }
            });
            if (_domicilios.length > 0) {
                $("#jqTxtDomicilio").val(_domicilios[0].descripcion);
                _idDomicilioSeleccionado = _domicilios[0].id;
            }
        };
        buscarDomicilios();
        function limpiarDomicilios() {
            _idCodPostalSeleccionado = "";
            $("#jqTxtCodPostal").val("");
            _idDomicilioSeleccionado = "";
            $("#jqTxtDomicilio").val("");
            _idDepartamentoSeleccionado = "";
            $("#jqTxtDepartamento").val("");
            _idLocalidadSeleccionado = "";
            $("#jqTxtPartido").val("");
            _idProvinciaSeleccionado = "";
            $("#jqTxtProvincia").val("");
        };
        function altaDomicilio() {
            $.ajax({
                type: "post",
                url: "/Website/WebServices/PerfilUsuario.asmx/altaDomicilio",
                data: JSON.stringify({
                    idUsuario: _usuario.idUsuario,
                    domicilio: $("#jqTxtDomicilioABM").val(),
                    idLocalidad: _idLocalidadSeleccionado,
                    latitud: $("#lat").val(),
                    longitud: $("#lng").val(),
                    idCodPostal: _idCodPostalSeleccionado 
                }),
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                beforeSend: function () {
                    jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                },
                success: function (result) {
                    $.alerts._hide();
                    jInfo($('#<%= msAltaDomicilioOk.ClientID %>').text(), 'Info');
                    buscarDomicilios();
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    $.alerts._hide();
                    jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
                }
            });
        };

        function modificarDomicilio() {
            $.ajax({
                type: "post",
                url: "/Website/WebServices/PerfilUsuario.asmx/modificarDomicilio",
                data: JSON.stringify({
                    idDomicilio: _idDomicilioSeleccionado,
                    domicilio: $("#jqTxtDomicilioABM").val(),
                    idLocalidad: _idLocalidadSeleccionado,
                    latitud: $("#lat").val(),
                    longitud: $("#lng").val(),
                    idCodPostal: _idCodPostalSeleccionado 
                }),
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                beforeSend: function () {
                    jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                },
                success: function (result) {
                    $.alerts._hide();
                    jInfo($('#<%= msModiDomicilioOk.ClientID %>').text(), 'Info');
                    buscarDomicilios();
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    $.alerts._hide();
                    jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
                }
            });
        };



        function bajaDomicilio() {
            $.ajax({
                type: "post",
                url: "/Website/WebServices/PerfilUsuario.asmx/bajaDomicilio",
                data: JSON.stringify({ idDomicilio: _idDomicilioSeleccionado }),
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                beforeSend: function () {
                    jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                },
                success: function (result) {
                    $.alerts._hide();
                    jInfo($('#<%= msBajaDomicilioOk.ClientID %>').text(), 'Info');
                    buscarDomicilios();
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    $.alerts._hide();
                    jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
                }
            });
        };
        function modificarUsuario() {
            var _esCuit = "";
            if ($("#jqRdCuit").is(':checked')){
                _esCuit= 1;
            }else if ($("#jqRdCuil").is(':checked')){
                _esCuit= 0;
            }
            $.ajax({
                type: "post",
                url: "/Website/WebServices/PerfilUsuario.asmx/modificarUsuario",
                data: JSON.stringify({
                    contrasena: jQuery.trim($('#jqTextContrasena').val()),
                    email: jQuery.trim($('#jqTxtEmail').val()),
                    nombre: jQuery.trim($('#jqTxtNombre').val()),
                    apellido: jQuery.trim($('#JqTxtApellido').val()),
                    razonSocial: jQuery.trim($('#JqTxtRazonSocial').val()),
                    esCuit: _esCuit,
                    cuit_cuil: jQuery.trim($('#jqTxtCuilCuit').val())
                }),
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                beforeSend: function () {
                    jProcess($('#<%= msgProcesando.ClientID %>').text(), 'Procesando');
                },
                success: function (result) {
                    $.alerts._hide();
                    recargarUsuario();
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    $.alerts._hide();
                    jError($('#<%= msgError.ClientID %>').text() + "<br> " + xhr.status + "<br> " + thrownError, 'Error');
                }
            });
        };

        function recargarUsuario() {
            $.ajax({
                type: "post",
                url: "/Website/WebServices/PerfilUsuario.asmx/recargarUsuario",
                data: JSON.stringify({}),
                contentType: "application/json;charset=utf-8",
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
                }
            });
        };
    //]]>
    </script>
</asp:Content>