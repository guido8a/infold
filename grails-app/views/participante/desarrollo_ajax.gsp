<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 29/06/21
  Time: 15:46
--%>

<g:form class="form-horizontal" name="frmDesarrollo" role="form"  method="POST">
    <div class="form-group">
        <span class="grupo">
            <label class="col-md-2 control-label text-info">
                Desarrollo de Capacidades
            </label>
            <div class="col-md-8">
                <g:select name="desarrolloCapacidades" from="${infold.DesarrolloCapacidades.list()?.sort{it.descripcion}}" optionValue="descripcion" optionKey="id"
                          class="form-control" value="${desarrolloPersona ? desarrolloPersona?.desarrolloCapacidades?.id : ''}"/>
            </div>
        </span>
    </div>
</g:form>
