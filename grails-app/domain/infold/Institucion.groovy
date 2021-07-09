package infold

import audita.Auditable
import seguridad.Sesn

class Institucion implements Auditable{

    String nombre
    String sigla
    String objetivo
    String descricpion
//    String ejesFormacion
    String vision
    String mision
    String mail
    String direccion
    String telefono
    Date modificacion


    static auditable = true

    static mapping = {
        table 'inst'
        cache usage: 'read-write', include: 'non-lazy'
        id generator: 'identity'
        version false

        columns {
            id column: 'inst__id'
            nombre column: 'instnmbr'
            sigla column: 'instsgla'
            objetivo column: 'instobjt'
            descricpion column: 'instdscr'
//            ejesFormacion column: 'instejfr'
            vision column: 'instvisn'
            mision column: 'instmisn'
            mail column: 'instmail'
            direccion column: 'instdire'
            telefono column: 'insttelf'
            modificacion column: 'instfcmd'
        }
    }
    static constraints = {
        nombre(size: 3..127, blank: false)
        sigla(size: 0..15, blank: true, nullable: true)
        objetivo(blank: true, nullable: true)
        descricpion(blank: true, nullable: true)
//        ejesFormacion(blank: true, nullable: true)
        vision(blank: true, nullable: true)
        mision(blank: true, nullable: true)
        mail(size: 3..255, blank: false, nullable: false)
        direccion(blank: true, nullable: true)
        telefono(blank: true, nullable: true)
        modificacion(blank: true, nullable: true)
    }

    String toString() {
        "${this.nombre} (${this.sigla})"
    }

}
