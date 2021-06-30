<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 29/06/21
  Time: 15:23
--%>


<g:form class="form-horizontal" name="frmEnfoque" role="form"  method="POST">
    <div class="form-group">
        <span class="grupo">
            <label class="col-md-2 control-label text-info">
                Enfoque
            </label>
            <div class="col-md-8" id="divEnfoqueSel">

            </div>
            <a href="#" class="btn btn-sm btn-success btnAgregarEnfoque" title="Agregar enfoque">
                <i class="fa fa-plus"></i>
            </a>
        </span>
    </div>

    <div style="width: 100%;height: 130px; overflow-x: auto; margin-top: 20px">
        <div id="divEnfoque">
        </div>
    </div>

</g:form>

<script type="text/javascript">

    $(".btnAgregarEnfoque").click(function (){
            guardarEnfoque();
    });

    function guardarEnfoque(){
        var l = cargarLoader("Grabando...");
        $.ajax({
            type: 'POST',
            url: '${createLink(controller: 'participante', action: 'guardarEnfoque_ajax')}',
            data:{
                id: '${participante?.id}',
                enfoque: $("#enfoque option:selected").val()
            },
            success: function (msg) {
                l.modal("hide");
                if(msg == 'ok'){
                    log("Enfoque personal guardado correctamente","success");
                    cargarTablaEnfoqueSel();
                    cargarTablaEnfoque();
                }else{
                    log("Error al guardar el enfoque personal","error")
                }
            }
        });
    }

    cargarTablaEnfoqueSel();

    function cargarTablaEnfoqueSel(){
        $.ajax({
            type: 'POST',
            url: '${createLink(controller: 'participante', action: 'enfoqueSel_ajax')}',
            data:{
                id: '${participante?.id}'
            },
            success: function(msg){
                $("#divEnfoqueSel").html(msg)
            }
        })
    }

    cargarTablaEnfoque();

    function cargarTablaEnfoque(){
        $.ajax({
            type: 'POST',
            url: '${createLink(controller: 'participante', action: 'tablaEnfoque_ajax')}',
            data:{
                id: '${participante?.id}'
            },
            success: function(msg){
                $("#divEnfoque").html(msg)
            }
        })
    }

</script>
