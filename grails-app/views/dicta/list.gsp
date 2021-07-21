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

<style>

.bc{
    border-color: #eeb51f;
}

.bc1{
    border-color: #1B274E;
}

</style>
</head>


<elm:flashMessage tipo="${flash.tipo}" clase="${flash.clase}">${flash.message}</elm:flashMessage>

<!-- botones -->
<div class="btn-toolbar toolbar" style="margin-top: 5px">
    <div class="btn-group">
        <a href="${createLink(controller: 'curso', action: 'curso', params: [id: curso?.id])}" class="btn btn-gris btnRegresa">
            <i class="fa fa-arrow-left"></i> Curso
        </a>
    </div>
</div>

<div class="form-group divDatos" style="margin-top: 10px;  border-radius: 4px; border-style: solid; padding: 5px; border-width: 1px">
    <g:hiddenField name="id"/>
    <span class="grupo">
        <label class="col-md-1 control-label text-info">
            Descripción
        </label>
        <div class="col-md-5">
            <g:textField name="nombre" class="form-control" />
        </div>
        <label class="col-md-1 control-label text-info">
            Fechas
        </label>
        <div class="col-md-3">
            <g:textField name="dp" class="form-control"/>
        </div>
        <a href="#" class="btn btn-sm btn-rojo btnAgregarHorario" title="Agregar horario del curso">
            <i class="fa fa-plus"></i> Agregar Fechas
        </a>
        <a href="#" class="btn btn-sm btn-rojo btnGuardarHorario hidden" title="Guardar cambios">
            <i class="fa fa-save"></i> Guardar
        </a>
        <a href="#" class="btn btn-sm btn-gris btnCancelar hidden" title="Cancelar edición">
            <i class="fa fa-times"></i> Cancelar
        </a>
    </span>
</div>

<h3>Fechas asignadas al curso: ${curso?.nombre}</h3>

<table class="table table-condensed table-bordered">
    <thead>
    <tr style="width: 100%">
        <th style="width: 50%">Descripción</th>
        <th style="width: 20%">Fecha Inicio</th>
        <th style="width: 20%">Fecha Fin</th>
        <th style="width: 10%">Borrar</th>
    </tr>
    </thead>
</table>

<div id="divTablaDicta">

</div>

<script type="text/javascript">

    $(".btnCancelar").click(function () {
       cancelarEdicion();
    });

    function cancelarEdicion() {
        var id = $(this).data("");
        var nombre = $(this).data("");
        var fecha = $(this).data("");
        $("#nombre").val(nombre);
        $("#dp").val(fecha);
        $("#id").val(id);
        $(".btnAgregarHorario").removeClass("hidden");
        $(".btnGuardarHorario").addClass("hidden");
        $(".btnCancelar").addClass("hidden");
        $(".divDatos").css('background-color','')
    }

    cargarTablaDicta();

    $('#dp').dateRangePicker({
        separator: ' al ',
        format: 'DD-MM-YYYY',
        startOfWeek: 'monday',
        startDate: new Date(),
        language: 'es',
        getValue: function() {
            return $(this).val();
        }
    });

    $(".btnAgregarHorario, .btnGuardarHorario").click(function () {
        guardarHorario();
    });

    function guardarHorario(){
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
                        dp: $("#dp").val(),
                        id: $("#id").val()
                    },
                    success: function (msg) {
                        l.modal("hide");
                        if(msg == 'ok'){
                            log("Horario guardado correctamente","success");
                            cancelarEdicion();
                            cargarTablaDicta();
                        }else{
                            log("Error al guardar el horario","error")
                        }
                    }
                });
            }
        }
    }

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







</script>

</body>
</html>
