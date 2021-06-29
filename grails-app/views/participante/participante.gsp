<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <meta name="layout" content="main">
    <title>${participante?.tipo == '1' ? 'Instructor - '  : 'Participante - '}${participante?.nombre + " " + participante?.apellido}</title>

    <style type="text/css">
    .mediano {
        margin-top: 5px;
        padding-top: 9px;
        height: 30px;
        font-size: inherit;
        /*font-size: medium;*/
        text-align: right;
    }

    .sobrepuesto {
        position: absolute;
        top: 3px;
        font-size: 14px;
    }

    .negrita {
        font-weight: bold;
    }

    .izquierda{
        margin-left: 4px;
    }
    </style>

</head>

<body>

<h3>${participante?.tipo == '1' ? 'Instructor - '  : 'Participante - '}${participante?.nombre + " " + participante?.apellido}</h3>

<div class="panel panel-primary col-md-12">

    <div class="panel-heading" style="padding: 3px; margin-top: 2px; text-align: center">
        <a href="${createLink(controller: 'principal', action: 'index')}" id="btnConsultarBase"
           class="btn btn-sm btn-warning" title="Salir" style="float: left">
            <i class="fa fa-arrow-left"></i> Salir
        </a>
        <a href="${createLink(controller: 'buscarBase', action: 'busquedaBase')}" id="btnConsultarBase"
           class="btn btn-sm btn-primary" title="Consultar artículo">
            <i class="fas fa-clipboard-check"></i> Editar
        </a>
        <a href="${createLink(controller: 'documento', action: 'listProyecto')}" id="btnConsultar"
           class="btn btn-sm btn-info" title="Consultar documentos del proyecto">
            <i class="fas fa-book-reader"></i> Enfoque personal
        </a>
        <a href="#" id="btnFinanciamiento" class="btn btn-sm btn-info" title="Nuevo financiamiento">
            <i class="fa fa-dollar-sign"></i> Desarrollo de capacidades
        </a>
        <g:if test="${proy?.fechaRegistro}">
            <a href="#" id="btnEstado" class="btn btn-sm btn-warning" title="Cambiar de estado al proyecto">
                <i class="fa fa-check"></i> Desregistrar
            </a>
        </g:if>
        <g:else>
            <a href="#" id="btnEstado" class="btn btn-sm btn-info" title="Cambiar de estado al proyecto">
                <i class="fa fa-check"></i> Estado
            </a>
        </g:else>
        <a href="#" id="btnVerCronograma" class="btn btn-sm btn-info" title="Ver cronograma">
            <i class="fa fa-calendar-alt"></i> Cursos Asistidos
        </a>
        %{--        <a href="#" id="btnGuardar" class="btn btn-sm btn-success" title="Guardar información">--}%
        %{--            <i class="fa fa-save"></i> Guardar--}%
        %{--        </a>--}%
    </div>

    <div class="tab-content">
        <div id="home" class="tab-pane fade in active">
            <g:form class="form-horizontal" name="frmProyecto" controller="proyecto" action="save_ajax">
                <g:hiddenField name="id" value="${participante?.id}"/>


                <div class="row izquierda">
                    <div class="col-md-12 input-group">
                        <span class="col-md-2 label label-primary text-info mediano">Cédula</span>
                        <div class="col-md-3">
                            <g:textField name="cedula" readonly="" class="form-control" value="${participante?.cedula}"/>
                        </div>
                    </div>
                </div>

                <div class="row izquierda">
                    <div class="col-md-12 input-group">
                        <span class="col-md-2 label label-primary text-info mediano">Nombre</span>
                        <div class="col-md-3">
                            <span class="grupo">
                                <g:textField name="nombre" class="form-control" readonly="" value="${participante?.nombre}"/>
                            </span>
                        </div>
                        <span class="col-md-1 label label-primary text-info mediano">Apellido</span>
                        <div class="col-md-3">
                            <span class="grupo">
                                <g:textField name="apellido" class="form-control" readonly="" value="${participante?.apellido}"/>
                            </span>
                        </div>
                    </div>
                </div>

                <div class="row izquierda">
                    <div class="col-md-12 input-group">
                        <span class="col-md-2 label label-primary text-info mediano">Mail</span>
                        <div class="col-md-3">
                            <span class="grupo">
                                <g:textField name="mail" class="form-control" readonly="" value="${participante?.mail}"/>
                            </span>
                        </div>
                        <span class="col-md-1 label label-primary text-info mediano">Teléfono</span>
                        <div class="col-md-3">
                            <span class="grupo">
                                <g:textField name="telefono" class="form-control" readonly="" value="${participante?.telefono}"/>
                            </span>
                        </div>

                        <span class="col-md-1 label label-primary text-info mediano">Género</span>
                        <div class="col-md-2">
                            <span class="grupo">
                                <g:textField name="genero" class="form-control" readonly="" value="${participante?.genero == 'M' ? 'Masculino' : (participante?.genero == 'F' ? 'Femenino' : 'Otro')}"/>
                            </span>
                        </div>
                    </div>
                </div>
            %{--                    </div>--}%
            %{--                </div>--}%



                <div class="row izquierda">
                    <div class="col-md-12 input-group">
                        <span class="col-md-2 label label-primary text-info mediano">Provincia</span>
                        <div class="col-md-2">
                            <span class="grupo">
                                <g:textField name="provincia" class="form-control" readonly="" value="${participante?.parroquia?.canton?.provincia?.nombre}"/>
                            </span>
                        </div>
                        <span class="col-md-1 label label-primary text-info mediano">Cantón</span>
                        <div class="col-md-3">
                            <span class="grupo">
                                <g:textField name="canton" class="form-control" readonly="" value="${participante?.parroquia?.canton?.nombre}"/>
                            </span>
                        </div>
                        <span class="col-md-1 label label-primary text-info mediano">Parroquia</span>
                        <div class="col-md-3">
                            <span class="grupo">
                                <g:textField name="parroquia" class="form-control" readonly="" value="${participante?.parroquia?.nombre}"/>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="row izquierda">
                    <div class="col-md-12 input-group">
                        <span class="col-md-2 label label-primary text-info mediano">Área de trabajo</span>
                        <div class="col-md-2">
                            <span class="grupo">
                                <g:textField name="areaTrabajo" class="form-control" readonly="" value="${participante?.areaTrabajo?.descripcion}"/>
                            </span>
                        </div>
                        <span class="col-md-1 label label-primary text-info mediano">Grupo Etario</span>
                        <div class="col-md-3">
                            <span class="grupo">
                                <g:textField name="grupoEtario" class="form-control" readonly="" value="${participante?.grupoEtario?.descripcion}"/>
                            </span>
                        </div>
                    </div>
                </div>

                <p style="margin-top: 10px">

                    <button class="btn btn-success" type="button" data-toggle="collapse" data-target="#collapseExample2" aria-expanded="false" aria-controls="collapseExample2">
                        <i class="fa fa-user-injured"></i> Afiliación
                    </button>
                    <button class="btn btn-info" type="button" data-toggle="collapse" data-target="#collapseExample3" aria-expanded="false" aria-controls="collapseExample3">
                        <i class="fa fa-book-medical"></i> Estudios
                    </button>
                </p>

                <div class="collapse" id="collapseExample2" style="margin-bottom: 20px">
                    <div class="card card-body">
                        <div class="row izquierda">
                            <div class="col-md-12 input-group">
                                <span class="col-md-2 label label-primary text-info mediano">Partido Político</span>
                                <div class="col-md-6">
                                    <span class="grupo">
                                        <g:textField name="partidoPolítico" class="form-control" readonly="" value="${participante?.partido?.descripcion}"/>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="row izquierda">
                            <div class="col-md-12 input-group">
                                <span class="col-md-2 label label-primary text-info mediano">Organización Social</span>
                                <div class="col-md-6">
                                    <span class="grupo">
                                        <g:textArea name="organizacionSocial" class="form-control" readonly="" value="${participante?.organizacionSocial}" style="resize: none; height: 100px"/>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="row izquierda">
                            <div class="col-md-12 input-group">
                                <span class="col-md-2 label label-primary text-info mediano">Movimiento Político</span>
                                <div class="col-md-6">
                                    <span class="grupo">
                                        <g:textArea name="movimientoPolitico" class="form-control" readonly="" value="${participante?.movimientoPolitico}" style="resize: none; height: 100px"/>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="collapse" id="collapseExample3" style="margin-bottom: 20px">
                    <div class="card card-body">

                        <div class="row izquierda">
                            <div class="col-md-12 input-group">
                                <span class="col-md-2 label label-primary text-info mediano">Nivel de Educación</span>
                                <div class="col-md-6">
                                    <span class="grupo">
                                        <g:textField name="nivelEducacion" class="form-control" readonly="" value="${participante?.nivelEducacion?.descripcion}"/>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="row izquierda">
                            <div class="col-md-12 input-group">
                                <span class="col-md-2 label label-primary text-info mediano">Área de espeacialización</span>
                                <div class="col-md-6">
                                    <span class="grupo">
                                        <g:textArea name="organizacionSocial" class="form-control" readonly="" value="${participante?.estudia}" style="resize: none; height: 100px"/>
                                    </span>
                                </div>
                            </div>
                        </div>
