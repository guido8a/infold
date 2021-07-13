<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 13/07/21
  Time: 10:03
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Contenidos - ${curso?.nombre}</title>
</head>

<body>


<div class="panel-heading" style="padding: 3px; margin-top: 2px; text-align: left">
    <div class="btn-group">
        <a href="${createLink(controller: 'curso', action: 'curso', params: [id: curso?.id])}" id="btnSalir"
           class="btn btn-sm btn-warning" title="Salir">
            <i class="fa fa-arrow-left"></i> Curso
        </a>
        <a href="#" id="btnNuevo" class="btn btn-sm btn-info" title="Nuevo Curso">
            <i class="fa fa-file"></i> Nuevo contenido
        </a>
    </div>
</div>

<div style="margin-top: 30px; min-height: 650px" class="vertical-container">
    <p class="css-vertical-text">Contenidos - ${curso?.nombre}</p>

    <div class="linea"></div>
    <table class="table table-bordered table-hover table-condensed" style="width: 1070px">
        <thead>
        <tr>
%{--            <th class="alinear" style="width: 15%">Curso</th>--}%
            <th class="alinear" style="width: 10%">Eje de formación</th>
            <th class="alinear" style="width: 10%">Área</th>
            <th class="alinear" style="width: 5%">Número</th>
            <th class="alinear" style="width: 6%">Horas docente</th>
            <th class="alinear" style="width: 6%">Horas Práctica</th>
            <th class="alinear" style="width: 7%">Horas Aprendizaje autónomo</th>
            <th class="alinear" style="width: 10%">Metodología</th>
            <th class="alinear" style="width: 30%">Contenido</th>
        </tr>
        </thead>
    </table>


    <div class="" style="width: 99.7%;height: 400px; overflow-y: auto;float: right; margin-top: -20px">
        <table class="table-bordered table-condensed table-hover">
            <g:each in="${contenidos}" var="contenido" status="z">

                <tr id="${contenido?.id}">
%{--                    <td width="15%">--}%
%{--                        ${contenido?.curso?.nombre}--}%
%{--                    </td>--}%

                    <td width="12%">
                        ${contenido?.areas?.ejes?.descripcion}
                    </td>

                    <td width="8%">
                        ${contenido?.areas?.descripcion}
                    </td>
                    <td width="8%">
                        ${contenido?.numero}
                    </td>

                    <td width="5%" class="centrado">
                        ${contenido?.numeroHorasDocente}
                    </td>

                    <td width="5%" class="centrado">
                        ${contenido?.numeroHorasPractica}
                    </td>

                    <td width="6%" class="centrado">
                        ${contenido?.numeroHorasAprendizajeAutonomo}
                    </td>
                    <td width="20%">
                        ${contenido?.metodologia}
                    </td>
                    <td width="20%">
                        ${contenido?.contenido}
                    </td>
                </tr>
            </g:each>
        </table>
    </div>
</div>

</body>
</html>