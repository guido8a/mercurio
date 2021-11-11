package ventas

import groovy.io.FileType
import seguridad.Persona

import javax.imageio.ImageIO

class AnuncioController {

    def mailService
    def dbConnectionService

    def aceptarAnuncio_ajax() {
        println "aceptaAnuncio_ajax: $params"
        def personaAprueba = Persona.get(session.usuario.id)

        def anuncio = Anuncio.get(params.id)
        def producto = anuncio.producto

        anuncio.estado = 'A'
        anuncio.persona = personaAprueba
        anuncio.fechaAprobacion = new Date()

        def fecha_hoy = new Date().clearTime()
        println "hoy: $fecha_hoy, inicio: ${anuncio.fechaInicio}"
        if (anuncio.fechaInicio < fecha_hoy) {
            def dif = fecha_hoy - anuncio.fechaInicio.clearTime()
            println "dif: $dif"
            anuncio.fechaInicio = anuncio.fechaInicio + dif
            anuncio.fechaFin = anuncio.fechaFin + dif
        }

        println "anuncio: ${anuncio.fechaInicio} - ${anuncio.fechaFin}"
        if (!anuncio.save(flush: true)) {
            println("error al aceptar el anuncio " + anuncio.errors)
            render "no"
        } else {
            producto.estado = 'A'
            producto.save(flush: true)


            def mail = producto.persona.mailContacto
            def errores = ''

            try {
                mailService.sendMail {
                    to mail
                    subject "Confirmación de publicación del producto: ${producto?.titulo}"
                    body "Este mail de confirmación es para comunicarle que su producto: ${producto?.titulo} , ha sido exitosamente publicado!" +
                            "\n Si possee alguna duda comuniquese con el administrador del sistema "
                }
            } catch (e) {
                println("Error al enviar el mail: " + e)
                errores += e
            }

            if (errores == '') {
                render "ok"
            } else {
                render "no"
            }
        }
    }

    def negarAnuncio_ajax() {

        def personaNiega = Persona.get(session.usuario.id)

        def anuncio = Anuncio.get(params.id)
        def producto = anuncio.producto

        anuncio.estado = 'N'
        anuncio.persona = personaNiega
        anuncio.fechaAprobacion = new Date()

        if (!anuncio.save(flush: true)) {
            println("error al negar el anuncio " + anuncio.errors)
            render "no"
        } else {
            producto.estado = 'N'
            producto.save(flush: true)
            render "ok"
        }
    }

    def list() {
        def anuncios = Anuncio.findAllByEstado('R')
        return [anuncios: anuncios]
    }

    def tablaAnuncios_ajax() {
        def anuncios = Anuncio.findAllByEstado('A').sort { it.id }
        return [anuncios: anuncios]
    }

