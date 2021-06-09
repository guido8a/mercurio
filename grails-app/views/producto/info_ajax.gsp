<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 09/06/21
  Time: 12:23
--%>

<g:form class="form-horizontal" name="frmVer" role="form">
    <div class="form-group">
        <span class="grupo">
            <label class="col-md-2 control-label text-info">
                Titulo
            </label>
            <div class="col-md-9">
                ${producto?.titulo}
            </div>
        </span>
    </div>

    <div class="form-group">
        <span class="grupo">
            <label class="col-md-2 control-label text-info">
                Fecha Inicio Publicación
            </label>
            <div class="col-md-9">
                ${anuncio?.fechaInicio?.format("dd-MM-yyyy")}
            </div>
        </span>
    </div>

    <div class="form-group">
        <span class="grupo">
            <label class="col-md-2 control-label text-info">
                Fecha Fin Publicación
            </label>
            <div class="col-md-9">
                ${anuncio?.fechaFin?.format("dd-MM-yyyy")}
            </div>
        </span>
    </div>

    <div class="form-group">
        <span class="grupo">
            <label class="col-md-2 control-label text-info">
                Estado
            </label>
            <div class="col-md-9">
                ${producto?.estado == 'A' ? 'ACTIVO' : (producto?.estado == 'R' ? 'REVISIÓN' : 'INACTIVO')}
            </div>
        </span>
    </div>

</g:form>



