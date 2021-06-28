class TrixTagLib {
    static namespace = 'trix'
    static defaultEncodeAs = [taglib: 'text']

    def editor = { attrs, body ->
        def id = attrs.id ?: attrs.name
        def height = ""
        println "editor --> $attrs"
        out << "<input id=\"${id}\" type=\"hidden\" name=\"${attrs.name}\""
        if ( attrs.value ) {
            out << " value=\"${attrs.value.encodeAsHTML()}\""
        }
        if ( attrs.height ) {
            println ".. pone height a ${attrs.height.encodeAsHTML()}"
            height = " height=\"${attrs.height.encodeAsHTML()}\""
        }
        out << ' />'
        out << "<trix-editor input=\"${id}\" $height></trix-editor>"
    }
}
