<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 01/04/21
  Time: 10:16
--%>

<g:form class="form-horizontal" name="frmRespuesta" role="form" action="savePregunta_ajax" method="POST">
    <g:hiddenField name="id" value="${pregunta?.id}" />
    <g:hiddenField name="producto" value="${pregunta?.producto?.id}" />

    <div class="alert alert-warning" role="alert" style="font-size: 14px">
        <strong>Pregunta:</strong> ${pregunta?.texto}
    </div>

    <g:textArea name="respuesta"  class="form-control" maxlength="255" style="resize: none" value="${pregunta?.respuesta}"/>

</g:form>

