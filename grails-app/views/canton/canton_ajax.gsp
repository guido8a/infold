<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 26/04/21
  Time: 14:05
--%>

<g:select name="canton" from="${cantones}" class="form-control" optionKey="id" optionValue="nombre" value="${participante?.parroquia?.canton?.id}"/>


<script type="text/javascript">

    $("#canton").change(function () {
        var id = $(this).val();
        cargarParroquia(id)
    });

    cargarParroquia($("#canton").val());

    function cargarParroquia(id){
        $.ajax({
            type: 'POST',
            url: '${createLink(controller: 'parroquia', action: 'parroquia_ajax')}',
            data:{
                id: id,
                participante: '${participante?.id}'
            },
            success: function (msg) {
                $("#divParroquia").html(msg)
            }
        });
    }

</script>