package ventas

import seguridad.Persona

class VerController {

    def mailService
    def dbConnectionService

    /* debe llegar el id del producto */
    def carrusel() {
        def cn = dbConnectionService.getConnection()
        println "carrusel params: $params"
        def producto
        def anuncio
        if(params.anun) {
            anuncio = Anuncio.get(params.anun)
            producto = anuncio.producto
        } else {
            producto = Producto.get(params.id)
//            anuncio = Anuncio.findAllByProducto(producto, [sort: 'fecha', order: 'desc'])?.first()
        }
        def sql = "select provnmbr||' - '||cntnnmbr lugar, prod.cntn__id from prod, cntn, prov " +
                "where cntn.cntn__id = prod.cntn__id and prov.prov__id = cntn.prov__id and prod__id = ${producto.id}"
        def prod = cn.rows(sql.toString())[0]
        def lugar = (prod.cntn__id == 226)? 'Ecuador' : prod.lugar

        def atrb = Valores.findAllByProducto(producto)
        def preguntas = Pregunta.findAllByProducto(producto).sort{it.fecha}
        def carrusel = []

        def imag = Imagen.findAllByProducto(producto, [sort: 'principal', order: 'desc'])
        imag.each { im ->
            carrusel.add([ruta: "/var/ventas/productos/pro_${producto.id}/${im.ruta}"])
        }

        if(params.tipo == '3' && anuncio?.estado != 'A'){
            redirect(controller: 'principal', action: 'error');
        }
        return [carrusel: carrusel, producto: producto, atributos: atrb, tipo: params.tipo,
                preguntas: preguntas, lugar: lugar, anuncio: anuncio]
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
