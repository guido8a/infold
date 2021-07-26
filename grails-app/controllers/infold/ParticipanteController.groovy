package infold

import geografia.Canton
import geografia.Parroquia
import geografia.Provincia

class ParticipanteController {

//    def dbConnectionService
//    def mailService
//


    def cedula_ajax(){
        println "cedula_ajax --> $params"

    }

    def seleccion_ajax(){

    }

    def verificar_ajax(){
        println("params v " + params)
        def existe = Participante.findByCedulaAndTipo(params.c.toString().trim(), params.tipo)

        if(existe){
            switch (existe.completado) {
                case "1":
                    redirect(controller: 'participante', action: 'wizardDatos', params: [id: existe.id])
                    break
                case "2":
                    redirect(controller: 'participante', action: 'wizardGeo', params: [id: existe.id])
                    break
                case "3":
                    redirect(controller: 'participante', action: 'wizardPoli', params: [id: existe.id])
                    break
                case "4":
                    redirect(controller: 'participante', action: 'wizardEdu', params: [id: existe.id])
                    break
                case "5":
                    redirect(controller: 'participante', action: 'wizardFor', params: [id: existe.id])
                    break
            }
        }else{
            redirect(controller: 'participante', action: 'wizardDatos', params:[cedula: params.c, tipo: params.tipo])
        }
    }

    def wizardDatos(){
        def participante
        def tipo

        if(params.id){
            participante = Participante.get(params.id)
            tipo = participante.tipo
        }else{
            participante = new Participante()
            tipo = params.tipo
        }

        return[participante: participante, tipo: tipo, cedula: params.cedula]
    }



    def wizardGeo(){
        def participante = Participante.get(params.id)
        def tipo = participante.tipo
        return[participante: participante, tipo: tipo]
    }

    def wizardPoli(){
        def participante = Participante.get(params.id)
        def tipo = participante.tipo
        return[participante: participante, tipo: tipo]
    }

    def wizardEdu(){
        def participante = Participante.get(params.id)
        def tipo = participante.tipo
        return[participante: participante, tipo: tipo]
    }

    def wizardFor(){
        def participante = Participante.get(params.id)
        def tipo = participante.tipo
        return[participante: participante, tipo: tipo]
    }

    def saveDatos(){
        println("params " + params)

        def participante

        if(params.id){
            participante = Participante.get(params.id)
            participante.fechaModificacion = new Date()
        }else{
            participante = new Participante()
            participante.activo = 1
            participante.completado = '1'
            participante.fecha = new Date()
            participante.estado = 'N'
        }

        participante.properties = params

        if(!participante.save(flush:true)){
            println("error al guardar el participante " + participante.errors)
            render "no"
        }else{
            render "ok_" + participante?.id
        }
    }


    def saveGeo(){
        println("params geo " + params)

        def participante = Participante.get(params.id)
        participante.completado = '2'

        participante.fechaModificacion = new Date()
        participante.properties = params

        if(!participante.save(flush:true)){
            println("error al guardar el participante " + participante.errors)
            render "no"
        }else{
            render "ok_" + participante?.id
        }
    }

    def saveAfiliacion(){
        println("params af " + params)

        def participante = Participante.get(params.id)

        participante.fechaModificacion = new Date()
        participante.properties = params

        if(!participante.save(flush:true)){
            println("error al guardar el participante " + participante.errors)
            render "no"
        }else{
            render "ok_" + participante?.id
        }
    }

    def savePoli(){
        println("params poli " + params)

        def participante = Participante.get(params.id)

        if(participante.tipo == 'I'){
            if(participante.hojaVida){
                participante.fechaModificacion = new Date()
                participante.estado = 'S'
                participante.properties = params

                if(!participante.save(flush:true)){
                    println("error al guardar el participante " + participante.errors)
                    render "no"
                }else{
                    render "ok_" + participante?.id
                }
            }else{
                render "er"
            }
        }else{
            participante.fechaModificacion = new Date()
            participante.estado = 'S'
            participante.properties = params

            if(!participante.save(flush:true)){
                println("error al guardar el participante " + participante.errors)
                render "no"
            }else{
                render "ok_" + participante?.id
            }
        }
    }

