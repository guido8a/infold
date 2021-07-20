<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 20/07/21
  Time: 9:33
--%>

<div class=""  style="width: 99.7%;height: 350px; overflow-y: auto; margin-top: -20px">
    <table class="table-bordered table-condensed table-hover" width="100%">
        <tbody id="tabla_bandeja">
        <g:if test="${dictas.size() > 0}">
            <g:each in="${dictas}" var="dicta">
                <tr data-id="${dicta?.id}" style="width: 100%">
                    <td style="width: 55%">${dicta?.nombre}</td>
                    <td style="width: 20%">${dicta?.fechaInicio?.format("dd-MM-yyyy")}</td>
                    <td style="width: 20%">${dicta?.fechaFin?.format("dd-MM-yyyy")}</td>
                </tr>
            </g:each>
        </g:if>
        <g:else>
            <div class="alert alert-warning" role="alert" style="text-align: center">
                <p style="font-size: 14px"><i class="fa fa-exclamation-triangle"></i> No existen registros</p>
            </div>
        </g:else>
        </tbody>
    </table>
</div>