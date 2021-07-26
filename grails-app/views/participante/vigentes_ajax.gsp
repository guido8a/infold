<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 26/07/21
  Time: 13:20
--%>

<g:form class="form-horizontal" name="frmVigentes" role="form"  method="POST">
    <table class="table table-condensed table-bordered" width='100%'>
        <thead>
        <tr style="text-align: center; width: 100px">
            <th style="width: 50%">Descripción</th>
            <th style="width: 15%">Fecha Inicio</th>
            <th style="width: 15%">Fecha FIn</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${cursos}" var="curso">
            <tr>
                <td style="font-weight: bold; font-size: 12px; width: 50%">
                    ${curso.dicta.nombre}
                </td>
                <td style="font-weight: bold; font-size: 12px; width: 15%; background-color: #eeb51f; text-align: center">
                    ${curso.dicta.fechaInicio?.format("dd-MM-yyyy")}
                </td>
                <td style="font-weight: bold; font-size: 12px; width: 15%; background-color: #afafaf; text-align: center">
                    ${curso.dicta.fechaFin.format("dd-MM-yyyy")}
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
</g:form>
