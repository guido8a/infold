<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 30/06/21
  Time: 15:05
--%>

<g:form class="form-horizontal" name="frmContenidos" action="saveContenido_ajax">
    <g:hiddenField name="id" value="${contenido?.id}"/>

    <div class="form-group ${hasErrors(bean: contenido, field: 'areas', 'error')} ">
        <span class="grupo">
            <label for="areas" class="col-md-2 control-label text-info">
                Área
            </label>
            <div class="col-md-8">
               <g:select name="areas" from="${areas}" optionValue="descripcion" optionKey="id" class="form-control" value="${contenido?.areas?.id}"/>
            </div>
        </span>
    </div>
    <div class="form-group ${hasErrors(bean: contenido, field: 'numero', 'error')} ">
        <span class="grupo">
            <label for="numero" class="col-md-2 control-label text-info">
                Número
            </label>
            <div class="col-md-2">
                <g:textField name="numero" maxlength="2" class="digits form-control required" value="${contenido?.numero}"/>
            </div>
        </span>
    </div>
    <div class="form-group ${hasErrors(bean: contenido, field: 'contenido', 'error')} ">
        <span class="grupo">
            <label for="contenido" class="col-md-2 control-label text-info">
                Contenido
            </label>
            <div class="col-md-8">
                <g:textArea name="contenido" class="form-control required" value="${contenido?.contenido}" style="resize: none; height: 150px"/>
            </div>
        </span>
    </div>
    <div class="form-group ${hasErrors(bean: contenido, field: 'metodologia', 'error')} ">
        <span class="grupo">
            <label for="contenido" class="col-md-2 control-label text-info">
                Metodología
            </label>
            <div class="col-md-8">
                <g:textArea name="metodologia" class="form-control" value="${contenido?.metodologia}" style="resize: none; height: 150px"/>
            </div>
        </span>
    </div>
    <div class="form-group ${hasErrors(bean: contenido, field: 'numeroHorasDocente', 'error')} ">
        <span class="grupo">
            <label for="numeroHorasDocente" class="col-md-2 control-label text-info">
                Horas Docente
            </label>
            <div class="col-md-1">
                <g:textField name="numeroHorasDocente" class="digits form-control" value="${contenido?.numeroHorasDocente}"/>
            </div>
            <label for="numeroHorasPractica" class="col-md-2 control-label text-info">
                Horas Práctica
            </label>
            <div class="col-md-1">
                <g:textField name="numeroHorasPractica" class="digits form-control" value="${contenido?.numeroHorasPractica}"/>
            </div>
            <label for="numeroHorasDocente" class="col-md-3 control-label text-info">
                Horas Aprendizaje Autónomo
            </label>
            <div class="col-md-1">
                <g:textField name="numeroHorasAprendizajeAutonomo" class="digits form-control" value="${contenido?.numeroHorasAprendizajeAutonomo}"/>
            </div>
        </span>
    </div>
</g:form>

<script type="text/javascript">
    var validator = $("#frmContenidos").validate({
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
