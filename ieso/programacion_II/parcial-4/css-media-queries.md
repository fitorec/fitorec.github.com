#CSS media Queries


Las consulta por los medios es un mecanismos **CSS** que nos permite definir el diseño de nuestras aplicaciones web a partir de:

 - El tipo de dispositivo(`smarthphone`, `TV`, `Tableta`, `Desktop`, `proyector`, `impresora`, etc)
 - La resolución de pantalla (ancho `width`, alto `heigth`).
 - La inclinación de la pantalla (horizontal, vertical).

----------------------------------------------------

# Operadores Lógicos

	!css
	@media (min-width: 700px) { ... }

Si usted quiere aplicar ese query solo si la pantalla esta en formato horizontal, usted puede utilizar el operador and y colocar la siguiente cadena

	!css
	@media (min-width: 700px) and (orientation: landscape) { ... }

----------------------------------------------------

## detección del tipo de dispotivo


## Detección de la resolución y tipo de pantalla:

	!css
	/* Formato Vertical */
	@media screen and (orientation:portrait) {
	    /* Portrait styles */
	}
	/* Formato Horizontal */
	@media screen and (orientation:landscape) {
	    /* Landscape styles */
	}


## Fuentes:
	- [MDN - CSS media queries](https://developer.mozilla.org/es/docs/CSS/Media_queries)

# Recursos:
 - [Opera mini simulator](http://www.opera.com/developer/mobile-emulator)