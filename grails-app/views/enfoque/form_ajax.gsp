<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 30/06/21
  Time: 15:05
--%>


<g:form class="form-horizontal" name="frmEnfoque" action="saveEnfoque">
    <g:hiddenField name="id" value="${enfoque?.id}"/>

    <div class="form-group ${hasErrors(bean: enfoque, field: 'descripcion', 'error')} ">
        <span class="grupo">
            <label for="descripcion" class="col-md-2 control-label text-info">
                Descripción
            </label>
            <div class="col-md-10">
                <g:textArea name="descripcion" maxlength="127" class="form-control required" value="${enfoque?.descripcion}" style="resize: none"/>
            </div>
        </span>
    </div>
</g:form>

<script type="text/javascript">
    var validator = $("#frmEnfoque").validate({
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
