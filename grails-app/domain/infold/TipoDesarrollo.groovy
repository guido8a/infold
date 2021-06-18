package infold

class TipoDesarrollo {

    String descripcion
    int orden

    static mapping = {
        table 'tpds'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'tpds__id'
        id generator: 'identity'
        version false
        columns {
            id column: 'tpds__id'
            descripcion column: 'tpdsdscr'
        }
    }
    static constraints = {
        descripcion(size: 1..63, blank: false, nullable: false, attributes: [title: 'descripcion'])
        orden(blank: true, nullable: true, attributes: [title: 'orden'])
    }
}
