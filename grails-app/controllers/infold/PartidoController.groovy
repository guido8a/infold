package infold

class PartidoController {

    def list(){
        def partidos = Partido.list().sort{it.lista}
        return [partidos:partidos]
    }

    def form_ajax(){
        def partido

        if(params.id){
            partido = Partido.get(params.id)
        }else{
            partido = new Partido()
        }

        return[partido: partido]
    }

    def savePartido(){

        def partido

        if(params.id){
            partido = Partido.get(params.id)
        }else{
            partido = new Partido()
        }

        params.sigla = params.sigla.toUpperCase()

        partido.properties = params

        if(!partido.save(flush:true)){
            println("error al guardar el partido " + partido.errors)
            render "no"
        }else{
            render "ok"
        }
    }

    def eliminar_ajax(){
        def partido = Partido.get(params.id)

        try{
            partido.delete(flush:true)
            render "ok"
        }catch(e){
            println("error al borrar el partido" + partido.errors)
            render "no"
        }
    }

}
