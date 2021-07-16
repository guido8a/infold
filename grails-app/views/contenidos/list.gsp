<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 13/07/21
  Time: 10:03
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Contenidos - ${curso?.nombre}</title>

    <asset:javascript src="/trix.js"/>
    <asset:stylesheet src="/trix.css"/>



    <style>
    .hiddenRow {padding: 0 !important;}
    </style>
</head>

<body>

<div class="panel-heading" style="padding: 3px; margin-top: 2px; text-align: left">
    <div class="btn-group">
        <a href="${createLink(controller: 'curso', action: 'curso', params: [id: curso?.id])}" id="btnSalir"
           class="btn btn-sm btn-gris" title="Salir">
            <i class="fa fa-arrow-left"></i> Curso
        </a>
        <a href="#" id="btnNuevo" class="btn btn-sm btn-rojo" title="Nuevo Curso">
            <i class="fa fa-file"></i> Nuevo contenido
        </a>
    </div>
</div>

<div style="margin-top: 20px; min-height: 450px" class="vertical-container">
    <p class="css-vertical-text">Contenidos - ${curso?.nombre}</p>

    <div class="linea"></div>
    <table class="table table-bordered table-hover table-condensed">
        <thead>
        <tr>
            %{--            <th class="alinear" style="width: 15%">Curso</th>--}%
            <th class="alinear" style="width: 4%">Número</th>
            <th class="alinear" style="width: 30%">Eje de formación</th>
            <th class="alinear" style="width: 11%">Área</th>
            <th class="alinear" style="width: 6%">Horas docente</th>
            <th class="alinear" style="width: 6%">Horas Práctica</th>
            <th class="alinear" style="width: 6%">Horas Aprendizaje autónomo</th>
            <th class="alinear" style="width: 11%">Metodología</th>
            <th class="alinear" style="width: 10%">Contenido</th>
            <th class="alinear" style="width: 1%"></th>
        </tr>
        </thead>
    </table>

    <div class="" style="width: 100%;height: 350px; overflow-y: auto;float: right; margin-top: -20px">
        <table class="table-bordered table-condensed table-hover">
            <g:each in="${contenidos}" var="contenido" status="z">

                <tr data-id="${contenido?.id}">
                    <td width="4%">
                        ${contenido?.numero}
                    </td>
                    <td width="30%">
                        ${contenido?.areas?.ejes?.descripcion}
                    </td>
                    <td width="11%">
                        ${contenido?.areas?.descripcion}
                    </td>
                    <td width="6%" class="centrado">
                        ${contenido?.numeroHorasDocente}
                    </td>

                    <td width="6%" class="centrado">
                        ${contenido?.numeroHorasPractica}
                    </td>

                    <td width="6%" class="centrado">
                        ${contenido?.numeroHorasAprendizajeAutonomo}
                    </td>
                    <td width="10%">
                        <button class="btn btn-gris" type="button" data-toggle="collapse" data-target="#collapseExample2_${contenido?.id}" aria-expanded="false" aria-controls="collapseExample2_${contenido?.id}">
                            <i class="fa fa-user-graduate"></i> Metodología
                        </button>

                    </td>
                    <td width="10%">
                        <button class="btn btn-rojo" type="button" data-toggle="collapse" data-target="#collapseExample3_${contenido?.id}" aria-expanded="false" aria-controls="collapseExample3_${contenido?.id}">
                            <i class="fa fa-book"></i> Contenido
                        </button>
                    </td>
                </tr>

                <tr>
                    <td colspan="6" class="hiddenRow">
                        <div class="accordion-body collapse" id="collapseExample2_${contenido?.id}">
                            <div class="card card-body">
                                <h3>Metodología</h3>
                                <div class="row izquierda">
                                    <div class="col-md-12 input-group">
                                        <div class="col-md-10">
                                            <span class="grupo">
                                                <r:script>
                                                    <g:applyCodec encodeAs="none">
                                                        ${contenido?.metodologia}
                                                    </g:applyCodec>
                                                </r:script>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="6" class="hiddenRow">
                        <div class="accordion-body collapse" id="collapseExample3_${contenido?.id}">
                            <div class="card card-body">
                                <h3>Contenido</h3>
                                <div class="row izquierda">
                                    <div class="col-md-12 input-group">
                                        <div class="col-md-10">
                                            <span class="grupo">
                                                <r:script>
                                                    <g:applyCodec encodeAs="none">
                                                        ${contenido?.contenido}
                                                    </g:applyCodec>
                                                </r:script>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>

            </g:each>
        </table>
    </div>
