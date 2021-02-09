<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 09/02/21
  Time: 12:58
--%>

<g:if test="${!promotor}">
    No se encontró promotor
</g:if>
<g:else>
    <div class="media">
        <g:if test="${promotor?.canton}">
            <div class="row">
                <div class="col-md-3 text-info">
                    Provincia:
                </div>

                <div class="col-md-9">
                    ${promotor?.canton?.provincia?.nombre}
                </div>

            </div>
            <div class="row">
                <div class="col-md-3 text-info">
                    Cantón:
                </div>

                <div class="col-md-9">
                    ${promotor?.canton?.nombre}
                </div>

            </div>
        </g:if>

        <g:if test="${promotor?.tipo}">
            <div class="row">
                <div class="col-md-3 text-info">
                    Tipo:
                </div>

                <div class="col-md-9">
                    ${promotor?.tipo == '1' ? 'Jurídico' : 'Natural'}
                </div>

            </div>
        </g:if>

        <g:if test="${promotor?.nombre}">
            <div class="row">
                <div class="col-md-3 text-info">
                    Nombre:
                </div>

                <div class="col-md-9">
                    ${promotor?.nombre}
                </div>

            </div>
        </g:if>

        <g:if test="${promotor?.apellido}">
            <div class="row">
                <div class="col-md-3 text-info">
                    Apellido:
                </div>

                <div class="col-md-9">
                    ${promotor?.apellido}
                </div>

            </div>
        </g:if>

        <g:if test="${promotor?.ruc}">
            <div class="row">
                <div class="col-md-3 text-info">
                    RUC:
                </div>

                <div class="col-md-9">
                    ${promotor?.ruc}
                </div>

            </div>
        </g:if>

        <g:if test="${promotor?.telefono}">
            <div class="row">
                <div class="col-md-3 text-info">
                    Teléfono:
                </div>

                <div class="col-md-9">
                    ${promotor?.telefono}
                </div>

            </div>
        </g:if>

        <g:if test="${promotor?.mail}">
            <div class="row">
                <div class="col-md-3 text-info">
                    Email:
                </div>

                <div class="col-md-9">
                    ${promotor?.mail}
                </div>

            </div>
        </g:if>

        <g:if test="${promotor?.fecha}">
            <div class="row">
                <div class="col-md-3 text-info">
                    Fecha de registro:
                </div>

                <div class="col-md-9">
                    ${promotor?.fecha?.format("dd-MM-yyyy")}
                </div>

            </div>
        </g:if>

        <g:if test="${promotor?.direccion}">
            <div class="row">
                <div class="col-md-3 text-info">
                    Dirección:
                </div>

                <div class="col-md-9">
                    ${promotor?.direccion}
                </div>

            </div>
        </g:if>

        <g:if test="${promotor?.observaciones}">
            <div class="row">
                <div class="col-md-3 text-info">
                    Observaciones:
                </div>

                <div class="col-md-9">
                    ${promotor?.observaciones}
                </div>

            </div>
        </g:if>

        <g:if test="${promotor?.estado}">
            <div class="row">
                <div class="col-md-3 text-info">
                    Estado:
                </div>

                <div class="col-md-9">
                    ${promotor?.estado == '1' ? 'Activo' : 'Inactivo'}
                </div>

            </div>
        </g:if>
    </div>
</g:else>