package infold


import groovy.io.FileType
import seguridad.Persona

import javax.imageio.ImageIO
import java.nio.file.Files
import java.nio.file.Paths
import java.nio.file.StandardCopyOption

class InstitucionController {

    def dbConnectionService
    def mailService

    def list(){
        println("params list" + params)
        def cn = dbConnectionService.getConnection()
        def persona = Persona.get(session.usuario.id)
        def sql = "select * from anuncio(${persona.id})"
        println "sql: $sql"
        def productos = cn.rows(sql.toString())
        return[productos: productos, persona: persona]
    }

    def form_ajax(){
        def persona = Persona.get(params.persona)
        def institucion
        if(params.id){
            institucion = Institucion.get(params.id)
        }else{
            institucion = new Institucion()
        }

        return[institucion: institucion, persona: persona]
    }

    def inst(){
        println "params: $params"

        def institucion

        if(params.id){
            institucion = Institucion.get(1)
        }else{
            institucion = new Institucion()
        }

        return[institucion: institucion]
    }

    def saveInstitucion(){
        println("params si " + params)
        def institucion

        if(params.id){
            institucion = Institucion.get(params.id)
        }else{
            institucion = new Institucion()
        }

        institucion.properties = params

        if(!institucion.save(flush:true)){
            println("error al guardar la institucion " + institucion.errors)
            render "no"
        }else{
            render "ok_" + institucion.id
        }
    }

    def saveProducto(){
        println "saveProducto $params"
        def persona = Persona.get(session.usuario.id)
        def institucion

        if(params.id){
            institucion = Institucion.get(params.id)
        }else{
            institucion = new Institucion()
            institucion.persona = persona
            institucion.padre = null
            params.estado = (params.padre? 'T':'I')
            params.fecha = new Date()
            params.latitud = 0
            params.longitud = 0
            println "padre--> ${params.padre}"
        }

        institucion.properties = params
//        if(institucion.padre && !params.id){
//            Imagen.findAllByProducto(institucion.padre).each {im ->
//                def imagen = new Imagen()
//                imagen.institucion = institucion
//                imagen.estado = estado
//                imagen.ruta =
//            }
//        }

        if(!institucion.save(flush:true)){
            println("error al guardar el institucion " + institucion.errors)
            render "no"
        }else{
            render "ok_" + institucion.id
        }
    }

    def show_ajax(){
        def institucion = Institucion.get(params.id)
        return[institucion: institucion]
    }

    def texto(){
        def institucion = Institucion.get(params.id)
        return[institucion: institucion]
    }

    def guardarTexto_ajax(){
        def institucion = Institucion.get(params.id)
        institucion.texto = params.editorTramite

        if(!institucion.save(flush:true)){
            println("error al guardar el texto del institucion " + institucion.errors)
            render "no"
        }else{
            render "ok"
        }
    }

    def imagenes_ajax() {
        def institucion = Institucion.get(params.id)
        return[institucion: institucion]
    }


