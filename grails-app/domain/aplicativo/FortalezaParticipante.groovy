package aplicativo

class FortalezaParticipante {

    Participante participante
    Fortaleza fortaleza

    static mapping = {
        table 'frpr'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'frpr__id'
        id generator: 'identity'
        version false
        columns {
            id column: 'frpr__id'
            participante column: 'prtc__id'
            fortaleza column: 'frtl__id'
        }
    }
    static constraints = {
        participante(blank: false, nullable: false, attributes: [title: 'participante'])
        fortaleza(blank: false, nullable: false, attributes: [title: 'fortaleza'])
    }
}
