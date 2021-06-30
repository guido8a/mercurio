package seguridad

class WardInterceptor {

    WardInterceptor () {
        matchAll().excludes(controller:'login')
                .excludes(controller:'shield')
                .excludes(controller:'principal')  /** principal **/
                .excludes(controller:'persona')  /** ventas **/
                .excludes(controller:'ver')  /** ventas **/
                .excludes(controller:'cliente')  /** cliente **/
                .excludes(controller:'shield')  /** cliente **/
    }

    boolean before() {
//        println "before acción: " + actionName + " controlador: " + controllerName + " params: $params"
//        println "usuario: ${session.usuario} , perfil: ${session?.perfil}"
        session.an = actionName
        session.cn = controllerName
        session.pr = params
        def usro
        if(session) {
            usro = session.usuario
        }

        if(session.an == 'saveTramite' && session.cn == 'tramite'){
            println("entro")
            return true
        } else {
            if (!session?.usuario && !session?.perfil) {
                if(controllerName != "inicio" && actionName != "index") {
                }
                render "<script type='text/javascript'> window.location.href = '/' </script>"
                session.finalize()
                return false
            } else {
                if (isAllowed()) {
                    return true
                } else {
                    if (grails.util.Environment.getCurrent().name == 'development') {
                        render "<script type='text/javascript'> window.location.href = '/shield/ataques' </script>"
                    } else {
                        render "<script type='text/javascript'> window.location.href = '/ventas/shield/ataques' </script>"
                    }
                }
            }
        }

        true
    }

    boolean after() {
//        println "+++++después"
        true
    }

    void afterView() {
//        println "+++++afterview"
        // no-op
    }


    boolean isAllowed() {
//        println "--> ${session?.permisos[controllerName?.toLowerCase()]} --> ${actionName}"
        try {
            if((request.method == "POST") || (actionName.toLowerCase() =~ 'ajax')) { /** es post no audit **/
                return true
            }
            if (!session.permisos[controllerName.toLowerCase()]) {
                println "Sin permisos todo el Controlador: '${controllerName}' Acción: '${actionName}'"
                return false
            } else {
                if (session.permisos[controllerName.toLowerCase()].contains(actionName.toLowerCase())) {
                    return true
                } else {
                    println "Sin permisos Controlador: '${controllerName}' Acción: '${actionName}'"
                    return false
                }
            }

        } catch (e) {
            println "Shield execption e: " + e
            redirect(controller: "shield", action: "ataques")
            return false
        }

//        return true

    }

}
