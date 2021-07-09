package infold

class Areas {

    Ejes ejes
    String descripcion
    int orden

    static mapping = {
        table 'area'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'area__id'
        id generator: 'identity'
        version false
        columns {
            id column: 'area__id'
            ejes column: 'ejes__id'
            descripcion column: 'areadscr'
            orden column: 'areaordn'
        }
    }
    static constraints = {
        descripcion(size: 1..255, blank: false, nullable: false, attributes: [title: 'descripcion'])
        orden(blank: true, nullable: true, attributes: [title: 'orden'])
    }
}
