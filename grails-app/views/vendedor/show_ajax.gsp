<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 09/02/21
  Time: 15:41
--%>

<g:if test="${!vendedor}">
    No se encontró vendedor
</g:if>
<g:else>
    <div class="media">

        <g:if test="${vendedor?.promotor}">
            <div class="row">
                <div class="col-md-3 text-info">
                    Promotor:
                </div>

                <div class="col-md-9">
                    ${vendedor?.promotor?.nombre + (vendedor?.promotor?.apellido ? (' ' + vendedor?.promotor?.apellido) : '')}
                </div>

            </div>
        </g:if>

        <g:if test="${vendedor?.nombre}">
            <div class="row">
                <div class="col-md-3 text-info">
                    Nombre:
                </div>

                <div class="col-md-9">
                    ${vendedor?.nombre}
                </div>

            </div>
        </g:if>

        <g:if test="${vendedor?.apellido}">
            <div class="row">
                <div class="col-md-3 text-info">
                    Apellido:
                </div>

                <div class="col-md-9">
                    ${vendedor?.apellido}
                </div>

            </div>
        </g:if>


        <g:if test="${vendedor?.telefono}">
            <div class="row">
                <div class="col-md-3 text-info">
                    Teléfono:
                </div>

                <div class="col-md-9">
                    ${vendedor?.telefono}
                </div>

            </div>
        </g:if>

        <g:if test="${vendedor?.mail}">
            <div class="row">
                <div class="col-md-3 text-info">
                    Email:
                </div>

                <div class="col-md-9">
                    ${vendedor?.mail}
                </div>

            </div>
        </g:if>

        <g:if test="${vendedor?.fecha}">
            <div class="row">
                <div class="col-md-3 text-info">
                    Fecha de registro:
                </div>

                <div class="col-md-9">
                    ${vendedor?.fecha?.format("dd-MM-yyyy")}
                </div>

            </div>
        </g:if>


        <g:if test="${vendedor?.estado}">
            <div class="row">
                <div class="col-md-3 text-info">
                    Estado:
                </div>

                <div class="col-md-9">
                    ${vendedor?.estado == '1' ? 'Activo' : 'Inactivo'}
                </div>

            </div>
        </g:if>
    </div>
</g:else>