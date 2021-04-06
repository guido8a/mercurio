package ventas

import groovy.io.FileType

import javax.imageio.ImageIO

class LinkController {

    def list(){
        def links = Link.list().sort{it.orden}
        return[links:links]
    }

    def form_ajax(){
        def link

        if(params.id){
            link = Link.get(params.id)
        }else{
            link = new Link()
        }

        return[link:link]
    }

    def saveLink_ajax(){

//        println("params " + params)

        def link

        if(params.id){
            link = Link.get(params.id)
        }else{
            link = new Link()
        }

        if(params.estado){
            params.activo = 'A'
        }else{
            params.activo = 'N'
        }

        link.properties = params

        if(!link.save(flush:true)){
            println("error al guardar el link " + link.errors)
            render "no"
        }else{
            render "ok"
        }
    }

    def deleteLink_ajax(){

        def link = Link.get(params.id)

        try{
            link.delete(flush:true)
            render "ok"
        }catch(e){
            println("error al borrar el link " + link.errors)
            render "no"
        }
    }

    def logo_ajax(){
        def link = Link.get(params.id)
        return[link:link]
    }

    def tablaLogos_ajax(){
        def link = Link.get(params.id)
//        def path = "/var/ventas/productos/pro_" + producto.id + "/"
        def path = "/var/ventas/imagen/consultas/"
        new File(path).mkdirs()

        def files = []

        def dir = new File(path)
        dir.eachFileRecurse(FileType.FILES) { file ->
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

        return[imagenes: files, link:link]
    }

    def getImage() {
        println "params get image $params"
        byte[] imageInBytes = im(params.id, params.format)
        response.with{
            setHeader('Content-length', imageInBytes.length.toString())
            contentType = "image/${params.format}" // or the appropriate image content type
            outputStream << imageInBytes
            outputStream.flush()
        }
    }

    byte[] im(nombre,ext) {
        ByteArrayOutputStream baos = new ByteArrayOutputStream()
        ImageIO.write(ImageIO.read(new File("/var/ventas/imagen/consultas/" + nombre + "." + ext)), ext.toString(), baos)
        baos.toByteArray()
    }

    def upload_ajax() {
        println ("params imas " +  params)
        def link = Link.get(params.id)
        def path = "/var/ventas/imagen/consultas/"
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

                def nombre = fileName + "." + ext
                def pathFile = path + nombre
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
                    link.logo = nombre
                    link.save(flush:true)

                } catch (e) {
                    println ("error al subir la imagen " + e)
                }

                /* fin resize */
//                def pathReturn = "/var/ventas/productos/pro_" + producto.id + "/" + nombre
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
    }

    def deleteImagen_ajax() {
        println "deleteImagen_ajax params $params"
        def link = Link.get(params.id)
        def path = "/var/ventas/imagen/consultas/"
        def file = params.file
        def fileDel = new File(path + file)

        try{
            link.logo = null
            link.save(flush:true)
            fileDel.delete()
            render "ok"
        }catch(e){
            println("error al borrar la imagen " + e)
            render "no"
        }
    }

}
