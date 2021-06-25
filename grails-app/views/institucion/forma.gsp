<!DOCTYPE html>
<html lang="en" class="no-js">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <script type="text/javascript"
            src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBpasnhIQUsHfgCvC3qeJpEgcB9_ppWQI0&sensor=true"></script>

<asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
<title>Ventas</title>

%{--    <g:layoutHead/>--}%

<!-- Bootstrap core CSS -->
<asset:stylesheet src="/merc/bootstrap.min.css"/>
<asset:stylesheet src="/apli/shop-homepage.css"/>

<asset:javascript src="/merc/jquery.min.js"/>
<asset:javascript src="/merc/bootstrap.bundle.js"/>
<asset:javascript src="/apli/bootbox.js"/>
<asset:javascript src="/jquery-validation-1.11.1/js/jquery.validate.min.js"/>
<asset:javascript src="/jquery-validation-1.11.1/js/jquery.validate.js"/>
<asset:javascript src="/jquery-validation-1.11.1/localization/messages_es.js"/>
<asset:javascript src="/apli/functions.js"/>
<asset:javascript src="/apli/loader.js"/>
<asset:javascript src="/apli/fontawesome.all.min.js"/>

<style type="text/css">




body {
    /*background: #B4BAC0;*/
    line-height: 1.0;
}
.lista-item {
    position: relative;
    display: block;
    padding: .5rem 1.0rem;
    background-color: #fff;
    border: 1px solid rgba(0, 0, 0, .125);
    border-top-width: 1px;
}

.consulta {
    color: var(--naranja00);
    font-size: small;
    background-color: #fdfdfd;
}

.cs900 {
    width: 800px;
    height: 350px;
    align-content: center;
    /*background-color: #B4BAC0;*/
    background-color: var(--gris);
}

.carousel-inner {
    text-align: center;
}

.carousel .item > img {
    display: inline-block;
}

.imag-item {
    height: 350px;
    width: auto;
    max-height: 350px;
    margin: 0;
}


.marcoDestacados {
    border-color: var(--naranja0);
}

.buscar {
    /*color: #444 !important;*/
    border-radius: 4px;
    background-image: linear-gradient(var(--naranja3),var(--naranja),var(--naranja3));
    text-align-all: center;
    margin: 2px;
}
.buscar:hover{
    background-image: linear-gradient(var(--naranja),var(--naranja3),var(--naranja));
}

.btn-gris {
    border-radius: 4px;
    background-image: linear-gradient(#D4DAE0, #A4AAB0, #D4DAE0);
    text-align-all: center;
    margin: 2px;
}
.btn-gris-inv {
    border-radius: 4px;
    background-image: linear-gradient(#A4AAB0, #D4DAE0, #A4AAB0);
    text-align-all: center;
    margin: 2px;
}
.btn-gris a {
    color: #000;
}
.btn-gris:hover{
    color: #000;
    background-image: linear-gradient(#A4AAB0, #D4DAE0, #A4AAB0);
}
.btn-gris-inv:hover{
    color: #000;
    background-image: linear-gradient(#D4DAE0, #A4AAB0, #D4DAE0);
}

a.nav-link:hover {
    border-radius: 4px;
    background-image: linear-gradient(#D4DAE0, #D4DAE0, #D4DAE0);
}

.navbar-nav .nav-link{
    border-radius: 4px;
    height: 30px;
    text-decoration: none;
}
.navbar-dark .navbar-nav .nav-link {
    border-radius: 4px;
    background-image: linear-gradient(#D4DAE0, #A4AAB0, #D4DAE0);
}

:root {
    --naranja: #FFAB2A;
    --naranja1: #DF8B0A;
    --naranja3: #FFCB4A;
    --naranja2: #EFEBEA;
    --naranja0: #AF5B00;
    --naranja00: #4F1B00;
    --gris: #343A40;
}

.redondeado {
    width: 400px;
    border-style:solid;
    border-width: 2px;
    border-color: var(--naranja);
    /*border-color: #e67a00;*/
    border-radius: 4px;
    background-color:var(--naranja);
    text-align: center;
}

.estilo {
    border-radius: 50px;
    border-style: solid;
    border-width: 1px;
    border-color: #000000;
}

.categoria {
    position: relative;
    display: block;
    padding: .5rem 1.0rem;
    background-color: #fff;
    /*border: 1px solid rgba(0, 0, 0, .25);*/
    border: 1px solid #0a193b;
    border-top-width: 1px;
    border-top-width: 1px;
    color: #42577d;
    border-radius: 5px;
    margin-right: 0px;
}

.subcat {
    margin-left: 20px;
    padding-left: 20px;
    border-radius: 7px;
}

a.categoria:hover{
    text-decoration: none;
    color: #0a193b;
    background-color: var(--naranja2);
}
a.subcat:hover{
    text-decoration: none;
    color: #0a193b;
    /*background-color: #efeff8;*/
    background-color: var(--naranja);
;
}

.act_ct {
    color: #222;
    background-color: var(--naranja2);
    border-width: 2px;
    /*border-color: #bF6B00;*/
    border-color: var(--naranja0);
}

.activo {
    color: #222;
    /*background-color: #fdf8f0;*/
    background-color: var(--naranja);
    border-width: 2px;
    /*border-left: 20px solid #343a40;*/
    border-color: var(--naranja0);
}

.titulo0 {
    color:var(--naranja00);
    /*color: #444;*/
    font-size: 1.5rem;
}

.titulo1 {
    color:var(--naranja0);
    font-size: 1.5rem;
}

.titulo2 {
    color:var(--naranja0);
    font-size: 1.2rem;
}

a.consulta {
    color:var(--naranja00);
    /*font-size: 1.2rem;*/
    /*text-decoration: none;*/
}
.titulo2 a {
    color:var(--naranja0);
    font-size: 1.2rem;
}

.blink_text {
    animation:1s blinker linear infinite;
    -webkit-animation:1s blinker linear infinite;
    -moz-animation:1s blinker linear infinite;
    color: black;
}

@-moz-keyframes blinker {
    0% { opacity: 1.0; }
    50% { opacity: 0.2; }
    100% { opacity: 1.0; }
}

@-webkit-keyframes blinker {
    0% { opacity: 1.0; }
    50% { opacity: 0.2; }
    100% { opacity: 1.0; }
}

@keyframes blinker {
    0% { opacity: 1.0; }
    50% { opacity: 0.2; }
    100% { opacity: 1.0; }
}

.columnas {
    float: left;
    border-radius: 8px;
    border-style: solid;
    border-color: var(--gris);
    border-width: 1px;
    padding: 1%;
    margin-top: 1%;
}

.barra {
    border-radius: 7px;
    background-color: var(--gris);
    padding: 0.5em;
    margin-bottom: 0.5em;
    color: #fff;
}


.btn-rojo {
    border-radius: 4px;
    background-image: linear-gradient(var(--naranja3),var(--naranja),var(--naranja3));
    text-align-all: center;
    margin: 2px;
}
.btn-rojo:hover{
    background-image: linear-gradient(var(--naranja),var(--naranja3),var(--naranja));
}
.btn-gris {
    border-radius: 4px;
    background-image: linear-gradient(#D4DAE0, #A4AAB0, #D4DAE0);
    text-align-all: center;
    margin: 2px;
}

</style>
</head>

<body>


<asset:javascript src="/apli/jquery.switcher.js"/>
<asset:stylesheet src="/apli/switcher.css"/>

<g:if test="${!producto}">
    No se encontró el producto
</g:if>
<g:else>
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

</g:else>

</body>