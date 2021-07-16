<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 30/06/21
  Time: 15:05
--%>



<style type="text/css">

trix-editor {
    height: 150px !important;
    max-height: 150px !important;
    overflow-y: auto !important;
}
</style>

<g:form class="form-horizontal" name="frmContenidos" action="saveContenido_ajax">
    <g:hiddenField name="id" value="${contenido?.id}"/>
    <g:hiddenField name="curso" value="${curso?.id}"/>

    <div class="form-group ${hasErrors(bean: contenido, field: 'areas', 'error')} ">
        <span class="grupo">
            <label for="areas" class="col-md-2 control-label text-info">
                Área
            </label>
            <div class="col-md-8">
                <g:select name="areas" from="${areas}" optionValue="descripcion" optionKey="id" class="form-control required" value="${contenido?.areas?.id}"/>
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
            <div class="col-md-8 form-check form-check-inline"
                 style=" margin-left:5px; border-radius: 4px; border-style: solid; border-color: #888;
                 border-width: 1px; padding: 5px; height: 200px">
                <trix:editor name="contenido" class="editor" value="${contenido?.contenido}"/>
            </div>
        </span>

    </div>
    <div class="form-group ${hasErrors(bean: contenido, field: 'metodologia', 'error')} ">
        <span class="grupo">
            <label for="contenido" class="col-md-2 control-label text-info">
                Metodología
            </label>
            <div class="col-md-8 form-check form-check-inline"
                 style=" margin-left:5px; border-radius: 4px; border-style: solid; border-color: #888;
                 border-width: 1px; padding: 5px; height: 200px">
                <trix:editor name="metodologia" class="editor" value="${contenido?.metodologia}"/>
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

    // $("#contenido").replace('<input id="contenido" type="hidden" name="contenido" value="&lt;div&gt;Primera partes&lt;/div&gt;" /><trix-editor input="contenido" ></trix-editor>');
</script>
