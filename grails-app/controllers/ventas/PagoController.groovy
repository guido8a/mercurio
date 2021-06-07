package ventas

import geografia.Canton
import groovy.io.FileType
import seguridad.Persona

import javax.imageio.ImageIO
import java.text.SimpleDateFormat


class PagoController {

    def list(){

    }

    def form_ajax(){
        def producto = Producto.get(params.id)
        def anuncio = Anuncio.get(params.anun)
        println "anuncio: ${anuncio.id}, tipo: ${anuncio.tipoPago.descripcion} fecha: ${anuncio.fechaInicio.format('dd-MM-yyyy')}"
        return[producto: producto, anuncio: anuncio]
    }

    def valor_ajax(){
        def tipoPago = TipoPago.get(params.valor)
        def valor = tipoPago.tarifa ?: 0
        return[valor:valor]
    }

    def pago_ajax(){
        println("pago " + params)
        def anuncio = Anuncio.get(params.anun.toInteger())
        def tppg = TipoPago.get(params.tipo.toInteger())
        def fchaInicio = new Date().parse('dd-MM-yyyy HH:mm:ss', params.fcin + " 00:00:00")
        def fchaFin = new Date().parse("dd-MM-yyyy HH:mm:ss", (fchaInicio + (tppg.dias - 1)).format('dd-MM-yyyy') + " 23:59:00")

        println "fcha: $fchaInicio, tppg: $tppg, fechaFin: $fchaFin"

        anuncio.fechaModificacion = new Date()
        anuncio.fechaInicio = fchaInicio
        anuncio.fechaFin = fchaFin
        anuncio.tipoPago = tppg

        if (!anuncio.save(flush: true)) {
            println("error al crear el anuncio " + anuncio.errors)
        }

        return[producto: anuncio.producto, anuncio: anuncio, tipo: tppg, fi: fchaInicio.format("dd-MM-yyyy"), ff: fchaFin]
    }

    def republicar_ajax(){
        def producto = Producto.get(params.id)
        def anuncio = Anuncio.get(params.anun)
        println "anuncio: ${anuncio.id}, tipo: ${anuncio.tipoPago.descripcion} fecha: ${anuncio.fechaInicio.format('dd-MM-yyyy')}"
        return[producto: producto, anuncio: anuncio]
    }

    def pago_republicar_ajax(){
        println("pago_republicar_ajax " + params)
        def anterior = Anuncio.get(params.anun.toInteger())
        def anuncio = new Anuncio(anterior.properties)
        def tppg = TipoPago.get(params.tipo.toInteger())
        def fchaInicio = new Date().parse('dd-MM-yyyy HH:mm:ss', params.fcin + " 00:00:00")
        def fchaFin = new Date().parse("dd-MM-yyyy HH:mm:ss", (fchaInicio + (tppg.dias - 1)).format('dd-MM-yyyy') + " 23:59:00")

        println "fcha: $fchaInicio, tppg: $tppg, fechaFin: $fchaFin"

        anuncio.fecha = new Date()
        anuncio.fechaModificacion = null
        anuncio.fechaInicio = fchaInicio
        anuncio.fechaFin = fchaFin
        anuncio.tipoPago = tppg
        anuncio.observaciones = "Vuelve a publicar"


        anterior.estado = 'B'
        anterior.save(flush: true)

        if (!anuncio.save(flush: true)) {
            println("error al crear el anuncio " + anuncio.errors)
        }

        return[producto: anuncio.producto, anuncio: anuncio, tipo: tppg, fi: fchaInicio.format("dd-MM-yyyy"), ff: fchaFin]
    }



