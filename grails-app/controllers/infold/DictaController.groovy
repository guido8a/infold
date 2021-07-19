package infold


class DictaController {

    def list(){
        def curso = Curso.get(params.id)
        def dictas = Dicta.findAllByCurso(curso).sort{it.nombre}
        return[dictas:dictas]
    }

    def form_ajax(){
        def dicta
        if(params.id){
            dicta = Dicta.get(params.id)
        }else{
            dicta = new Dicta()
        }

        return[dicta:dicta]
    }

    def saveDicta(){

    }


}
