package infold


class EnfoqueController {

    def list(){
        def enfoques = Enfoque.list().sort{it.descripcion}
        return [enfoques:enfoques]
    }

    def form_ajax(){
        def enfoque

        if(params.id){
            enfoque = Enfoque.get(params.id)
        }else{
            enfoque = new Enfoque()
        }

        return[enfoque: enfoque]
    }

    def saveEnfoque(){

        def enfoque
        if(params.id){
            enfoque = Enfoque.get(params.id)
        }else{
            enfoque = new Enfoque()
        }

        enfoque.properties = params

        if(!enfoque.save(flush:true)){
            println("error al guardar el enfoque " + enfoque.errors)
            render "no"
        }else{
            render "ok"
        }

    }

    def eliminar_ajax(){
        def enfoque = Enfoque.get(params.id)

        try{
            enfoque.delete(flush:true)
            render "ok"
        }catch(e){
            println("error al borrar el enfoque" + enfoque.errors)
            render "no"
        }
    }

}
