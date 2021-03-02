<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 11/02/21
  Time: 12:03
--%>

<g:select name="subcategoria" from="${subCategorias}" class="form-control required" optionKey="id" optionValue="descripcion" value="${producto?.subcategoria?.id}" required=""/>
