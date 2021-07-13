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

<div style="margin-top: 30px; min-height: 650px" class="vertical-container">
    <p class="css-vertical-text">Contenidos - ${curso?.nombre}</p>

    <div class="linea"></div>
    <table class="table table-bordered table-hover table-condensed">
        <thead>
        <tr>
            %{--            <th class="alinear" style="width: 15%">Curso</th>--}%
            <th class="alinear" style="width: 5%">Número</th>
            <th class="alinear" style="width: 10%">Eje de formación</th>
            <th class="alinear" style="width: 10%">Área</th>
            <th class="alinear" style="width: 6%">Horas docente</th>
            <th class="alinear" style="width: 6%">Horas Práctica</th>
            <th class="alinear" style="width: 7%">Horas Aprendizaje autónomo</th>
            <th class="alinear" style="width: 10%">Metodología</th>
            <th class="alinear" style="width: 30%">Contenido</th>
        </tr>
        </thead>
    </table>


    <div class="" style="width: 99.7%;height: 400px; overflow-y: auto;float: right; margin-top: -20px">
        <table class="table-bordered table-condensed table-hover">
            <g:each in="${contenidos}" var="contenido" status="z">

                <tr data-id="${contenido?.id}">
                    <td width="5%">
                        ${contenido?.numero}
                    </td>
                    <td width="10%">
                        ${contenido?.areas?.ejes?.descripcion}
                    </td>

                    <td width="10%">
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
                        ${contenido?.metodologia}
                    </td>
                    <td width="30%">
                        ${contenido?.contenido}
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
            message : "<i class='fa fa-trash fa-2x pull-left text-warning text-shadow'></i><span style='font-size: 14px; font-weight: bold'>&nbsp; ¿Está seguro que desea eliminar este partido político?.</span>",
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
                            url     : "${createLink(controller: 'partido', action:'eliminar_ajax')}",
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
                                    log("Error al eliminar el partido político","error")
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