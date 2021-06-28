<!DOCTYPE html>
<html lang="en" class="no-js">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <title>Institución</title>
    <meta name="layout" content="main"/>

    <asset:javascript src="/trix.js"/>
    <asset:stylesheet src="/trix.css"/>


    <style type="text/css">
        body {
            /*background: #B4BAC0;*/
            line-height: 1.0;
        }
        trix-editor {
            height: 150px !important;
            max-height: 150px !important;
            overflow-y: auto !important;
        }
    </style>
</head>

<body>


<asset:javascript src="/apli/jquery.switcher.js"/>
<asset:stylesheet src="/apli/switcher.css"/>

    <g:form class="form-horizontal" name="frmProducto" role="form" action="saveProducto" method="POST">
        <g:hiddenField name="id" value="${producto?.id}" />
        <g:hiddenField name="persona" value="${persona?.id}" />

        <div class="form-group">
            <span class="grupo">
                <label class="col-md-2 control-label text-info">
                    Anuncio
                </label>
                <div class="col-md-6">
                    <span class="badge bg-primary">${anuncio?.nombre}</span>
                </div>
            </span>
        </div>

        <div class="form-group ${hasErrors(bean: 'producto', field: 'titulo', 'error')} required">
            <span class="grupo">
                <label for="titulo" class="col-md-2 control-label text-info">
                    Título
                </label>
                <div class="col-md-8">
                    <g:textField name="titulo" maxlength="255" required="" class="form-control required" value="${producto?.titulo}"/>
                </div>
                *
            </span>
        </div>

        <div class="form-group ${hasErrors(bean: 'producto', field: 'subtitulo', 'error')}">
            <span class="grupo">
                <label class="col-md-2 control-label text-info">
                    Subtítulo
                </label>
                <div class="col-md-8">
                    <g:textField name="subtitulo" maxlength="255" class="form-control" value="${producto?.subtitulo}"/>
                </div>
            </span>
        </div>

        <div class="form-group ${hasErrors(bean: 'producto', field: 'orden', 'error')} required">
            <span class="grupo">
                <label for="orden" class="col-md-2 control-label text-info">
                    Orden
                </label>
                <div class="col-md-3">
                    <g:textField name="orden" maxlength="2" required="" class="digits form-control required" value="${producto?.orden}"/>
                </div>
            </span>
        </div>

        <div class="form-group ${hasErrors(bean: 'promotor', field: 'estado', 'error')}">
            <span class="grupo">
                <label class="col-md-2 control-label text-info">
                    Estado
                </label>
                <div class="col-md-6 form-check form-check-inline" style="margin-top: 5px">
                    <input name="estado" class="form-check-input" type="checkbox" id="inlineCheckbox1" ${producto?.estado == '1' ? 'checked' : ''}> <span class="badge bg-primary">OK=Activo, No=Inactivo</span>
                </div>
            </span>
        </div>

        <div class="form-group ${hasErrors(bean: 'promotor', field: 'objetivo', 'error')}">
            <span class="grupo">
                <label class="col-md-2 control-label text-info">
                    Objetivos
                </label>
                <div class="col-md-8 form-check form-check-inline"
                     style=" margin-left:5px; border-radius: 4px; border-style: solid; border-color: #888;
                     border-width: 1px; padding: 5px; height: 200px">
                    <trix:editor name="texto" class="editor" value="${institucion?.objetivo}"/>
                </div>
            </span>
        </div>

    </g:form>

    <script type="text/javascript">

        $.switcher('input[type=checkbox]');

        var validator = $("#frmProducto").validate({
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


</body>