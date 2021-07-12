<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 12/07/21
  Time: 10:26
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Curso</title>

    <style>

    </style>

</head>

<body>


%{--<g:form class="form-horizontal" name="frmCurso" role="form" action="saveCurso" method="POST">--}%



            <div class="col-md-10">


                <div class="col-md-12" style="margin-bottom: 10px">
                    <div class="form-group ${hasErrors(bean: 'participante', field: 'cedula', 'error')}">
                        <span class="grupo">
                            <label class="col-md-3 control-label text-info">
                                Cédula
                            </label>
                            <div class="col-md-3">
                                <g:textField name="cedula" class="form-control" readonly="" title="Cédula"
                                             value="${participante?.cedula ?: cedula}" style="font-size: 16px"/>
                            </div>
                        </span>
                    </div>
                </div>

                <div class="col-md-12" style="margin-bottom: 10px">
                    <div class="form-group ${hasErrors(bean: 'participante', field: 'nombre', 'error')}">
                        <span class="grupo">
                            <label class="col-md-3 control-label text-info">
                                Nombres
                            </label>
                            <div class="col-md-6">
                                <g:textField name="nombre" maxlength="31" class="form-control required" title="Nombres"
                                             value="${participante?.nombre ?: ''}" style="background-color: #ffffef"/>
                            </div>
                        </span>
                    </div>
                </div>

                <div class="col-md-12" style="margin-bottom: 10px">
                    <div class="form-group ${hasErrors(bean: 'participante', field: 'apellido', 'error')}">
                        <span class="grupo">
                            <label class="col-md-3 control-label text-info">
                                Apellidos
                            </label>
                            <div class="col-md-6">
                                <g:textField name="apellido" maxlength="31" class="form-control required" title="Apellido"
                                             value="${participante?.apellido ?: ''}" style="background-color: #ffffef"/>
                            </div>
                        </span>
                    </div>
                </div>

                <div class="col-md-12" style="margin-bottom: 10px">
                    <div class="form-group ${hasErrors(bean: 'participante', field: 'mail', 'error')}">
                        <span class="grupo">
                            <label class="col-md-3 control-label text-info">
                                Mail
                            </label>
                            <div class="col-md-6">
                                <g:textField name="mail" maxlength="63" class="email mail form-control" title="Email"
                                             value="${participante?.mail ?: ''}"/>
                            </div>
                        </span>
                    </div>
                </div>

                <div class="col-md-12" style="margin-bottom: 10px">
                    <div class="form-group ${hasErrors(bean: 'participante', field: 'telefono', 'error')}">
                        <span class="grupo">
                            <label class="col-md-3 control-label text-info">
                                Teléfono
                            </label>
                            <div class="col-md-3">
                                <g:textField name="telefono" maxlength="31" class="digits form-control" title="Teléfono"
                                             value="${participante?.telefono ?: ''}"/>
                            </div>
                        </span>
                        <span class="grupo">
                            <label for="genero" class="col-md-1 control-label text-info">
                                Género
                            </label>
                            <div class="col-md-3">
                                <g:select name="genero" from="${['M':'Masculino', 'F':'Femenino', 'G':'GLBTI+']}"
                                          class="form-control" optionKey="key" optionValue="value"
                                          value="${participante?.genero}"/>
                            </div>
                        </span>
                    </div>
                </div>

            </div>

%{--</g:form>--}%

</body>
</html>