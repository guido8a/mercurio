<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 26/04/21
  Time: 14:05
--%>

<g:select name="canton" from="${cantones}" class="form-control required" optionKey="id" optionValue="nombre" value="${producto?.canton?.id ? producto?.canton?.id : producto?.padre?.canton?.id}" required=""/>