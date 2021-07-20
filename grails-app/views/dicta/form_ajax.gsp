<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 16/07/21
  Time: 14:02
--%>

<asset:stylesheet src="/jquery-date-range-picker-master/dist/daterangepicker.css"/>
<asset:javascript src="/jquery-date-range-picker-master/dist/jquery.daterangepicker.min.js"/>


<g:form class="form-horizontal" name="frmDicta" action="saveDicta">
    <g:hiddenField name="id" value="${dicta?.id}"/>

    <div class="form-group ${hasErrors(bean: dicta, field: 'nombre', 'error')} ">
        <span class="grupo">
            <label for="nombre" class="col-md-2 control-label text-info">
                Nombre
            </label>
            <div class="col-md-10">
                <g:textField name="nombre" maxlength="127" class="form-control required" value="${dicta?.nombre}" style="resize: none"/>
            </div>
        </span>
    </div>

    <div class="form-group ${hasErrors(bean: dicta, field: 'nombre', 'error')} ">
        <span class="grupo">
            <label for="nombre" class="col-md-2 control-label text-info">
                Fechas
            </label>
            <div class="col-md-10">
                <g:textField name="dp" class="form-control"/>
            </div>
        </span>
    </div>


%{--    <input type="text" id="dp" />--}%


</g:form>

<div class="calender"></div>


<script type="text/javascript">

    $('#dp').dateRangePicker();

    var validator = $("#frmDicta").validate({
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