%{--                        <div class="row izquierda">--}%
%{--                            <div class="col-md-12 input-group">--}%
%{--                                <span class="col-md-2 label label-primary text-info mediano">Movimiento Político</span>--}%
%{--                                <div class="col-md-6">--}%
%{--                                    <span class="grupo">--}%
%{--                                        <g:textArea name="movimientoPolitico" class="form-control" readonly="" value="${participante?.movimientoPolitico}" style="resize: none; height: 100px"/>--}%
%{--                                    </span>--}%
%{--                                </div>--}%
%{--                            </div>--}%
%{--                        </div>--}%



                    </div>
                </div>



            %{--                <div class="row izquierda">--}%
            %{--                    <div class="col-md-12 input-group">--}%
            %{--                        <span class="col-md-2 label label-primary text-info mediano">Descripción</span>--}%

            %{--                        <div class="col-md-10">--}%
            %{--                            <span class="grupo">--}%
            %{--                                <g:textArea name="descripcion" id="descripcion" class="form-control" maxlength="1023"--}%
            %{--                                            style="height: 80px; resize: none" value="${proy?.descripcion}"/>--}%
            %{--                            </span>--}%
            %{--                        </div>--}%
            %{--                    </div>--}%
            %{--                </div>--}%

            %{--                <div class="row izquierda">--}%
            %{--                    <div class="col-md-12 input-group">--}%
            %{--                        <span class="col-md-2 label label-primary text-info mediano">Problema</span>--}%

            %{--                        <div class="col-md-10">--}%
            %{--                            <g:textArea name="problema" id="problema" class="form-control required" maxlength="1023"--}%
            %{--                                        style="height: 80px; resize: none" value="${proy?.problema}"/>--}%
            %{--                        </div>--}%
            %{--                    </div>--}%
            %{--                </div>--}%

            %{--                <div class="row izquierda">--}%
            %{--                    <div class="col-md-12 input-group">--}%
            %{--                        <span class="col-md-2 label label-primary text-info mediano">Justificación</span>--}%

            %{--                        <div class="col-md-10">--}%
            %{--                            <g:textArea name="justificacion" id="justificacion" class="form-control required"--}%
            %{--                                        maxlength="1023"--}%
            %{--                                        style="height: 80px; resize: none" value="${proy?.justificacion}"/>--}%
            %{--                        </div>--}%
            %{--                    </div>--}%
            %{--                </div>--}%

            %{--                <div class="row izquierda">--}%
            %{--                    <div class="col-md-12 input-group">--}%
            %{--                        <span class="col-md-2 label label-primary text-info mediano">Fecha Inicio</span>--}%
            %{--                        <span class="grupo">--}%
            %{--                            <div class="col-md-2 ">--}%
            %{--                                <input name="fechaInicio" id='fechaInicio' type='text' class="form-control"--}%
            %{--                                       value="${proy?.fechaInicio?.format("dd-MM-yyyy")}"/>--}%

            %{--                                <p class="help-block ui-helper-hidden"></p>--}%
            %{--                            </div>--}%
            %{--                        </span>--}%
            %{--                        <span class="col-md-2 mediano"></span>--}%
            %{--                        <span class="col-md-2 label label-primary text-info mediano">Fecha Fin</span>--}%
            %{--                        <span class="grupo">--}%
            %{--                            <div class="col-md-2">--}%
            %{--                                <input name="fechaFin" id='fechaFin' type='text' class="form-control"--}%
            %{--                                       value="${proy?.fechaFin?.format("dd-MM-yyyy")}"/>--}%

            %{--                                <p class="help-block ui-helper-hidden"></p>--}%
            %{--                            </div>--}%
            %{--                        </span>--}%
            %{--                    </div>--}%
            %{--                </div>--}%

            %{--                <div class="row izquierda" style="margin-bottom: 20px">--}%
            %{--                    <div class="col-md-6 input-group">--}%
            %{--                        <span class="col-md-4 label label-primary text-info mediano">Informar cada (meses)</span>--}%

            %{--                        <div class="col-md-2">--}%
            %{--                            <g:textField name="mes" id="mes" class="form-control" maxlength="5" value="${proy?.mes}"/>--}%
            %{--                        </div>--}%
            %{--                    </div>--}%
            %{--                    <div class="col-md-6 input-group">--}%
            %{--                        <span class="col-md-4 label label-primary text-info mediano">Monto del Proyecto</span>--}%

            %{--                        <div class="col-md-4">--}%
            %{--                            <g:textField name="monto" id="monto" class="form-control negrita" maxlength="16"--}%
            %{--                                         value="${util.formatNumber(number: proy?.monto, maxFractionDigits: 2, minFractionDigits: 2)}"/>--}%
            %{--                        </div>--}%
            %{--                    </div>--}%
            %{--                </div>--}%
            </g:form>
        </div>
    </div>
