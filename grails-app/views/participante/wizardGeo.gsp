<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 10/03/21
  Time: 12:44
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>${tipo == '1' ? 'Instructor' : 'Participante'} - Ubicación</title>

    <asset:stylesheet src="/bar/main.css"/>
    <asset:javascript src="/bar/progress-bar.js"/>

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

    </style>

</head>

<body>

<g:form class="form-horizontal" name="frmGeo" role="form" action="saveGeo" method="POST">
    <g:hiddenField name="id" value="${participante?.id}" />
    <g:hiddenField name="tipo" value="${tipo}" />

    <div class="progress-bar-wrapper"></div>

    <div class="col-md-12" style="background-color: #d0d0d0; padding: 5px">
        <div class="col-md-10 btn-group" style="float: left;">
            <a href="#" class="btn btn-rojo btnRetornar" ><i class="fa fa-arrow-left"></i> Anterior</a>
            <a href="#" class="btn btn-gris btnSalir" ><i class="fa fa-door-open"></i> Salir</a>
        </div>
        <div class="col-md-2 btn-group">
            <a href="#" class="btn btn-rojo btnSiguiente flush-right" >Siguiente <i class="fa fa-arrow-right"></i></a>
        </div>
    </div>

    <div class="card">
        <div class="card-header">
            &nbsp;
        </div>
        <div class="card-body">
        </div>
    </div>

    <div class="card" style="width: 100%; height: 300px">
        <div class="card-body">

            <div style="margin-top: 10px">
                <p class="numeroPaso">2</p>
                <h1 class="textoPaso">Ubicación</h1>
                <div class="col-md-8">
                    <h3> Ubicación  - ${participante?.tipo == '1' ? 'Instructor' : 'Participante'}</h3>

                    <div class="col-md-12" style="margin-bottom: 10px">
                        <div class="form-group">
                            <span class="grupo">
                                <label class="col-md-3 control-label text-info">
                                    Provincia
                                </label>
                                <div class="col-md-6">
                                    <g:select name="provincia" from="${geografia.Provincia.list().sort{it.nombre}}" class="form-control" optionKey="id" optionValue="nombre" value="${participante?.parroquia?.canton?.provincia?.id}"/>
                                </div>
                            </span>
                        </div>
                    </div>

                    <div class="col-md-12" style="margin-bottom: 10px">
                        <div class="form-group">
                            <span class="grupo">
                                <label class="col-md-3 control-label text-info">
                                    Cantón
                                </label>
                                <div class="col-md-6" id="divCanton">

                                </div>
                            </span>
                        </div>
                    </div>

                    <div class="col-md-12" style="margin-bottom: 10px">
                        <div class="form-group">
                            <span class="grupo">
                                <label class="col-md-3 control-label text-info">
                                    Parroquia
                                </label>
                                <div class="col-md-6" id="divParroquia">

                                </div>
                            </span>
                        </div>
                    </div>


                    <div class="col-md-12" style="margin-bottom: 10px">
                        <div class="form-group ${hasErrors(bean: 'participante', field: 'areaTrabajo', 'error')}">
                            <span class="grupo">
                                <label class="col-md-3 control-label text-info">
                                    Área de trabajo
                                </label>
                                <div class="col-md-6">
                                    <g:select name="areaTrabajo" from="${infold.AreaTrabajo.list().sort{it.descripcion}}" class="form-control" optionKey="id" optionValue="descripcion" value="${participante?.areaTrabajo?.id}"/>
                                </div>
                            </span>
                        </div>
                    </div>

                    <div class="col-md-12" style="margin-bottom: 10px">
                        <div class="form-group ${hasErrors(bean: 'participante', field: 'grupoEtario', 'error')}">
                            <span class="grupo">
                                <label class="col-md-3 control-label text-info">
                                    Grupo Etario
                                </label>
                                <div class="col-md-6">
                                    <g:select name="grupoEtario" from="${infold.GrupoEtario.list().sort{it.descripcion}}" class="form-control" optionKey="id" optionValue="descripcion" value="${participante?.grupoEtario?.id}"/>
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

</g:form>

<script type="text/javascript">

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
                        location.href="${createLink(controller: 'inicio', action: 'index')}"
                    }
                }
            }
        });
    });

    $("#provincia").change(function () {
        var id = $(this).val();
        cargarCanton(id)
    });

    cargarCanton($("#provincia").val());

    function cargarCanton(id){
        $.ajax({
            type: 'POST',
            url: '${createLink(controller: 'canton', action: 'canton_ajax')}',
            data:{
                id: id,
                participante: $("#id").val()
            },
            success: function (msg) {
                $("#divCanton").html(msg)
            }
        });
    }

    $(".btnRetornar").click(function () {
        submitFormGeo(0);
    });

    ProgressBar.init(['Datos', 'Ubicación', 'Afiliación',  'Estudios', 'Trabajo'],
        'Ubicación', 'progress-bar-wrapper');

    $(".btnSiguiente").click(function () {
        submitFormGeo(1);
    });

    function submitFormGeo(band) {
        var $form = $("#frmGeo");
        // var $btn = $("#dlgCreateEdit").find("#btnSave");
        if ($form.valid()) {
            // $btn.replaceWith(spinner);
            var l = cargarLoader("Grabando...");
            var data = $form.serialize();
            $.ajax({
                type    : "POST",
                url     : '${createLink(action:'saveGeo')}',
                // data: data,
                data: {
                    id: $("#id").val(),
                    tipo: $("#tipo").val(),
                    parroquia: $("#parroquia option:selected").val(),
                    areaTrabajo: $("#areaTrabajo option:selected").val(),
                    grupoEtario: $("#grupoEtario option:selected").val()
                },
                success : function (msg) {
                    l.modal("hide");
                    var parts = msg.split("_");
                    if (parts[0] == "ok") {
                        if(band == 1){
                            location.href="${createLink(controller: 'participante', action: 'wizardPoli')}?id=" + parts[1];
                        }else{
                            location.href="${createLink(controller: 'participante', action: 'wizardDatos')}?id=" + parts[1];
                        }
                    } else {
                        log("Error al guardar los datos personales","error");
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