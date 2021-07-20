package infold


class DictaController {

    def list(){
        def curso = Curso.get(params.id)
        return[curso:curso]
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
        println("params " + params)
        def fechas = params.dp.split(" al ")
        println("fechas " + fechas)
        def dicta
        if(params.id){
            dicta = Dicta.get(params.id)
        }else{
            dicta = new Dicta()
        }

        params.fechaInicio = new Date().parse("dd-MM-yyyy",fechas[0])
        params.fechaFin = new Date().parse("dd-MM-yyyy",fechas[1])
        dicta.properties = params

        if(!dicta.save(flush:true)){
            println("error al guardar el horario " + dicta.errors)
            render "no"
        }else{
            render "ok"
        }
    }

    def tablaDicta_ajax(){
        def curso = Curso.get(params.curso)
        def dictas = Dicta.findAllByCurso(curso).sort{it.nombre}
        return [dictas:dictas]
    }


}
