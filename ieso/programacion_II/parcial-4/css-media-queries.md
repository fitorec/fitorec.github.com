#CSS media Queries


Las consulta por los medios es un mecanismos **CSS** que nos permite definir el diseño de nuestras aplicaciones web a partir de:

 - El tipo de dispositivo(`smarthphone`, `TV`, `Tableta`, `Desktop`, `proyector`, `impresora`, etc)
 - La resolución de pantalla (ancho `width`, alto `heigth`).
 - La inclinación de la pantalla (horizontal, vertical).

-------------------------------------------------------
# Medios.

Una de las características más importantes de las hojas de estilos CSS es que permiten definir diferentes estilos para diferentes medios o dispositivos: pantallas, impresoras, móviles, proyectores, etc.

Además, CSS define algunas propiedades específicamente para determinados medios, como por ejemplo la paginación y los saltos de página para los medios impresos o el volumen y tipo de voz para los medios de audio. La siguiente tabla muestra el nombre que CSS utiliza para identificar cada medio y su descripción:

-----------------------------------------------------------------

# Medios tabla:

<table>
<thead>
<tr>
  <th>Medio</th>
  <th>Descripción</th>
</tr>
</thead>
<tbody>
<tr>
  <td><code>all</code></td>
  <td>Todos los medios definidos</td>
</tr>
<tr>
  <td><code>braille</code></td>
  <td>Dispositivos táctiles que emplean el sistema braille</td>
</tr>
<tr>
  <td><code>embosed</code></td>
  <td>Impresoras braille</td>
</tr>
<tr>
  <td><code>handheld</code></td>
  <td>Dispositivos de mano: móviles, PDA, etc.</td>
</tr>
<tr>
  <td><code>print</code></td>
  <td>Impresoras y navegadores en el modo <em>"Vista Previa para Imprimir"</em></td>
</tr>
<tr>
  <td><code>projection</code></td>
  <td>Proyectores y dispositivos para presentaciones</td>
</tr>
<tr>
  <td><code>screen</code></td>
  <td>Pantallas de ordenador</td>
</tr>
<tr>
  <td><code>speech</code></td>
  <td>Sintetizadores para navegadores de voz utilizados por personas discapacitadas</td>
</tr>
<tr>
  <td><code>tty</code></td>
  <td>Dispositivos textuales limitados como teletipos y terminales de texto</td>
</tr>
<tr>
  <td><code>tv</code></td>
  <td>Televisores y dispositivos con resolución baja</td>
</tr>
</tbody>
</table>

----------------------------------------------------

#Medios:

Los medios más utilizados actualmente son `screen` (para definir el aspecto de la página en pantalla) y `print` (para definir el aspecto de la página cuando se imprime), seguidos de `handheld` (que define el aspecto de la página cuando se visualiza mediante un dispositivo móvil).

Además, `CSS` clasifica a los medios en diferentes grupos según sus características. La siguiente tabla resume todos los grupos definidos en el estándar:

---------------------------------------------------------

#Medios:

<table>
<thead>
<tr>
  <th>Medio</th>
  <th>Continuo / Paginado</th>
  <th>Visual / Auditivo / Táctil / Vocal</th>
  <th>Mapa de bits / Caracteres</th>
  <th>Interactivo / Estático</th>
</tr>
</thead>
<tbody>
<tr>
  <td><code>braille</code></td>
  <td>continuo</td>
  <td>táctil</td>
  <td>caracteres</td>
  <td>ambos</td>
</tr>
<tr>
  <td><code>embossed</code></td>
  <td>paginado</td>
  <td>táctil</td>
  <td>caracteres</td>
  <td>estático</td>
</tr>
<tr>
  <td><code>handheld</code></td>
  <td>ambos</td>
  <td>visual, auditivo, vocal</td>
  <td>ambos</td>
  <td>ambos</td>
</tr>
<tr>
  <td><code>print</code></td>
  <td>paginado</td>
  <td>visual</td>
  <td>mapa de bits</td>
  <td>estático</td>
</tr>
<tr>
  <td><code>projection</code></td>
  <td>paginado</td>
  <td>visual</td>
  <td>mapa de bits</td>
  <td>interactivo</td>
</tr>
<tr>
  <td><code>screen</code></td>
  <td>continuo</td>
  <td>visual, auditivo</td>
  <td>mapa de bits</td>
  <td>ambos</td>
</tr>
<tr>
  <td><code>speech</code></td>
  <td>continuo</td>
  <td>vocal</td>
  <td>(no tiene sentido)</td>
  <td>ambos</td>
</tr>
<tr>
  <td><code>tty</code></td>
  <td>continuo</td>
  <td>visual</td>
  <td>caracteres</td>
  <td>ambos</td>
</tr>
<tr>
  <td><code>tv</code></td>
  <td>ambos</td>
  <td>visual, auditivo</td>
  <td>mapa de bits</td>
  <td>ambos</td>
</tr>
</tbody>
</table>

---------------------------------------------------------

