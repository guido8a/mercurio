package ventas

import groovy.io.FileType
import seguridad.Persona

import javax.imageio.ImageIO
import java.awt.image.BufferedImage

import static java.awt.RenderingHints.KEY_INTERPOLATION
import static java.awt.RenderingHints.VALUE_INTERPOLATION_BICUBIC

class ProductoController {

    def list(){
        println("params " + params)
        def persona = Persona.get(params.id)
        def productos = Producto.findAllByPersona(persona)
        return[productos: productos, persona: persona]
    }

    def form_ajax(){
        def persona = Persona.get(params.persona)
        def producto
        if(params.id){
            producto = Producto.get(params.id)
        }else{
            producto = new Producto()
        }

        return[producto: producto, persona: persona]
    }

    def producto(){
        println "params: $params"
        def persona = Persona.get(params.persona)
        def producto
        def path = "/var/ventas/productos/pro_"
        def imagenes = []

        if(params.id){
            producto = Producto.get(params.id)
        }else{
            producto = new Producto()
        }

        /**** imágenes ****/
        if(producto?.id){
            path += producto.id + "/"
            def imag = new File(path)
            imag.eachFileRecurse(FileType.FILES) { file ->
                def img = ImageIO.read(file)
                if (img) {
                    imagenes.add([file: file.name])
                }
            }
        }

        return[producto: producto, persona: persona, imagenes: imagenes]
    }


    def saveProducto(){

        println("params " + params)

        def producto

        if(params.id){
            producto = Producto.get(params.id)
        }else{
            producto = new Producto()
            params.estado = 'R'
            params.fecha = new Date()
        }

        producto.properties = params

        if(!producto.save(flush:true)){
            println("error al guardar el producto " + producto.errors)
            render "no"
        }else{
            render "ok_" + producto.id
        }
    }

    def show_ajax(){
        def producto = Producto.get(params.id)
        return[producto: producto]
    }

    def texto(){
        def producto = Producto.get(params.id)
        return[producto: producto]
    }

    def guardarTexto_ajax(){
        def producto = Producto.get(params.id)
        producto.texto = params.editorTramite

        if(!producto.save(flush:true)){
            println("error al guardar el texto del producto " + producto.errors)
            render "no"
        }else{
            render "ok"
        }
    }

    def imagenes_ajax() {
        def producto = Producto.get(params.id)
        return[producto: producto]
    }


    def upload_ajax() {
//        println ("params imas " +  params)
        def producto = Producto.get(params.id)
        def path = "/var/ventas/productos/pro_" + producto.id + "/"
        new File(path).mkdirs()

//        def f = request.getFile('upload')
        def f = request.getFile('file')

        def okContents = ['image/png': "png", 'image/jpeg': "jpeg", 'image/jpg': "jpg"]

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
                    def imagenNueva = new Imagen()
                    imagenNueva.producto = producto
                    imagenNueva.estado = 1
                    imagenNueva.ruta = nombre
                    imagenNueva.save(flush:true)
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
        println("parmas " + params)
        def producto = Producto.get(params.id)
        def path = "/var/ventas/productos/pro_" + producto.id + "/"
        def file = params.file
        def fileDel = new File(path + file)

        try{
            def imagen = Imagen.findByProductoAndRuta(producto,file)
            if(imagen){
                fileDel.delete()
                imagen.delete(flush: true)
                render "ok"
            }else{
                render  "no"
            }
        }catch(e){
            println("error al borrar la imagen " + e)
            render "no"
        }
    }

    def getImage() {
        println("params get image " + params)
        byte[] imageInBytes = im(params.id, params.format, params.pro)
        response.with{
            setHeader('Content-length', imageInBytes.length.toString())
            contentType = "image/${params.format}" // or the appropriate image content type
            outputStream << imageInBytes
            outputStream.flush()
        }
    }

    byte[] im(nombre,ext,producto) {
        ByteArrayOutputStream baos = new ByteArrayOutputStream()
        ImageIO.write(ImageIO.read(new File("/var/ventas/productos/pro_" + producto + "/" + nombre + "." + ext)), ext.toString(), baos)
        baos.toByteArray()
    }

    def tablaImagenes_ajax(){
        def producto = Producto.get(params.id)

        def path = "/var/ventas/productos/pro_" + producto.id + "/"
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

        return[imagenes: files, producto: producto]
    }

    def tablaAtributos_ajax(){
        println("params ta " + params)
        def producto = Producto.get(params.id)
        def atributos = Valores.findAllByProducto(producto)
        return[atributos: atributos]
    }

    def agregarAtributo_ajax(){
        println("params " + params)

        def producto = Producto.get(params.id)
        def ac = AtributoCategoria.get(params.atributo)

        if(!params.valor){
            render "er_Ingrese un valor"
        }else{
            def existe = Valores.findAllByProductoAndAtributoCategoria(producto, ac)

            if(existe){
                render "er_El atributo seleccionado ya se encuentra agregado"
            }else{
                def v = new Valores()
                v.atributoCategoria = ac
                v.producto = producto
                v.valor = params.valor

                if(!v.save(flush:true)){
                    println("error al guardar el atributo")
                    render "no"
                }else{
                    render "ok"
                }
            }
        }
    }

    def borrarAtributo_ajax() {
        def valor = Valores.get(params.id)
        try{
            valor.delete(flush:true)
            render "ok"
        }catch(e){
            println("error al borrar el valor " + valor.errors)
            render "no"
        }
    }
}
