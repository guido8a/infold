<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 22/06/21
  Time: 9:44
--%>

<%@ page import="infold.Partido" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>${tipo == 'I' ? 'Instructor' : 'Participante'} - Trabajo</title>

    <asset:stylesheet src="/bar/main.css"/>
    <asset:javascript src="/bar/progress-bar.js"/>

    <asset:stylesheet src="/apli/jquery.multilineSelectmenu.css"/>
    <asset:stylesheet src="/apli/jquery-ui.theme.css"/>
    <asset:javascript src="/apli/jquery.multilineSelectmenu.js"/>

    <style>

    .numeroPaso{
        background-color: #E6E6E6;
        -webkit-border-radius: 300px;
        -moz-border-radius: 300px;
        border-radius: 300px;
        color: #AF5B00;
        float: left;
        font-size: 36px;
        height: 70px;
        margin-right: 10px;
        text-align: center;
        width: 70px;
        font-weight: bold;
        padding-top: 8px;
    }

    .textoPaso {
        color: #AF5B00;
        font-size: 36px;
        float: left;
        margin-top: 8px;
    }

    .card {
        border: green;
        width: 100%;
        -webkit-box-shadow : 7px 7px 5px 0px rgba(50, 50, 50, 0.75);
        -moz-box-shadow    : 7px 7px 5px 0px rgba(50, 50, 50, 0.75);
        box-shadow         : 7px 7px 5px 0px rgba(50, 50, 50, 0.75);
    }

    li.ui-menu-item {
        padding: 5px;
        border-bottom: solid 1px #ddd;
    }

    </style>

</head>

<body>

<g:form class="form-horizontal" name="frmTrabajo" role="form" action="savePoli" method="POST">
    <g:hiddenField name="id" value="${participante?.id}" />
    <g:hiddenField name="tipo" value="${tipo}" />
    <g:hiddenField name="completado" value="${5}" />

    <div class="progress-bar-wrapper"></div>

    <div class="col-md-12" style="background-color: #d0d0d0; padding: 5px">
        <div class="col-md-10 btn-group" style="float: left;">
            <a href="#" class="btn btn-rojo btnRetornar" ><i class="fa fa-arrow-left"></i> Anterior</a>
            <a href="#" class="btn btn-gris btnSalir" ><i class="fa fa-door-open"></i> Salir</a>
        </div>
        <div class="col-md-2 btn-group">
            <a href="#" class="btn btn-rojo btnSiguiente flush-right" >Terminar <i class="fa fa-arrow-right"></i></a>
        </div>
    </div>

    <div class="card">
        <div class="card-header">
            &nbsp;
        </div>
        <div class="card-body">
        </div>
    </div>

