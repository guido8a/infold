<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 23/06/21
  Time: 10:14
--%>

<g:select name="parroquia" from="${parroquias}" class="form-control" optionKey="id" optionValue="nombre"
          value="${participante?.parroquia?.id}"/>