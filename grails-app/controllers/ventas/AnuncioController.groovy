package ventas

import groovy.io.FileType

import javax.imageio.ImageIO

class AnuncioController {

    def crearAnuncio_ajax(){

        def anuncio
        def alerta = Alerta.get(params.id)
        def producto = alerta.producto
        alerta.fechaAprobacion = new Date()

        if(!alerta.save(flush:true)){
            println("error al colocar la fecha de aprobación en la alerta " + alerta.errors)
            render "no"
        }else{
            def existe = Anuncio.findByProducto(producto)

            if(existe){
                anuncio = existe
            }else{
                anuncio = new Anuncio()
                anuncio.producto = producto
                anuncio.estado = 'N'
            }

            anuncio.titulo = producto.titulo
            anuncio.subtitulo = producto.subtitulo
            anuncio.texto = producto.texto

            if(!anuncio.save(flush:true)){
                println("error al guardar el anuncio " + anuncio.errors)
                render "no"
            }else{
                render "ok"
            }
        }


    }

    def list(){

    }

    def tablaAnuncios_ajax(){

        def anuncios = Anuncio.list().sort{it.estado}
        return[anuncios: anuncios]

    }

    def cambiarEstado_ajax(){
        def anuncio = Anuncio.get(params.id)
        def producto = anuncio.producto
        def estadoActual = anuncio.estado

        if(estadoActual == '1'){
            anuncio.estado = 0
        }else{
            anuncio.estado = 1
        }

        if(!anuncio.save(flush:true)){
            println("error al guardar el estado del anuncio " + anuncio.errors)
            render "no"
        }else{

            def publicacion = Publicacion.findByAnuncioAndFechaFinIsNull(anuncio)

            if(publicacion){
                publicacion.fechaFin = new Date()
                publicacion.save(flush:true)
            }

            producto.estado = 'I'
            producto.save(flush:true)

            render "ok"
        }
    }

