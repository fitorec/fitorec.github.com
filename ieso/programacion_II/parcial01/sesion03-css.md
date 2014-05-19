#CSS

## Selectores:

### Selector universal

#### Código CSS
	
	* {
	  margin: 0;
	  padding: 0;
	}

### Selector de tipo o etiqueta

#### Código CSS

	p {
  		...
	}
	h1,h2,h3{
		color: red;
	}

### Selector de descendencia
Selecciona los elementos que se encuentran dentro de otros elementos. Un elemento es descendiente de otro cuando se encuentra entre las etiquetas de apertura y de cierre del otro elemento.

#### Código HTML:

	<p>
	  ...
	  <span>texto1</span>
	  ...
	  <a href="">...<span>texto2</span></a>
	  ...
	</p>
#### Código CSS

	p span { color: red; }

### Selector de clase
Este tipo de selectores se llaman selectores de clase y son los más utilizados junto con los selectores de ID que se verán a continuación. La principal característica de este selector es que en una misma página HTML varios elementos diferentes pueden utilizar el mismo valor en el atributo class:

#### Código HTML:
	<body>
	  <p class="destacado">Lorem ipsum dolor sit amet...</p>
	  <p>Nunc sed lacus et est adipiscing accumsan...</p>
	  <p>Class aptent taciti sociosqu ad litora...</p>
	</body>

#### Código CSS
	.destacado { color: red; }

### Selector de hijos:
Se utiliza para seleccionar un elemento que es hijo directo de otro elemento y se indica mediante el "signo de mayor que" `>`.

#### Código HTML
	<p>
	  <span>Texto1</span>
	</p>
	<p>
	  <a href="#">
	    <span>Texto2</span>
	  </a>
	</p>

#### Código CSS
	p > span { color: blue; }

### Selectores de ID
El selector de ID permite seleccionar un elemento de la página a través del valor de su atributo id. Este tipo de selectores sólo seleccionan un elemento de la página porque el valor del atributo id no se puede repetir en dos elementos diferentes de una misma página.

#### Código CSS:

	#destacado { color: red; }
#### Código HTML
	<p>Primer párrafo</p>
	<p id="destacado">Segundo párrafo</p>
	<p>Tercer párrafo</p>


### Selector Adyacente:

El selector adyacente se emplea para seleccionar elementos que son hermanos (su elemento padre es el mismo) y están seguidos en el código HTML. Este selector emplea en su sintaxis el símbolo `+` :

#### Código HTML 
	<body>
	<h1>Titulo1</h1>
	 
	<h2>Subtítulo</h2>
	...
	 
	<h2>Otro subtítulo</h2>
	...
	</body>
#### Código CSS

	h1 + h2 { color: red }

### Selector de atributo:

Permiten seleccionar elementos **HTML** en función de sus atributos y/o valores de esos atributos:

- `[nombre_atributo]`, selecciona los elementos que tienen establecido el atributo llamado nombre_atributo, independientemente de su valor.
- `[nombre_atributo=valor]`, selecciona los elementos que tienen establecido un atributo llamado nombre_atributo con un valor igual a valor.
- `[nombre_atributo~=valor]`, selecciona los elementos que tienen establecido un atributo llamado nombre_atributo y cuyo valor es una lista de palabras separadas por espacios en blanco en la que al menos una de ellas es exactamente igual a valor.
- `[nombre_atributo|=valor]`, selecciona los elementos que tienen establecido un atributo llamado nombre_atributo y cuyo valor es una serie de palabras separadas con guiones, pero que comienza con valor. Este tipo de selector sólo es útil para los atributos de tipo lang que indican el idioma del contenido del elemento.

#### Código CSS

	/* Se muestran de color azul todos los enlaces que tengan 
   un atributo "class", independientemente de su valor */
	a[class] { color: blue; }
	 
	/* Se muestran de color azul todos los enlaces que tengan 
	   un atributo "class" con el valor "externo" */
	a[class="externo"] { color: blue; }
	 
	/* Se muestran de color azul todos los enlaces que apunten 
	   al sitio "http://www.ejemplo.com" */
	a[href="http://www.ejemplo.com"] { color: blue; }
	 
	/* Se muestran de color azul todos los enlaces que tengan 
	   un atributo "class" en el que al menos uno de sus valores
	   sea "externo" */
	a[class~="externo"] { color: blue; }
	 
	/* Selecciona todos los elementos de la página cuyo atributo
	   "lang" sea igual a "en", es decir, todos los elementos en inglés */
	*[lang=en] { ... }
	 
	/* Selecciona todos los elementos de la página cuyo atributo
	   "lang" empiece por "es", es decir, "es", "es-ES", "es-AR", etc. */
	*[lang|="es"] { color : red }

## Unidades de medida
### Unidades absolutas

- `in`, pulgadas ("inches", en inglés). Una pulgada equivale a 2.54 centímetros.
- `cm`, centímetros.
- `mm`, milímetros.

-------------

	/* El cuerpo de la página debe mostrar un margen de media pulgada */
	body { margin: 0.5in; }
 
	/* Los elementos <h1> deben mostrar un interlineado de 2 centímetros */
	h1 { line-height: 2cm; }	
 
	/* Las palabras de todos los párrafos deben estar separadas 4 milímetros entre si */
	p { word-spacing: 4mm; }

### Unidades relativas

- `em`, relativa respecto del tamaño de letra del elemento.
- `px`, (píxel) relativa respecto de la resolución de la pantalla del dispositivo en el que se visualiza la página HTML.

	p { margin: 1em; }
	p { font-size: 32px; margin: 1em; }

### Colores

> <http://www.w3.org/TR/CSS21/syndata.html#value-def-color>
