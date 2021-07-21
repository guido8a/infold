package infold

class Dicta {

    Curso curso
    Date fechaInicio
    Date fechaFin
    String nombre
    Date fechaMatricula
    Date fechaCierre

    static mapping = {
        table 'dcta'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'dcta__id'
        id generator: 'identity'
        version false
        columns {
            id column: 'dcta__id'
            curso column: 'crso__id'
            fechaInicio column: 'dctafcin'
            fechaFin column: 'dctafcfn'
            nombre column: 'dctanmbr'
            fechaMatricula column: 'dctafcma'
            fechaCierre column: 'dctafcci'
        }
    }
    static constraints = {
        nombre(size: 1..127, blank: false, nullable: false, attributes: [title: 'nombre'])
        curso(blank: false, nullable: false, attributes: [title: 'curso'])
        fechaInicio(blank: false, nullable: false, attributes: [title: 'Fecha Inicio'])
        fechaFin(blank: true, nullable: true, attributes: [title: 'Fecha Fin'])
        fechaMatricula(blank: true, nullable: true, attributes: [title: 'Fecha Matricula'])
        fechaCierre(blank: true, nullable: true, attributes: [title: 'Fecha Cierre'])
    }
}
