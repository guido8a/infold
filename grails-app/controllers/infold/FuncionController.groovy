package infold


class FuncionController {

    def list(){
        def funciones = Funcion.list().sort{it.descripcion}
        return[funciones:funciones]
    }

    def form_ajax(){
        def funcion
        if(params.id){
            funcion = Funcion.get(params.id)
        }else{
            funcion = new Funcion()
        }

        return[funcion:funcion]
    }

    def eliminar_ajax(){
        def funcion = Funcion.get(params.id)

        try{
            funcion.delete(flush:true)
            render "ok"
        }catch(e){
            println("error al borrar la funcion " + funcion.errors)
            render "no"
        }
    }

    def saveFuncion_ajax(){
        def funcion
        if(params.id){
            funcion = Funcion.get(params.id)
        }else{
            funcion = new Funcion()
        }

        funcion.properties = params

        if(!funcion.save(flush:true)){
            println("error al guardar la funcion " + funcion.errors)
            render "no"
        }else{
            render "ok"
        }
    }

}
