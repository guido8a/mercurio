<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 01/03/21
  Time: 15:35
--%>

<style>

.lineaAt {
    height: 1px;
    background-color: #5596ff;
}
</style>

<table class="table table-condensed table-bordered">
    <thead>
    <tr style="width: 80%">
        <th style="width: 70%" colspan="3">Atributos del producto</th>
    </tr>
    <tr style="width: 80%">
        <th style="width: 20%">Nombre</th>
        <th style="width: 60%">Descripción</th>
        <th style="width: 20%">Valor</th>
    </tr>
    </thead>
</table>

<div class=""  style="width: 99.7%;height: 350px; overflow-y: auto; margin-top: -20px">
    <table class="table-bordered table-condensed table-hover" width="100%">
        <tbody id="tabla_bandeja">
        <tr>
            <td style="width: 20%">
                <span class="badge bg-warning" style="background-color:  #67a153 ">Número de habitaciones</span>
            </td>
            <td style="width: 60%">
                Habitaciones del departamento
            </td>
            <td style="width: 20%">
                3
            </td>
        </tr>
%{--        <g:each in="${anuncios}" var="anuncio">--}%
%{--            <tr data-id="${promotor?.id}" style="width: 100%">--}%
%{--                <td style="width: 20%; text-align: center">${anuncio?.subcategoria?.categoria?.descripcion}</td>--}%
%{--                <td style="width: 20%">${anuncio?.nombre}</td>--}%
%{--                <td style="width: 20%">${anuncio?.descripcion}</td>--}%
%{--            </tr>--}%
%{--        </g:each>--}%
        </tbody>
    </table>
</div>



<div class="lineaAt col-md-10" style="margin-top: 30px; text-align: center">

</div>