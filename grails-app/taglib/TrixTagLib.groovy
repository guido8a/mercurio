class TrixTagLib {
    static namespace = 'trix'
    static defaultEncodeAs = [taglib: 'text']

    def editor = { attrs, body ->
        def id = attrs.id ?: attrs.name

        out << "<input id=\"${id}\" type=\"hidden\" name=\"${attrs.name}\""
        if ( attrs.value ) {
            out << " value=\"${attrs.value.encodeAsHTML()}\""
        }
        out << ' />'
        out << "<trix-editor input=\"${id}\" style='height:250px; overflow:auto'></trix-editor>"
    }
}
