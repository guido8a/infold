package infold

class Funcion {

    String descripcion

    static mapping = {
        table 'func'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'func__id'
        id generator: 'identity'
        version false
        columns {
            id column: 'func__id'
            descripcion column: 'funcdscr'
        }
    }
    static constraints = {
        descripcion(size: 1..63, blank: false, nullable: false, attributes: [title: 'descripcion'])
    }
}
