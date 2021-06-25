<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 21/06/21
  Time: 13:52
--%>

<div class="container">

    <span class="col-md-4">
        <a href="#" class="btn btn-warning btn-lg btnInstructor">
            <i class="fa fa-user-graduate"></i> Instructor
        </a>
    </span>
    <span class="col-md-3">
        <a href="#" class="btn btn-info btn-lg btnParticipante">
            <i class="fa fa-user"></i> Participante
        </a>
    </span>

    <span class="col-md-12 hidden" style="margin-top: 20px; text-align: center" id="spanCedula">
        <div class="col-md-3">
            <g:textField name="cedula" class="form-control" placeholder="Cédula"/>
        </div>

        <div class="col-md-3 btn-group">
            <a href="#" class="btn btn-success btnAceptar"><i class="fa fa-check"></i> Aceptar</a>
            <a href="#" class="btn btn-primary btnCancelar"><i class="fa fa-times"></i> Cancelar</a>
        </div>
    </span>

</div>

<script type="text/javascript">

    var band = 0;

    $(".btnInstructor").click(function (){
        $("#cedula").val("");
        $("#spanCedula").removeClass("hidden");
        $(".btnParticipante").attr("disabled",true);
        band = 1
    });

    $(".btnParticipante").click(function (){
        $("#cedula").val("");
        $("#spanCedula").removeClass("hidden");
        $(".btnInstructor").attr("disabled",true);
        band = 2
    });

    $(".btnCancelar").click(function (){
        bootbox.hideAll()
    });

    $(".btnAceptar").click(function (){
        cedula(band);
    });

    function cedula(band){
        var cedula = $("#cedula").val();
        location.href="${createLink(controller: 'participante', action: 'verificar_ajax')}?c=" + cedula + "&tipo=" + band;
    }

</script>