    def hoja_ajax(){
        def participante = Participante.get(params.id)
        return[participante: participante]
    }

    def revisarHoja_ajax (){
        def participante = Participante.get(params.id)
        if(participante.hojaVida){
            render "no"
        }else{
            render "ok"
        }
    }

    def upload_ajax() {
        println ("params imas " +  params)
        def participante = Participante.get(params.id)
        def path = "/var/infold/hojas/${participante?.id}/"
        new File(path).mkdirs()

        def f = request.getFile('file')

        def okContents = [
                'image/png'  : "png",
                'image/jpeg' : "jpeg",
                'image/jpg'  : "jpg",

                'application/pdf'        : 'pdf',
                'application/download'   : 'pdf',
                'application/vnd.ms-pdf' : 'pdf',

                'application/msword'                                                      : 'doc',
                'application/vnd.openxmlformats-officedocument.wordprocessingml.document' : 'docx',

                'application/vnd.oasis.opendocument.text'         : 'odt'
        ];

        if (f && !f.empty) {
            def fileName = f.getOriginalFilename() //nombre original del archivo
            def ext
            def parts = fileName.split("\\.")
            fileName = ""
            parts.eachWithIndex { obj, i ->
                if (i < parts.size() - 1) {
                    fileName += obj
                } else {
                    ext = obj
                }
            }

            if (okContents.containsKey(f.getContentType())) {
                ext = okContents[f.getContentType()]
                fileName = fileName.size() < 40 ? fileName : fileName[0..39]
                fileName = fileName.tr(/áéíóúñÑÜüÁÉÍÓÚàèìòùÀÈÌÒÙÇç .!¡¿?&#°"'/, "aeiounNUuAEIOUaeiouAEIOUCc_")

//                    def nombre = fileName + "_${new Date().format("dd-MM-yyyy HH:mm")}" + "." + ext
                def nombre = fileName + "." + ext
                def pathFile = path + nombre
//                    def fn = fileName + "_${new Date().format("dd-MM-yyyy HH:mm")}"
//                    def fn = fileName
//                    def src = new File(pathFile)

                println("path -->" + pathFile)

//                    def i = 1
//                    while (src.exists()) {
//                        nombre = fn + "_" + i + "." + ext
//                        pathFile = path + nombre
//                        src = new File(pathFile)
//                        i++
//                    }
                try {
                    f.transferTo(new File(pathFile)) // guarda el archivo subido al nuevo path
                    participante.hojaVida = nombre
                    participante.save(flush:true)

                } catch (e) {
                    println ("error al subir la hoja de vida " + e)
                }

                /* fin resize */
                def output = '<html>' +
                        '<body>' +
                        '<script type="text/javascript">' +
                        'Archivo subido correctamente.' +
                        '</script>' +
                        '</body>' +
                        '</html>';
                render output
            } //contenido ok (extension ok
            else {
                def ok = ""
                okContents.each {
                    if (ok != "") {
                        ok += ", "
                    }
                    ok += it.value
                }
                def output = '<html>' +
                        '<body>' +
                        '<script type="text/javascript">' +
                        'Por favor utilice archivos de tipo' + ok +
                        '</script>' +
                        '</body>' +
                        '</html>';
                render output
            }
        }//f not empty
        else {
            def output = '<html>' +
                    '<body>' +
                    '<script type="text/javascript">' +
                    'Por favor seleccioneun archivo' +
                    '</script>' +
                    '</body>' +
                    '</html>';
            render output
        }
    }

    def tablaHojas_ajax(){
        def participante = Participante.get(params.id)
        return[participante: participante]
    }

    def descargar() {
//        println ("descargar" + params)
        def participante = Participante.get(params.id)
        def nombre = participante.hojaVida
        def parts = nombre.split('\\.')
//        println("parts " + parts)
        def path = "/var/infold/hojas/${participante?.id}/${nombre}"
        def file = new File(path)
        def b = file.getBytes()
//        response.setContentType('pdf')
        response.setContentType(parts[1])
        response.setHeader("Content-disposition", "attachment; filename=" + nombre)
        response.setContentLength(b.length)
        response.getOutputStream().write(b)
    }

    def borrarHoja_ajax(){
        def participante = Participante.get(params.id)
        def nombre = participante.hojaVida
        def band = ''
//        def path = "/var/infold/hojas/${participante?.id}/"
        def path = "/var/infold/hojas/${participante?.id}/${nombre}"
        def hojas = new File(path)
//        hojas?.eachFileRecurse(FileType.FILES) { file ->
//            file.delete()
        println "archivo: $hojas"

        try{
            hojas.delete()
            band = ''
        }catch(e){
            println("error al borrar la hoja de vida " + e)
            band = e
        }

//        }

        if(band == ''){
            participante.hojaVida = null
            participante.estado = 'N'
            participante.save(flush:true)
            render "ok"
        }else{
            render "no"
        }
    }

    def canton_ajax(){
        def provincia = Provincia.get(params.id)
        def cantones = Canton.findAllByProvincia(provincia).sort{it.nombre}
        def participante = Participante.get(params.participante)
        return[cantones:cantones, participante: participante]
    }

    def parroquia_ajax(){
        def canton = Canton.get(params.id)
        def parroquias = Parroquia.findAllByCanton(canton)
        def participante = Participante.get(params.participante)
        return[parroquias: parroquias, participante: participante]
    }

    def participante(){
        println("participante " + params)
        def participante = Participante.get(params.id)
        return[participante: participante]
    }

    def verificarParticipante(){
        println("verificarParticipante " + params)
        def prtc = Participante.findByCedulaAndTipo(params.c.toString().trim(), params.tipo)

        if(prtc){
            if(prtc.estado == 'S'){
                redirect(controller: 'participante', action: 'participante', params:[id: prtc?.id])
            }else{
                redirect(controller: 'participante', action: 'wizardDatos', params:[id: prtc?.id])
            }
        }else{
            redirect(controller: 'participante', action: 'wizardDatos', params: [tipo: params.tipo, cedula: params.c])
        }
    }

    def enfoque_ajax(){
        def participante = Participante.get(params.id)
        return[participante: participante]
    }

    def desarrollo_ajax(){
        def participante = Participante.get(params.id)
        return[participante: participante]
    }

    def guardarEnfoque_ajax(){
//        println("params ge " + params)
        def participante = Participante.get(params.id)
        def enfoque = Enfoque.get(params.enfoque)
        def existe = EnfoqueParticipante.findByParticipanteAndEnfoque(participante, enfoque)
        def enfoqueParticipante

        if(existe){
            render "no"
        }else{
            enfoqueParticipante = new EnfoqueParticipante()
            enfoqueParticipante.participante = participante
            enfoqueParticipante.enfoque = enfoque
        }

        if(!enfoqueParticipante.save(flush:true)){
            println("error al guardar el enfoque participante " + enfoqueParticipante.errors)
            render "no"
        }else{
            render "ok"
        }
    }

    def desarrolloSel_ajax(){
        def participante = Participante.get(params.id)
        def existentes = AreasPersona.findAllByParticipante(participante)
        def desarrollos
        if(existentes){
            desarrollos = Areas.findAllByIdNotInList(existentes?.areas?.id)
        }else{
            desarrollos = Areas.list().sort{it.descripcion}
        }

        return[desarrollos:desarrollos]
    }

    def tablaDesarrollo_ajax(){
        def participante = Participante.get(params.id)
        def desarrollos = AreasPersona.findAllByParticipante(participante)
        return [desarrollos: desarrollos]
    }

    def enfoqueSel_ajax(){
        def participante = Participante.get(params.id)
        def existentes = EnfoqueParticipante.findAllByParticipante(participante)
        def enfoques
        if(existentes){
            enfoques = Enfoque.findAllByIdNotInList(existentes?.enfoque?.id)
        }else{
            enfoques = Enfoque.list().sort{it.descripcion}
        }

        return[enfoques:enfoques]
    }

    def tablaEnfoque_ajax(){
        def participante = Participante.get(params.id)
        def enfoques = EnfoqueParticipante.findAllByParticipante(participante)
        return[enfoques:enfoques]
    }

    def borrarEnfoque_ajax(){
        def enfoquePersonal = EnfoqueParticipante.get(params.id)

        try{
            enfoquePersonal.delete(flush:true)
            render "ok"
        }catch(e){
            println("error al borrar el enfoque " + enfoquePersonal.errors)
            render "no"
        }
    }

    def borrarDesarrollo_ajax(){
        def desarrolloPersona = AreasPersona.get(params.id)

        try{
            desarrolloPersona.delete(flush:true)
            render "ok"
        }catch(e){
            println("error al borrar el desarrollo " + desarrolloPersona.errors)
            render "no"
        }
    }

    def guardarDesarrollo_ajax(){
        println("params ge " + params)
        def participante = Participante.get(params.id)
        def desarrolloCapacidades = Areas.get(params.desarrolloCapacidades)
        def existe = AreasPersona.findByParticipanteAndAreas(participante, desarrolloCapacidades)
        def desarrolloPersona

        if(existe){
            render "no"
        }else{
            desarrolloPersona = new AreasPersona()
            desarrolloPersona.participante = participante
            desarrolloPersona.areas = desarrolloCapacidades
        }

        if(!desarrolloPersona.save(flush:true)){
            println("error al guardar el desarrollo " + desarrolloPersona.errors)
            render "no"
        }else{
            render "ok"
        }
    }

    def disponibles_ajax(){
        def participante = Participante.get(params.id)
        return[participante:participante]
    }

    def tablaDisponibles_ajax(){
        def participante = Participante.get(params.id)
        def cursos = Dicta.findAllByFechaCierreGreaterThanEqualsAndFechaMatriculaLessThanEquals(new Date(), new Date()).sort{it.nombre}
//        println("cursos " + cursos.id)
        def cursosParticipante = RolCurso.findAllByParticipante(participante)
//        println("existe " + cursosParticipante.dicta.id)
        return[participante:participante, cursos: cursos, cursosParticipante: cursosParticipante]
    }

    def guardarMatricula_ajax(){

//        println("params --->" + params)
        def participante = Participante.get(params.participante)
        def curso = Dicta.get(params.id)
        def funcion
        if(participante.tipo == 'I'){
            funcion = Funcion.get(1)
        }else{
            funcion = Funcion.get(2)
        }

        def matricula

        if(params.estado == 'si'){
            matricula = new RolCurso()
            matricula.fecha = new Date()
            matricula.participante = participante
            matricula.dicta = curso
            matricula.funcion = funcion

            if(!matricula.save(flush:true)){
                println("Error al guardar el curso para la persona " + matricula.errors)
                render "no"
            }else{
                render "ok"
            }

        }else{

            matricula = RolCurso.findByParticipanteAndFuncionAndDicta(participante, funcion, curso)

            try{
                matricula.delete(flush:true)
                render "ok"
            }catch(e){
                println("error al borrar el curso para la persona " + matricula.errors)
                render "no"
            }

        }

    }

    def vigentes_ajax(){
        def participante = Participante.get(params.id)
        def idFuncion = (participante?.tipo == 'I' ? 1 : 2)
        def funcion = Funcion.get(idFuncion)
        def cursosActivos = Dicta.findAllByFechaInicioLessThanEqualsAndFechaFinGreaterThanEquals(new Date(), new Date())
        def cursosVigentes = (cursosActivos ? RolCurso.findAllByParticipanteAndFuncionAndDictaInListAndEstado(participante,funcion,cursosActivos,'A') : [])
        return[cursos:cursosVigentes]
    }

    def asistidos_ajax(){
        def participante = Participante.get(params.id)
        def idFuncion = (participante?.tipo == 'I' ? 1 : 2)
        def funcion = Funcion.get(idFuncion)
        def cursosActivos = Dicta.findAllByFechaFinLessThan(new Date())
        def cursosAsistidos = (cursosActivos ? RolCurso.findAllByParticipanteAndFuncionAndEstadoAndDictaInList(participante, funcion, 'A', cursosActivos) : [])
        return [cursos: cursosAsistidos]
    }

}
