package ventas

import groovy.io.FileType
import seguridad.Persona

import javax.imageio.ImageIO

class AdminController {

    def dbConnectionService
    def buscadorService

    def index() {
        params.ordenar = "anunfcha"
        def cn = dbConnectionService.getConnection()
        def sql = "select sbct__id id, sbctdscr descripcion from sbct, ctgr where ctgr.ctgr__id = sbct.ctgr__id and " +
                "sbct__id in (select sbct__id from prod) order by ctgrordn, sbctordn"
        def categoria = cn.rows(sql.toString())
        categoria.add([id:0, descripcion: 'Todas...'])
        def estados = ['A': 'Aprobados', 'R': 'En Revisión', 'N': 'Negados', 'I': 'Inactivos', 'T': 'Todos']

        println "actual: ${params}"
        return[actual: params.actual, estados: estados, categoria: categoria]
    }

    def tablaBuscar() {
        println "buscar .... $params"
        def cn = dbConnectionService.getConnection()
        params.old = params.criterio
        params.criterio = buscadorService.limpiaCriterio(params.criterio)
        params.ordenar  = buscadorService.limpiaCriterio(params.ordenar)

        def sql = armaSql(params)
        params.criterio = params.old
        println "sql: $sql"
        def data = cn.rows(sql.toString())

        def msg = ""
        if(data?.size() > 50){
            data.pop()   //descarta el último puesto que son 21
            msg = "<div class='alert-danger' style='margin-top:-20px; diplay:block; height:25px;margin-bottom: 20px;'>" +
                    " <i class='fa fa-warning fa-2x pull-left'></i> Su búsqueda ha generado más de 50 resultados. " +
                    "Use más letras para especificar mejor la búsqueda.</div>"
        }
        cn.close()

        return [data: data, msg: msg]
    }

    def armaSql(params){
//        println "armaSql: $params"
        def campos = buscadorService.parmAnuncios()
        def operador = buscadorService.operadores()
//        def wh = " edif.edif__id = prsn.edif__id and tpoc.tpoc__id = prsn.tpoc__id and prsnactv = 1 " //condicion fija

        def sqlSelect = "select * from admnanun() "

        //condicion fija
        def wh = " prsn__id is not null "
        def sqlWhere = "where ${wh}"

        def sqlOrder = "order by ${params.ordenar} limit 51"

//        println "sql: $sqlSelect $sqlWhere $sqlOrder"
//        if(params.criterio) {
        if(params.operador && params.criterio) {
            if(campos.find {it.campo == params.buscador}?.size() > 0) {
                def op = operador.find {it.valor == params.operador}
                sqlWhere += " and ${params.buscador} ${op.operador} ${op.strInicio}${params.criterio}${op.strFin}";
            }
        }
        if(params.ctgr != '0') {
            sqlWhere += " and sbct__id = '${params.ctgr}' ";
        }
        if(params.etdo != 'T') {
            sqlWhere += " and anunetdo = '${params.etdo}' ";
        }
//        println "-->sql: $sqlSelect $sqlWhere $sqlOrder"
        "$sqlSelect $sqlWhere $sqlOrder".toString()
    }



}