%{--    <div class="card" style="width: 100%; height: ${participante?.tipo == '1' ? '450px' : '400px'}">--}%
    <div class="container-fluid content-row">
    <div class="row" style="background-color: white; box-shadow: 0px 0px 10px #444; display: inline-block; margin-bottom: 20px">
    <div>
        <div class="card-body">
            <div style="margin-top: 10px">
                <p class="numeroPaso" style="margin-left: 10px">5</p>
                <h1 class="textoPaso">Trabajo - ${participante?.tipo == 'I' ? 'Instructor' : 'Participante'}</h1>
                <div class="col-md-12">
                    <g:if test="${tipo == 'I'}">
                        <div class="col-md-12" style="margin-bottom: 10px">
                            <div class="form-group">
                                <span class="grupo">
                                    <label class="col-md-3 control-label text-info">
                                        Hoja de vida
                                    </label>
                                    <div class="col-md-6">
                                        <a href="#" class="btn btn-rojo" id="btnHojaVida" title="Agregar hoja de vida">
                                            <i class="fa fa-file-archive"></i> Cargar hoja de vida
                                        </a>
                                        <g:if test="${participante?.hojaVida}">
                                            Documento existente: <strong>${participante?.hojaVida}</strong>
                                        </g:if>
                                    </div>
                                </span>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group ${hasErrors(bean: 'participante', field: 'resumenTrabajo', 'error')}">
                                <span class="grupo">
                                    <label class="col-md-3 control-label text-info">
                                        Resumen de trabajo
                                    </label>
                                    <div class="col-md-8">
                                        <g:textArea name="resumenTrabajo" maxlength="1024" style='resize: none; height: 60px' class="form-control" title="Resumen de trabajo"
                                                    value="${participante?.resumenTrabajo ?: ''}"/>
                                    </div>
                                </span>
                            </div>
                        </div>
                    </g:if>


                    <div class="col-md-12" style="margin-bottom: 5px">
                        <div class="form-group ${hasErrors(bean: 'participante', field: 'sectorEconomico')}">
                            <span class="grupo">
                                <label class="col-md-3 control-label text-info">
                                    Sector Econ??mico
                                </label>
                                <div class="col-md-8">
                                    <elm:selectMultiple from="${infold.SectorEconomico.list().sort{it.descripcion}}"
                                        id="sectorEconomico" selected="3"
                                        class="form-control input-sm selectpicker" letras="80"
                                        value="${participante?.sectorEconomico?.id}"/>
                                </div>
                            </span>
                        </div>
                    </div>

                    <div class="col-md-12" style="margin-bottom: 5px">
                        <div class="form-group ${hasErrors(bean: 'participante', field: 'fortaleza1', 'error')} required">
                            <span class="grupo">
                                <label class="col-md-3 control-label text-info">
                                    Fortaleza uno
                                </label>
                                <div class="col-md-8">
                                    <g:textArea name="fortaleza1" maxlength="255" style='resize: none; height: 60px' class="form-control" title="Fortaleza 1"
                                                value="${participante?.fortaleza1 ?: ''}"/>
                                </div>
                            </span>
                        </div>
                    </div>

                    <div class="col-md-12" style="margin-bottom: 10px">
                        <div class="form-group ${hasErrors(bean: 'participante', field: 'fortaleza2', 'error')} required">
                            <span class="grupo">
                                <label class="col-md-3 control-label text-info">
                                    Fortaleza dos
                                </label>
                                <div class="col-md-8">
                                    <g:textArea name="fortaleza2" maxlength="255" style='resize: none; height: 60px' class="form-control" title="Fortaleza 2"
                                                value="${participante?.fortaleza2 ?: ''}"/>
                                </div>
                            </span>
                        </div>
                    </div>

                    <div class="col-md-12" style="margin-bottom: 10px">
                        <div class="form-group ${hasErrors(bean: 'participante', field: 'fortaleza3', 'error')} required">
                            <span class="grupo">
                                <label class="col-md-3 control-label text-info">
                                    Fortaleza tres
                                </label>
                                <div class="col-md-8">
                                    <g:textArea name="fortaleza3" maxlength="255" style='resize: none; height: 60px' class="form-control" title="Fortaleza 3"
                                                value="${participante?.fortaleza3 ?: ''}"/>
                                </div>
                            </span>
                        </div>
                    </div>
                </div>

                <div class="col-md-12" style="margin-bottom: 10px">
                    <div class="col-md-3 btn-group" style="float: right">.
                    </div>
                </div>


            </div>
        </div>
    </div>
    </div>
    </div>

</g:form>

