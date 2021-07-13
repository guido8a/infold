package infold

class ContenidosController {

    def list(){
        def curso = Curso.get(params.id)
        def contenidos = Contenidos.findAllByCurso(curso)
        return[contenidos:contenidos, curso:curso]
    }

    def form_ajax(){

    }


}
