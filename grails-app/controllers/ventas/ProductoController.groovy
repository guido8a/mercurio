package ventas

import com.itextpdf.tool.xml.html.Image
import groovy.io.FileType
import seguridad.Persona

import javax.imageio.ImageIO
import java.awt.image.BufferedImage

import static java.awt.RenderingHints.KEY_INTERPOLATION
import static java.awt.RenderingHints.VALUE_INTERPOLATION_BICUBIC

class ProductoController {

    def list(){
        println("params " + params)
        def persona = Persona.get(session.usuario.id)
        def productos = Producto.findAllByPersonaAndEstadoNotEqual(persona,'B')
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
        println("persona " + persona)
        def producto
//        def path = "/var/ventas/productos/pro_"
        def imagenes = []

        if(params.id){
            producto = Producto.get(params.id)
        }else{
            producto = new Producto()
        }

        /**** imágenes ****/
        if(producto?.id){

            def path = "/var/ventas/productos/pro_" + producto.id + "/"
            new File(path).mkdirs()

            def imag = new File(path)
            imag?.eachFileRecurse(FileType.FILES) { file ->
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

        def producto = Producto.get(params.id)

//        if(params.id){
//            producto = Producto.get(params.id)
//        }else{
//            producto = new Producto()
//            params.estado = 'I'
//            params.fecha = new Date()
//            params.latitud = 0
//            params.longitud = 0
//        }

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
        println ("params imas " +  params)
        def producto = Producto.get(params.id)
        def imagenes = Imagen.findAllByProductoAndEstado(producto, '1')
        def path = "/var/ventas/productos/pro_" + producto.id + "/"
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
                        imagenNueva.producto = producto
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
        def producto = Producto.get(params.id)
        def imagenes = Imagen.findAllByProductoAndEstado(producto,'1')
        def path = "/var/ventas/productos/pro_" + producto.id + "/"
        new File(path).mkdirs()


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
            render "ok"
        }else{
            render "no"
        }

    }

    def deleteImagen_ajax() {
        println "deleteImagen_ajax params $params"
        def producto = Producto.get(params.id)
        def imagenes = Imagen.findAllByProductoAndEstado(producto,'1')
        def path = "/var/ventas/productos/pro_" + producto.id + "/"
        def file = params.file
        def fileDel = new File(path + file)


        def canti = []
        def dir = new File(path)
        dir.eachFileRecurse(FileType.FILES) { f ->
            def img = ImageIO.read(f)

            if (img) {
                canti.add([
                        dir : path,
                        file: f.name
                ])
            }
        }

//        if(canti.size() == 1){
        if(imagenes.size() == 1){
            render "er_No se puede borrar la imagen, el producto tiene una sola imagen asociada."
        }else{
            try{
                def imagen = Imagen.findByProductoAndRuta(producto,file)
                def otras = Imagen.findAllByProductoAndEstadoAndIdNotEqual(producto, '1',imagen.id)
                def principal = otras[0]

                if(imagen){
//                    fileDel.delete()
                    if(imagen.principal == '1'){
                        principal.principal = 1
                    }

                    imagen.estado = 0
                    imagen.principal = 0
//                    imagen.delete(flush: true)
                    imagen.save(flush: true)
                    render "ok"
                }else{
                    render  "no"
                }
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

    byte[] im(nombre,ext,producto) {
        ByteArrayOutputStream baos = new ByteArrayOutputStream()
        ImageIO.write(ImageIO.read(new File("/var/ventas/productos/pro_" + producto + "/" + nombre + "." + ext)), ext.toString(), baos)
        baos.toByteArray()
    }

    def tablaImagenes_ajax(){
        def producto = Producto.get(params.id)
        def imagenes = Imagen.findAllByProductoAndEstado(producto,'1')

        def path = "/var/ventas/productos/pro_" + producto.id + "/"
        new File(path).mkdirs()

        def files = []

        def dir = new File(path)
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

        return[imagenes: files, producto: producto, tam: imagenes.size()]
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

    def ponerPrincipal_ajax(){
        def imagen = Imagen.get(params.id)
        def producto = imagen.producto
        def imagenes = Imagen.findAllByProductoAndEstado(producto,'1')

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
        def producto = Producto.get(params.id)
        def imagenes = Imagen.findAllByProducto(producto)

        println("ima " + imagenes)

        if(imagenes){
            render "ok"
        }else{
            render "no"
        }
    }

    def destacado_ajax(){
        def producto = Producto.get(params.id)
        return[producto:producto]
    }

    def wizardProducto() {
        println ("params wp"  + params)
        def persona = Persona.get(params.persona)
        def padre
//        println("persona " + persona)

        def producto

        switch (params.tipo) {

            case "1":
                producto = new Producto()
                padre = Producto.get(params.id)
                producto.padre = padre
                producto.estado = 'I'
                producto.fecha = new Date()
                producto.latitud = 0
                producto.longitud = 0
                producto.save(flush:true)
                break;
            case "2" :
                producto = Producto.get(params.id)
                break;
            case "3" :
                producto = new Producto()
                producto.padre = null
                producto.estado = 'I'
                producto.fecha = new Date()
                producto.latitud = 0
                producto.longitud = 0
                producto.save(flush:true)
                break;
        }

//        producto.save(flush:true)
        println("producto " + producto.errors)

        return[producto: producto, persona: persona]
    }

    def wizardInfo() {
        println "params: $params"
        def persona = Persona.get(params.persona)
        def producto = Producto.get(params.id)

        return[producto: producto, persona: persona]
    }

    def wizardAtributos() {
        println "params: $params"
        def persona = Persona.get(params.persona)
        def producto = Producto.get(params.id)

        return[producto: producto, persona: persona]
    }

    def wizardImagenes() {
        println "wizardImagenes: $params"
        def persona = Persona.get(params.persona)
        def producto = Producto.get(params.id)
        def imas = Imagen.findAllByProductoAndEstado(producto, '1')

        def imagenes = []

        /**** imágenes ****/
        if(producto?.id){
            def path = "/var/ventas/productos/pro_" + producto.id + "/"
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

        return[producto: producto, persona: persona, imagenes: imagenes, tam: imas.size()]
    }

    def wizardContacto() {
        println "params: $params"
        def persona = Persona.get(params.persona)
        def producto = Producto.get(params.id)

        return[producto: producto, persona: persona]
    }

    def comprobarImagenes_ajax(){

        def producto = Producto.get(params.id)
        def path = "/var/ventas/productos/pro_" + producto.id + "/"
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
        def producto = Producto.get(params.id)
        return[producto: producto]
    }

    def guardarDestacar_ajax(){
        def producto = Producto.get(params.producto)
        if(params.tipo == 'si'){
            producto.destacado = 1
        }else{
            producto.destacado = 0
        }

        producto.save(flush:true)
    }

    def delete_ajax(){
        def producto = Producto.get(params.id)

        def atributos = Valores.findAllByProducto(producto)
        def imagenes = Imagen.findAllByProducto(producto)

        if(atributos){
            atributos.each {a->
                a.delete(flush:true)
            }
        }

        if(imagenes){

            imagenes.each {i->
                i.delete(flush:true)
            }

            def path = "/var/ventas/productos/pro_" + producto.id + "/"

            def imag = new File(path)
            imag?.eachFileRecurse(FileType.FILES) { file ->
                file.delete()
            }

            imag.delete()
        }

        try{
            producto.delete(flush:true)
            render "ok"
        }catch(e){
            println("error al borrar el producto " + producto.errors)
            render "no"
        }
    }


    def producto_ajax(){
        def producto = Producto.get(params.id)
        return[producto:producto]
    }

    def wizardGeo(){
        def persona = Persona.get(params.persona)
        def producto = Producto.get(params.id)
        return[producto: producto, persona: persona]
    }

    def publicar_ajax(){
        def producto = Producto.get(params.id)
        return [producto:producto]
    }

    def guardarContacto_ajax(){
        def persona = Persona.get(params.persona)
        persona.mailContacto = params.mail
        persona.contacto = params.contacto
        persona.telefonoContacto = params.telefono

        if(!persona.save(flush:true)){
            println("error al guardar la información de contacto " + persona.errors)
            render "no"
        }else{
            render "ok"
        }
    }

    def crearAnuncio_ajax(){
        println("params crear anuncio " + params)
        def producto = Producto.get(params.id)
//        def activo = Anuncio.findByProductoAndEstado(producto,'A')
        def band = false
        def activo

        if(producto?.padre){
            def padre = Producto.get(producto?.padre?.id)
            activo = Anuncio.findByProductoAndEstado(padre,'A')
            if(activo){
                band = true
            }else{
                band = false
            }
        }else{
            band = false
        }


        def anuncio = new Anuncio()

        if(band){
            render"er"
        }else{
            anuncio.producto = producto
            anuncio.estado = 'R'
            anuncio.fecha = new Date()
            if(!anuncio.save(flush:true)){
                println("error al crear el anuncio " + anuncio.errors)
                render "no_Error al publicar el producto"
            }else{
                producto.estado = 'R'
                producto.save(flush:true)
                render "ok"
            }
        }
    }

    def reemplazar_ajax(){
        def anuncio = new Anuncio()
        def producto = Producto.get(params.id)

        anuncio.producto = producto
        anuncio.estado = 'R'
        anuncio.fecha = new Date()

        if(!anuncio.save(flush:true)){
            println("error al crear el anuncio " + anuncio.errors)
            render "no_Error al publicar el producto"
        }else{
            producto.estado = 'R'
            producto.save(flush:true)


            def padre = Producto.get(producto?.padre?.id)
            def activo = Anuncio.findByProductoAndEstado(padre,'A')

            padre.estado = 'B'
            padre.save(flush:true)
            activo.estado = 'B'
            activo.save(flush:true)

            render "ok"
        }

    }

}
