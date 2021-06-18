package aplicativo

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
    String mail
    String login
    String password
    int activo
    String telefono
    String genero
    String estado
    String organizacionSocial
    String movimientoPolitico
    String hojaVida
    String resumenTrabajo
    String completado
    String area

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
            nombre column: 'prtcnmbr'
            cedula column: 'prtccdla'
            apellido column: 'prtcapll'
            fechaInicio column: 'prtcfcin'
            fechaFin column: 'prtcfcfn'
            mail column: 'prtcmail'
            login column: 'prtclogn'
            password column: 'prtcpass'
            activo column: 'prtcactv'
            telefono column: 'prtctelf'
            genero column: 'prtcsexo'
            estado column: 'prtcestd'
            organizacionSocial column: 'prtcorsc'
            movimientoPolitico column: 'prtcmvpl'
            hojaVida column: 'prtchjvd'
            resumenTrabajo column: 'prtctrbj'
            completado column: 'prtccmpl'
            area column: 'prtcarea'
        }
    }
    static constraints = {
        tipo(blank: false, nullable: false, attributes: [title: 'tipo'])
        nombre(size: 1..31, blank: false, nullable: false, attributes: [title: 'nombre'])
        cedula(size: 1..13, blank: false, nullable: false, attributes: [title: 'cedula'])
        apellido(size: 1..31, blank: false, nullable: false, attributes: [title: 'apellido'])
        fechaInicio(blank: true, nullable: true, attributes: [title: 'fechaInicio'])
        fechaFin(blank: true, nullable: true, attributes: [title: 'fechaFin'])
        mail(size: 0..63, blank: true, nullable: true, attributes: [title: 'mail'])
        login(size: 0..15,blank: true, nullable: true, attributes: [title: 'login'])
        password(size: 0..63,blank: true, nullable: true, attributes: [title: 'password'])
        activo(blank: true, nullable: true, attributes: [title: 'activo'])
        telefono(size: 0..31,blank: true, nullable: true, attributes: [title: 'telefono'])
        sexo(blank: true, nullable: true, attributes: [title: 'sexo'])
        estado(blank: true, nullable: true, attributes: [title: 'estado'])
        organizacionSocial(size: 0..255,blank: true, nullable: true, attributes: [title: 'organizacionSocial'])
        movimientoPolitico(size: 0..255,blank: true, nullable: true, attributes: [title: 'movimientoPolitico'])
        hojaVida(size: 0..127,blank: true, nullable: true, attributes: [title: 'hojaVida'])
        resumenTrabajo(blank: true, nullable: true, attributes: [title: 'resumenTrabajo'])
        completado(blank: true, nullable: true, attributes: [title: 'completado'])
        area(size: 0..127,blank: true, nullable: true, attributes: [title: 'area'])
    }
}