#Medios definidos con las reglas de tipo @media

Las reglas `@media` son un tipo especial de regla `CSS` que permiten indicar de forma directa el medio o medios en los que se aplicarán los estilos incluidos en la regla. Para especificar el medio en el que se aplican los estilos, se incluye su nombre después de `@media`. Si los estilos se aplican a varios medios, se incluyen los nombres de todos los medios separados por comas.

A continuación se muestra un ejemplo sencillo:

	!css
	@media print {
	  body { font-size: 10pt }
	}
	@media screen {
	  body { font-size: 13px }
	}
	@media screen, print {
	  body { line-height: 1.2 }
	}

---------------------------------

# Operadores Lógicos

	!css
	@media (min-width: 700px) { ... }

Si usted quiere aplicar ese query solo si la pantalla esta en formato horizontal, usted puede utilizar el operador and y colocar la siguiente cadena

	!css
	@media (min-width: 700px) and (orientation: landscape) { ... }

La siguiente query solo retornara verdadero si la ventana tiene un ancho de 700px o mas y la pantalla esta en formato horizontal. Ahora si usted quiere aplicar esta opción solo si tipo de medio es TV, usted puede utilizar la siguiente cadena:

	!css
	@media tv and (min-width: 700px) and (orientation: landscape) { ... }

----------------------------------------------------
# lista separada por comas

Las listas separadas por comas se comportan como el operador or cuando es usado en media queries. Cuando utilice una lista separada por comas y alguno de los queries retorna verdadero, el estilo o  la hoja de estilos sera aplicada. Cada query en una lista separada por comas es tratado como una query individual y cualquier operador aplicado a un medio no afectara a los demás. Esto significa que cada query en una lista separada por comas puede tener como objetivo diferentes medios, tipos y estados.

Si usted quiere aplicar una serie de estilos para un equipo con un ancho mínimo de 700px o si el dispositivo esta colocado en horizontal, usted puede escribir lo siguiente:

	!css
	@media (min-width: 700px), handheld and (orientation: landscape) { ... }

----------------------------------------------------
#not

El operador not aplica a todo el query y retorna verdadero si es posible y sino retorna falso (como por ejemplo monochrome en un monitor a color o una ventana con un ancho mínimo de min-width: 700px en un monitor de 600px). Un not negara un query si es posible pero no a todos los query posibles si están ubicados en una lista separada por comas. El operador not no puede ser usado para negar un query individual, solo para un query completo. Por ejemplo, el not en el siguiente query es evaluado al final:

	!css
	@media not all and (monochrome) { ... }

Esto significa que el query es evaluado de la siguiente forma:

	!css
	@media not (all and (monochrome)) { ... }

... y no de esta forma:

	!css
	@media (not all) and (monochrome) { ... }

----------------------------------------------------
#not

Otro Ejemplo:

	!css
	@media not screen and (color), print and (color)

Es evaluado de la siguiente forma:

	!css
	@media (not (screen and (color))), print and (color)

------------------------------------------------------

# detección del tipo de dispositivo


------------------------------------------

# Detección de la orientación de la pantalla:

**orientation:** Indica cuando el dispositivo esta en modo landscape (el ancho de la pantalla es mayor al alto) o modo portrait (el alto de la pantalla es mayor al ancho).


	!css
	/* Formato Vertical */
	@media screen and (orientation:portrait) {
	    /* Portrait styles */
	}
	/* Formato Horizontal */
	@media screen and (orientation:landscape) {
	    /* Landscape styles */
	}

Para aplicar una hoja de estilo solo en orientación vertical (portrait):

	!css
	@media all and (orientation: portrait) { ... }


---------------------------------------------------

# Ejemplo:

Observe el siguiente documento:

	!html
	<!DOCTYPE html>
	<html>
	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	    <title>Ejemplo Media Queries</title>
	    <link rel="stylesheet" href="ejemplo-media-queries.css">
	</head>
	<body>
		<h1>¿Y mis $50,00?</h1>
		<img src="http://i.ytimg.com/vi/IwwpMNqBZQY/0.jpg" alt="imagen canaca"/>
	</body>
	</html>

Vamos ha definir el diseño de esta pagina a partir de algunos atributos que vamos a extraer de [**CSS3 please**](http://css3please.com/), como vemos a continuación.

------------------------------------------------------------------

## CSS Ejemplo:


	body {
		background: #4D4D4D;
		text-align:center
	}
	
	h1 {
		color: #FF5976;
		text-shadow: 1px 1px 3px RGBA(0,0,0,0.5);
	}
	
	img {
		border: 5px solid #00C669;
		border-radius: 10px;
		opacity: 0.5;
	}
	img:hover {
		opacity: 1;
	}


## Fuentes:

 - [MDN - CSS media queries](https://developer.mozilla.org/es/docs/CSS/Media_queries)
 - [ Medios CSS](http://librosweb.es/css/capitulo_1/medios_css.html)


# Recursos:
 - [Opera mini simulator](http://www.opera.com/developer/mobile-emulator)