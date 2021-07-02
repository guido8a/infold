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
    <title>${tipo == '1' ? 'Instructor' : 'Participante'} - Datos</title>

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

<g:form class="form-horizontal" name="frmDatos" role="form" action="saveDatos" method="POST">
    <g:hiddenField name="id" value="${participante?.id}" />
    <g:hiddenField name="tipo" value="${tipo}" />

    <div class="progress-bar-wrapper"></div>

    <div class="col-md-12" style="background-color: #d0d0d0; padding: 5px">
        <div class="col-md-10 btn-group" style="float: left;">
            <a href="#" class="btn btn-gris btnRetornar" ><i class="fa fa-arrow-left"></i> Salir</a>
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
                <p class="numeroPaso">1</p>
                <h1 class="textoPaso">Datos</h1>
                <div class="col-md-10">
                    <h3> Datos personales  - ${participante?.tipo == '1' ? 'Instructor' : 'Participante'}</h3>

                    <div class="col-md-12" style="margin-bottom: 10px">
                        <div class="form-group ${hasErrors(bean: 'participante', field: 'cedula', 'error')}">
                            <span class="grupo">
                                <label class="col-md-3 control-label text-info">
                                    Cédula
                                </label>
                                <div class="col-md-3">
                                    <g:textField name="cedula" class="form-control" readonly="" title="Cédula"
                                                 value="${participante?.cedula ?: cedula}" style="font-size: 16px"/>
                                </div>
                            </span>
                        </div>
                    </div>

                    <div class="col-md-12" style="margin-bottom: 10px">
                        <div class="form-group ${hasErrors(bean: 'participante', field: 'nombre', 'error')}">
                            <span class="grupo">
                                <label class="col-md-3 control-label text-info">
                                    Nombres
                                </label>
                                <div class="col-md-6">
                                    <g:textField name="nombre" maxlength="31" class="form-control required" title="Nombres"
                                                 value="${participante?.nombre ?: ''}" style="background-color: #ffffef"/>
                                </div>
                            </span>
                        </div>
                    </div>

                    <div class="col-md-12" style="margin-bottom: 10px">
                        <div class="form-group ${hasErrors(bean: 'participante', field: 'apellido', 'error')}">
                            <span class="grupo">
                                <label class="col-md-3 control-label text-info">
                                    Apellidos
                                </label>
                                <div class="col-md-6">
                                    <g:textField name="apellido" maxlength="31" class="form-control required" title="Apellido"
                                                 value="${participante?.apellido ?: ''}" style="background-color: #ffffef"/>
                                </div>
                            </span>
                        </div>
                    </div>

                    <div class="col-md-12" style="margin-bottom: 10px">
                        <div class="form-group ${hasErrors(bean: 'participante', field: 'mail', 'error')}">
                            <span class="grupo">
                                <label class="col-md-3 control-label text-info">
                                    Mail
                                </label>
                                <div class="col-md-6">
                                    <g:textField name="mail" maxlength="63" class="email mail form-control" title="Email"
                                                 value="${participante?.mail ?: ''}"/>
                                </div>
                            </span>
                        </div>
                    </div>

                    <div class="col-md-12" style="margin-bottom: 10px">
                        <div class="form-group ${hasErrors(bean: 'participante', field: 'telefono', 'error')}">
                            <span class="grupo">
                                <label class="col-md-3 control-label text-info">
                                    Teléfono
                                </label>
                                <div class="col-md-3">
                                    <g:textField name="telefono" maxlength="31" class="digits form-control" title="Teléfono"
                                                 value="${participante?.telefono ?: ''}"/>
                                </div>
                            </span>
                            <span class="grupo">
                                <label for="genero" class="col-md-1 control-label text-info">
                                    Género
                                </label>
                                <div class="col-md-3">
                                    <g:select name="genero" from="${['M':'Masculino', 'F':'Femenino', 'G':'GLBTI+']}"
                                              class="form-control" optionKey="key" optionValue="value"
                                              value="${participante?.genero}"/>
                                </div>
                            </span>
                        </div>
                    </div>

%{--                    <div class="col-md-12" style="margin-bottom: 10px">--}%
%{--                        <div class="form-group ${hasErrors(bean: 'participante', field: 'genero', 'error')}">--}%

%{--                        </div>--}%
%{--                    </div>--}%

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

    $(".btnRetornar").click(function () {
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

    ProgressBar.init(['Datos', 'Ubicación', 'Afiliación',  'Estudios', 'Trabajo'],
        'Datos', 'progress-bar-wrapper');

    $(".btnSiguiente").click(function () {
        submitFormDatos();
    });

    function submitFormDatos() {
        var $form = $("#frmDatos");
        // var $btn = $("#dlgCreateEdit").find("#btnSave");
        if ($form.valid()) {
            // $btn.replaceWith(spinner);
            var l = cargarLoader("Grabando...");
            var data = $form.serialize();
            $.ajax({
                type    : "POST",
                url     : '${createLink(action:'saveDatos')}',
                data: data,
                success : function (msg) {
                    l.modal("hide");
                    var parts = msg.split("_");
                    if (parts[0] == "ok") {
                            location.href="${createLink(controller: 'participante', action: 'wizardGeo')}?id=" + parts[1];
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