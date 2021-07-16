<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <meta name="layout" content="main">
    <title>Curso ${curso?.id ? " - " + curso?.nombre : ''}</title>

    <style type="text/css">
    .mediano {
        margin-top: 5px;
        padding-top: 9px;
        height: 30px;
        font-size: inherit;
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


<div class="panel panel-primary col-md-12">

    <div class="panel-heading" style="padding: 3px; margin-top: 2px; text-align: left">
        <div class="btn-group">
            <a href="${createLink(controller: 'inicio', action: 'index')}" id="btnSalir"
               class="btn btn-sm btn-warning" title="Salir">
                <i class="fa fa-door-open"></i> Salir
            </a>

            <a href="#" id="btnGuardar" class="btn btn-sm btn-success" title="Guardar Curso">
                <i class="fa fa-save"></i> Guardar
            </a>
        </div>
        <a href="#" id="btnNuevo" class="btn btn-sm btn-info" title="Nuevo Curso">
            <i class="fa fa-file"></i> Nuevo curso
        </a>
        <g:if test="${curso?.id}">
            <a href="#" id="btnContenido" class="btn btn-sm btn-warning" title="Contenidos del curso">
                <i class="fa fa-book"></i> Contenidos
            </a>
            <a href="#" id="btnDicta" class="btn btn-sm btn-info" title="Horarios en los que se dicta el curso">
                <i class="fa fa-calendar"></i> Horarios
            </a>
        </g:if>
    </div>

    <div class="tab-content">
        <div id="home" class="tab-pane fade in active">
            <g:form class="form-horizontal" name="frmCurso" role="form" method="POST" controller="curso" action="saveCurso_ajax">
                <g:hiddenField name="id" value="${curso?.id}"/>

                <div class="row izquierda">
                    <div class="col-md-12 input-group">
                        <span class="col-md-1 label label-primary text-info mediano">Ejes de formación</span>
                        <div class="col-md-6">
                            <g:select name="ejes" from="${infold.Ejes.list().sort{it.descripcion}}"
                                      optionKey="id" optionValue="descripcion" class="form-control required" value="${curso?.ejes?.id}"/>
                        </div>
                    </div>
                </div>


                <div class="row izquierda">
                    <div class="col-md-12 input-group">
                        <span class="col-md-1 label label-primary text-info mediano">Curso requisito</span>
                        <div class="col-md-2">
                            <g:select name="requisito" from="${infold.Curso.list().sort{it.nombre}}"
                                      optionKey="id" optionValue="nombre" class="form-control required" noSelection="${[null:'Ninguno']}" value="${curso?.requisito?.id}"/>
                        </div>
                    </div>
                </div>

                <div class="row izquierda">
                    <div class="col-md-12 input-group">
                        <span class="col-md-1 label label-primary text-info mediano">Nombre</span>
                        <div class="col-md-6">
                            <span class="grupo">
                                <g:textField name="nombre" maxlength="127" class="form-control required" value="${curso?.nombre}"/>
                            </span>
                        </div>
                        <span class="col-md-1 label label-primary text-info mediano">Sigla</span>
                        <div class="col-md-2">
                            <span class="grupo">
                                <g:textField name="sigla" maxlength="15" class="allCaps form-control required" value="${curso?.sigla}"/>
                            </span>
                        </div>
                    </div>
                </div>

                <div class="row izquierda">
                    <div class="col-md-12 input-group">
                        <span class="col-md-1 label label-primary text-info mediano">Objetivo</span>
                        <div class="col-md-9">
                            <span class="grupo">
                                <g:textArea name="objetivo" class="form-control" value="${curso?.objetivo}" style="resize: none"/>
                            </span>
                        </div>
                    </div>
                </div>

                <div class="row izquierda">
                    <div class="col-md-12 input-group">
                        <span class="col-md-1 label label-primary text-info mediano">Descripción</span>
                        <div class="col-md-9">
                            <span class="grupo">
                                <g:textArea name="descripcion" class="form-control" value="${curso?.descripcion}" style="resize: none"/>
                            </span>
                        </div>
                    </div>
                </div>

                <div class="row izquierda">
                    <div class="col-md-12 input-group">
                        <span class="col-md-1 label label-primary text-info mediano">Caracterización</span>
                        <div class="col-md-9">
                            <span class="grupo">
                                <g:textArea name="caracterizacion" class="form-control" value="${curso?.caracterizacion}" style="resize: none"/>
                            </span>
                        </div>
                    </div>
                </div>

                <div class="row izquierda">
                    <div class="col-md-12 input-group">
                        <div class="col-md-1"></div>
                        <span class="col-md-2 label label-primary text-info mediano">Número de horas docente</span>
                        <div class="col-md-1">
                            <span class="grupo">
                                <g:textField name="numeroHorasDocente" maxlength="2" class="form-control" value="${curso?.numeroHorasDocente}"/>
                            </span>
                        </div>
                        <span class="col-md-2 label label-primary text-info mediano">Número de horas práctica</span>
                        <div class="col-md-1">
                            <span class="grupo">
                                <g:textField name="numeroHorasPractica" maxlength="2" class="form-control" value="${curso?.numeroHorasPractica}"/>
                            </span>
                        </div>
                        <span class="col-md-2 label label-primary text-info mediano">Número de horas aprendizaje autónomo</span>
                        <div class="col-md-1">
                            <span class="grupo">
                                <g:textField name="numeroHorasAprendizajeAutonomo"  maxlength="2" class="form-control" value="${curso?.numeroHorasAprendizajeAutonomo}"/>
                            </span>
                        </div>
                    </div>
                </div>

                <div class="row izquierda" style="margin-bottom: 10px">
                    <div class="col-md-12 input-group">
                        <span class="col-md-1 label label-primary text-info mediano">Metodología</span>
                        <div class="col-md-9">
                            <span class="grupo">
                                <g:textArea name="metodologia" class="form-control" value="${curso?.metodologia}" style="resize: none"/>
                            </span>
                        </div>
                    </div>
                </div>

            </g:form>
        </div>
    </div>
</div>

<script type="text/javascript">

    $("#btnContenido").click(function (){
       location.href="${createLink(controller: 'contenidos', action: 'list')}/" + '${curso?.id}'
    });

    function validarNumPunto(ev) {
        /*
        48-57      -> numeros
         96-105     -> teclado numerico
        188        -> , (coma)
        190        -> . (punto) teclado
        110        -> . (punto) teclado numerico
         8          -> backspace
        46         -> delete
        9          -> tab
        37         -> flecha izq
         39         -> flecha der
         */
        return ((ev.keyCode >= 48 && ev.keyCode <= 57) ||
            (ev.keyCode >= 96 && ev.keyCode <= 105) ||
            // ev.keyCode == 190 || ev.keyCode == 110 ||
            ev.keyCode == 8 || ev.keyCode == 46 || ev.keyCode == 9 ||
            ev.keyCode == 37 || ev.keyCode == 39 ||
            ev.keyCode == 173 || ev.keyCode == 109);
    }

    $("#numeroHorasDocente, #numeroHorasAprendizajeAutonomo, #numeroHorasPractica").keydown(function (ev) {
        return validarNumPunto(ev)
    });

    $("#btnGuardar").click(function (){
        if($("#nombre").val() == '' || $("#nombre").val() == null){
            bootbox.alert("<i class='fa fa-exclamation-triangle fa-2x text-warning'></i> <span style='font-size: 14px'>Ingrese un nombre</span>")
        }else{
            if($("#sigla").val() == '' || $("#sigla").val() == null)
            {
                bootbox.alert("<i class='fa fa-exclamation-triangle fa-2x text-warning'></i> <span style='font-size: 14px'>Ingrese una sigla</span>")
            }else{
                if($("#ejes").val() == '' || $("#ejes").val() == null)
                {
                    bootbox.alert("<i class='fa fa-exclamation-triangle fa-2x text-warning'></i> <span style='font-size: 14px'>Seleccione un eje de formación</span>")
                }else{
                    submitFormCurso();
                }
            }
        }
    });

    function submitFormCurso() {
        var $form = $("#frmCurso");
        if ($form.valid()) {
            var l = cargarLoader("Grabando...");
            var data = $form.serialize();
            $.ajax({
                type    : "POST",
                url     : '${createLink(action:'saveCurso_ajax')}',
                data: data,
                success : function (msg) {
                    l.modal("hide");
                    var parts = msg.split("_");
                    if (parts[0] == "ok") {
                        log("Curso guardado correctamente","success");
                        setTimeout(function () {
                            location.href="${createLink(controller: 'curso', action: 'curso')}/" + parts[1]
                        },800);
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