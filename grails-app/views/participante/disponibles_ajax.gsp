<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 22/07/21
  Time: 10:15
--%>
<g:form class="form-horizontal" name="frmDisponibles" role="form"  method="POST">
    <table class="table table-condensed table-bordered" width='100%'>
        <thead>
        <tr style="text-align: center; width: 100px">
            <th style="width: 50%">Descripción</th>
            <th style="width: 15%">Fecha Inicio</th>
            <th style="width: 15%">Fecha FIn</th>
            <th style="width: 10%">Matricularse</th>
        </tr>
        </thead>
    </table>
    <div id="divTablaDisponibles"></div>
</g:form>

<script type="text/javascript">
    cargarTablaDisponibles();

    function cargarTablaDisponibles(){
        $.ajax({
            type:'POST',
            url: '${createLink(controller: 'participante', action: 'tablaDisponibles_ajax')}',
            data:{
                id: '${participante?.id}'
            },
            success: function(msg){
                $("#divTablaDisponibles").html(msg)
            }
        })
    }

</script>