</div>

<script type="text/javascript">

    $("#btnNuevo").click(function () {
        createEditRow();
    });

    function submitForm() {
        var $form = $("#frmContenidos");
        var $btn = $("#dlgCreateEdit").find("#btnSave");
        if ($form.valid()) {
            $btn.replaceWith(spinner);
            var l = cargarLoader("Grabando...");
            $.ajax({
                type    : "POST",
                url     : '${createLink(action:'saveContenido_ajax')}',
                data    : $form.serialize(),
                success : function (msg) {
                    l.modal("hide");
                    if (msg == "ok") {
                        log("Contenido guardado correctamente","success");
                        setTimeout(function () {
                            location.reload(true);
                        }, 1000);
                    } else {
                        log("Error al guardar el contenido","error");
                    }
                }
            });
        } else {
            return false;
        } //else
    }

    function createEditRow(id) {
        var title = id ? "Editar" : "Crear";
        var data = id ? { id: id } : {};
        $.ajax({
            type    : "POST",
            url     : "${createLink(controller: 'contenidos', action:'form_ajax')}",
            data    : {
                id: id ? id : '',
                curso: '${curso?.id}'
            },
            success : function (msg) {
                var b = bootbox.dialog({
                    id      : "dlgCreateEdit",
                    title   : title + " Contenido",
                    message : msg,
                    class : "modal-lg",
                    buttons : {
                        cancelar : {
                            label     : "<i class='fa fa-times'></i> Cancelar",
                            className : "btn-primary",
                            callback  : function () {
                                $('#frmContenidos')[0].reset();
                            }
                        },
                        guardar  : {
                            id        : "btnSave",
                            label     : "<i class='fa fa-save'></i> Guardar",
                            className : "btn-rojo",
                            callback  : function () {
                                return submitForm();
                            } //callback
                        } //guardar
                    } //buttons
                }); //dialog
                setTimeout(function () {
                    b.find(".form-control").not(".datepicker").first().focus()
                }, 500);
            } //success
        }); //ajax
    } //createEdit

    function deleteRow(id) {
        bootbox.dialog({
            title   : "Eliminar Enfoque",
            message : "<i class='fa fa-trash fa-2x pull-left text-warning text-shadow'></i><span style='font-size: 14px; font-weight: bold'>&nbsp; ¿Está seguro que desea eliminar este contenido?.</span>",
            buttons : {
                cancelar : {
                    label     : "<i class='fa fa-times'></i> Cancelar",
                    className : "btn-gris",
                    callback  : function () {
                    }
                },
                aceptar : {
                    label     : "<i class='fa fa-check'></i> Aceptar",
                    className : "btn-rojo",
                    callback  : function () {
                        $.ajax({
                            type    : "POST",
                            url     : "${createLink(controller: 'contenidos', action:'eliminar_ajax')}",
                            data    : {
                                id:id
                            },
                            success : function (msg) {
                                if(msg == 'ok'){
                                    log("Eliminado correctamente","success");
                                    setTimeout(function () {
                                        location.reload(true);
                                    }, 1000);
                                }else{
                                    log("Error al eliminar el contenido","error")
                                }
                            } //success
                        }); //ajax
                    }
                }
            }
        });
    } //createEdit

    function createContextMenu(node) {
        var $tr = $(node);

        var items = {
            header : {
                label  : "Acciones",
                header : true
            }
        };

        var id = $tr.data("id");

        var editar = {
            label           : 'Editar',
            icon            : "fa fa-pen",
            separator_after : true,
            action          : function (e) {
                var id = $tr.data("id");
                createEditRow(id)
            }
        };

        var eliminar = {
            label            : 'Eliminar',
            icon             : "fa fa-trash text-warning",
            action           : function (e) {
                var id = $tr.data("id");
                deleteRow(id);
            }
        };

        items.editar = editar;
        items.eliminar = eliminar;
        return items;
    }
    //
    $("tr").contextMenu({
        items  : createContextMenu,
        onShow : function ($element) {
            $element.addClass("trHighlight");
        },
        onHide : function ($element) {
            $(".trHighlight").removeClass("trHighlight");
        }
    });


</script>

</body>
</html>