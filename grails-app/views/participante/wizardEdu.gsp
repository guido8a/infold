<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>${tipo == '1' ? 'Instructor' : 'Participante'} - Educación</title>

    <asset:stylesheet src="/bar/main.css"/>
    <asset:javascript src="/bar/progress-bar.js"/>

    <style>

    .numeroPaso{
        background-color: #E6E6E6;
        -webkit-border-radius: 300px;
        -moz-border-radius: 300px;
        border-radius: 300px;
        color: #AF5B00;
        float: left;
        font-size: 36px;
        height: 70px;
        margin-right: 10px;
        text-align: center;
        width: 70px;
        font-weight: bold;
        padding-top: 8px;
    }

    .textoPaso {
        color: #AF5B00;
        font-size: 36px;
        float: left;
        margin-top: 8px;
    }

    .card {
        border: green;
        width: 100%;
        -webkit-box-shadow : 7px 7px 5px 0px rgba(50, 50, 50, 0.75);
        -moz-box-shadow    : 7px 7px 5px 0px rgba(50, 50, 50, 0.75);
        box-shadow         : 7px 7px 5px 0px rgba(50, 50, 50, 0.75);
    }

    </style>

</head>

<body>

<g:form class="form-horizontal" name="frmEdu" role="form" action="savePoli" method="POST">
    <g:hiddenField name="id" value="${participante?.id}" />
    <g:hiddenField name="tipo" value="${tipo}" />
    <g:hiddenField name="completado" value="${4}" />

    <div class="progress-bar-wrapper"></div>

    <div class="col-md-12" style="background-color: #d0d0d0; padding: 5px">
        <div class="col-md-10 btn-group" style="float: left;">
            <a href="#" class="btn btn-rojo btnRetornar" ><i class="fa fa-arrow-left"></i> Anterior</a>
            <a href="#" class="btn btn-gris btnSalir" ><i class="fa fa-door-open"></i> Salir</a>
        </div>
        <div class="col-md-2 btn-group">
            <a href="#" class="btn btn-rojo btnSiguiente flush-right" >Siguiente <i class="fa fa-arrow-right"></i></a>
        </div>
    </div>

    <div class="card">
        <div class="card-header">
            &nbsp;
        </div>
        <div class="card-body">
        </div>
    </div>

    <div class="card" style="width: 100%; height: 300px">
        <div class="card-body">

            <div style="margin-top: 10px">
                <p class="numeroPaso">4</p>
                <h1 class="textoPaso">Educación</h1>
                <div class="col-md-8">
                    <h3> Educación  - ${participante?.tipo == '1' ? 'Instructor' : 'Participante'}</h3>

                    <div class="col-md-12" style="margin-bottom: 10px">
                        <div class="form-group">
                            <span class="grupo">
                                <label class="col-md-3 control-label text-info">
                                    Nivel de Educación
                                </label>
                                <div class="col-md-6">
                                    <g:select name="nivelEducacion" from="${infold.NivelEducacion.list().sort{it.descripcion}}" class="form-control" optionKey="id" optionValue="descripcion" value="${participante?.nivelEducacion?.id}"/>
                                </div>
                            </span>
                        </div>
                    </div>

                    <div class="col-md-12" style="margin-bottom: 10px">
                        <div class="form-group ${hasErrors(bean: 'participante', field: 'area', 'error')}">
                            <span class="grupo">
                                <label class="col-md-3 control-label text-info">
                                    Área de especialización
                                </label>
                                <div class="col-md-6">
                                    <g:textArea name="area" maxlength="127" style='resize: none; height: 60px' class="form-control" title="Área de especialización"
                                                value="${participante?.area ?: ''}"/>
                                </div>
                            </span>
                        </div>
                    </div>

                    <div class="col-md-12" style="margin-bottom: 10px">
                        <div class="form-group ${hasErrors(bean: 'participante', field: 'estudia', 'error')}">
                            <span class="grupo">
                                <label class="col-md-3 control-label text-info">
                                    Estudia actualmente?
                                </label>
                                <div class="col-md-2">
                                    <g:select name="estudia" from="${[0 : 'NO', 1 : 'SI']}" class="form-control" optionKey="key" optionValue="value" value="${participante?.estudia}"/>
                                </div>
                            </span>
                        </div>
                    </div>

                    <div class="col-md-12" style="margin-bottom: 10px">
                        <div class="form-group ${hasErrors(bean: 'participante', field: 'carreraEstudia', 'error')}">
                            <span class="grupo">
                                <label class="col-md-3 control-label text-info">
                                    Carrera que estudia
                                </label>
                                <div class="col-md-6">
                                    <g:textArea name="carreraEstudia" maxlength="255" style='resize: none; height: 60px' class="form-control" title="Carrera que estudia actualmente"
                                                value="${participante?.carreraEstudia ?: ''}"/>
                                </div>
                            </span>
                        </div>
                    </div>

                </div>

                <div class="col-md-12" style="margin-bottom: 10px">
                    <div class="col-md-3 btn-group" style="float: right">.
                    </div>
                </div>


            </div>
        </div>
    </div>

</g:form>

