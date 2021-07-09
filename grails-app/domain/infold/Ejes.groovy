package infold

class Ejes {

    String descripcion
    int orden

    static mapping = {
        table 'ejes'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'ejes__id'
        id generator: 'identity'
        version false
        columns {
            id column: 'ejes__id'
            descripcion column: 'ejesdscr'
            orden column: 'ejesordn'
        }
    }
    static constraints = {
        descripcion(size: 1..127, blank: false, nullable: false, attributes: [title: 'descripcion'])
        orden(blank: true, nullable: true, attributes: [title: 'orden'])
    }

    @Override
    String toString() {
        "${this.descripcion}"
    }
}
