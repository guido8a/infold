package infold

import geografia.Parroquia

class Participante {

    Parroquia parroquia
    AreaTrabajo areaTrabajo
    SectorEconomico sectorEconomico
    NivelEducacion nivelEducacion
    GrupoEtario grupoEtario
    Partido partido
    String tipo
    String cedula
    String nombre
    String apellido
    Date fechaInicio
    Date fechaFin
    Date fecha
    Date fechaModificacion
    String mail
    String login
    String password
    int activo
    String telefono
    String genero
    String organizacionSocial
    String movimientoPolitico
    String hojaVida
    String resumenTrabajo
    String completado
    String area
    String fortaleza1
    String fortaleza2
    String fortaleza3
    String estudia
    String carreraEstudia

    static mapping = {
        table 'prtc'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'prtc__id'
        id generator: 'identity'
        version false
        columns {
            id column: 'prtc__id'
            parroquia column: 'parr_id'
            areaTrabajo column: 'artb__id'
            sectorEconomico column: 'scec__id'
            nivelEducacion column: 'nved__id'
            grupoEtario column: 'gret__id'
            partido column: 'part__id'
            tipo column: 'prtctipo'
            cedula column: 'prtccdla'
            nombre column: 'prtcnmbr'
            apellido column: 'prtcapll'
            fechaInicio column: 'prtcfcin'
            fechaFin column: 'prtcfcfn'
            fecha column: 'prtcfcha'
            fechaModificacion column: 'prtcfcmd'
            mail column: 'prtcmail'
            login column: 'prtclogn'
            password column: 'prtcpass'
            activo column: 'prtcactv'
            telefono column: 'prtctelf'
            genero column: 'prtcsexo'
            estudia column: 'prtcestd'
            carreraEstudia column: 'prtcescr'
            organizacionSocial column: 'prtcorsc'
            movimientoPolitico column: 'prtcmvpl'
            hojaVida column: 'prtchjvd'
            resumenTrabajo column: 'prtctrbj'
            completado column: 'prtccmpl'
            area column: 'prtcarea'
            fortaleza1 column: 'prtcfr01'
            fortaleza2 column: 'prtcfr02'
            fortaleza3 column: 'prtcfr03'
        }
    }
    static constraints = {
        tipo(blank: false, nullable: false, attributes: [title: 'tipo'])
        nombre(size: 1..31, blank: false, nullable: false, attributes: [title: 'nombre'])
        cedula(size: 1..13, blank: false, nullable: false, attributes: [title: 'cedula'])
        apellido(size: 1..31, blank: false, nullable: false, attributes: [title: 'apellido'])
        fecha(blank: true, nullable: true, attributes: [title: 'fecha'])
        fechaModificacion(blank: true, nullable: true, attributes: [title: 'modificacion'])
        fechaInicio(blank: true, nullable: true, attributes: [title: 'fechaInicio'])
        fechaFin(blank: true, nullable: true, attributes: [title: 'fechaFin'])
        mail(size: 0..63, blank: true, nullable: true, attributes: [title: 'mail'])
        login(size: 0..15,blank: true, nullable: true, attributes: [title: 'login'])
        password(size: 0..63,blank: true, nullable: true, attributes: [title: 'password'])
        activo(blank: true, nullable: true, attributes: [title: 'activo'])
        telefono(size: 0..31,blank: true, nullable: true, attributes: [title: 'telefono'])
        genero(blank: true, nullable: true, attributes: [title: 'sexo'])
        estudia(blank: false, nullable: false)
        carreraEstudia(size: 0..255,blank: true, nullable: true)
        organizacionSocial(size: 0..255,blank: true, nullable: true, attributes: [title: 'organizacionSocial'])
        movimientoPolitico(size: 0..255,blank: true, nullable: true, attributes: [title: 'movimientoPolitico'])
        hojaVida(size: 0..127,blank: true, nullable: true, attributes: [title: 'hojaVida'])
        resumenTrabajo(blank: true, nullable: true, attributes: [title: 'resumenTrabajo'])
        completado(blank: true, nullable: true, attributes: [title: 'completado'])
        area(size: 0..127,blank: true, nullable: true, attributes: [title: 'area'])
        fortaleza1(size: 0..255,blank: false, nullable: false)
        fortaleza2(size: 0..255,blank: true, nullable: true)
        fortaleza3(size: 0..255,blank: true, nullable: true)
    }
}
