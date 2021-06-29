<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 21/06/21
  Time: 13:52
--%>

%{--        <div class="col-md-12">--}%
%{--            <span class="col-md-12 hidden" style="margin-top: 20px; text-align: center" id="spanCedula">--}%
%{--                <div class="col-md-3">--}%
%{--                    <g:textField name="cedula" class="form-control" placeholder="Cédula"/>--}%
%{--                </div>--}%
%{----}%
%{--                <div class="col-md-8 btn-group">--}%
%{--                    <a href="#" class="btn btn-success btnAceptar"><i class="fa fa-check"></i> Aceptar</a>--}%
%{--                    <a href="#" class="btn btn-primary btnCancelar"><i class="fa fa-times"></i> Cancelar</a>--}%
%{--                </div>--}%
%{--            </span>--}%
%{--        </div>--}%

%{--<div class="modal-dialog">--}%
%{--    <div class="modal-content">--}%

<g:if test="${params.tipo == '1'}">
    <g:set var="titl" value="${'Registro como Instructor'}"/>
</g:if>
<g:else>
    <g:set var="titl" value="${'Registro como Participante'}"/>
</g:else>

<div class="modal-header">
            <h3>${titl}</h3>
        </div>
        <div class="modal-body row">
            <div class="col-md-6">
                <h4 class="modal-title">Cédula</h4>
            </div>
            <div class="col-md-5">
                <g:textField name="cedula" class="form-control" placeholder="Cédula"/>
            </div>
        </div>
        <div class="modal-footer">
            <button class="btn btn-outline-dark" type="button" data-bb-handler="cancel">
                <i class="fa fa-times"></i> Cancelar</button>
            <button class="btn btn-primary" id="btnAceptar" type="button" data-bb-handler="confirm">
                <i class="fa fa-check"></i> Aceptar</button>
        </div>

%{--    </div>--}%
%{--</div>--}%

<script type="text/javascript">

    $("#btnAceptar").click(function (){
        cedula("${params.tipo}");
    });

    function cedula(tipo){
        var cedula = $("#cedula").val();
        %{--location.href="${createLink(controller: 'participante', action: 'verificar_ajax')}?c=" + cedula + "&tipo=" + tipo;--}%
        %{--location.href="${createLink(controller: 'participante', action: 'participante')}?c=" + cedula + "&tipo=" + tipo;--}%
        location.href="${createLink(controller: 'participante', action: 'verificarParticipante')}?c=" + cedula + "&tipo=" + tipo;
    }

</script>