    def cambiarEstado_ajax() {
        def anuncio = Anuncio.get(params.id)
        def producto = anuncio.producto
        def estadoActual = anuncio.estado

        if (estadoActual == '1') {
            anuncio.estado = 0
        } else {
            anuncio.estado = 1
        }

        if (!anuncio.save(flush: true)) {
            println("error al guardar el estado del anuncio " + anuncio.errors)
            render "no"
        } else {

            def publicacion = Publicacion.findByAnuncioAndFechaFinIsNull(anuncio)

            if (publicacion) {
                publicacion.fechaFin = new Date()
                publicacion.save(flush: true)
            }

            def publicaciones = Publicacion.findAllByAnuncio(anuncio)
            def ultimaPublicacion = publicaciones ? publicaciones.last() : null

            if (estadoActual == '1') {
                if (ultimaPublicacion) {
                    ultimaPublicacion.fechaFin = new Date()
                    ultimaPublicacion.save(flush: true)
                }

            }

            producto.estado = 'I'
            producto.save(flush: true)

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
        response.with {
            setHeader('Content-length', imageInBytes.length.toString())
            contentType = "image/${params.format}" // or the appropriate image content type
            outputStream << imageInBytes
            outputStream.flush()
        }
    }

    byte[] im(nombre, ext, anuncio) {
        ByteArrayOutputStream baos = new ByteArrayOutputStream()
        ImageIO.write(ImageIO.read(new File("/var/ventas/anuncios/anun_" + anuncio + "/" + nombre + "." + ext)), ext.toString(), baos)
        baos.toByteArray()
    }

    def revisados() {
    }

    def negados() {
        def anuncios = Anuncio.findAllByEstado('N')
        return [anuncios: anuncios]
    }

    def revisarPago_ajax() {
        def anuncio = Anuncio.get(params.id)
        println "revisarPago_ajax: $params, --> ${anuncio?.id}"

        def path = "/var/ventas/pagos/pro_" + anuncio.producto.id + "/" + anuncio.id + "/"
        new File(path).mkdirs()

        def files = []

        def dir = new File(path)
        dir.eachFileRecurse(FileType.FILES) { file ->
            def img = ImageIO.read(file)
            if (img) {
                files.add([
                        dir : path,
                        file: file.name,
                        w   : 400,
                        h   : 500,
                ])
            }
        }

        return [imagenes: files, producto: anuncio.producto]


    }

    def anuncio() {
        println "anuncio params: $params"
        def cn = dbConnectionService.getConnection()
        def persona = Persona.get(session.usuario.id)
        persona.mailContacto = params.mail
        persona.contacto = params.contacto
        persona.telefonoContacto = params.telefono
        if (!persona.save(flush: true)) {
            println("error al guardar la información de contacto " + persona.errors)
            render "no"
        } else {
            def tppg = TipoPago.get(params.pago.toInteger())

            def destacados = []
            def campos = "prod.prod__id, prodtitl, prodsbtl, prodtxto, " +
                    "provnmbr||' - '||cntnnmbr lugar, prod.cntn__id, prod.sbct__id, imagruta "

            def sql = "select ${campos} from prod, cntn, prov, imag " +
                    "where prod.prod__id = ${params.id} and cntn.cntn__id = prod.cntn__id and " +
                    "prov.prov__id = cntn.prov__id and imag.prod__id = prod.prod__id and imagpncp = '1'"

            println "sql: $sql"
            def anuncios = cn.rows(sql.toString())
            println "anuncios: ${anuncios.size()}"

            anuncios.each { pb ->
                def ls = [tp: 'p', rt: pb.imagruta, p: pb.prod__id, tt: pb.prodtitl,
                          sb: pb.prodsbtl, t: pb.prodtxto, id: 0,
                          gf: ((pb.cntn__id == 226) ? 'Ecuador' : pb.lugar)]
                destacados.add(ls)
            }
            println "destacados: ${destacados.rt}"

            return [prod: destacados[0], fcha: params.fecha, dias: tppg.dias]
        }
    }

    /* debe llegar el id del producto */

    def editar() {
        def cn = dbConnectionService.getConnection()
        println "carrusel editar: $params"
        def producto
        def anuncio
        if (params.anun) {
            anuncio = Anuncio.get(params.anun)
            producto = anuncio.producto
        } else {
            producto = Producto.get(params.id)
//            anuncio = Anuncio.findAllByProducto(producto, [sort: 'fecha', order: 'desc'])?.first()
        }
        def sql = "select provnmbr||' - '||cntnnmbr lugar, prod.cntn__id from prod, cntn, prov " +
                "where cntn.cntn__id = prod.cntn__id and prov.prov__id = cntn.prov__id and prod__id = ${producto.id}"
        def prod = cn.rows(sql.toString())[0]
        def lugar = (prod.cntn__id == 226) ? 'Ecuador' : prod.lugar

        def atrb = Valores.findAllByProducto(producto)
        def preguntas = Pregunta.findAllByProducto(producto).sort { it.fecha }
        def carrusel = []

        def imag = Imagen.findAllByProducto(producto, [sort: 'principal', order: 'desc'])
        imag.each { im ->
            carrusel.add([ruta: "/var/ventas/productos/pro_${producto.id}/${im.ruta}"])
        }

        if (params.tipo == '3' && anuncio?.estado != 'A') {
            redirect(controller: 'principal', action: 'error');
        }
        return [carrusel : carrusel, producto: producto, atributos: atrb, tipo: params.tipo,
                preguntas: preguntas, lugar: lugar, anuncio: anuncio]
    }

    /*
    * insertar en PUBL: prod__id, prodfcha, prodtitl, prodsbtt, prodtxto, prodlong, prodlatt
    * En DTPB: Imágenes: {dtpbtipo = 'I', dtpbdscr = imagtxto, dtpbvlor = imagruta }
    *          Valores:  {dtpbtipo = 'V', dtpbdscr = atvldscr, dtpbvlor = atvlvlor }
    * Si hay una publicación activa, se la da de baja: publetdo = 'B' el nuevo queda como 'A' **/
    def publicar_ajax(){
        println "publicar_ajax: $params"
        def cn = dbConnectionService.getConnection()
        def prod = Producto.get(params.producto)
        def obsr = ""
        def fcha = new Date().format('yyyy-MM-dd HH:mm:ss')
        def fcin = new Date().parse('dd-MM-yyyy HH:mm:ss', params.fcha + " 00:00:00")
        def fcfn = new Date().parse("dd-MM-yyyy HH:mm:ss", (fcin + (params.dias.toInteger() - 1)).format('dd-MM-yyyy') + " 23:59:00")
        def tx_fcin = fcin.format('yyyy-MM-dd HH:mm:ss')
        def tx_fcfn = fcfn.format('yyyy-MM-dd HH:mm:ss')

        def sql = "update publ set publetdo = 'B' where prod__id = ${params.producto} and publetdo = 'A' " +
                "returning publfcha"
        println "sql: $sql"
        def publfcha = cn.rows(sql.toString())[0]?.publfcha

        /* si  existió una publicación OBSR: 'Producto modificado */
        sql = "insert into publ(prod__id, publfcha, publfcin, publfcfn, publdstc, publtitl, publsbtl, " +
                "publtxto, publlong, publlatt, publetdo, sbct__id, cntn__id, publobsr) select " +
                "${params.producto}, '${fcha}', '${tx_fcin}', '${tx_fcfn}', '${params.dstc}', prodtitl, prodsbtl, " +
                "prodtxto, prodlong, prodlatt, 'A', sbct__id, cntn__id"
        if(publfcha) {
            sql += ",'Publicado anteriormente el ${publfcha.format('yyyy-MM-dd HH:mm:ss')}' " +
                    "from prod where prod__id = ${params.producto} returning publ__id"
        } else {
            sql += ",null from prod where prod__id = ${params.producto} returning publ__id"
        }
        println "sql: $sql"
        def publ__id = cn.rows(sql.toString())[0].publ__id

        sql = "insert into dtpb(publ__id, dtpbtipo, dtpbdscr, dtpbvlor, dtpbpncp) " +
                "select ${publ__id}, 'I', imagtxto, imagruta, imagpncp " +
                "from imag where prod__id = ${params.producto} returning dtpb__id"

        println "sql: $sql"
        def dtpbimag = cn.rows(sql.toString()).size()

        sql = "insert into dtpb(publ__id, dtpbtipo, dtpbdscr, dtpbvlor) " +
                "select ${publ__id}, 'V', atrbdscr, atvlvlor from atrb, atct, atvl " +
                "where prod__id = ${params.producto} and atct.atct__id = atvl.atct__id and " +
                "atrb.atrb__id = atct.atrb__id returning dtpb__id"

        def dtpbvlor = cn.rows(sql.toString()).size()

        render("<h3>Publicación Existosa</h3><br>Del anuncio:<br><br><h6>${prod.titulo}</h6><br>" +
                "Con ${dtpbimag} imágenes y ${dtpbvlor} atributos")

    }


}
