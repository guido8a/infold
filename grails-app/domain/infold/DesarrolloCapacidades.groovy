package infold

class DesarrolloCapacidades {

    TipoDesarrollo tipoDesarrollo
    String descripcion
    int orden

    static mapping = {
        table 'dscp'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'dscp__id'
        id generator: 'identity'
        version false
        columns {
            id column: 'dscp__id'
            tipoDesarrollo column: 'tpds__id'
            descripcion column: 'dscpdscr'
            orden column: 'dscpordn'
        }
    }
    static constraints = {
        descripcion(size: 1..255, blank: false, nullable: false, attributes: [title: 'descripcion'])
        orden(blank: true, nullable: true, attributes: [title: 'orden'])
    }
}
