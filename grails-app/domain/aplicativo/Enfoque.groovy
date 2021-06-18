package aplicativo

class Enfoque {

    String descripcion

    static mapping = {
        table 'enfq'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'enfq__id'
        id generator: 'identity'
        version false
        columns {
            id column: 'enfq__id'
            descripcion column: 'enfqdscr'
        }
    }
    static constraints = {
        descripcion(size: 1..127, blank: false, nullable: false, attributes: [title: 'descripcion'])
    }
}