    def forzarAnuncio () {

        def anuncio
        def alerta = Alerta.get(params.id)
        def producto = alerta.producto

        def existe = Anuncio.findByProducto(producto)

        if(existe){
            render "er_Ya existe un anuncio creado para este producto"
        }else{
            anuncio = new Anuncio()
            anuncio.producto = producto
            anuncio.estado = 'N'
        }

        anuncio.titulo = producto.titulo
        anuncio.subtitulo = producto.subtitulo
        anuncio.texto = producto.texto

        if(!anuncio.save(flush:true)){
            println("error al guardar el anuncio " + anuncio.errors)
            render "no"
        }else{
            render "ok"
        }
    }
//
//    def form_ajax(){
//        def promotor = Promotor.get(params.promotor)
//        def anuncio
//        if(params.id){
//            anuncio = Anuncio.get(params.id)
//        }else{
//            anuncio = new Anuncio()
//        }
//
//        return[anuncio:anuncio, promotor: promotor]
//    }
//
//    def saveAnuncio(){
//
//        println("params " + params)
//
//        def anuncio
//        if(params.id){
//            anuncio = Anuncio.get(params.id)
//        }else{
//            anuncio = new Anuncio()
//        }
//
//        if(params.estado){
//            params.estado = 1
//        }else{
//            params.estado = 0
//        }
//
//        anuncio.properties = params
//
//        if(!anuncio.save(flush:true)){
//            println("error al guardar el anuncio")
//            render "no"
//        }else{
//            render "ok"
//        }
//    }
//
//    def delete_ajax(){
//
//    }
//
//    def subcategoria_ajax(){
//
//        println("id " + params)
//
//        def categoria = Categoria.get(params.id)
//        def subCategorias = Subcategoria.findAllByCategoria(categoria).sort{it.descripcion}
//        def anuncio
//        if(params.anuncio){
//            anuncio = Anuncio.get(params.anuncio)
//        }else{
//            anuncio = new Anuncio()
//        }
//
//        return[subCategorias: subCategorias, anuncio: anuncio]
//    }
//
//    def imagen_ajax(){
//        def anuncio = Anuncio.get(params.id)
//        return[anuncio:anuncio]
//    }
//
//    def upload_ajax() {
////        println ("params imas " +  params)
//        def anuncio = Anuncio.get(params.id)
//        def path = "/var/ventas/anuncios/anun_" + anuncio.id + "/"
//        new File(path).mkdirs()
//
//        def f = request.getFile('file')
//
//        def okContents = ['image/png': "png", 'image/jpeg': "jpeg", 'image/jpg': "jpg"]
//
//        if (f && !f.empty) {
//            def fileName = f.getOriginalFilename() //nombre original del archivo
//            def ext
//            def parts = fileName.split("\\.")
//            fileName = ""
//            parts.eachWithIndex { obj, i ->
//                if (i < parts.size() - 1) {
//                    fileName += obj
//                } else {
//                    ext = obj
//                }
//            }
//
//            if (okContents.containsKey(f.getContentType())) {
//                ext = okContents[f.getContentType()]
//                fileName = fileName.size() < 40 ? fileName : fileName[0..39]
//                fileName = fileName.tr(/áéíóúñÑÜüÁÉÍÓÚàèìòùÀÈÌÒÙÇç .!¡¿?&#°"'/, "aeiounNUuAEIOUaeiouAEIOUCc_")
//
//                def nombre = fileName + "." + ext
//                def pathFile = path + nombre
//                def fn = fileName
//                def src = new File(pathFile)
//
//                println("path -->" + pathFile)
//
//                def i = 1
//                while (src.exists()) {
//                    nombre = fn + "_" + i + "." + ext
//                    pathFile = path + nombre
//                    src = new File(pathFile)
//                    i++
//                }
//                try {
//                    f.transferTo(new File(pathFile)) // guarda el archivo subido al nuevo path
//                    anuncio.imagen = nombre
//                    anuncio.save(flush:true)
//                } catch (e) {
//                    println ("error al subir la imagen " + e)
//                }
//
//                /* fin resize */
////                def pathReturn = "/var/ventas/productos/pro_" + producto.id + "/" + nombre
//                def output = '<html>' +
//                        '<body>' +
//                        '<script type="text/javascript">' +
//                        'Archivo subido correctamente.' +
//                        '</script>' +
//                        '</body>' +
//                        '</html>';
//                render output
//            } //contenido ok (extension ok
//            else {
//                def ok = ""
//                okContents.each {
//                    if (ok != "") {
//                        ok += ", "
//                    }
//                    ok += it.value
//                }
//                def output = '<html>' +
//                        '<body>' +
//                        '<script type="text/javascript">' +
//                        'Por favor utilice archivos de tipo' + ok +
//                        '</script>' +
//                        '</body>' +
//                        '</html>';
//                render output
//            }
//        }//f not empty
//        else {
//            def output = '<html>' +
//                    '<body>' +
//                    '<script type="text/javascript">' +
//                    'Por favor seleccione una imagen' +
//                    '</script>' +
//                    '</body>' +
//                    '</html>';
//            render output
//        }
//    }
//
//    def tablaImagen_ajax(){
//        def anuncio = Anuncio.get(params.id)
//
//        def path = "/var/ventas/anuncios/anun_" + anuncio.id + "/"
//        new File(path).mkdirs()
//
//        def files = []
//
//        def dir = new File(path)
//        dir.eachFileRecurse(FileType.FILES) { file ->
//            def img = ImageIO.read(file)
//            if (img) {
//                files.add([
//                        dir : path,
//                        file: file.name,
//                        w   : img?.getWidth(),
//                        h   : img?.getHeight(),
//                ])
//            }
//        }
//
//        return[imagenes: files, anuncio: anuncio]
//    }
//
//    def deleteImagen_ajax() {
//        println("params " + params)
//        def anuncio = Anuncio.get(params.id)
//        def path = "/var/ventas/anuncios/anun_" + anuncio.id + "/"
//        def file = params.file
//        def fileDel = new File(path + file)
//
//        try{
//            fileDel.delete()
//            anuncio.imagen = null
//            anuncio.save(flush:true)
//            render "ok"
//        }catch(e){
//            println("errro al borrar la imagen " + e)
//            render "no"
//        }
//    }

    def getImage() {
        println("params " + params)
        byte[] imageInBytes = im(params.id, params.format, params.anun)
        response.with{
            setHeader('Content-length', imageInBytes.length.toString())
            contentType = "image/${params.format}" // or the appropriate image content type
            outputStream << imageInBytes
            outputStream.flush()
        }
    }

    byte[] im(nombre,ext,anuncio) {
        ByteArrayOutputStream baos = new ByteArrayOutputStream()
        ImageIO.write(ImageIO.read(new File("/var/ventas/anuncios/anun_" + anuncio + "/" + nombre + "." + ext)), ext.toString(), baos)
        baos.toByteArray()
    }

}
