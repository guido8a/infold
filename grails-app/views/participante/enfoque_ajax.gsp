<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 29/06/21
  Time: 15:23
--%>


<g:form class="form-horizontal" name="frmEnfoque" role="form"  method="POST">
    <div class="form-group">
        <span class="grupo">
            <label class="col-md-2 control-label text-info">
                Enfoque
            </label>
            <div class="col-md-8">
                <g:select name="enfoque" from="${infold.Enfoque.list().sort{it.descripcion}}" optionValue="descripcion" optionKey="id"
                          class="form-control" value="${enfoqueParticipante ? enfoqueParticipante?.enfoque?.id : ''}"/>
            </div>
        </span>
    </div>
</g:form>
