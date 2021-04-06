<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 06/04/21
  Time: 10:41
--%>

<asset:javascript src="/apli/jquery.switcher.js"/>
<asset:stylesheet src="/apli/switcher.css"/>

<g:if test="${!link}">
   No se encontró link
</g:if>
<g:else>
    <div class="modal-contenido">
        <g:form class="form-horizontal" name="frmLink" role="form" controller="link" action="saveLink_ajax" method="POST">
            <g:hiddenField name="id" value="${link?.id}"/>
            <div class="form-group keeptogether ${hasErrors(bean: link, field: 'titulo', 'error')} required">
                <div class="col-md-12">
                    <span class="grupo">
                        <label for="titulo" class="col-md-2 control-label">
                            Título
                        </label>
                        <div class="col-md-8">
                            <g:textField name="titulo" maxlength="127" required="" class="form-control input-sm required" value="${link?.titulo}"/>
                        </div>
                    </span>
                </div>
            </div>
            <div class="form-group keeptogether ${hasErrors(bean: link, field: 'link', 'error')} required">
                <div class="col-md-12">
                    <span class="grupo">
                        <label for="link" class="col-md-2 control-label">
                            URL
                        </label>
                        <div class="col-md-8">
                            <g:textField name="link" maxlength="255" required="" class="form-control input-sm required" value="${link?.link}"/>
                        </div>
                    </span>
                </div>
            </div>
            <div class="form-group keeptogether ${hasErrors(bean: link, field: 'texto', 'error')}">
                <div class="col-md-12">
                    <span class="grupo">
                        <label for="texto" class="col-md-2 control-label">
                            Texto
                        </label>
                        <div class="col-md-8">
                            <g:textArea name="texto" maxlength="255" class="form-control input-sm " value="${link?.texto}" style="resize: none"/>
                        </div>
                    </span>
                </div>
            </div>
            <div class="form-group keeptogether ${hasErrors(bean: link, field: 'orden', 'error')}">
                <div class="col-md-12">
                    <span class="grupo">
                        <label for="orden" class="col-md-2 control-label">
                            Orden
                        </label>
                        <div class="col-md-3">
                            <g:textField name="orden" maxlength="2" required="" class="form-control input-sm required" value="${link?.orden ?: 0}"/>
                        </div>
                    </span>
                </div>
            </div>
            <div class="form-group keeptogether ${hasErrors(bean: link, field: 'estado', 'error')}">
                <div class="col-md-12">
                    <span class="grupo">
                        <label class="col-md-2 control-label">
                            Estado
                        </label>
                        <div class="col-md-3 form-check form-check-inline" style="margin-top: 5px">
                            <input name="estado" class="form-check-input tipo" type="checkbox" id="inlineCheckbox1" ${link?.activo == 'A' ? 'checked' : ''}>
                        </div>
                    </span>
                </div>
            </div>
        </g:form>
    </div>
</g:else>

<script type="text/javascript">

    $.switcher('input[type=checkbox]');

</script>