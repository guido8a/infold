package infold

class AreasPersona {

    Participante participante
    Areas areas

    static mapping = {
        table 'arpr'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'arpr__id'
        id generator: 'identity'
        version false
        columns {
            id column: 'arpr__id'
            participante column: 'prtc__id'
            areas column: 'area__id'
        }
    }
    static constraints = {
        participante(blank: false, nullable: false, attributes: [title: 'participante'])
        areas(blank: false, nullable: false, attributes: [title: 'desarrollo'])
    }
}
