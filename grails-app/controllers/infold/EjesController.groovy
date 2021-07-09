package infold



class EjesController {

    def list(){
        def tipos = Ejes.list([sort: 'orden'])
        return [tipos:tipos]
    }

    def form_ajax(){
        def tipo

        if(params.id){
            tipo = Ejes.get(params.id)
        }else{
            tipo = new Ejes()
        }

        return[tipo: tipo]
    }

    def saveTipoDesarrollo(){

        def tipo

        if(params.id){
            tipo = Ejes.get(params.id)
        }else{
            tipo = new Ejes()
        }

        tipo.properties = params

        if(!tipo.save(flush:true)){
            println("error al guardar el tipo de desarrollo " + tipo.errors)
            render "no"
        }else{
            render "ok"
        }
    }

    def eliminar_ajax(){
        def tipo = Ejes.get(params.id)

        try{
            tipo.delete(flush:true)
            render "ok"
        }catch(e){
            println("error al borrar el tipo de desarrollo" + tipo.errors)
            render "no"
        }
    }

}
