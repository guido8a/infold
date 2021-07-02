package infold

class DesarrolloCapacidadesController {

    def list(){
        def desarrollos = DesarrolloCapacidades.list().sort{it.tipoDesarrollo.descripcion}
        return [desarrollos:desarrollos]
    }

    def form_ajax(){
        def desarrollo

        if(params.id){
            desarrollo = DesarrolloCapacidades.get(params.id)
        }else{
            desarrollo = new DesarrolloCapacidades()
        }

        return[desarrollo: desarrollo]
    }

    def saveDesarrollo(){

        def desarrollo

        if(params.id){
            desarrollo = DesarrolloCapacidades.get(params.id)
        }else{
            desarrollo = new DesarrolloCapacidades()
        }

        desarrollo.properties = params

        if(!desarrollo.save(flush:true)){
            println("error al guardar el eje de formación " + desarrollo.errors)
            render "no"
        }else{
            render "ok"
        }
    }

    def eliminar_ajax(){
        def desarrollo = DesarrolloCapacidades.get(params.id)

        try{
            desarrollo.delete(flush:true)
            render "ok"
        }catch(e){
            println("error al borrar el eje de formación" + desarrollo.errors)
            render "no"
        }
    }

}
