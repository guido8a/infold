package aplicativo

class GrupoEtario {

    String descripcion
    int desde
    int hasta

    static mapping = {
        table 'gret'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'gret__id'
        id generator: 'identity'
        version false
        columns {
            id column: 'gret__id'
            descripcion column: 'gretdscr'
            desde column: 'gretdsde'
            hasta column: 'grethsta'
        }
    }
    static constraints = {
        descripcion(size: 1..128, blank: false, nullable: false, attributes: [title: 'descripcion'])
        desde(blank: false, nullable: false, attributes: [title: 'desde'])
        hasta(blank: false, nullable: false, attributes: [title: 'hasta'])
    }
}
