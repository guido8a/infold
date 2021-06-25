<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 25/06/21
  Time: 10:36
--%>

<g:if test="${participante?.hojaVida}">
    <div>
        <table class="table table-condensed table-bordered" width='100%'>
            <head>
                <tr style="text-align: center">
                    <th>Archivo</th>
                    <th>Acciones</th>
                </tr>
            </head>
            <body>
            <tr>
                <td style="font-weight: bold; font-size: 16px">
                    ${participante?.hojaVida}
                </td>
                <td style="text-align: center">
                    <a href="#" class="btn btn-sm btn-danger btnBorrarHoja" title="Borrar archivo">
                        <i class="fa fa-trash"></i>
                    </a>
                    <a href="${createLink(controller: 'participante', action: 'descargar', params: [id: participante?.id])}" class="btn btn-sm btn-info" title="Descargar archivo">
                        <i class="fa fa-download"></i>
                    </a>
                </td>
            </tr>
            </body>
        </table>
    </div>
</g:if>



<script type="text/javascript">

    $(".btnBorrarHoja").click(function (){
        $.ajax({
            type: 'POST',
            url: '${createLink(controller: 'participante', action:  'borrarHoja_ajax')}',
            data:{
                id: '${participante?.id}'
            },
            success: function (msg) {
                if(msg == 'ok'){
                    cargarTablaHoja();
                }else{
                    log("Error al borrar la hoja de vida","error")
                }
            }
        })
    });

</script>