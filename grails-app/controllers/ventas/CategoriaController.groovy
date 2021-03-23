package ventas

class CategoriaController {

    def list(){
        def categorias = Categoria.list().sort{it.orden}
        return[categorias: categorias]
    }

    def form_ajax(){

        def categoria

        if(params.id){
            categoria = Categoria.get(params.id)
        }else{
            categoria = new Categoria()
        }

        return[categoria:categoria]
    }

    def saveCategoria(){

//        println("params " + params)

        def categoria

        if(params.id){
            categoria = Categoria.get(params.id)
        }else{
            categoria = new Categoria()
        }

        categoria.properties = params

        if(!categoria.save(flush:true)){
            println("error al guardar la categoria " + categoria.errors)
            render "no"
        }else{
            render "ok"
        }
    }

    def delete_ajax(){

        def categoria = Categoria.get(params.id)

        try{
            categoria.delete(flush:true)
            render "ok"
        }catch(e){
            println("error al borrar la categoria " + categoria.errors)
            render "no"
        }
    }

    def arbol() {

    }

    def loadTreePart() {
        render(makeTreeNode(params))
    }

    def makeTreeNode(params) {
        def actv = params.actv == 'true'
        def id = params.id
        if (!params.sort) {
            params.sort = "apellido"
        }
        if (!params.order) {
            params.order = "asc"
        }
        String tree = "", clase = "", rel = ""
        def padre
        def hijos = []

        if (id == "#") {
            //root
            def hh = Categoria.count()
            if (hh > 0) {
                clase = "hasChildren jstree-closed"
            }

            tree = "<li id='root' class='root ${clase}' data-jstree='{\"type\":\"root\"}' level='0' >" +
                    "<a href='#' class='label_arbol'>Categorías</a>" +
                    "</li>"
            if (clase == "") {
                tree = ""
            }
        } else if (id == "root") {
            hijos = Categoria.list().sort{it.descripcion}
        } else {
            def parts = id.split("_")
            def node_id = parts[1].toLong()
            padre = Categoria.get(node_id)
            if (padre) {
                hijos = []
                hijos += Subcategoria.findAllByCategoria(padre).sort{it.descripcion}
            }
        }

        if (tree == "" && (padre || hijos.size() > 0)) {
            tree += "<ul>"
            def lbl = ""

            hijos.each { hijo ->
                def tp = ""
                def data = ""
                if (hijo instanceof Categoria) {
                    lbl = hijo.descripcion
//                    if (hijo.id) {
//                        lbl += " (${hijo.id})"
//                    }
                    tp = "dep"
                    def hijosH = Subcategoria.findAllByCategoria(hijo, [sort: "descripcion"])
                    data = "data-tramites='-1'"

//                    rel = (hijosH.size() > 0) ? "padre" : "hijo"
                    hijosH += Subcategoria.findAllByCategoria(hijo, [sort: "descripcion"])

                    clase = (hijosH.size() > 0) ? "jstree-closed hasChildren" : ""
                    if (hijosH.size() > 0) {
                        clase += " catego"
                        data += "data-tienehij='${hijosH.size()}'"
                    }
                    rel = "catego"

                } else if (hijo instanceof Subcategoria) {

                    tp = "usu"
                    rel = "subcatego"
                    clase = "subcatego"
                    lbl = hijo.descripcion

                }

                tree += "<li id='li${tp}_" + hijo.id + "' class='" + clase + "' ${data} data-jstree='{\"type\":\"${rel}\"}' >"
                tree += "<a href='#' class='label_arbol'>" + lbl + "</a>"
                tree += "</li>"
            }
            tree += "</ul>"
        }
        return tree
    }

}
