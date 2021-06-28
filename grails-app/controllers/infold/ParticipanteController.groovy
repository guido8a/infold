package infold

import geografia.Canton
import geografia.Parroquia
import geografia.Provincia
import grails.validation.ValidationException
import groovy.io.FileType
import seguridad.Persona

import javax.imageio.ImageIO
import java.nio.file.Files
import java.nio.file.Paths
import java.nio.file.StandardCopyOption



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

    def savePoli(){
        println("params poli " + params)

        def participante = Participante.get(params.id)

        if(participante.tipo == '1'){
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
        println ("descargar" + params)
        def participante = Participante.get(params.id)
        def nombre = participante.hojaVida
        def parts = nombre.split('\\.')
        println("parts " + parts)
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


}
