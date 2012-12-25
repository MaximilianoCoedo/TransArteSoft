<%@ Page Language="C#" MasterPageFile="~/MasterPages/BackEnd.master" AutoEventWireup="true" CodeFile="Calendario.aspx.cs" Inherits="_Default" title="Home" culture="auto" meta:resourcekey="PageResource1" uiculture="auto"%>
<%@ MasterType VirtualPath="~/MasterPages/BackEnd.master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" Runat="Server">
<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAIKI1RJamIEvP7_Du5ZGi6xS4M_PhMYp3D1A5cqeLLIOnkUYWYhS8jdwSdUjZxBwswqHipWYzfju7fA" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        
        var date = new Date();
        var d = date.getDate();
        var m = date.getMonth();
        var y = date.getFullYear();

        $('#calendar').fullCalendar({
            theme: true,
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },
            editable: true,
            eventSources: [{
                events: [{
                    title: 'Reunion con Museo del humor',
                    start: new Date(y, m, 1),
                    end: new Date(y, m, 2)
                }],
                backgroundColor: 'green',
                borderColor: 'red',
                textColor: 'yellow'
                }, [{
                    title: 'Servicio de transporte Museo de la ciudad',
                    start: new Date(y, m, d - 12),
                    end: new Date(y, m, d - 6)
                },{
                    title: 'Servicio de transporte Museo de Arte Popular José Hernández',
                    start: new Date(y, m, d - 4),
                    end: new Date(y, m, d - 2)
                }]
            ]
        });
    });
</script>


<div class="sidebar-at-right" id="main">
    <div id="content">
    <center>
       <div id="calendar"></div>
    </center>
</div>
       <div id="sidebar" style="text-align: left; text-align: justify;" class="ui-corner-all">
            <!-- ayuda -->
            <asp:Label ID="Label4" runat="server" ForeColor="Black" meta:resourcekey="LabelEmpresaTituloAyuda"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" ForeColor="Black" meta:resourcekey="LabelEmpresaDescripcionAyuda"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label6" runat="server" ForeColor="Black" meta:resourcekey="LabelEmpresaPieAyuda"></asp:Label>
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