<script type="text/javascript">

    revisarNivel($("#nivelEducacion").val())

    $("#nivelEducacion").change(function (){
        var nivel = $(this).val();
        revisarNivel(nivel)
    });

    function revisarNivel(nivel){
        var lista = [3,4,5];
        if(nivel in lista){
            $("#area").attr("disabled", true)
            $("#area").val('')
        }else{
            $("#area").attr("disabled", false)
        }
    }

    revisarEstudia($("#estudia").val());

    $("#estudia").change(function (){
       var estado = $(this).val();
        revisarEstudia(estado)
    });

    function revisarEstudia(estado){
        if(estado == 0){
            $("#carreraEstudia").attr("disabled", true);
            $("#carreraEstudia").val("")
        }else{
            $("#carreraEstudia").attr("disabled", false)
        }
    }

    $(".btnSalir").click(function () {
        bootbox.dialog({
            title   : "Alerta",
            message : "<i class='fa fa-exclamation-triangle fa-3x pull-left text-warning text-shadow'></i>" +
                "<p style='font-size: 14px; font-weight: bold'>" + "&nbsp; El ingreso de datos no se encuentra " +
                "completo. <br> &nbsp; Desea salir?" + "</p>",
            buttons : {
                cancelar : {
                    label     : "<i class='fa fa-times'></i> Cancelar",
                    className : "btn-primary",
                    callback  : function () {
                    }
                },
                aceptar : {
                    label     : "<i class='fa fa-check'></i> Aceptar",
                    className : "btn-success",
                    callback  : function () {
                        location.href="${createLink(controller: 'inicio', action: 'index')}"
                    }
                }
            }
        });
    });

    $(".btnRetornar").click(function () {
        var lista = [3,4,5];
        if($("#nivelEducacion option:selected").val() in lista){
            if($("#estudia").val() == 0){
                submitFormEdu(0);
            }else{
                if($("#carreraEstudia").val() == ''){
                    bootbox.alert("<i class='fa fa-exclamation-triangle fa-2x text-warning'></i> Ingrese la carrera que estudia actualmente")
                }else{
                    submitFormEdu(0);
                }
            }
        }else{
            if($("#area").val() == ''){
                bootbox.alert("<i class='fa fa-exclamation-triangle fa-2x text-warning'></i> Ingrese el área de especialización")
            }else{
                if($("#estudia").val() == 0){
                    submitFormEdu(0);
                }else{
                    if($("#carreraEstudia").val() == ''){
                        bootbox.alert("<i class='fa fa-exclamation-triangle fa-2x text-warning'></i> Ingrese la carrera que estudia actualmente")
                    }else{
                        submitFormEdu(0);
                    }
                }
            }
        }
    });

    ProgressBar.init(['Datos', 'Ubicación', 'Afiliación',  'Estudios', 'Trabajo'],
        'Estudios', 'progress-bar-wrapper');

    $(".btnSiguiente").click(function () {
        var lista = [3,4,5];
        if($("#nivelEducacion option:selected").val() in lista){
            if($("#estudia").val() == 0){
                submitFormEdu(1);
            }else{
                if($("#carreraEstudia").val() == ''){
                    bootbox.alert("<i class='fa fa-exclamation-triangle fa-2x text-warning'></i> Ingrese la carrera que estudia actualmente")
                }else{
                    submitFormEdu(1);
                }
            }
        }else{
            if($("#area").val() == ''){
                bootbox.alert("<i class='fa fa-exclamation-triangle fa-2x text-warning'></i> Ingrese el área de especialización")
            }else{
                if($("#estudia").val() == 0){
                    submitFormEdu(1);
                }else{
                    if($("#carreraEstudia").val() == ''){
                        bootbox.alert("<i class='fa fa-exclamation-triangle fa-2x text-warning'></i> Ingrese la carrera que estudia actualmente")
                    }else{
                        submitFormEdu(1);
                    }
                }
            }
        }
    });

    function submitFormEdu(band) {

        var $form = $("#frmEdu");
        if ($form.valid()) {
            var l = cargarLoader("Grabando...");
            var data = $form.serialize();
            $.ajax({
                type    : "POST",
                url     : '${createLink(action:'savePoli')}',
                // data: data,
                data: {
                    id: $("#id").val(),
                    tipo: $("#tipo").val(),
                    completado: $("#completado").val(),
                    nivelEducacion: $("#nivelEducacion option:selected").val(),
                    area: $("#area").val(),
                    estudia: $("#estudia option:selected").val(),
                    carreraEstudia: $("#carreraEstudia").val()
                },
                success : function (msg) {
                    l.modal("hide");
                    var parts = msg.split("_");
                    if (parts[0] == "ok") {
                        if(band == 1){
                            location.href="${createLink(controller: 'participante', action: 'wizardFor')}?id=" + parts[1];
                        }else{
                            location.href="${createLink(controller: 'participante', action: 'wizardPoli')}?id=" + parts[1];
                        }
                    } else {
                        log("Error al guardar los datos","error");
                    }
                }
            });
        } else {
            return false;
        } //else
    }

</script>

</body>
</html>