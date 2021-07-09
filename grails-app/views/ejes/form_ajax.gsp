<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 01/07/21
  Time: 11:43
--%>

<g:form class="form-horizontal" name="frmTipoDesarrollo" action="saveTipoDesarrollo">
    <g:hiddenField name="id" value="${tipo?.id}"/>

    <div class="form-group ${hasErrors(bean: tipo, field: 'descripcion', 'error')} ">
        <span class="grupo">
            <label for="descripcion" class="col-md-2 control-label text-info">
                Descripción
            </label>
            <div class="col-md-10">
                <g:textArea name="descripcion" maxlength="63" class="form-control required" value="${tipo?.descripcion}" style="resize: none"/>
            </div>
        </span>
    </div>
    <div class="form-group ${hasErrors(bean: tipo, field: 'orden', 'error')} ">
        <span class="grupo">
            <label for="orden" class="col-md-2 control-label text-info">
                Orden
            </label>
            <div class="col-md-4">
                <g:textField name="orden" maxlength="63" class="form-control required" value="${tipo?.orden}" style="resize: none"/>
            </div>
        </span>
    </div>
</g:form>

<script type="text/javascript">
    var validator = $("#frmTipoDesarrollo").validate({
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
