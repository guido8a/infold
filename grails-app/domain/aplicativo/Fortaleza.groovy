package aplicativo

class Fortaleza {

    String descripcion
    int orden

    static mapping = {
        table 'frtl'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'frtl__id'
        id generator: 'identity'
        version false
        columns {
            id column: 'frtl__id'
            descripcion column: 'frtldscr'
            orden column: 'frtlordn'
        }
    }
    static constraints = {
        descripcion(size: 1..255, blank: false, nullable: false, attributes: [title: 'descripcion'])
        orden(blank: false, nullable: false, attributes: [title: 'orden'])
    }
}
