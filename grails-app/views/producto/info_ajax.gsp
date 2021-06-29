<g:form class="form-horizontal" name="frmVer" role="form">
    <div class="form-group">
        <span class="grupo">
            <label class="col-md-4 control-label text-info">
                Categoría:
            </label>
            <div class="col-md-8">
                ${data?.ctgrdscr}
            </div>
        </span>
    </div>

    <div class="form-group">
        <span class="grupo">
            <label class="col-md-4 control-label text-info">
                Subcategoría:
            </label>
            <div class="col-md-8">
                ${data?.sbctdscr}
            </div>
        </span>
    </div>

    <div class="form-group">
        <span class="grupo">
            <label class="col-md-4 control-label text-info">
                Titulo
            </label>
            <div class="col-md-8">
                ${data?.prodtitl}
            </div>
        </span>
    </div>

    <div class="form-group">
        <span class="grupo">
            <label class="col-md-4 control-label text-info">
                Subtítulo
            </label>
            <div class="col-md-8">
                ${data?.prodsbtl}
            </div>
        </span>
    </div>

    <div class="form-group">
        <span class="grupo">
            <label class="col-md-4 control-label text-info">
                Fecha Inicio Publicación
            </label>
            <div class="col-md-8">
                ${data?.anunfcin?.format("dd-MM-yyyy")}
            </div>
        </span>
    </div>

    <div class="form-group">
        <span class="grupo">
            <label class="col-md-4 control-label text-info">
                Fecha Fin Publicación
            </label>
            <div class="col-md-8">
                ${data?.anunfcfn?.format("dd-MM-yyyy")}
            </div>
        </span>
    </div>

    <div class="form-group">
        <span class="grupo">
            <label class="col-md-4 control-label text-info">
                Estado
            </label>
            <div class="col-md-8">
                ${data?.etdo}
            </div>
        </span>
    </div>

</g:form>



