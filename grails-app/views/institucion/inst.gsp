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
        height: 100px !important;
        max-height: 100px !important;
        overflow-y: auto !important;
    }
    </style>
</head>

<body>


<asset:javascript src="/apli/jquery.switcher.js"/>
<asset:stylesheet src="/apli/switcher.css"/>

<g:form class="form-horizontal" name="frmInstitucion" role="form" action="saveInstitucion" method="POST">
    <g:hiddenField name="id" value="${institucion?.id}" />

    <div class="col-md-12">
        <div class="col-md-4">
            <a href="${createLink(controller: 'inicio', action:'index')}" class="btn btn-primary">
                <i class="fa fa-arrow-left"></i> Regresar</a>
            <a href="#" class="btn btn-success btnGuardarInsti"> <i class="fa fa-save"></i> Guardar</a>
        </div>
        <div class="col-md-8">
            <h3>${institucion?.nombre}</h3>
        </div>
    </div>
    <div class="form-group ${hasErrors(bean: 'institucion', field: 'nombre', 'error')} required">
        <span class="grupo">
            <label for="nombre" class="col-md-2 control-label text-info">
                Nombre
            </label>
            <div class="col-md-5">
                <g:textField name="nombre" maxlength="127" required="" class="form-control required" value="${institucion?.nombre}"/>
            </div>
            <label for="sigla" class="col-md-1 control-label text-info">
                Sigla
            </label>
            <div class="col-md-2">
                <g:textField name="sigla" maxlength="127" required="" class="form-control required" value="${institucion?.sigla}"
                style="font-size: x-large"/>
            </div>
        </span>
    </div>

    <div class="form-group ${hasErrors(bean: 'institucion', field: 'sigla', 'mail')}">
        <span class="grupo">
            <label for="mail" class="col-md-2 control-label text-info">
                Mail
            </label>
            <div class="col-md-4">
                <g:textField name="mail" maxlength="255" required="" class="email mail form-control required"
                             value="${institucion?.mail}"/>
            </div>

            <label for="telefono" class="col-md-1 control-label text-info">
                Teléfono
            </label>
            <div class="col-md-3">
                <g:textField name="telefono" maxlength="63" class="digits form-control" value="${institucion?.telefono}"/>
            </div>
        </span>
    </div>

    <div class="form-group ${hasErrors(bean: 'institucion', field: 'nombre', 'direccion')}">
        <span class="grupo">
            <label for="direccion" class="col-md-2 control-label text-info">
                Dirección
            </label>
            <div class="col-md-8">
                <g:textField name="direccion" maxlength="255" class="form-control" value="${institucion?.direccion}"/>
            </div>
        </span>
    </div>

    <div class="form-group ${hasErrors(bean: 'institucion', field: 'objetivo', 'error')}">
        <span class="grupo">
            <label for="sigla" class="col-md-2 control-label text-info">
                Objetivo
            </label>
            <div class="col-md-8 form-check form-check-inline"
                 style=" margin-left:5px; border-radius: 4px; border-style: solid; border-color: #888;
                 border-width: 1px; padding: 5px; height: 150px">
                <trix:editor name="objetivo" class="editor" value="${institucion?.objetivo}"/>
            </div>
        </span>
    </div>

    <div class="form-group ${hasErrors(bean: 'institucion', field: 'descricpion', 'error')}">
        <span class="grupo">
            <label for="sigla" class="col-md-2 control-label text-info">
                Descripción
            </label>
            <div class="col-md-8 form-check form-check-inline"
                 style=" margin-left:5px; border-radius: 4px; border-style: solid; border-color: #888;
                 border-width: 1px; padding: 5px; height: 150px">
                <trix:editor name="descricpion" class="editor" value="${institucion?.descricpion}"/>
            </div>
        </span>
    </div>

    <div class="form-group ${hasErrors(bean: 'institucion', field: 'ejesFormacion', 'error')}">
        <span class="grupo">
            <label class="col-md-2 control-label text-info">
                Ejes de formación
            </label>
            <div class="col-md-8 form-check form-check-inline"
                 style=" margin-left:5px; border-radius: 4px; border-style: solid; border-color: #888;
                 border-width: 1px; padding: 5px; height: 150px">
                <trix:editor name="ejesFormacion" class="editor" value="${institucion?.ejesFormacion}"/>
            </div>
        </span>
    </div>

%{--        <div class="form-group ${hasErrors(bean: 'promotor', field: 'estado', 'error')}">--}%
%{--            <span class="grupo">--}%
%{--                <label class="col-md-2 control-label text-info">--}%
%{--                    Estado--}%
%{--                </label>--}%
%{--                <div class="col-md-6 form-check form-check-inline" style="margin-top: 5px">--}%
%{--                    <input name="estado" class="form-check-input" type="checkbox" id="inlineCheckbox1" ${producto?.estado == '1' ? 'checked' : ''}> <span class="badge bg-primary">OK=Activo, No=Inactivo</span>--}%
%{--                </div>--}%
%{--            </span>--}%
%{--        </div>--}%

    <div class="form-group ${hasErrors(bean: 'institucion', field: 'vision', 'error')}">
        <span class="grupo">
            <label class="col-md-2 control-label text-info">
                Visión
            </label>
            <div class="col-md-8 form-check form-check-inline"
                 style=" margin-left:5px; border-radius: 4px; border-style: solid; border-color: #888;
                 border-width: 1px; padding: 5px; height: 150px">
                <trix:editor name="vision" class="editor" value="${institucion?.vision}"/>
            </div>
        </span>
    </div>

    <div class="form-group ${hasErrors(bean: 'institucion', field: 'mision', 'error')}">
        <span class="grupo">
            <label class="col-md-2 control-label text-info">
                Misión
            </label>
            <div class="col-md-8 form-check form-check-inline"
                 style=" margin-left:5px; border-radius: 4px; border-style: solid; border-color: #888;
                 border-width: 1px; padding: 5px; height: 150px">
                <trix:editor name="mision" class="editor" value="${institucion?.mision}"/>
            </div>
        </span>
    </div>



</g:form>

<script type="text/javascript">

    $(".btnGuardarInsti").click(function () {
        submitFormInstitucion();
    });

    function submitFormInstitucion() {
        var $form = $("#frmInstitucion");
        if ($form.valid()) {
            var l = cargarLoader("Grabando...");
            var data = $form.serialize();
            $.ajax({
                type    : "POST",
                url     : '${createLink(action:'saveInstitucion')}',
                data: data,
                success : function (msg) {
                    l.modal("hide");
                    var parts = msg.split("_");
                    if (parts[0] == "ok") {
                       log("Datos de institución guardados correctamente","success")
                        setTimeout(function () {
                            location.href="${createLink(controller: 'institucion', action: 'inst')}?id=" + parts[1];
                        }, 800);
                    } else {
                        log("Error al guardar los datos de institución","error");
                    }
                }
            });
        } else {
            return false;
        } //else
    }

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