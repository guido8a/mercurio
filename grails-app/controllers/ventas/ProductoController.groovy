package ventas

import com.itextpdf.tool.xml.html.Image
import groovy.io.FileType
import seguridad.Persona

import javax.imageio.ImageIO
import java.awt.image.BufferedImage
import java.nio.file.Files
import java.nio.file.Paths
import java.nio.file.StandardCopyOption

import static java.awt.RenderingHints.KEY_INTERPOLATION
import static java.awt.RenderingHints.VALUE_INTERPOLATION_BICUBIC

class ProductoController {

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
        println "saveProducto $params"
        def persona = Persona.get(session.usuario.id)
        def producto

        if(params.id){
            producto = Producto.get(params.id)
        }else{
            producto = new Producto()
            producto.persona = persona
            producto.padre = null
            params.estado = (params.padre? 'T':'I')
            params.fecha = new Date()
            params.latitud = 0
            params.longitud = 0
            println "padre--> ${params.padre}"
        }

        producto.properties = params
//        if(producto.padre && !params.id){
//            Imagen.findAllByProducto(producto.padre).each {im ->
//                def imagen = new Imagen()
//                imagen.producto = producto
//                imagen.estado = estado
//                imagen.ruta =
//            }
//        }

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
        println "revisarImas_ajax $params"
        def producto = Producto.get(params.id)
        def imagenes = Imagen.findAllByProductoAndEstado(producto,'1')
        if(imagenes.size() < 5){
            render "ok"
        }else{
            render "no"
        }

    }

    def deleteImagen_ajax() {
        println "deleteImagen_ajax params $params"
        def imagen = Imagen.get(params.idim)
        def imagenes = Imagen.findAllByProductoAndIdNotEqual(imagen.producto, imagen.id)
        def path = "/var/ventas/productos/pro_" + imagen.producto.id + "/${imagen.ruta}"

        if(imagenes.size() == 0){
            render "er_No se puede borrar la imagen, el producto tiene una sola imagen asociada."
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
        def persona = Persona.get(session.usuario.id)
        def padre
        def producto
        def mnsj, anun, primero = true

        if(params.e){
            producto = Producto.get(params.id)
        }else{
            switch (params.tipo) {
                case "1":
                    producto = new Producto()
                    padre = Producto.get(params.id)
                    producto.padre = padre
                    producto.persona = persona
                    producto.subcategoria = padre.subcategoria
                    producto.estado = 'I'
                    producto.fecha = new Date()
                    producto.latitud = 0
                    producto.longitud = 0
//                    producto.save(flush:true)
                    break;
                case "2" :
                    producto = Producto.get(params.id)
                    def anuncio = Anuncio.findAllByProductoAndEstado(producto, "R")
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
                    if (producto.estado == 'R') producto.estado = 'I'
                    producto.save(flush: true)
                    break;
                case "3" :
                    producto = new Producto()
                    producto.persona = persona
                    producto.padre = null
                    producto.estado = 'I'
                    producto.fecha = new Date()
                    producto.latitud = 0
                    producto.longitud = 0
//                    producto.save(flush:true)
                    break;
            }
        }
        println "producto: ${producto.id}, persona: ${persona.id}, tipo: ${params.tipo}"
        return[producto: producto, persona: persona, tipo: params.tipo]
    }

    def wizardInfo() {
        println "wizardInfo: $params"
        def persona = Persona.get(session.usuario.id)
        def producto = Producto.get(params.id)
        return[producto: producto, persona: persona, tipo: params.tipo]
    }

    def wizardAtributos() {
        println "wizardAtributos: $params"
        def persona = Persona.get(session.usuario.id)
        def producto = Producto.get(params.id)
        return[producto: producto, persona: persona, tipo: params.tipo]
    }

    def wizardImagenes() {
        println "wizardImagenes: $params"
        def persona = Persona.get(session.usuario.id)
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

        return[producto: producto, persona: persona, imagenes: imagenes, tam: imas.size(), tipo: params.tipo]
    }

    def wizardContacto() {
        println "wizardContacto: $params"
        def persona = Persona.get(session.usuario.id)
        def producto = Producto.get(params.id)
        return[producto: producto, persona: persona, tipo: params.tipo]
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

    def borrar_temporal(){
        if(params.id) {
           borrar_producto(params.id)
        }

        redirect(action: 'list')
    }

    /* si hay anuncios en proceso de aprobación o revisión se los da de baja */
    def delete_ajax(){
        def producto = Producto.get(params.id)
        def anuncios = Anuncio.findAllByProductoAndEstadoInList(producto, ['E', 'R'])
        if(anuncios.size() > 0) {
            producto.estado = 'B'
            producto.save(flush: true)
            anuncios.each { a ->
                a.estado = 'B'
                a.save(flush: true)
            }
        }
        try{
            borrar_producto(producto.id)
            render "ok"
        }catch(e){
             println("error al borrar el producto " + producto.errors)
             render "no"
        }
    }

    def borrar_producto(id){
        def cn = dbConnectionService.getConnection()
        def sql = "select imagruta from imag where prod__id = ${id}"
        def producto = Producto.get(id)
        def imagenes = cn.rows(sql.toString())
        if(imagenes){
            def path = "/var/ventas/productos/pro_" + producto.id + "/"
            def imag = new File(path)
            imag?.eachFileRecurse(FileType.FILES) { file ->
                file.delete()
            }
            imag.delete()
        }
        cn.execute("delete from imag where prod__id = ${producto.id}".toString())

        sql = "delete from atvl where prod__id = ${id}"
        cn.execute(sql.toString())

        sql = "delete from prod where prod__id = ${id}"
        cn.execute(sql.toString())
    }

    /* Se pone publfcfn = now() para dejar de publicar */
    def quitarAnuncio_ajax(){
        def producto = Producto.get(params.id)
        def cn = dbConnectionService.getConnection()
        def fcha = new Date().format('yyyy-MM-dd HH:mm:ss')
        def sql = "update anun set anunfcfn = '${fcha}', anunfcmd = '${fcha}' " +
                "where '${fcha}' between anunfcin and anunfcfn and " +
                "anun__id in (select anun__id from anun where prod__id = ${params.id})"

        try {
            def data = cn.executeUpdate(sql.toString())
            if(data) {
                flash.message = "Se han actualizado ${data} anuncios"

                def mail = producto.persona.mailContacto
                def errores = ''

                try{
                    mailService.sendMail {
                        to mail
                        subject "Confirmación de cancelación del anuncio del producto: ${producto?.titulo}"
                        body "Este mail de confirmación es para comunicarle que su producto: ${producto?.titulo} ," +
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
        def producto = Producto.get(params.id)
        return[producto:producto]
    }

    def wizardGeo(){
        def persona = Persona.get(session.usuario.id)
        def producto = Producto.get(params.id)
        return[producto: producto, persona: persona, tipo: params.tipo]
    }

    def publicar_ajax(){
        def producto = Producto.get(params.id)
        return [producto:producto]
    }

    /*
    * Se debe inhabilitar el producto anterior y cambiar el estado a 'R' del actual.
    * Si hay anuncio pagado se debe apsar el apgo a este anuncio y fijar las echa por el resto de la publicación
    */
    def guardarContacto_ajax(){
        println "guardarContacto_ajax: $params"
        def persona = Persona.get(session.usuario.id)
        def producto = Producto.get(params.id)

        persona.mailContacto = params.mail
        persona.contacto = params.contacto
        persona.telefonoContacto = params.telefono

        if(producto.estado == 'T') {
            def mnsj = inhabilitaAnterior(producto)
            println "mnsj: $mnsj"
            render mnsj
        } else {
            def anuncios = Anuncio.findAllByProductoAndEstadoInList(producto, ['E', 'B'])
            def anuncio
            def tppg = TipoPago.get(params.pago.toInteger())
            def fchaInicio = new Date().parse('dd-MM-yyyy HH:mm:ss', params.fecha + " 00:00:00")
            def fchaFin = new Date().parse("dd-MM-yyyy HH:mm:ss", (fchaInicio + (tppg.dias - 1)).format('dd-MM-yyyy') + " 23:59:00")

            println "fcha: $fchaInicio, tppg: $tppg, fechaFin: $fchaFin"

            if (!persona.save(flush: true)) {
                println("error al guardar la información de contacto " + persona.errors)
                render "no"
            } else {
                anuncios.each { a ->
                    if (a.estado == 'E') {
                        println "Anuncio en Espera..."
                        anuncio = a
                    } else {
                        if (anuncio && (a.estado == 'B')) {
                            println "Anuncio extra dado de baja"
                            a.delete(flush: true)
                        } else if (a.estado == 'B') {
                            println "Anuncio como dado de baja --> R"
                            anuncio = a
                        }
                    }
                }

                println "pago: -- ${params.pago.class} ${params.pago}"
                if (anuncio) {
                    anuncio.fechaModificacion = new Date()
                } else {
                    anuncio = new Anuncio()
                    anuncio.producto = producto
                    anuncio.fecha = new Date()
                }

                anuncio.estado = 'R'
                anuncio.fechaInicio = fchaInicio
                anuncio.fechaFin = fchaFin
                anuncio.tipoPago = tppg
//            anuncio.pago = (params.pago == '5'? 'N' : 'S')  /* si es pagado o no */

                if (!anuncio.save(flush: true)) {
                    println("error al crear el anuncio " + anuncio.errors)
                    render "no_Error al publicar el producto"
                } else {
                    producto.estado = 'R'
                    producto.fechaModificacion = new Date()
                    producto.save(flush: true)
                    render "ok"
                }
            }

        }
    }

    def inhabilitaAnterior(prod) {
        println "inhabilitaAnterior: $prod"

        def anuncio = Anuncio.findByProductoAndEstadoInList(prod.padre, ['A'])
        def nuevo
//        def diff = anuncio.fechaFin - new Date().clearTime()

        println "Anuncio: ${anuncio?.id}"

        if (anuncio) {
            anuncio.fechaModificacion = new Date()
            anuncio.estado = 'B'
            nuevo = new Anuncio()
            nuevo.producto = prod
            nuevo.fecha = new Date()
            nuevo.estado = 'R'
            nuevo.tipoPago = anuncio.tipoPago
            nuevo.fechaInicio = new Date()
            nuevo.fechaFin = anuncio.fechaFin
            nuevo.observaciones = "Modificación del anuncio original: ${anuncio.id}"

            if (!anuncio.save(flush: true)) {
                println("error al crear el anuncio " + anuncio.errors)
                return "no"
            } else {
                nuevo.save(flush: true)
                prod.estado = 'R'
                prod.padre.estado = 'B'
                prod.padre.fechaModificacion = new Date()
                prod.save(flush: true)
                prod.padre.save(flush: true)
                return "ok"
            }
        }
    }

    /*
    * Crea otro anuncio para este producto con nuevas fechas y tipo de pago
    */
    def rePublicar_ajax(){
        println "rePublicar_ajax: $params"
        def persona = Persona.get(session.usuario.id)
        def producto = Producto.get(params.id)
        def anuncios = Anuncio.findAllByProductoAndEstadoInList(producto, ['E', 'B'])
        def anuncio
        def tppg = TipoPago.get(params.pago.toInteger())
        def fchaInicio = new Date().parse('dd-MM-yyyy HH:mm:ss', params.fecha + " 00:00:00")
        def fchaFin = new Date().parse("dd-MM-yyyy HH:mm:ss", (fchaInicio + (tppg.dias - 1)).format('dd-MM-yyyy') + " 23:59:00")

        println "fcha: $fchaInicio, tppg: $tppg, fechaFin: $fchaFin"

        persona.mailContacto = params.mail
        persona.contacto = params.contacto
        persona.telefonoContacto = params.telefono

        if (!persona.save(flush: true)) {
            println("error al guardar la información de contacto " + persona.errors)
            render "no"
        } else {
            anuncios.each { a ->
                if (a.estado == 'E') {
                    println "Anuncio en Espera..."
                    anuncio = a
                } else {
                    if (anuncio && (a.estado == 'B')) {
                        println "Anuncio extra dado de baja"
                        a.delete(flush: true)
                    } else if (a.estado == 'B') {
                        println "Anuncio como dado de baja --> R"
                        anuncio = a
                    }
                }
            }

            println "pago: -- ${params.pago.class} ${params.pago}"
            if (anuncio) {
                anuncio.fechaModificacion = new Date()
            } else {
                anuncio = new Anuncio()
                anuncio.producto = producto
                anuncio.fecha = new Date()
            }

            anuncio.estado = 'R'
            anuncio.fechaInicio = fchaInicio
            anuncio.fechaFin = fchaFin
            anuncio.tipoPago = tppg
//            anuncio.pago = (params.pago == '5'? 'N' : 'S')  /* si es pagado o no */

            if (!anuncio.save(flush: true)) {
                println("error al crear el anuncio " + anuncio.errors)
                render "no_Error al publicar el producto"
            } else {
                producto.estado = 'R'
                producto.fechaModificacion = new Date()
                producto.save(flush: true)
                render "ok"
            }
        }
    }




    /*
    * Si ya existe un anuncio en estado en revisión: R se cambia el estado a 'I' para que se vuelva a publicar una vez
    * completada la edición --Avisar antes de editar */
    def crearAnuncio_ajax(){
        println("params crear anuncio " + params)
        def producto = Producto.get(params.id)
        def texto= ''
        def anuncios = Anuncio.findAllByProductoAndEstadoInList(producto, ['E', 'B'])
        def anuncio

        anuncios.each { a ->
            if(a.estado == 'E') {
                println "Anuncio en Espera..."
                anuncio = a
            } else {
                if(anuncio && (a.estado == 'B')) {
                    println "Anuncio extra dado de baja"
                    a.delete(flush: true)
                } else if(a.estado == 'B') {
                    println "Anuncio como dado de baja --> R"
                    anuncio = a
                }
            }
        }

        if(anuncio){
            anuncio.estado = 'R'
            anuncio.fechaModificacion = new Date()
        } else {
            anuncio = new Anuncio()
            anuncio.producto = producto
            anuncio.estado = 'R'
//            anuncio.pago = (params.pago == '5'? 'N' : 'S')  /* si es pagado o no */
            anuncio.fecha = new Date()
        }

        if(!anuncio.save(flush:true)){
            println("error al crear el anuncio " + anuncio.errors)
            render "no_Error al publicar el producto"
        }else{
            producto.estado = 'R'
            producto.save(flush:true)
            render "ok"
        }

    }

    def reemplazar_ajax(){
//        def anuncio = new Anuncio()
        def anuncio
        def producto = Producto.get(params.id)

//        anuncio.producto = producto
//        anuncio.estado = 'R'
//        anuncio.fecha = new Date()
//
//        if(!anuncio.save(flush:true)){
//            println("error al crear el anuncio " + anuncio.errors)
//            render "no_Error al publicar el producto"
//        }else{

            switch (params.tipo) {
                case "1":
                    def padre = Producto.get(producto?.padre?.id)
                    padre.estado = 'B'
                    padre.save(flush:true)

                    def activo = Anuncio.findByProductoAndEstado(padre,'A')
                    if(activo){
                        activo.estado = 'B'
                        activo.observaciones = 'Dado de baja por reemplazo'
                        activo.save(flush:true)
                    }

                    anuncio = new Anuncio()
                    anuncio.producto = producto
                    anuncio.estado = 'R'
                    anuncio.fecha = new Date()
//                    anuncio.pago = 'N'
                    anuncio.save(flush:true)

                    break;
                case "2" :
                    def activo2 = Anuncio.findByProductoAndEstado(producto,'R')

                    if(activo2){
                        activo2.estado = 'R'
                        activo2.fecha = new Date()
//                        activo2.pago = 'N'
                        activo2.observaciones = 'Anuncio editado el ' + new Date().format("dd-MM-yyyy")
                        activo2.save(flush:true)
                    }

                    break;
                case "3" :
                    break;
            }

            producto.estado = 'R'
            producto.save(flush:true)

            render "ok"
//        }
    }

    def copiarAtributos_ajax(){
        def producto = Producto.get(params.id)
        def padre
//        if(params.tipo == '1'){
            padre = producto.padre
//        }else{
//            padre = Producto.get(producto.anterior)
//        }
        def atributos = Valores.findAllByProducto(producto)
        def atributosPadre = Valores.findAllByProducto(padre)

        if(atributos.size() == 0){

            if(atributosPadre.size() != 0){
                atributosPadre.each {
                    def atr = new Valores()
                    atr.producto = producto
                    atr.valor = it.valor
                    atr.orden = it.orden
                    atr.atributoCategoria = it.atributoCategoria

                    atr.save(flush:true)
                }

                render "ok"
            }else{
                render "no"
            }
        }else{
            render "no"
        }

    }

    def copiarImagenes_ajax(){
        def producto = Producto.get(params.id)
        def padre
//        if(params.tipo == '1'){
            padre = producto.padre
//        }else{
//            padre = Producto.get(producto.anterior.toInteger())
//        }

        def nmbr = "", arch = ""

        def pathHijo = "/var/ventas/productos/pro_" + producto.id + "/"
        new File(pathHijo).mkdirs()
        def pathPadre = "/var/ventas/productos/pro_" + padre.id + "/"

        def imasHijo = []
        def dir = new File(pathHijo)
        dir.eachFileRecurse(FileType.FILES) { file ->
            def img = ImageIO.read(file)
            if (img) {
                imasHijo.add([
                        dir : pathPadre,
                        file: file.name
                ])
            }
        }

        if(imasHijo.size() == 0){

            def band = 0
            def dirPadre = new File(pathPadre)
            dirPadre.eachFileRecurse(FileType.FILES) { file ->
                def img = ImageIO.read(file)
                if (img) {
                    def imagenNueva = new Imagen()
                    imagenNueva.producto = producto
                    imagenNueva.estado = 1
                    imagenNueva.ruta = file.name

                    if(band == 0){
                        imagenNueva.principal = 1
                    }

                    imagenNueva.save(flush:true)
                    band ++
                }
            }

            new File(pathPadre).traverse(type: groovy.io.FileType.FILES, nameFilter: ~/.*/) { ar ->
                nmbr = ar.toString() - pathPadre
                arch = nmbr.substring(nmbr.lastIndexOf("/") + 1)
                def imagenNueva = new Imagen()
                File original = new File(ar.toString())
                File destino = new File(pathHijo + nmbr)
                Files.copy(Paths.get(original.getAbsolutePath()), Paths.get(destino.getAbsolutePath()), StandardCopyOption.REPLACE_EXISTING)
            }

            render "ok"
        }else{
            render "no"
        }


    }

    def info_ajax(){

        println("params " + params)
        def producto = Producto.get(params.id)
        def persona = Persona.get(params.persona)

        def cn = dbConnectionService.getConnection()
        def sql = "select * from anuncio(${persona?.id}) where prod__id = ${producto?.id}"
        def res = cn.rows(sql.toString())

        return[producto: producto, res: res[0]]
    }

}
