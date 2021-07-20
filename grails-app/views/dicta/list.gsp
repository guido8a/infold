<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 16/07/21
  Time: 14:02
--%>

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Fecha que se dicta el curso</title>
    <asset:stylesheet src="/jquery-date-range-picker-master/dist/daterangepicker.css"/>
    <asset:javascript src="/jquery-date-range-picker-master/dist/jquery.daterangepicker.min.js"/>

</head>
<body>

<elm:flashMessage tipo="${flash.tipo}" clase="${flash.clase}">${flash.message}</elm:flashMessage>

<!-- botones -->
<div class="btn-toolbar toolbar" style="margin-top: 5px">
    <div class="btn-group">
        <a href="${createLink(controller: 'curso', action: 'curso', params: [id: curso?.id])}" class="btn btn-gris btnRegresa">
            <i class="fa fa-arrow-left"></i> Curso
        </a>
    </div>
</div>

<div class="form-group">
    <span class="grupo">
        <label class="col-md-1 control-label text-info">
            Descripción
        </label>
        <div class="col-md-4">
            <g:textField name="nombre" class="form-control" />
        </div>
        <label class="col-md-1 control-label text-info">
            Fechas
        </label>
        <div class="col-md-4">
            <g:textField name="dp" class="form-control"/>
        </div>
        <a href="#" class="btn btn-sm btn-success btnAgregarHorario" title="Agregar horario del curso">
            <i class="fa fa-plus"></i>
        </a>
    </span>
</div>

<table class="table table-condensed table-bordered">
    <thead>
    <tr style="width: 100%">
        <th style="width: 55%">Descripción</th>
        <th style="width: 20%">Fecha Inicio</th>
        <th style="width: 20%">Fecha Fin</th>
    </tr>
    </thead>
</table>

<div id="divTablaDicta">

</div>

<script type="text/javascript">

    cargarTablaDicta();

    $('#dp').dateRangePicker({
        separator: ' al ',
        format: 'DD-MM-YYYY',
        startOfWeek: 'monday',
        startDate: new Date(),
        getValue: function() {
            return $(this).val();
        }
    });

    $(".btnAgregarHorario").click(function () {
        if($("#nombre").val() == ''){
             bootbox.alert("<i class='fa fa-exclamation-triangle fa-2x text-warning'></i> Ingrese una descripción del horario")
        }else{
            if($("#dp").val() == ''){
                bootbox.alert("<i class='fa fa-exclamation-triangle fa-2x text-warning'></i> Ingrese las fechas")
            }else{
                var l = cargarLoader("Grabando...");
                $.ajax({
                    type: 'POST',
                    url: '${createLink(controller: 'dicta', action: 'saveDicta')}',
                    data:{
                        curso: '${curso?.id}',
                        nombre: $("#nombre").val(),
                        dp: $("#dp").val()
                    },
                    success: function (msg) {
                        l.modal("hide");
                        if(msg == 'ok'){
                            log("Horario agregado correctamente","success")
                            cargarTablaDicta();
                        }else{
                            log("Error al agregar el horario","error")
                        }
                    }
                });
            }
        }
    });

    function cargarTablaDicta(){
        $.ajax({
            type: 'POST',
            url:'${createLink(controller: 'dicta', action: 'tablaDicta_ajax')}',
            data:{
                curso: '${curso?.id}'
            },
            success: function (msg) {
                $("#divTablaDicta").html(msg)
            }
        })
    }


    function deleteRow(id) {
        bootbox.dialog({
            title   : "Eliminar",
            message : "<i class='fa fa-trash fa-2x pull-left text-warning text-shadow'></i><span style='font-size: 14px; font-weight: bold'>&nbsp; ¿Está seguro que desea eliminar este registro?.</span>",
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
                            url     : "${createLink(controller: 'dicta', action:'eliminar_ajax')}",
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
                                    log("Error al eliminar el registro","error")
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
