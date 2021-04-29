package ventas

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
        def valor = 10 * params.valor.toInteger()
        return[valor:valor]
    }

    def pago_ajax(){
        def producto = Producto.get(params.id)
        return[producto: producto]
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

        def fi = new Date().parse("dd-MM-yyyy", params.inicio)
        println("params ff " + ff)

    }


}
