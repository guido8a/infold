package infold

class AdmnParticipanteController {

    def dbConnectionService
    def buscadorService

    def index() {
        params.ordenar = "anunfcha"
        def cn = dbConnectionService.getConnection()
        def sql = "select artb__id id, artbdscr descripcion from artb where artb__id in " +
                "(select artb__id from prtc where prtctipo = '1') order by artbdscr"
        println "sql: $sql"
        def areas = cn.rows(sql.toString())
        areas.add([id:0, descripcion: 'Todas...'])
        areas = areas.sort{it.id}
        def niveles = NivelEducacion.list()
        niveles.add([id:0, descripcion: 'Todos...'])
        niveles = niveles.sort{it.id}

        println "actual: ${params}"
        return[actual: params.actual, areas: areas, niveles: niveles]
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
        def campos = buscadorService.parmInstructor()
        def operador = buscadorService.operadores()
//        def wh = " edif.edif__id = prsn.edif__id and tpoc.tpoc__id = prsn.tpoc__id and prsnactv = 1 " //condicion fija

        def sqlSelect = "select * from instructor() "

        //condicion fija
        def wh = " prtc__id is not null "
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
        if(params.area != '0') {
            sqlWhere += " and artb__id = ${params.area} "
        }
        if(params.nvel != '0') {
            sqlWhere += " and nved__id = ${params.nvel} "
        }
//        println "-->sql: $sqlSelect $sqlWhere $sqlOrder"
        "$sqlSelect $sqlWhere $sqlOrder".toString()
    }

}
