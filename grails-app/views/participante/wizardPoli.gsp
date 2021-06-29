<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 23/06/21
  Time: 11:11
--%>

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
    <title>${tipo == '1' ? 'Instructor' : 'Participante'} - Afiliación Política</title>

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

<g:form class="form-horizontal" name="frmPoli" role="form" action="savePoli" method="POST">
    <g:hiddenField name="id" value="${participante?.id}" />
    <g:hiddenField name="tipo" value="${tipo}" />
    <g:hiddenField name="completado" value="${3}" />

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
                <p class="numeroPaso">3</p>
                <h1 class="textoPaso">Afiliación</h1>
                <div class="col-md-8">
                    <h3> Afiliación  - ${participante?.tipo == '1' ? 'Instructor' : 'Participante'}</h3>

                    <div class="col-md-12" style="margin-bottom: 10px">
                        <div class="form-group">
                            <span class="grupo">
                                <label class="col-md-3 control-label text-info">
                                    Partido Político
                                </label>
                                <div class="col-md-6">
                                    <g:select name="partido" from="${infold.Partido.list().sort{it.descripcion}}" class="form-control" optionKey="id" optionValue="descripcion" value="${participante?.partido?.id}"/>
                                </div>
                            </span>
                        </div>
                    </div>

                    <div class="col-md-12" style="margin-bottom: 10px">
                        <div class="form-group ${hasErrors(bean: 'participante', field: 'organizacionSocial', 'error')}">
                            <span class="grupo">
                                <label class="col-md-3 control-label text-info">
                                    Organización Social
                                </label>
                                <div class="col-md-6">
                                    <g:textArea name="organizacionSocial" maxlength="255" style='resize: none; height: 80px' class="form-control" title="Organización Social"
                                                 value="${participante?.organizacionSocial ?: ''}"/>
                                </div>
                            </span>
                        </div>
                    </div>

                    <div class="col-md-12" style="margin-bottom: 10px">
                        <div class="form-group ${hasErrors(bean: 'participante', field: 'movimientoPolitico', 'error')}">
                            <span class="grupo">
                                <label class="col-md-3 control-label text-info">
                                    Movimiento Político
                                </label>
                                <div class="col-md-6">
                                    <g:textArea name="movimientoPolitico" maxlength="255" style='resize: none; height: 80px' class="form-control" title="Movimiento Político"
                                                value="${participante?.movimientoPolitico ?: ''}"/>
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

    $(".btnRetornar").click(function () {
        submitFormPoli(0);
    });

    ProgressBar.init(['Datos', 'Ubicación', 'Afiliación',  'Estudios', 'Trabajo'],
        'Afiliación', 'progress-bar-wrapper');

    $(".btnSiguiente").click(function () {
        submitFormPoli(1);
    });

    function submitFormPoli(band) {
        var $form = $("#frmPoli");
        // var $btn = $("#dlgCreateEdit").find("#btnSave");
        if ($form.valid()) {
            // $btn.replaceWith(spinner);
            var l = cargarLoader("Grabando...");
            var data = $form.serialize();
            $.ajax({
                type    : "POST",
                url     : '${createLink(action:'saveAfiliacion')}',
                // data: data,
                data: {
                    id: $("#id").val(),
                    tipo: $("#tipo").val(),
                    completado: $("#completado").val(),
                    partido: $("#partido option:selected").val(),
                    organizacionSocial: $("#organizacionSocial").val(),
                    movimientoPolitico: $("#movimientoPolitico").val()
                },
                success : function (msg) {
                    l.modal("hide");
                    var parts = msg.split("_");
                    if (parts[0] == "ok") {
                        if(band == 1){
                            location.href="${createLink(controller: 'participante', action: 'wizardEdu')}?id=" + parts[1];
                        }else{
                            location.href="${createLink(controller: 'participante', action: 'wizardGeo')}?id=" + parts[1];
                        }
                    } else {
                        log("Error al guardar los datos","error");
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