package aplicativo

class EnfoqueParticipante {

    Participante participante
    Enfoque enfoque

    static mapping = {
        table 'efpr'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'efpr__id'
        id generator: 'identity'
        version false
        columns {
            id column: 'efpr__id'
            participante column: 'prtc__id'
            enfoque column: 'enfq__id'
        }
    }
    static constraints = {
        participante(blank: false, nullable: false, attributes: [title: 'participante'])
        enfoque(blank: false, nullable: false, attributes: [title: 'enfoque'])
    }
}
