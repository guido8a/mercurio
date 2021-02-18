<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 17/02/21
  Time: 16:06
--%>

<g:if test="${!producto}">
    No se encontró el producto
</g:if>
<g:else>
    <div class="media">
            <div class="row">
                <div class="col-md-3 text-info">
                    Anuncio:
                </div>

                <div class="col-md-9">
                    ${producto?.anuncio?.nombre}
                </div>

            </div>

        <g:if test="${producto?.orden}">
            <div class="row">
                <div class="col-md-3 text-info">
                    Orden:
                </div>

                <div class="col-md-9">
                    ${producto?.orden}
                </div>
            </div>
        </g:if>

        <g:if test="${producto?.titulo}">
            <div class="row">
                <div class="col-md-3 text-info">
                    Título:
                </div>

                <div class="col-md-9">
                    ${producto?.titulo}
                </div>
            </div>
        </g:if>

        <g:if test="${producto?.subtitulo}">
            <div class="row">
                <div class="col-md-3 text-info">
                    Subtítulo:
                </div>

                <div class="col-md-9">
                    ${producto?.subtitulo}
                </div>
            </div>
        </g:if>

        <g:if test="${producto?.estado}">
            <div class="row">
                <div class="col-md-3 text-info">
                    Estado:
                </div>

                <div class="col-md-9">
                    ${producto?.estado == '1' ? 'Activo' : 'Inactivo'}
                </div>
            </div>
        </g:if>

        <g:if test="${producto?.texto}">
            <div class="row">
                <div class="col-md-3 text-info">
                    Texto:
                </div>

                <div class="col-md-9">
                    <div class=""  style="width: 99.7%;height: 350px; overflow-y: auto; margin-top: -20px">
                        <table class="table-bordered table-condensed table-hover" width="100%">
                            <tbody id="tabla_txt">

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </g:if>
    </div>
</g:else>