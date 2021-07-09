<%@ page import="infold.Ejes" %>
<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 30/06/21
  Time: 15:05
--%>

<style>

select#tipoDesarrollo option{
    max-width: 100%;
    border: 1px solid cornflowerblue;
    border-radius: 2px;
    box-shadow: 0 2px 8px #888;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}

.select-selected {
    background-color: DodgerBlue;
}

</style>

<g:form class="form-horizontal" name="frmDesarrollo" action="saveEnfoque">
    <g:hiddenField name="id" value="${desarrollo?.id}"/>

    <div class="form-group ${hasErrors(bean: desarrollo, field: 'ejes', 'error')} ">
        <span class="grupo">
            <label for="tipoDesarrollo" class="col-md-2 control-label text-info">
                Eje de desarrollo
            </label>
            <div class="col-md-10">
                <g:select name="tipoDesarrollo" from="${infold.Ejes?.list()?.sort{it.descripcion}}"
                          class="form-control" value="${desarrollo?.ejes?.id}" optionKey="id" optionValue="descripcion"/>
            </div>
        </span>
    </div>
    <div class="form-group ${hasErrors(bean: desarrollo, field: 'descripcion', 'error')} ">
        <span class="grupo">
            <label for="descripcion" class="col-md-2 control-label text-info">
                Descripción
            </label>
            <div class="col-md-10">
                <g:textArea name="descripcion" maxlength="255" class="form-control required"
                             value="${desarrollo?.descripcion}" style="resize: none"/>
            </div>
        </span>
    </div>
    <div class="form-group ${hasErrors(bean: desarrollo, field: 'orden', 'error')} ">
        <span class="grupo">
            <label for="orden" class="col-md-2 control-label text-info">
                Orden
            </label>
            <div class="col-md-2">
                <g:textField name="orden" maxlength="63" class="form-control required" value="${desarrollo?.orden}" style="resize: none"/>
            </div>
        </span>
    </div>
</g:form>

<script type="text/javascript">
    var validator = $("#frmDesarrollo").validate({
        errorClass     : "help-block",
        errorPlacement : function (error, element) {
            if (element.parent().hasClass("input-group")) {
                error.insertAfter(element.parent());
            } else {
                error.insertAfter(element);
            }
            element.parents(".grupo").addClass('has-error');
        },
        success        : function (label) {
            label.parents(".grupo").removeClass('has-error');
        }
    });
    $(".form-control").keydown(function (ev) {
        if (ev.keyCode == 13) {
            submitForm();
            return false;
        }
        return true;
    });
</script>
