package ventas

import geografia.Canton
import groovy.io.FileType

import javax.imageio.ImageIO


class PagoController {

    def list(){

    }

    def form_ajax(){
        def producto = Producto.get(params.id)
        return[producto:producto]
    }

    def valor_ajax(){
        def tipoPago = TipoPago.get(params.valor)
        def valor = tipoPago.tarifa ?: 0
        return[valor:valor]
    }

    def pago_ajax(){
        println("pago " + params)
        def producto = Producto.get(params.id)
        def tipo = TipoPago.get(params.tipo)
        def fechaInicio = params.fi
        def fechaFin = params.ff
        return[producto: producto, tipo: tipo, fi: fechaInicio, ff: fechaFin]
    }

    def tablaPagos_ajax(){
        def producto = Producto.get(params.id)

        def path = "/var/ventas/pagos/pro_" + producto.id + "/"
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

    def upload_ajax() {
        println ("params imas " +  params)
        def producto = Producto.get(params.id)
        def tipo = TipoPago.get(params.tipo)
        def fi = new Date().parse("dd-MM-yyyy", params.fi)
        def ff = new Date().parse("dd-MM-yyyy", params.ff)
        def path = "/var/ventas/pagos/pro_" + producto.id + "/"
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
                        f.transferTo(new File(pathFile)) // guarda el archivo subido al nuevo path
                        def pago = new Pago()
                        pago.producto = producto
                        pago.tipoPago = tipo
                        pago.fecha = new Date()
                        pago.fechaInicio = fi
                        pago.fechaFin = ff
                        pago.valor = tipo.tarifa
                        pago.save(flush:true)
                    } catch (e) {
                        println ("error al subir la imagen del comprobante" + e)
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


        println("params ff " + ff)

        return[ff:ff]
    }

    def deleteImagen_ajax() {
        println "params borrar comprobante" + params
        def producto = Producto.get(params.id)
        def path = "/var/ventas/pago/pro_" + producto.id + "/"
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
//            render "er_No se puede borrar el comprobante."
//        }else{
            try{
//                def imagen = Imagen.findByProductoAndRuta(producto,file)
                def pago = Pago.findByProducto(producto)
                if(pago){
                    fileDel.delete()
                    pago.delete(flush: true)
                    render "ok"
                }else{
                    render  "no"
                }
            }catch(e){
                println("error al borrar la imagen " + e)
                render "no"
            }
//        }
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
        ImageIO.write(ImageIO.read(new File("/var/ventas/pagos/pro_" + producto + "/" + nombre + "." + ext)), ext.toString(), baos)
        baos.toByteArray()
    }

}
