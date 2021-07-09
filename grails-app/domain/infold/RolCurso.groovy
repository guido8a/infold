package infold

class RolCurso {

    Funcion funcion
    Participante participante
    Dicta dicta
    Date fecha

    static mapping = {
        table 'rlcr'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'rlcr__id'
        id generator: 'identity'
        version false
        columns {
            id column: 'rlcr__id'
            funcion column: 'func__id'
            participante column: 'prtc__id'
            dicta column: 'dcta__id'
            fecha column: 'rlcrfcha'
        }
    }
    static constraints = {
        funcion(blank: false, nullable: false, attributes: [title: 'función'])
        participante(blank: false, nullable: false, attributes: [title: 'participante'])
        dicta(blank: false, nullable: false, attributes: [title: 'dicta'])
        fecha(blank: true, nullable: true, attributes: [title: 'fecha'])
    }
}
