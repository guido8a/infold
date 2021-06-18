package aplicativo

class DesarrolloPersona {

    Participante participante
    DesarrolloCapacidades desarrolloCapacidades

    static mapping = {
        table 'dcpr'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'dcpr__id'
        id generator: 'identity'
        version false
        columns {
            id column: 'dcpr__id'
            participante column: 'prtc__id'
            desarrolloCapacidades column: 'dscp__id'
        }
    }
    static constraints = {
        participante(blank: false, nullable: false, attributes: [title: 'participante'])
        desarrolloCapacidades(blank: false, nullable: false, attributes: [title: 'desarrollo'])
    }
}
