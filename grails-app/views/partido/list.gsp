<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 30/06/21
  Time: 15:05
--%>

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Lista de Partidos Políticos</title>

    <style>

    </style>
</head>
<body>

<elm:flashMessage tipo="${flash.tipo}" clase="${flash.clase}">${flash.message}</elm:flashMessage>

<!-- botones -->
<div class="btn-toolbar toolbar" style="margin-top: 5px">
    <div class="btn-group">
        <a href="#" class="btn btn-rojo btnNuevoPartido">
            <i class="fa fa-file"></i> Nuevo Partido
        </a>
    </div>
</div>

<table class="table table-condensed table-bordered">
    <thead>
    <tr style="width: 100%">
        <th style="width: 10%">Lista</th>
        <th style="width: 54%">Descripción</th>
        <th style="width: 21%">Sigla</th>
    </tr>
    </thead>
</table>

<div class=""  style="width: 99.7%;height: 350px; overflow-y: auto; margin-top: -20px">
    <table class="table-bordered table-condensed table-hover" width="100%">
        <tbody id="tabla_bandeja">
        <g:if test="${partidos.size() > 0}">
            <g:each in="${partidos}" var="partido">
                <tr data-id="${partido?.id}" style="width: 100%">
                    <td style="width: 10%">${partido?.lista}</td>
                    <td style="width: 55%">${partido?.descripcion}</td>
                    <td style="width: 20%">${partido?.sigla}</td>
                </tr>
            </g:each>
        </g:if>
        <g:else>
            <div class="alert alert-warning" role="alert" style="text-align: center">
                <p style="font-size: 14px"><i class="fa fa-exclamation-triangle"></i> No existen registros</p>
            </div>
        </g:else>
        </tbody>
    </table>
</div>

<script type="text/javascript">

    $(".btnNuevoPartido").click(function () {
        createEditRow();
    });

    function submitForm() {
        var $form = $("#frmPartido");
        var $btn = $("#dlgCreateEdit").find("#btnSave");
        if ($form.valid()) {
            $btn.replaceWith(spinner);
            var l = cargarLoader("Grabando...");
            $.ajax({
                type    : "POST",
                url     : '${createLink(action:'savePartido')}',
                data    : $form.serialize(),
                success : function (msg) {
                    l.modal("hide");
                    if (msg == "ok") {
                        log("Partido político guardado correctamente","success");
                        setTimeout(function () {
                            location.reload(true);
                        }, 1000);
                    } else {
                        log("Error al guardar el partido político","error");
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
            url     : "${createLink(controller: 'partido', action:'form_ajax')}",
            data    : {
                id: id ? id : ''
            },
            success : function (msg) {
                var b = bootbox.dialog({
                    id      : "dlgCreateEdit",
                    title   : title + " Partido político",
                    message : msg,
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
