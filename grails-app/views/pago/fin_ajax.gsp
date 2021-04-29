<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 29/04/21
  Time: 12:13
--%>

<input name="fechaFin" id='datetimepicker2' type='text' class="form-control" disabled value="${ff}"/>

<script type="text/javascript">

    $(function () {
        $('#datetimepicker2').datetimepicker({
            locale: 'es',
            format: 'DD-MM-YYYY',
            showClose: true,
            icons: {
                close: 'closeText'
            }
        });
    });
</script>