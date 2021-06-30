<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 30/06/21
  Time: 10:56
--%>

<table class="table table-condensed table-bordered" width='100%'>
    <thead>
        <tr style="text-align: center">
            <th>Descripción</th>
            <th>Acciones</th>
        </tr>
    </thead>
    <tbody>
    <g:each in="${enfoques}" var="enfoque">
        <tr>
            <td style="font-weight: bold; font-size: 12px">
                ${enfoque?.enfoque?.descripcion}
            </td>
            <td style="text-align: center">
                <a href="#" class="btn btn-xs btn-danger btnBorrarEnfoque" data-id="${enfoque?.id}" title="Borrar enfoque">
                    <i class="fa fa-trash"></i>
                </a>
            </td>
        </tr>
    </g:each>

    </tbody>
</table>

<script type="text/javascript">

    $(".btnBorrarEnfoque").click(function () {
        var id = $(this).data("id");
        $.ajax({
            type: 'POST',
            url: '${createLink(controller: 'participante', action: 'borrarEnfoque_ajax')}',
            data:{
                id: id
            },
            success: function(msg){
                if(msg == 'ok'){
                    log("Enfoque personal borrado correctamente","success");
                    cargarTablaEnfoqueSel();
                    cargarTablaEnfoque();
                }else{
                    log("Error al borrar el enfoque personal","error")
                }
            }
        })
    });

</script>