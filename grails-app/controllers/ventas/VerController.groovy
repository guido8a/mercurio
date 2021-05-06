package ventas

import seguridad.Persona

class VerController {

    def mailService
    def dbConnectionService

    /* debe llegar el id del producto */
    def carrusel() {
        def cn = dbConnectionService.getConnection()
        println "index params: $params"

//        params.id = params.id?:1
        /** si el producto se puede ver --> avanza **/

        def producto = Producto.get(params.id)
        def anuncio = Anuncio.findByProducto(producto)
        def estadoAnuncio = anuncio?.estado ?: 0
        def persona = Persona.get(params.persona)
        def sql = "select provnmbr||' - '||cntnnmbr lugar, prod.cntn__id from prod, cntn, prov " +
                "where cntn.cntn__id = prod.cntn__id and prov.prov__id = cntn.prov__id and prod__id = ${params.id}"
        def prod = cn.rows(sql.toString())[0]
        println "prod: $prod"
        def lugar = (prod.cntn__id == 226)? 'Ecuador' : prod.lugar


        if(params.tipo == '3'){
            def existePublicacion = Publicacion.findAllByAnuncioAndFechaInicioIsNotNullAndFechaFinGreaterThanEquals(anuncio, new Date())?.size()

            if(existePublicacion){


                def atrb = Valores.findAllByProducto(producto)
                def carrusel = []

                def imag = Imagen.findAllByProducto(producto, [sort: 'principal', order: 'desc'])
//        println "imagen: ${imag}"
                imag.each { im ->
                    carrusel.add([ruta: "/var/ventas/productos/pro_${producto.id}/${im.ruta}"])
                }
//        println "carrusel: ${carrusel}"

                def publicaciones
                if(anuncio){
                    println("estado " + estadoAnuncio)
                    if(estadoAnuncio == '1'){
                        publicaciones = Publicacion.findAllByAnuncioAndFechaInicioIsNotNullAndFechaFinGreaterThanEquals(anuncio, new Date())?.size()
                    }else{
                        publicaciones = 0
                    }
                }else{
                    publicaciones = 0
                }

                def preguntas = Pregunta.findAllByProducto(producto).sort{it.fecha}

                println("publicaciones3 " + publicaciones)

                return [carrusel: carrusel, producto: producto, atributos: atrb, tipo: params.tipo, persona: persona,
                        publicaciones: publicaciones, preguntas: preguntas, lugar: lugar]
            }else{

                redirect(controller: 'principal', action: 'error');

            }
        }else{
            def atrb = Valores.findAllByProducto(producto)
            def carrusel = []

            def imag = Imagen.findAllByProducto(producto, [sort: 'principal', order: 'desc'])
//        println "imagen: ${imag}"
            imag.each { im ->
                carrusel.add([ruta: "/var/ventas/productos/pro_${producto.id}/${im.ruta}"])
            }
//        println "carrusel: ${carrusel}"

            def publicaciones
            if(anuncio){
                println("estado " + estadoAnuncio)
                if(estadoAnuncio == '1'){
                    publicaciones = Publicacion.findAllByAnuncioAndFechaInicioIsNotNullAndFechaFinGreaterThanEquals(anuncio, new Date())?.size()
                }else{
                    publicaciones = 0
                }
            }else{
                publicaciones = 0
            }

            def preguntas = Pregunta.findAllByProducto(producto).sort{it.fecha}

            println("publicaciones " + publicaciones)

            return [carrusel: carrusel, producto: producto, atributos: atrb, tipo: params.tipo, persona: persona,
                    publicaciones: publicaciones, preguntas: preguntas, lugar: lugar]
        }


//        def existePublicacion = Publicacion.findAllByAnuncioAndFechaInicioIsNotNullAndFechaFinGreaterThanEquals(anuncio, new Date())?.size()
//
//        if(existePublicacion){
//
//
//            def atrb = Valores.findAllByProducto(producto)
//            def carrusel = []
//
//            def imag = Imagen.findAllByProducto(producto, [sort: 'principal', order: 'desc'])
////        println "imagen: ${imag}"
//            imag.each { im ->
//                carrusel.add([ruta: "/var/ventas/productos/pro_${producto.id}/${im.ruta}"])
//            }
////        println "carrusel: ${carrusel}"
//
//
//            def publicaciones
//            if(anuncio){
//                println("estado " + estadoAnuncio)
//                if(estadoAnuncio == '1'){
//                    publicaciones = Publicacion.findAllByAnuncioAndFechaInicioIsNotNullAndFechaFinGreaterThanEquals(anuncio, new Date())?.size()
//                }else{
//                    publicaciones = 0
//                }
//            }else{
//                publicaciones = 0
//            }
//
//            def preguntas = Pregunta.findAllByProducto(producto).sort{it.fecha}
//
//            println("publicaciones " + publicaciones)
//
//            return [carrusel: carrusel, producto: producto, atributos: atrb, tipo: params.tipo, persona: persona,
//                    publicaciones: publicaciones, preguntas: preguntas]
//        }else{
//
//            redirect(controller: 'principal', action: 'error');
//
//        }
    }

    def preguntas_ajax(){
        def producto = Producto.get(params.id)
        def preguntas = Pregunta.findAllByProducto(producto)

        println("preguntas " +  preguntas)
        return[preguntas:preguntas]
    }

    def guardarPregunta_ajax(){

        def producto = Producto.get(params.id)
        def pregunta = new Pregunta()
        pregunta.producto = producto
        pregunta.texto = params.texto
        pregunta.fecha = new Date()

        if(!pregunta.save(flush:true)){
            println("error al guardar la pregunta" + pregunta.errors)
            render "no"
        }else{

            def mail = producto.persona.mailContacto
            def errores = ''

            try{
                mailService.sendMail {
                    to mail
                    subject "Pregunta sobre el producto: ${producto?.titulo}"
                    body "Ha recibido una pregunta referente a su producto: ${producto?.titulo} " +
                            "\n Pregunta: ${params.texto} " +
                            "\n Para responder a esta pregunta, porfavor ingrese al sistema"
                }
            }catch (e){
                println("Error al enviar el mail: " + e)
                errores += e
            }

            if(errores == ''){
                render  "ok"
            }else{
                render "no"
            }




        }

    }
}
