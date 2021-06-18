package infold

class NivelEducacion {

    String descripcion

    static mapping = {
        table 'nved'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'nved__id'
        id generator: 'identity'
        version false
        columns {
            id column: 'nved__id'
            descripcion column: 'nveddscr'
        }
    }
    static constraints = {
        descripcion(size: 1..63, blank: false, nullable: false, attributes: [title: 'descripcion'])
    }

}
