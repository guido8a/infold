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
        <a href="${createLink(controller: 'principal', action: 'index')}" id="btnSalir"
           class="btn btn-sm btn-warning" title="Salir" style="float: left">
            <i class="fa fa-door-open"></i> Salir
        </a>
        <a href="${createLink(controller: 'participante', action: 'wizardDatos', params: [id: participante?.id])}" id="btnEditarParticipante"
           class="btn btn-sm btn-success" title="Consultar artículo">
            <i class="fas fa-edit"></i> Editar
        </a>
        <a href="#" id="btnEnfoque" class="btn btn-sm btn-info" title="Enfoque personal">
            <i class="fas fa-book-reader"></i> Enfoque personal
        </a>
        <a href="#" id="btnDesarrollo" class="btn btn-sm btn-info" title="Desarrollo de capacidades">
            <i class="fa fa-handshake"></i> Ejes de formación
        </a>
%{--            <a href="#" id="btnEstado" class="btn btn-sm btn-info" title="Cambiar de estado al proyecto">--}%
%{--                <i class="fa fa-check"></i> Estado--}%
%{--            </a>--}%
        <a href="#" id="btnVerCronograma" class="btn btn-sm btn-info" title="Ver cronograma">
            <i class="fa fa-calendar-alt"></i> Cursos Asistidos
        </a>


    </div>

    <div class="tab-content">
        <div id="home" class="tab-pane fade in active">
            <g:form class="form-horizontal" name="frmProyecto" controller="proyecto" action="save_ajax">
                <g:hiddenField name="id" value="${participante?.id}"/>


                <div class="row izquierda">
                    <div class="col-md-12 input-group">
                        <span class="col-md-1 label label-primary text-info mediano">Cédula</span>
                        <div class="col-md-2">
                            <g:textField name="cedula" readonly="" class="form-control" value="${participante?.cedula}"/>
                        </div>
                        <div class="col-md-5"></div>
                        <span class="col-md-1 label label-primary text-info mediano">Estado del registro</span>
                        <div class="col-md-2" style="margin-top: 10px">
                            <span class="grupo">
                                <span class="badge bg-success">${participante?.estado == 'S' ? 'COMPLETADO' : 'INCOMPLETO'}</span>
                            </span>
                        </div>
                    </div>
                </div>

                <div class="row izquierda">
                    <div class="col-md-12 input-group">
                        <span class="col-md-1 label label-primary text-info mediano">Nombre</span>
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
                        <span class="col-md-1 label label-primary text-info mediano">Mail</span>
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
                                <g:textField name="genero" class="form-control" readonly=""
                                    value="${participante?.genero == 'M' ? 'Masculino' : (participante?.genero == 'F' ? 'Femenino' : 'GLBTI+')}"/>
                            </span>
                        </div>
                    </div>
                </div>

                <div class="row izquierda">
                    <div class="col-md-12 input-group">
                        <span class="col-md-1 label label-primary text-info mediano">Provincia</span>
                        <div class="col-md-3">
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
                        <span class="col-md-1 label label-primary text-info mediano">Área de trabajo</span>
                        <div class="col-md-3">
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

                <p style="margin-top: 10px; border-color: #1B274E; border-radius: 4px; border-style: solid;
                padding: 5px; border-width: 1px">

                    <button class="btn btn-success" type="button" data-toggle="collapse" data-target="#collapseExample2" aria-expanded="false" aria-controls="collapseExample2">
                        <i class="fa fa-user-tag"></i> Afiliación
                    </button>
                    <button class="btn btn-info" type="button" data-toggle="collapse" data-target="#collapseExample3" aria-expanded="false" aria-controls="collapseExample3">
                        <i class="fa fa-university"></i> Estudios
                    </button>
                    <button class="btn btn-warning" type="button" data-toggle="collapse" data-target="#collapseExample4" aria-expanded="false" aria-controls="collapseExample4">
                        <i class="fa fa-building"></i> Trabajo
                    </button>
                </p>

                <div class="collapse" id="collapseExample2" style="margin-bottom: 20px">
                    <div class="card card-body">
                        <h3>Afiliación Política</h3>
                        <div class="row izquierda">
                            <div class="col-md-12 input-group">
                                <span class="col-md-1 label label-primary text-info mediano">Partido Político</span>
                                <div class="col-md-6">
                                    <span class="grupo">
                                        <g:textField name="partidoPolítico" class="form-control" readonly="" value="${participante?.partido?.descripcion}"/>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="row izquierda">
                            <div class="col-md-12 input-group">
                                <span class="col-md-1 label label-primary text-info mediano">Organización Social</span>
                                <div class="col-md-6">
                                    <span class="grupo">
                                        <g:textArea name="organizacionSocial" class="form-control" readonly="" value="${participante?.organizacionSocial}" style="resize: none; height: 50px"/>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="row izquierda">
                            <div class="col-md-12 input-group">
                                <span class="col-md-1 label label-primary text-info mediano">Movimiento Político</span>
                                <div class="col-md-6">
                                    <span class="grupo">
                                        <g:textArea name="movimientoPolitico" class="form-control" readonly="" value="${participante?.movimientoPolitico}" style="resize: none; height: 50px"/>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="collapse" id="collapseExample3" style="margin-bottom: 20px">
                    <div class="card card-body">
                        <h3>Estudios</h3>
                        <div class="row izquierda">
                            <div class="col-md-12 input-group">
                                <span class="col-md-1 label label-primary text-info mediano">Nivel de Educación</span>
                                <div class="col-md-6">
                                    <span class="grupo">
                                        <g:textField name="nivelEducacion" class="form-control" readonly="" value="${participante?.nivelEducacion?.descripcion}"/>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="row izquierda">
                            <div class="col-md-12 input-group">
                                <span class="col-md-1 label label-primary text-info mediano">Área de espeacialización</span>
                                <div class="col-md-6">
                                    <span class="grupo">
                                        <g:textArea name="area" class="form-control" readonly="" value="${participante?.nivelEducacion?.id?.toInteger() in [3,4,5] ? participante?.area : 'N/A'}" style="resize: none; height: 50px"/>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="row izquierda">
                            <div class="col-md-12 input-group">
                                <span class="col-md-1 label label-primary text-info mediano">Estudia actualmente</span>
                                <div class="col-md-6">
                                    <span class="grupo">
                                        <g:textField name="estudia" class="form-control" readonly="" value="${participante?.estudia == '0' ? 'NO' : 'SI'}"/>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="row izquierda">
                            <div class="col-md-12 input-group">
                                <span class="col-md-1 label label-primary text-info mediano">Carrera que estudia</span>
                                <div class="col-md-6">
                                    <span class="grupo">
                                        <g:textArea name="carreraEstudia" class="form-control" readonly="" value="${participante?.estudia == '0' ? 'N/A' : participante?.carreraEstudia}" style="resize: none; height: 50px"/>
                                    </span>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="collapse" id="collapseExample4" style="margin-bottom: 20px">
                    <div class="card card-body">
                        <h3>Trabajo</h3>

                        <g:if test="${participante?.tipo == '1'}">
                            <div class="row izquierda">
                                <div class="col-md-12 input-group">
                                    <span class="col-md-1 label label-primary text-info mediano">Hoja de vida</span>
                                    <div class="col-md-6">
                                        <span class="grupo col-md-6">
                                                Documento existente: <strong>${participante?.hojaVida}</strong>
                                        </span>
                                        <span class="grupo">
                                            <a href="${createLink(controller: 'participante', action: 'descargar', params: [id: participante?.id])}" class="btn btn-sm btn-info" title="Descargar archivo">
                                                <i class="fa fa-download"></i> Descargar</a>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </g:if>

                        <div class="row izquierda">
                            <div class="col-md-12 input-group">
                                <span class="col-md-1 label label-primary text-info mediano">Resumen trabajo</span>
                                <div class="col-md-11">
                                    <span class="grupo">
                                        <g:textArea name="resumenTrabajo" class="form-control" readonly=""
                                                    value="${participante?.resumenTrabajo}" style="resize: none; height: 45px"/>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="row izquierda">
                            <div class="col-md-12 input-group">
                                <span class="col-md-1 label label-primary text-info mediano">Fortaleza 1</span>
                                <div class="col-md-11">
                                    <span class="grupo">
                                        <g:textArea name="fortaleza1" class="form-control" readonly=""
                                                    value="${participante?.fortaleza1}" style="resize: none; height: 45px"/>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="row izquierda">
                            <div class="col-md-12 input-group">
                                <span class="col-md-1 label label-primary text-info mediano">Fortaleza 2</span>
                                <div class="col-md-11">
                                    <span class="grupo">
                                        <g:textArea name="fortaleza2" class="form-control" readonly=""
                                                    value="${participante?.fortaleza2}" style="resize: none; height: 45px"/>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="row izquierda">
                            <div class="col-md-12 input-group">
                                <span class="col-md-1 label label-primary text-info mediano">Fortaleza 3</span>
                                <div class="col-md-11">
                                    <span class="grupo">
                                        <g:textArea name="fortaleza3" class="form-control" readonly=""
                                                    value="${participante?.fortaleza3}" style="resize: none; height: 45px"/>
                                    </span>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

            </g:form>
        </div>
    </div>
</div>

<script type="text/javascript">

    $("#btnEnfoque").click(function (){
        var id = '${participante?.id}';
        $.ajax({
            type    : "POST",
            url     : "${createLink(controller: 'participante', action:'enfoque_ajax')}",
            data    : {
                id : id
            },
            success : function (msg) {
                bootbox.dialog({
                    title   : "Enfoque personal",
                    // class   : "modal-lg",
                    message : msg,
                    buttons : {
                        cancelar : {
                            label     : "<i class='fa fa-times'></i> Cancelar",
                            className : "btn-primary",
                            callback  : function () {
                            }
                        }
                    }
                });
            }
        });
    });

    $("#btnDesarrollo").click(function (){
        var id = '${participante?.id}';
        $.ajax({
            type    : "POST",
            url     : "${createLink(controller: 'participante', action:'desarrollo_ajax')}",
            data    : {
                id : id
            },
            success : function (msg) {
                bootbox.dialog({
                    title   : "Ejes de formación",
                    message : msg,
                    buttons : {
                        cancelar : {
                            label     : "<i class='fa fa-times'></i> Cancelar",
                            className : "btn-primary",
                            callback  : function () {
                            }
                        }
                    }
                });
            }
        });
    });

</script>

</body>
</html>