</div>

<script type="text/javascript">

    $("#btnEstado").click(function () {
        bootbox.confirm({
            size: "small",
            title: 'Alerta',
            message: "<i class='fa fa-exclamation-triangle fa-3x pull-left text-warning text-shadow'></i> ¿Está seguro de cambiar el estado del proyecto?",
            buttons: {
                confirm: {
                    label: 'Aceptar',
                    className: 'btn-success'
                },
                cancel: {
                    label: 'Cancelar',
                    className: 'btn-primary'
                }
            },
            callback: function(result){
                if(result){
                    $.ajax({
                        type: 'POST',
                        url: '${createLink(controller: 'proyecto', action: 'cambiarEstado_ajax')}',
                        data:{
                            id: '${proy?.id}'
                        },
                        success: function (msg) {
                            if(msg == 'ok'){
                                log("Estado cambiado correctamente","success");
                                setTimeout(function () {
                                    location.reload(true)
                                }, 1000);
                            }else{
                                if(msg == 'er'){
                                    bootbox.alert({
                                        size: "small",
                                        title: "Alerta!!!",
                                        message: "<i class='fa fa-exclamation-triangle fa-3x pull-left text-danger text-shadow'></i>  No se puede cambiar el estado, el marco lógico ya ha sido modificado!",
                                        callback: function(){}
                                    })
                                }else{
                                    log("Error al cambiar de estado","error")
                                }
                            }
                        }
                    });
                }
            }
        });
    });

    $("#btnVerCronograma").click(function () {
        location.href="${createLink(controller: 'cronograma', action: 'form')}/" + '${proy?.id}'
    });

    $("#btnMeta").click(function () {
        location.href="${createLink(controller: 'meta', action: 'list')}/" + '${proy?.id}'
    });

    $("#btnFinanciamiento").click(function () {
        var id = '${proy?.id}';
        $.ajax({
            type    : "POST",
            url     : "${createLink(controller: 'financiamiento', action:'list_ajax')}",
            data    : {
                id : id
            },
            success : function (msg) {
                bootbox.dialog({
                    title   : "Presupuesto/Fuentes",
                    class   : "modal-lg",
                    message : msg,
                    buttons : {
                        ok : {
                            label     : "Salir",
                            className : "btn-primary",
                            callback  : function () {
                            }
                        }
                    }
                });
            }
        });
    });

    $("#btnVerMarco").click(function () {
        location.href="${createLink(controller: 'marcoLogico', action: 'verMarco')}/${proy?.id}"
    });

    $("#btnBase").click(function () {
        location.href = "${createLink(controller: 'proyecto', action: 'proy')}"
    });

    $("#editMrlg").click(function () {
        location.href = "${createLink(controller: 'marcoLogico', action: 'marcoLogicoProyecto')}/${proy?.id}?list=list"
    });

    $("#btnGuardar").click(function () {

        var $form = $("#frmProyecto");
        var base_id = '${proy?.id}';
        $form.validate();
        // console.log('val:', $form.validate());
        // console.log('val:', $form.validate().label);
        if($form.valid()){
            var dialog = cargarLoader("Guardando...");
            $.ajax({type: 'POST',
                url: "${createLink(controller: 'proyecto', action: 'save_ajax')}",
                data:  $form.serialize(),
                success: function (msg) {
                    dialog.modal('hide');
                    var parte = msg.split("_");
                    if(parte[0] == 'ok'){
                        log("Proyecto guardado correctamente","success");
                        setTimeout(function () {
                            reCargar(parte[1]);
                        }, 800);
                    }else{
                        dialog.modal('hide');
                        log("Error al guardar el proyecto" + parte[1],"error")
                    }
                }
            });
        }
    });

    function reCargar(id) {
//        console.log('recargar', id)
        var url = "${createLink(controller: 'proyecto', action: 'proy')}" + "/" + id
//        console.log('link', url)
        location.href = url
    }

    /*
        $("#frmProyecto").validate({
            errorClass     : "help-block",
            errorPlacement : function (error, element) {
                if (element.parent().hasClass("input-group")) {
                    error.insertAfter(element.parent());
                } else {
                    error.insertAfter(element);
                }
                element.parents(".grupo").addClass('has-error');
            },
            success        : function (label) {
                label.parents(".grupo").removeClass('has-error');
                label.remove();
            }
        });
    */

    $("#frmProyecto").validate({
        errorClass: "help-block",
        errorPlacement: function (error, element) {
            if (element.parent().hasClass("input-group")) {
                error.insertAfter(element.parent());
            } else {
                error.insertAfter(element);
            }
            element.parents(".grupo").addClass('has-error');
        },
        success: function (label) {
            label.parents(".grupo").removeClass('has-error');
            label.remove();
        },
        rules: {
            nombre: {
                remote: {
                    url: "${createLink(action: 'validarNombre_ajax')}",
                    type: "post"
                }
            }
        },
        messages: {
            nombre: {
                remote: "El nombre no contiene FAREPS"
            }
        }
    });

    $(".form-control").keydown(function (ev) {
        if (ev.keyCode == 13) {
            submitForm();
            return false;
        }
        return true;
    });

    /*
        function createContainer() {
            var file = document.getElementById("file");
            var next = $("#files").find(".fileContainer").size();
            if (isNaN(next))
                next = 1;
            else
                next++;
            var ar = file.files[next - 1];
            var div = $('<div class="fileContainer ui-corner-all d-' + next + '">');
            var row1 = $("<div class='row resumen'>");
            var row3 = $("<div class='row botones'  style='text-align: center'>");
            var row4 = $("<div class='row'>");
            row1.append("<div class='col-md-2 etiqueta' style='font-size: 14px'>Descripción</div>");
            row1.append("<div class='col-md-5'><textarea maxlength='254' style='resize: none' class='form-control " + next + "' required id='descripcion' name='descripcion' cols='5' rows='5'></textarea></div>");
            row3.append(" <a href='#' class='btn btn-azul subir' style='margin-left: 200px; margin-bottom: 10px' clase='" + next + "'><i class='fa fa-upload'></i> Guardar Imagen</a>");
            div.append("<div class='row' style='margin-top: 10px; font-size: 14px'><div class='titulo-archivo col-md-10'><span style='color: #327BBA'>Archivo:</span> " + ar.name + "</div></div>");
            div.append(row1);
            div.append(row3);
            $("#files").append(div);
            if ($("#files").height() * 1 > 120) {
                $("#titulo-arch").show();
                $("#linea-arch").show();
            } else {
                $("#titulo-arch").hide();
                $("#linea-arch").hide();
            }
        }
    */


    $('#fechaInicio').datetimepicker({
        locale: 'es',
        format: 'DD-MM-YYYY',
        daysOfWeekDisabled: [0, 6],
        sideBySide: true,
        showClose: true,
    });

    $('#fechaFin').datetimepicker({
        locale: 'es',
        format: 'DD-MM-YYYY',
        daysOfWeekDisabled: [0, 6],
        sideBySide: true,
        showClose: true,
    });

    $("input[maxlength]").maxlength({
        alwaysShow: true,
        threshold: 10,
        warningClass: "label label-success",
        limitReachedClass: "label label-danger"
    });
    $("textarea[maxlength]").maxlength();



</script>

</body>
</html>