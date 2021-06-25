package infold

class AreaTrabajo {

    String descripcion

    static mapping = {
        table 'artb'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'artb__id'
        id generator: 'identity'
        version false
        columns {
            id column: 'artb__id'
            descripcion column: 'artbdscr'
        }
    }
    static constraints = {
        descripcion(blank: false, nullable: false, attributes: [title: 'descripcion'])
    }
}
