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
                    <td style="width: 50%">${dicta?.nombre}</td>
                    <td style="width: 20%; font-size: 14px; font-weight: bold; text-align: center; background-color: #eeb51f">${dicta?.fechaInicio?.format("dd-MM-yyyy")}</td>
                    <td style="width: 20%; font-size: 14px; font-weight: bold; text-align: center; background-color: #afafaf">${dicta?.fechaFin?.format("dd-MM-yyyy")}</td>
                    <td style="width: 10%; text-align: center">
                        <a href="#" class="btn btn-xs btn-gris btnBorrarFecha" data-id="${dicta?.id}" title="Borrar fecha"><i class="fa fa-trash"></i></a>
                        <a href="#" class="btn btn-xs btn-rojo btnEditarFecha" data-id="${dicta?.id}" data-nom="${dicta?.nombre}" data-fi="${dicta?.fechaInicio?.format("dd-MM-yyyy")}" data-ff="${dicta?.fechaFin?.format("dd-MM-yyyy")}" title="Editar fecha"><i class="fa fa-edit"></i></a>
                    </td>
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

<script type="text/javascript">

    $(".btnEditarFecha").click(function () {
        var id = $(this).data("id");
        var nombre = $(this).data("nom");
        var fecha = $(this).data("fi") + " al " + $(this).data("ff");
        $("#nombre").val(nombre);
        $("#dp").val(fecha);
        $("#id").val(id);
        $(".btnAgregarHorario").addClass("hidden");
        $(".btnGuardarHorario").removeClass("hidden");
        $(".btnCancelar").removeClass("hidden");
        $(".divDatos").css('background-color','#eeb51f')
    });

    $(".btnBorrarFecha").click(function (){
        var id = $(this).data("id");
        deleteRow(id)
    });

    function deleteRow(id) {
        bootbox.dialog({
            title   : "Eliminar fecha",
            message : "<i class='fa fa-trash fa-2x pull-left text-warning text-shadow'></i><span style='font-size: 14px; font-weight: bold'>&nbsp; ¿Está seguro que desea eliminar este registro?.</span>",
            buttons : {
                cancelar : {
                    label     : "<i class='fa fa-times'></i> Cancelar",
                    className : "btn-gris",
                    callback  : function () {
                    }
                },
                aceptar : {
                    label     : "<i class='fa fa-check'></i> Aceptar",
                    className : "btn-rojo",
                    callback  : function () {
                        $.ajax({
                            type    : "POST",
                            url     : "${createLink(controller: 'dicta', action:'eliminar_ajax')}",
                            data    : {
                                id:id
                            },
                            success : function (msg) {
                                if(msg == 'ok'){
                                    log("Eliminado correctamente","success");
                                    cargarTablaDicta();
                                }else{
                                    log("Error al eliminar el registro","error")
                                }
                            } //success
                        }); //ajax
                    }
                }
            }
        });
    } //createEdit

    // function createContextMenu(node) {
    //     var $tr = $(node);
    //
    //     var items = {
    //         header : {
    //             label  : "Acciones",
    //             header : true
    //         }
    //     };
    //
    //     var id = $tr.data("id");
    //
    //
    //     var eliminar = {
    //         label            : 'Eliminar',
    //         icon             : "fa fa-trash text-warning",
    //         action           : function (e) {
    //             var id = $tr.data("id");
    //             deleteRow(id);
    //         }
    //     };
    //
    //     // items.editar = editar;
    //     items.eliminar = eliminar;
    //     return items;
    // }
    // //
    // $("tr").contextMenu({
    //     items  : createContextMenu,
    //     onShow : function ($element) {
    //         $element.addClass("trHighlight");
    //     },
    //     onHide : function ($element) {
    //         $(".trHighlight").removeClass("trHighlight");
    //     }
    // });


</script>