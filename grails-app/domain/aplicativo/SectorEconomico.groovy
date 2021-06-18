package aplicativo

class SectorEconomico {

    String descripcion
    String codigo

    static mapping = {
        table 'scec'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'scec__id'
        id generator: 'identity'
        version false
        columns {
            id column: 'scec__id'
            codigo column: 'sceccdgo'
            descripcion column: 'escedscr'
        }
    }
    static constraints = {
        descripcion(size: 1..255, blank: false, nullable: false, attributes: [title: 'descripcion'])
        codigo(blank: false, nullable: false, attributes: [title: 'codigo'])
    }
}
