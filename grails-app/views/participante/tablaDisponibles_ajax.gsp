<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 22/07/21
  Time: 11:49
--%>

<table class="table table-condensed table-bordered" width='100%' style="margin-top: -20px">
    <tbody>
    <g:each in="${cursos}" var="curso">
        <tr>
            <td style="font-weight: bold; font-size: 12px; width: 50%">
                ${curso.nombre}
            </td>
            <td style="font-weight: bold; font-size: 12px; width: 15%; background-color: #eeb51f; text-align: center">
                ${curso.fechaInicio?.format("dd-MM-yyyy")}
            </td>
            <td style="font-weight: bold; font-size: 12px; width: 15%; background-color: #afafaf; text-align: center">
                ${curso.fechaFin.format("dd-MM-yyyy")}
            </td>
            <td style="text-align: center; width: 10%">
                <div class="form-check form-check-inline" style="margin-top: 7px">
                    <input class="form-check-input matricula" type="checkbox" data-id="${curso?.id}" name="matricula_name" ${curso?.id in cursosParticipante?.dicta?.id  ? 'checked' : ''}>
                </div>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>

<script type="text/javascript">

    $.switcher('input[type=checkbox]');

    $(".matricula").click(function () {
        var id = $(this).data("id");
        var checked = $(this).is(":checked");
        if (checked) {
            guardarMatricula('si',id)
        } else {
            guardarMatricula('no',id)
        }
    });

    function guardarMatricula(estado,id) {
        bootbox.confirm({
            message: "<i class='fa fa-cogs fa-3x pull-left text-info text-shadow'></i>  " +
                "<p style='text-align: center; font-size: 14px; font-weight: bold'>  Está seguro de realizar esta acción?</p>",
            buttons: {
                confirm: {
                    label: "<i class='fa fa-save'></i> Aceptar",
                    className: 'btn-rojo'
                },
                cancel: {
                    label: "<i class='fa fa-times'></i> Cancelar",
                    className: 'btn-gris'
                }
            },
            callback: function (result) {
                if (result) {
                    var cl1 = cargarLoader("Guardando...");
                    %{--var data = "id=${participante.id}";--}%
                    %{--$(".matricula").each(function () {--}%
                    %{--    if ($(this).is(":checked")) {--}%
                    %{--        data += "&curso=" + $(this).data("id");--}%
                    %{--    }--}%
                    %{--});--}%
                    // saveMatricula(data, cl1)
                    saveMatricula(estado, id, cl1)
                }else{
                    cargarTablaDisponibles();
                }
            }
        });
    }

    function saveMatricula(estado, id ,cl1) {
        $.ajax({
            type: 'POST',
            url: '${createLink(controller: 'participante', action: 'guardarMatricula_ajax')}',
            // data:data,
            data:{
                id: id,
                participante: '${participante?.id}',
                estado: estado
            },
            success: function (msg) {
                cl1.modal("hide");
                var parts = msg.split("_");
                if(parts[0] == 'ok'){
                    log("Curso agregado correctamente al participante","success")
                }else{
                    log("Error al guardar","error");
                    cargarTablaDisponibles();
                }
            }
        });
    }

</script>