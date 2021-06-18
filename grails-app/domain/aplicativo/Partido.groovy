package aplicativo

class Partido {

    String descripcion
    int lista
    String sigla

    static mapping = {
        table 'part'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'part__id'
        id generator: 'identity'
        version false
        columns {
            id column: 'part__id'
            descripcion column: 'partdscr'
            lista column: 'partlsta'
            sigla column: 'partsgla'
        }
    }
    static constraints = {
        descripcion(size: 1..255, blank: false, nullable: false, attributes: [title: 'descripcion'])
        sigla(size: 1..8, blank: false, nullable: false, attributes: [title: 'sigla'])
        lista(blank: false, nullable: false, attributes: [title: 'lista'])
    }
}