    def tablaPagos_ajax(){
        def producto = Producto.get(params.id)
        def anuncio = Anuncio.findByProducto(producto)

//        def path = "/var/ventas/pagos/pro_" + producto.id + "/"
        def path = "/var/ventas/pagos/pro_" + producto.id + "/" + anuncio.id + "/"
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

    def actualizaAnuncio_ajax(){
        println "actualizaAnuncio_ajax: $params"
        def anuncio = Anuncio.get(params.anun.toInteger())
        def tppg = TipoPago.get(params.tipo.toInteger())
        def fchaInicio = new Date().parse('dd-MM-yyyy HH:mm:ss', params.fcin + " 00:00:00")
        def fchaFin = new Date().parse("dd-MM-yyyy HH:mm:ss", (fchaInicio + (tppg.dias - 1)).format('dd-MM-yyyy') + " 23:59:00")

        println "fcha: $fchaInicio, tppg: $tppg, fechaFin: $fchaFin"

        anuncio.fechaModificacion = new Date()
        anuncio.fechaInicio = fchaInicio
        anuncio.fechaFin = fchaFin
        anuncio.tipoPago = tppg

        if (!anuncio.save(flush: true)) {
            println("error al crear el anuncio " + anuncio.errors)
            render "no_Error al publicar el producto"
        } else {
            render "<p>Su producto será revisado y publicado en las próximas 24 horas</p>"
        }
    }

    def actualizaNuevoAnuncio_ajax(){
        println "actualizaAnuncio_ajax: $params"
        def anterior = Anuncio.get(params.anun.toInteger())
        def anuncio = new Anuncio(anterior.properties)
        def tppg = TipoPago.get(params.tipo.toInteger())
        def fchaInicio = new Date().parse('dd-MM-yyyy HH:mm:ss', params.fcin + " 00:00:00")
        def fchaFin = new Date().parse("dd-MM-yyyy HH:mm:ss", (fchaInicio + (tppg.dias - 1)).format('dd-MM-yyyy') + " 23:59:00")

        println "fcha: $fchaInicio, tppg: $tppg, fechaFin: $fchaFin"

        anuncio.fecha = new Date()
        anuncio.fechaModificacion = null
        anuncio.fechaInicio = fchaInicio
        anuncio.fechaFin = fchaFin
        anuncio.tipoPago = tppg
        anuncio.observaciones = "Vuelve a publicar"

        anterior.estado = 'B'
        anterior.save(flush: true)

        if (!anuncio.save(flush: true)) {
            println("error al crear el anuncio " + anuncio.errors)
            render "no_Error al publicar el producto"
        } else {
            render "<p>Su producto será revisado y publicado en las próximas 24 horas</p>"
        }
    }

    def upload_ajax() {
        println ("params imas " +  params)
        def producto = Producto.get(params.id)
//        def anuncio = Anuncio.findByProducto(producto)
        def anuncio = Anuncio.get(params.anun.toInteger())
        def tipo = TipoPago.get(params.tipo)
//        def fi = new Date().parse("dd-MM-yyyy", params.fi)
//        def fi = Date.parse("dd-MM-yyyy", params.fi)
//        def ff = Date.parse("dd-MM-yyyy", params.ff)
//        def di = new SimpleDateFormat("dd-MM-yyyy").parse(params.fi).format("dd-MM-yyyy")
//        def df = new SimpleDateFormat("dd-MM-yyyy").parse(params.ff).format("dd-MM-yyyy")



        def path = "/var/ventas/pagos/pro_" + anuncio.producto.id + "/"
//        def path = "/var/ventas/pagos/anun_" + anuncio.id + "/"
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

        if(canti.size() < 1){
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
//                        f.transferTo(new File(pathFile)) // guarda el archivo subido al nuevo path
                        def pago = new Pago()
                        pago.anuncio = anuncio
//                        pago.tipoPago = tipo
                        pago.fecha = new Date()
//                        pago.fechaInicio = fi
//                        pago.fechaFin = ff
                        pago.valor = tipo.tarifa
                        pago.estado = 'R'
                        pago.ruta = nombre
                        pago.save(flush:true)

                        def path2 = "/var/ventas/pagos/pro_" + anuncio.producto.id + "/" + anuncio.id + "/"
                        new File(path2).mkdirs()

                        def pathFile2 = path2 + nombre

                        f.transferTo(new File(pathFile2)) // guarda el archivo subido al nuevo path

                        anuncio.pago = 'R'
                        anuncio.save(flush:true)

                    } catch (e) {
                        println ("error al subir la imagen del comprobante" + e)
                    }

                    /* fin resize */
//                def pathReturn = "/var/ventas/productos/pro_" + anuncio.producto.id + "/" + nombre
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
        def path = "/var/ventas/pagos/pro_" + producto.id + "/"
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

        if(canti.size() < 1){
            render "ok"
        }else{
            render "no"
        }
    }

    def fin_ajax(){

        println("params fechas" + params)
        def tipoPago = TipoPago.get(params.tipo)

        def fi = new Date().parse("dd-MM-yyyy", params.inicio)
        println("params fi " + fi.format("dd-MM-yyyy"))
        def ff

//        switch (params.tipo) {
//
//            case "1":
//                ff  = fi.plus(7).format("dd-MM-yyyy")
//            break;
//            case "2":
//                ff  = fi.plus(14).format("dd-MM-yyyy")
//                break;
//            case "3":
//                ff  = fi.plus(21).format("dd-MM-yyyy")
//                break;
//            case "4":
//                ff  = fi.plus(28).format("dd-MM-yyyy")
//                break;
//        }

        ff  = fi.plus(tipoPago.dias.toInteger()).format("dd-MM-yyyy")


//        println("params ff " + ff)

        return[ff:ff]
    }

    def deleteImagenPago_ajax() {
        println "params borrar comprobante" + params
        def producto = Producto.get(params.id)
        def anuncio = Anuncio.findByProducto(producto)
        def pagoActual = Pago.findByAnuncioAndRuta(anuncio, params.file)
        def path = "/var/ventas/pagos/pro_" + producto.id + "/" + anuncio.id + "/"
        def file = params.file
        def fileDel = new File(path + file)

        if(pagoActual.estado == 'A'){
            render "er_El estado del pago se encuentra activo, no es posible borrar el comprobante"
        }else{
            if(pagoActual){
                try{
                    fileDel.delete()
                    pagoActual.delete(flush: true)
                    render "ok"
                }catch(e){
                    println("error al borrar el comprobante " + e + imag.errors)
                }
            }else{
                render  "no"
            }
        }
    }

    def getImage() {
//        println "params get image $params"
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
        def pro = Producto.get(producto)
        def anuncio = Anuncio.findByProducto(pro)
        ImageIO.write(ImageIO.read(new File("/var/ventas/pagos/pro_" + pro.id + "/" + anuncio.id + "/" + nombre + "." + ext)), ext.toString(), baos)
        baos.toByteArray()
    }

}
