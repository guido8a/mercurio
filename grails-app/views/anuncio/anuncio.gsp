<table style="padding: 10px">
    <tr>
        <td>
            <span  class="titulo1" >Su Anuncio Destacado</span>
%{--            <g:each in="${destacados}" var="prod" status="i">--}%
                <div>
                    <div class="card h-100 marcoDestacados">
                        <img width="253px" height="auto" style="padding: 1px"
                             src="${request.contextPath}/principal/getImgnProd?ruta=${prod.rt}&tp=${prod.tp}&id=${prod.p}"/>

                        <div class="card-body">
                            <h4 class="titulo2">${prod.tt}</h4>
                            <h5 class="titulo3">${prod.sb ?: 'Sin descripción'}</h5>
                            <div class="normal">${prod.gf}</div>
                        </div>
                    </div>
                </div>
%{--            </g:each>--}%
        </td>
        <td style="width: 30px">&nbsp;</td>
        <td>
            <span  class="titulo1n" >Su Anuncio Gratuito</span>
%{--            <g:each in="${destacados}" var="prod" status="i">--}%
                <div style="display: inline">
                    <div class="card h-100 marcoNormal">
                        <img width="253px" height="auto" style="padding: 1px"
                             src="${request.contextPath}/principal/getImgnProd?ruta=${prod.rt}&tp=${prod.tp}&id=${prod.p}"/>

                        <div class="card-body">
                            <h4 class="titulo2n">
                                ${prod.tt}
                            </h4>
                            <h5 class="titulo4">${prod.sb ?: 'Sin descripción'}</h5>

                            <div class="normal">${prod.gf}</div>
                        </div>
                    </div>
                </div>
%{--            </g:each>--}%
        </td>
    </tr>
</table>

<style type="text/css">
:root {
    --naranja: #FFAB2A;
    --naranja1: #DF8B0A;
    --naranja3: #FFCB4A;
    --naranja2: #EFEBEA;
    --naranja0: #AF5B00;
    --naranja00: #4F1B00;
    --gris: #343A40;
}

.titulo1 {
    color: var(--naranja0);
    font-size: 2rem;
}

.titulo1n {
    color: var(--gris);
    font-size: 2rem;
}
.normal {
    text-align: center;
    color:#000;
    font-size: 10pt;
    font-weight: normal;
}
.marcoDestacados {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
    font-size: 2rem;
    font-weight: 400;
    line-height: 1.5;
    color: #212529;
    background-color: #fff;
    border-color: var(--naranja0);
    border-style: solid;
    border-width: 1px;
    width: 255px;
    text-align: center;
}

.marcoNormal {
    font-size: 2rem;
    font-weight: 400;
    line-height: 1.5;
    color: #212529;
    background-color: #fff;
    border-color: var(--gris);
    border-style: solid;
    border-width: 1px;
    width: 255px;
    text-align: center;
}

.titulo2 {
    color: var(--naranja0);
    font-size: 2rem;
}

.titulo3 {
    color: #000;
    font-size: 1.4rem;
}

.titulo2n {
    color: var(--gris);
    font-size: 1.8rem;
}

.titulo4 {
    color: #000;
    font-size: 1.0rem;
    font-weight: normal;
}
</style>
