package infold

class AreasController {

    def list(){
        def desarrollos = Areas.list().sort{it.ejes.descripcion}
        return [desarrollos:desarrollos]
    }

    def form_ajax(){
        def desarrollo

        if(params.id){
            desarrollo = Areas.get(params.id)
        }else{
            desarrollo = new Areas()
        }

        return[desarrollo: desarrollo]
    }

    def saveDesarrollo(){

        def desarrollo

        if(params.id){
            desarrollo = Areas.get(params.id)
        }else{
            desarrollo = new Areas()
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
        def desarrollo = Areas.get(params.id)

        try{
            desarrollo.delete(flush:true)
            render "ok"
        }catch(e){
            println("error al borrar el eje de formación" + desarrollo.errors)
            render "no"
        }
    }

}
