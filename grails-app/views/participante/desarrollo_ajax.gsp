<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 29/06/21
  Time: 15:46
--%>

<g:form class="form-horizontal" name="frmDesarrollo" role="form"  method="POST">
    <div class="form-group">
        <span class="grupo">
            <label class="col-md-2 control-label text-info">
                Ejes de formación
            </label>
            <div class="col-md-8" id="divDesaSel">

            </div>
            <a href="#" class="btn btn-sm btn-success btnAgregarDesarrollo" title="Agregar eje">
                <i class="fa fa-plus"></i>
            </a>
        </span>
    </div>

    <div style="width: 100%;height: 130px; overflow-x: auto; margin-top: 20px">
        <div id="divDesarrollo">
        </div>
    </div>
</g:form>

<script type="text/javascript">

    $(".btnAgregarDesarrollo").click(function (){
        guardarDesarrollo();
    });

    function guardarDesarrollo(){
        var l = cargarLoader("Grabando...");
        $.ajax({
            type: 'POST',
            url: '${createLink(controller: 'participante', action: 'guardarDesarrollo_ajax')}',
            data:{
                id: '${participante?.id}',
                desarrolloCapacidades: $("#areas option:selected").val()
            },
            success: function (msg) {
                l.modal("hide");
                if(msg == 'ok'){
                    log("Eje de formación guardado correctamente","success");
                    cargarDesaSel();
                    cargarTablaDesarrollo();
                }else{
                    log("Error al guardar el eje de formación","error")
                }
            }
        });
    }

    cargarDesaSel();

    function cargarDesaSel(){
        $.ajax({
            type: 'POST',
            url: '${createLink(controller: 'participante', action: 'desarrolloSel_ajax')}',
            data:{
                id: '${participante?.id}'
            },
            success: function(msg){
                $("#divDesaSel").html(msg)
            }
        })
    }

    cargarTablaDesarrollo();

    function cargarTablaDesarrollo(){
        $.ajax({
            type: 'POST',
            url: '${createLink(controller: 'participante', action: 'tablaDesarrollo_ajax')}',
            data:{
                id: '${participante?.id}'
            },
            success: function(msg){
                $("#divDesarrollo").html(msg)
            }
        })
    }


</script>