<script type="text/javascript">

    $("#sectorEconomico").multilineSelectmenu();
    $("#select").multilineSelectmenu();
    $('#button').click(function(){
        $('#select').append($('<option>').html('new option'));
        setTimeout(function(){
            $("#select").multilineSelectmenu();
        }, 3000);

    })
    $('#button').click(function(){
        $('#sectorEconomico').append($('<option>').html('new option'));
        setTimeout(function(){
            $("#sectorEconomico").multilineSelectmenu();
        }, 3000);

    })


    $("#btnHojaVida").click(function () {
        cargarHoja($("#id").val())
    });

    function cargarHoja(id) {
        $.ajax({
            type    : "POST",
            url     : "${createLink(controller: 'participante', action:'hoja_ajax')}",
            data    : {
                id:id
            },
            success : function (msg) {
                var b = bootbox.dialog({
                    id      : "dlgHoja",
                    title   : "Hoja de vida",
                    // class : "modal-lg",
                    message : msg,
                    buttons : {
                        cancelar : {
                            label     : "<i class='fa fa-times'></i> Cerrar",
                            className : "btn-gris",
                            callback  : function () {
                                var l = cargarLoader("Cargando...");
                                location.href="${createLink(controller: 'participante', action: 'wizardFor')}?id=" + ${participante?.id};
                            }
                        }
                    } //buttons
                }); //dialog
            } //success
        }); //ajax
    } //createEdit



    $(".btnSalir").click(function () {
        bootbox.dialog({
            title   : "Alerta",
            message : "<i class='fa fa-exclamation-triangle fa-3x pull-left text-warning text-shadow'></i>" +
                "<p style='font-size: 14px; font-weight: bold'>" + "&nbsp; El ingreso de datos no se encuentra " +
                "completo. <br> &nbsp; Desea salir?" + "</p>",
            buttons : {
                cancelar : {
                    label     : "<i class='fa fa-times'></i> Cancelar",
                    className : "btn-primary",
                    callback  : function () {
                    }
                },
                aceptar : {
                    label     : "<i class='fa fa-check'></i> Aceptar",
                    className : "btn-success",
                    callback  : function () {
                        <g:if test="${participante?.estado == 'S'}">
                        location.href="${createLink(controller: 'participante', action: 'participante', params: [id: participante?.id])}";
                        </g:if>
                        <g:else>
                        location.href="${createLink(controller: 'inicio', action: 'index')}";
                        </g:else>
                    }
                }
            }
        });
    });

    $(".btnRetornar").click(function () {
        submitFormTrabajo(0);
    });

    ProgressBar.init(['Datos', 'Ubicaci??n', 'Afiliaci??n',  'Estudios', 'Trabajo'],
        'Trabajo', 'progress-bar-wrapper');

    $(".btnSiguiente").click(function () {
        var f1 = $("#fortaleza1").val();
        var f2 = $("#fortaleza2").val();
        var f3 = $("#fortaleza3").val();
        if(f1 == '' && f2 == '' && f3 == ''){
            bootbox.alert("<i class='fa fa-exclamation-triangle fa-2x text-warning'></i> Debe ingresar al menos una fortaleza")
        }else{
            submitFormTrabajo(1);
        }
    });

    function submitFormTrabajo(band) {
        var $form = $("#frmTrabajo");
        // var $btn = $("#dlgCreateEdit").find("#btnSave");
        if ($form.valid()) {
            // $btn.replaceWith(spinner);
            var l = cargarLoader("Grabando...");
            var data = $form.serialize();
            $.ajax({
                type    : "POST",
                url     : '${createLink(action:'savePoli')}',
                // data: data,
                data: {
                    id: $("#id").val(),
                    tipo: $("#tipo").val(),
                    completado: $("#completado").val(),
                    resumenTrabajo: $("#resumenTrabajo").val(),
                    sectorEconomico: $("#sectorEconomico").val(),
                    fortaleza1: $("#fortaleza1").val(),
                    fortaleza2: $("#fortaleza2").val(),
                    fortaleza3: $("#fortaleza3").val()
                },
                success : function (msg) {
                    l.modal("hide");
                    var parts = msg.split("_");
                    if (parts[0] == "ok") {
                        if(band == 1){
                            location.href="${createLink(controller: 'participante', action: 'participante')}?id=" + parts[1];
                        }else{
                            location.href="${createLink(controller: 'participante', action: 'wizardEdu')}?id=" + parts[1];
                        }
                    } else {
                        if(parts[0] == 'er'){
                             bootbox.alert("<i class='fa fa-exclamation-triangle fa-2x'></i> Ingrese su hoja de vida")
                        }else{
                            log("Error al guardar los datos","error");
                        }
                    }
                }
            });
        } else {
            return false;
        } //else
    }

</script>

</body>
</html>