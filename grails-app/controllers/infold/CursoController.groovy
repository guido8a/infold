package infold



class CursoController {

    def curso(){

        def curso

        if(params.id){
            curso = Curso.get(params.id)
        }else{
            curso = new Curso()
        }

        return[curso:curso]
    }

    def saveCurso_ajax(){
        println("params curso " + params)

        def curso

        if(params.id){
            curso = Curso.get(params.id)
        }else{
            curso = new Curso()
        }

        params.sigla = params.sigla.toUpperCase()
        curso.properties = params

        if(!curso.save(flush:true)){
            println("error al guardar el curso " + curso.errors)
            render "no"
        }else{
            render "ok_" + curso.id
        }
    }

}