    def upload_ajax() {
        println ("params imas " +  params)
        def institucion = Institucion.get(params.id)
        def imagenes = Imagen.findAllByProductoAndEstado(institucion, '1')
        def path = "/var/ventas/productos/pro_" + institucion.id + "/"
        new File(path).mkdirs()

//        def f = request.getFile('upload')
        def f = request.getFile('file')

        def okContents = ['image/png': "png", 'image/jpeg': "jpeg", 'image/jpg': "jpg"]

        def canti = []
        def dir = new File(path)
        dir.eachFileRecurse(FileType.FILES) { file ->
            def img = ImageIO.read(file)

            if (img) {
                canti.add([
                        dir : path,
                        file: file.name,
                        w   : img?.getWidth(),
                        h   : img?.getHeight(),
                ])
            }
        }

//        if(canti.size() < 5){
        if(imagenes.size() < 5){

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
                    def fn = fileName
                    def src = new File(pathFile)

                    println("path -->" + pathFile)

                    def i = 1
                    while (src.exists()) {
                        nombre = fn + "_" + i + "." + ext
                        pathFile = path + nombre
                        src = new File(pathFile)
                        i++
                    }
                    try {
                        f.transferTo(new File(pathFile)) // guarda el archivo subido al nuevo path
                        def imagenNueva = new Imagen()
                        imagenNueva.institucion = institucion
                        imagenNueva.estado = 1
                        imagenNueva.ruta = nombre

                        if(canti.size() == 0){
                            imagenNueva.principal = 1
                        }

                        imagenNueva.save(flush:true)
                    } catch (e) {
                        println ("error al subir la imagen " + e)
                    }

                    /* fin resize */
//                def pathReturn = "/var/ventas/productos/pro_" + institucion.id + "/" + nombre
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
                        'Por favor seleccione una imagen' +
                        '</script>' +
                        '</body>' +
                        '</html>';
                render output
            }
        }else{
//            def output = '<html>' +
//                    '<body>' +
//                    '<script type="text/javascript">' +
//                    'La cantidad de imágenes ingresadas no puede ser mayor a 5' +
//                    '</script>' +
//                    '</body>' +
//                    '</html>';
//            render output
            return false
        }
    }

    def revisarImas_ajax(){
        println "revisarImas_ajax $params"
        def institucion = Institucion.get(params.id)
        def imagenes = Imagen.findAllByProductoAndEstado(institucion,'1')
        if(imagenes.size() < 5){
            render "ok"
        }else{
            render "no"
        }

    }

    def deleteImagen_ajax() {
        println "deleteImagen_ajax params $params"
        def imagen = Imagen.get(params.idim)
        def imagenes = Imagen.findAllByProductoAndIdNotEqual(imagen.institucion, imagen.id)
        def path = "/var/ventas/productos/pro_" + imagen.institucion.id + "/${imagen.ruta}"

        if(imagenes.size() == 0){
            render "er_No se puede borrar la imagen, el institucion tiene una sola imagen asociada."
        }else{
            try{
                def principal = imagenes[0]
                principal.principal = 1
                imagen.delete(flush: true)
                def file = new File(path).delete()
                render "ok"
            }catch(e){
                println("error al borrar la imagen " + e)
                render "no"
            }
        }
    }

    def getImage() {
        println "params get image $params"
        byte[] imageInBytes = im(params.id, params.format, params.pro)
        response.with{
            setHeader('Content-length', imageInBytes.length.toString())
            contentType = "image/${params.format}" // or the appropriate image content type
            outputStream << imageInBytes
            outputStream.flush()
        }
    }

    byte[] im(nombre,ext,institucion) {
        ByteArrayOutputStream baos = new ByteArrayOutputStream()
        ImageIO.write(ImageIO.read(new File("/var/ventas/productos/pro_" + institucion + "/" + nombre + "." + ext)), ext.toString(), baos)
        baos.toByteArray()
    }

    def tablaImagenes_ajax(){
        def institucion = Institucion.get(params.id)
        def imagenes = Imagen.findAllByProductoAndEstado(institucion,'1')

        def path = "/var/ventas/productos/pro_" + institucion.id + "/"
        new File(path).mkdirs()

        def files = []

        def dir = new File(path)
/*
        dir.eachFileRecurse(FileType.FILES) { file ->
            if(file.name.toString() in imagenes.ruta){
                println("si " + file.name)
                def img = ImageIO.read(file)
                if (img) {
                    files.add([
                            dir : path,
                            file: file.name,
                            w   : img?.getWidth(),
                            h   : img?.getHeight(),
                    ])
                }
            }
        }
*/
        imagenes.each { im ->
            def file = new File(path + im.ruta)
            def img = ImageIO.read(file)
            if (img) {
                files.add([
                        id : im.id,
                        dir : path,
                        file: file.name,
                        w   : img?.getWidth(),
                        h   : img?.getHeight(),
                        pncp: im.principal
                ])
            }
        }

        return[imagenes: files, institucion: institucion, tam: imagenes.size()]
    }

    def tablaAtributos_ajax(){
        println("params ta " + params)
        def institucion = Institucion.get(params.id)
        def atributos = Valores.findAllByProducto(institucion)
        return[atributos: atributos]
    }

    def ponerPrincipal_ajax(){
        def imagen = Imagen.get(params.id)
        def institucion = imagen.institucion
        def imagenes = Imagen.findAllByProductoAndEstado(institucion,'1')

        imagenes.each{
            it.principal = 0
            it.save(flush:true)
        }

        imagen.principal = 1

        if(!imagen.save(flush:true)){
            println("error al colocar el estado principal en imagen " + imagen.errors)
            render "no"
        }else{
            render "ok"
        }
    }

    def textoImagen_ajax(){
        def imagen = Imagen.get(params.id)
        return[imagen:imagen]
    }

    def guardarTextoImagenes_ajax(){
        println("params ti " + params)
        def imagen = Imagen.get(params.id)
        imagen.texto = params.texto

        if(!imagen.save(flush:true)){
            println("error al guardar el texto de la imagen")
            render "no"
        }else{
            render "ok"
        }
    }

    def verificarImagen_ajax(){
        def institucion = Institucion.get(params.id)
        def imagenes = Imagen.findAllByProducto(institucion)

        println("ima " + imagenes)

        if(imagenes){
            render "ok"
        }else{
            render "no"
        }
    }

    def destacado_ajax(){
        def institucion = Institucion.get(params.id)
        return[institucion:institucion]
    }

    def wizardProducto() {
        println ("params wp"  + params)
        def persona = Persona.get(session.usuario.id)
        def padre
        def institucion
        def mnsj, anun, primero = true

        if(params.e){
            institucion = Institucion.get(params.id)
        }else{
            switch (params.tipo) {
                case "1":
                    institucion = new Institucion()
                    padre = Institucion.get(params.id)
                    institucion.padre = padre
                    institucion.persona = persona
                    institucion.subcategoria = padre.subcategoria
                    institucion.estado = 'I'
                    institucion.fecha = new Date()
                    institucion.latitud = 0
                    institucion.longitud = 0
//                    institucion.save(flush:true)
                    break;
                case "2" :
                    institucion = Institucion.get(params.id)
                    def anuncio = Anuncio.findAllByProductoAndEstado(institucion, "R")
                    anuncio.each { a ->
                        if (primero) {
                            a.estado = 'E'
                            anun = a;
                            primero = false
                        } else {
                            a.estado = 'X'
                        }
                        a.save(flush: true)
                    }
                    if (institucion.estado == 'R') institucion.estado = 'I'
                    institucion.save(flush: true)
                    break;
                case "3" :
                    institucion = new Institucion()
                    institucion.persona = persona
                    institucion.padre = null
                    institucion.estado = 'I'
                    institucion.fecha = new Date()
                    institucion.latitud = 0
                    institucion.longitud = 0
//                    institucion.save(flush:true)
                    break;
            }
        }
        println "institucion: ${institucion.id}, persona: ${persona.id}, tipo: ${params.tipo}"
        return[institucion: institucion, persona: persona, tipo: params.tipo]
    }

    def wizardInfo() {
        println "wizardInfo: $params"
        def persona = Persona.get(session.usuario.id)
        def institucion = Institucion.get(params.id)
        return[institucion: institucion, persona: persona, tipo: params.tipo]
    }

    def wizardAtributos() {
        println "wizardAtributos: $params"
        def persona = Persona.get(session.usuario.id)
        def institucion = Institucion.get(params.id)
        return[institucion: institucion, persona: persona, tipo: params.tipo]
    }

    def wizardImagenes() {
        println "wizardImagenes: $params"
        def persona = Persona.get(session.usuario.id)
        def institucion = Institucion.get(params.id)
        def imas = Imagen.findAllByProductoAndEstado(institucion, '1')

        def imagenes = []

        /**** imágenes ****/
        if(institucion?.id){
            def path = "/var/ventas/productos/pro_" + institucion.id + "/"
            new File(path).mkdirs()

            def imag = new File(path)
            imag?.eachFileRecurse(FileType.FILES) { file ->
                if(file.name.toString() in imas.ruta) {
                    def img = ImageIO.read(file)
                    if (img) {
                        imagenes.add([file: file.name])
                    }
                }
            }
            println "path: $path --> imagenes: $imagenes"
        }

        return[institucion: institucion, persona: persona, imagenes: imagenes, tam: imas.size(), tipo: params.tipo]
    }

    def wizardContacto() {
        println "wizardContacto: $params"
        def persona = Persona.get(session.usuario.id)
        def institucion = Institucion.get(params.id)
        return[institucion: institucion, persona: persona, tipo: params.tipo]
    }

    def comprobarImagenes_ajax(){

        def institucion = Institucion.get(params.id)
        def path = "/var/ventas/productos/pro_" + institucion.id + "/"
        def imag = new File(path)
        def imagenes = []
        imag?.eachFileRecurse(FileType.FILES) { file ->
            def img = ImageIO.read(file)
            if (img) {
                imagenes.add([file: file.name])
            }
        }

        println("imagenes " + imagenes.size())

        if(imagenes.size() > 0){
            render  "ok"
        }else{
            render  "no"
        }

    }

    def destacar_ajax(){
        def institucion = Institucion.get(params.id)
        return[institucion: institucion]
    }

    def guardarDestacar_ajax(){
        def institucion = Institucion.get(params.institucion)
        if(params.tipo == 'si'){
            institucion.destacado = 1
        }else{
            institucion.destacado = 0
        }

        institucion.save(flush:true)
    }

    def borrar_temporal(){
        if(params.id) {
           borrar_producto(params.id)
        }

        redirect(action: 'list')
    }

    /* si hay anuncios en proceso de aprobación o revisión se los da de baja */
    def delete_ajax(){
        def institucion = Institucion.get(params.id)
        def anuncios = Anuncio.findAllByProductoAndEstadoInList(institucion, ['E', 'R'])
        if(anuncios.size() > 0) {
            institucion.estado = 'B'
            institucion.save(flush: true)
            anuncios.each { a ->
                a.estado = 'B'
                a.save(flush: true)
            }
        }
        try{
            borrar_producto(institucion.id)
            render "ok"
        }catch(e){
             println("error al borrar el institucion " + institucion.errors)
             render "no"
        }
    }

    def borrar_producto(id){
        def cn = dbConnectionService.getConnection()
        def sql = "select imagruta from imag where prod__id = ${id}"
        def institucion = Institucion.get(id)
        def imagenes = cn.rows(sql.toString())
        if(imagenes){
            def path = "/var/ventas/productos/pro_" + institucion.id + "/"
            def imag = new File(path)
            imag?.eachFileRecurse(FileType.FILES) { file ->
                file.delete()
            }
            imag.delete()
        }
        cn.execute("delete from imag where prod__id = ${institucion.id}".toString())

        sql = "delete from atvl where prod__id = ${id}"
        cn.execute(sql.toString())

        sql = "delete from prod where prod__id = ${id}"
        cn.execute(sql.toString())
    }

    /* Se pone publfcfn = now() para dejar de publicar */
    def quitarAnuncio_ajax(){
        def institucion = Institucion.get(params.id)
        def cn = dbConnectionService.getConnection()
        def fcha = new Date().format('yyyy-MM-dd HH:mm:ss')
        def sql = "update anun set anunfcfn = '${fcha}', anunfcmd = '${fcha}' " +
                "where '${fcha}' between anunfcin and anunfcfn and " +
                "anun__id in (select anun__id from anun where prod__id = ${params.id})"

        try {
            def data = cn.executeUpdate(sql.toString())
            if(data) {
                flash.message = "Se han actualizado ${data} anuncios"

                def mail = institucion.persona.mailContacto
                def errores = ''

                try{
                    mailService.sendMail {
                        to mail
                        subject "Confirmación de cancelación del anuncio del institucion: ${institucion?.titulo}"
                        body "Este mail de confirmación es para comunicarle que su institucion: ${institucion?.titulo} ," +
                                " ha sido dado de baja en su publicación." +
                                "\n Si possee alguna duda comuniquese con el administrador del sistema "
                    }
                }catch (e){
                    println("Error al enviar el mail: " + e)
                    errores += e
                }

                if(errores == ''){
                    render "ok"
                }else{
                    render "no"
                }

            } else {
                flash.message = "Error en la actualización"
                flash.tipo = "error"
                render "no"
            }
        } catch (Exception ex) {
            println "Error al insertar $ex"
            render "no"
        }
    }


    def producto_ajax(){
        def institucion = Institucion.get(params.id)
        return[institucion:institucion]
    }

    def wizardGeo(){
        def persona = Persona.get(session.usuario.id)
        def institucion = Institucion.get(params.id)
        return[institucion: institucion, persona: persona, tipo: params.tipo]
    }

    def publicar_ajax(){
        def institucion = Institucion.get(params.id)
        return [institucion:institucion]
    }


}
