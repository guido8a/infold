package infold

class ContenidosController {

    def list(){
        def curso = Curso.get(params.id)
        def contenidos = Contenidos.findAllByCurso(curso)
        return[contenidos:contenidos, curso:curso]
    }

    def form_ajax(){
        def contenido
        def curso = Curso.get(params.curso)
        def areas = Areas.findAllByEjes(curso.ejes).sort{it.descripcion}

        if(params.id){
            contenido = Contenidos.get(params.id)
        }else{
            contenido = new Contenidos()
        }

        return [contenido:contenido, areas: areas, curso: curso]
    }


}
