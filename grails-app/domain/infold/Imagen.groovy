package infold

class Imagen {

    Institucion institucion
    String ruta
    String texto

    static mapping = {
        table 'imag'
        cache usage:'read-write', include:'non-lazy'
        version false
        id generator: 'identity'

        columns {
            id column: 'imag__id'
            institucion column: 'inst__id'
            ruta column: 'imagruta'
            texto column: 'imagtxto'
        }
    }

    static constraints = {
        ruta(blank:false,size:4..127)
        texto(blank: true, nullable: true)
    }
}
