package infold

class Curso {

    Curso requisito
    String nombre
    String sigla
    String objetivo
    String descripcion
    String caracterizacion
    int numeroHorasDocente
    int numeroHorasPractica
    int numeroHorasAprendizajeAutonomo
    String metodologia

    static mapping = {
        table 'crso'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'crso__id'
        id generator: 'identity'
        version false
        columns {
            id column: 'crso__id'
            requisito column: 'crsorqst'
            descripcion column: 'crsodscr'
            nombre column: 'crsonmbr'
            sigla column: 'crsosgla'
            objetivo column: 'crsoobjt'
            caracterizacion column: 'crsocrct'
            numeroHorasDocente column: 'crsonhdc'
            numeroHorasPractica column: 'crsonhpt'
            numeroHorasAprendizajeAutonomo column: 'crsonhaa'
            metodologia column: 'crsometd'
        }
    }
    static constraints = {
        requisito(blank:true, nullable: true)
        nombre(size:1..127, blank: false, nullable: false, attributes: [title: 'nombre'])
        sigla(size:0..15, blank: true, nullable: true, attributes: [title: 'sigla'])
        objetivo(blank: true, nullable: true, attributes: [title: 'objetivo'])
        descripcion(blank: true, nullable: true, attributes: [title: 'descripción'])
        caracterizacion(blank: true, nullable: true, attributes: [title: 'caracterización'])
        metodologia(blank: true, nullable: true, attributes: [title: 'metodología'])
        numeroHorasDocente(blank: true, nullable: true, attributes: [title: 'Número Horas Docente'])
        numeroHorasPractica(blank: true, nullable: true, attributes: [title: 'Número Horas Práctica'])
        numeroHorasAprendizajeAutonomo(blank: true, nullable: true, attributes: [title: 'número Horas Aprendizaje Autónomo'])
    }
}
