package infold

class Contenidos {

    Curso curso
    Areas areas
    int numero
    int numeroHorasDocente
    int numeroHorasPractica
    int numeroHorasAprendizajeAutonomo
    String metodologia
    String contenido

    static mapping = {
        table 'cntd'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'cntd__id'
        id generator: 'identity'
        version false
        columns {
            id column: 'cntd__id'
            curso column: 'crso__id'
            areas column: 'area__id'
            numero column: 'cntdnmro'
            numeroHorasDocente column: 'cntdnhdc'
            numeroHorasPractica column: 'cntdnhpt'
            numeroHorasAprendizajeAutonomo column: 'cntdnhaa'
            metodologia column: 'cntdmetd'
            contenido column: 'cntdcntd'
        }
    }
    static constraints = {
        curso(blank:true, nullable: true)
        areas(blank:true, nullable: true)
        numero(blank:true, nullable: true)
        contenido(blank: true, nullable: true, attributes: [title: 'caracterización'])
        metodologia(blank: true, nullable: true, attributes: [title: 'metodología'])
        numeroHorasDocente(blank: true, nullable: true, attributes: [title: 'Número Horas Docente'])
        numeroHorasPractica(blank: true, nullable: true, attributes: [title: 'Número Horas Práctica'])
        numeroHorasAprendizajeAutonomo(blank: true, nullable: true, attributes: [title: 'número Horas Aprendizaje Autónomo'])
    }
}
