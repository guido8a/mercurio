<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 03/06/21
  Time: 11:00
--%>

<%@ page import="ventas.Producto" %>

<style>

.marco{
    border-color: #AF5B00;
}

.btn-rojo {
    border-radius: 4px;
    background-image: linear-gradient(var(--naranja3),var(--naranja),var(--naranja3));
    text-align-all: center;
    margin: 2px;
}

.btn-gris {
    border-radius: 4px;
    background-image: linear-gradient(#D4DAE0, #A4AAB0, #D4DAE0);
    text-align-all: center;
    margin: 2px;
}

.card2 {
    border: green;
    width: 45%;
    -webkit-box-shadow : 7px 7px 5px 0px rgba(50, 50, 50, 0.75);
    -moz-box-shadow    : 7px 7px 5px 0px rgba(50, 50, 50, 0.75);
    box-shadow         : 7px 7px 5px 0px rgba(50, 50, 50, 0.75);
    height: auto;
}

</style>

<g:if test="${imagenes.size() > 0}">
    <div class="container">
        <g:each in="${imagenes}" var="file" status="i">
            <div class="card2">
                <div class="thumbnail">
                    <img src="${createLink(controller: 'pago', action: 'getImage', params: [id: file.file, pro: producto?.id] )}" />
                    <div>
                        <p>${file.file}</p>
                    </div>
                </div>
            </div>
        </g:each>
    </div>


</g:if>
<g:else>
    <br>
    <div class="alert alert-warning">
        <i class="fa fa-exclamation-triangle fa-2x"></i>
        No existe ningún comprobante de pago cargado
    </div>
</g:else>

<script type="text/javascript">


</script>