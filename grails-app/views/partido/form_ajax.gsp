<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 30/06/21
  Time: 15:05
--%>


<g:form class="form-horizontal" name="frmPartido" action="savePartido">
    <g:hiddenField name="id" value="${partido?.id}"/>

    <div class="form-group ${hasErrors(bean: partido, field: 'lista', 'error')} ">
        <span class="grupo">
            <label for="lista" class="col-md-2 control-label text-info">
                Lista
            </label>
            <div class="col-md-3">
                <g:textField name="lista" maxlength="2" class="form-control required" value="${partido?.lista}"/>
            </div>
        </span>
    </div>
    <div class="form-group ${hasErrors(bean: partido, field: 'descripcion', 'error')} ">
        <span class="grupo">
            <label for="descripcion" class="col-md-2 control-label text-info">
                Descripción
            </label>
            <div class="col-md-10">
                <g:textField name="descripcion" maxlength="255" class="form-control required" value="${partido?.descripcion}"/>
            </div>
        </span>
    </div>
    <div class="form-group ${hasErrors(bean: partido, field: 'sigla', 'error')} ">
        <span class="grupo">
            <label for="sigla" class="col-md-2 control-label text-info">
                Sigla
            </label>
            <div class="col-md-3">
                <g:textField name="sigla" maxlength="8" class="allCaps form-control required" value="${partido?.sigla}"/>
            </div>
        </span>
    </div>
</g:form>

<script type="text/javascript">
    var validator = $("#frmPartido").validate({
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
