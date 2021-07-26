<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 30/06/21
  Time: 12:52
--%>

<table class="table table-condensed table-bordered" width='100%'>
    <thead>
    <tr style="text-align: center">
        <th>Descripción</th>
        <th>Acciones</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${desarrollos}" var="desarrollo">
        <tr>
            <td style="font-weight: bold; font-size: 12px">
                ${desarrollo?.areas?.descripcion}
            </td>
            <td style="text-align: center">
                <a href="#" class="btn btn-xs btn-danger btnBorrarDesarrollo" data-id="${desarrollo?.id}" title="Borrar eje">
                    <i class="fa fa-trash"></i>
                </a>
            </td>
        </tr>
    </g:each>

    </tbody>
</table>

<script type="text/javascript">

    $(".btnBorrarDesarrollo").click(function () {
        var id = $(this).data("id");
        $.ajax({
            type: 'POST',
            url: '${createLink(controller: 'participante', action: 'borrarDesarrollo_ajax')}',
            data:{
                id: id
            },
            success: function(msg){
                if(msg == 'ok'){
                    log("Eje de formación borrado correctamente","success");
                    cargarDesaSel();
                    cargarTablaDesarrollo();
                }else{
                    log("Error al borrar el eje de formación","error")
                }
            }
        })
    });

</script>