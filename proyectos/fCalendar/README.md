fCalendar
=============================================

Es un muy ligero calendario escrito en _Javascript_ el cual proporciona un conjunto de funciones para el control de eventos.

Demos en linea:
-----------------------------------------------
<http://vivoenhuajuapan.com/calendario/>

Principales características
--------------------------------------------
* Ligero
 - No usa ni descarga imagenes encambio implementa técnicas de CSS3, webkit y moz
 - Tiene una implementación de control de eventos que no sobre carga el DOM
 - La libreria principal fcalendar.js sólo pesa 7.5kb
* Multi idiomas
 - Versión en español fcal-lang-es.js
 - Versión en ingles fcal-lang-en.js (inconclusa)
 - Futuras versiones: Frances, Portuges, Aleman
* Compatibilidad
 - Emplea unicamente javascript apegado la mayor parte al ECMAScript ISO 16262
 - No redefine ningun prototypo de DOM
 - Compatible con cualquier frameWork
 - CrossBrowser (probado con firefox, opera, chromium, safari)
* Eventos y Controles
 - Su manejador de eventos nos permite incorporarlos al vuelo
 - El usuario tiene control pleno sobre Estos eventos
 - Al poder usarse con frameWorks lo podemos combinar, facilmente
* Multiplantillas incorporadas
 - dark(Implementada)
 - orange(Implementada versión 0.01)
 - blue
 - white


Lista de archivos
-------------------------------------------------------------------
	fCalendar.git
		.
		|-- README.html <-- Archivo README con demos
		|-- README.md  <-- Archivo README texto plano
		`-- src
			|-- fcalendar.js  <-- fCalendar Prototipo core
			|-- fcal-lang-en.js <- fCalendar traduccion ingles
			|-- fcal-lang-es.js <- fCalendar traduccion español
			|-- style.css  <- fCalendar css Core
			`-- templates
				|-- blue.css 	<- Plantilla Azul
				|-- default.css	<- Plantilla por defecto(ver demo)
				|-- orange.css	<- Plantilla Naranja
				`-- white.css	<- Plantilla blanco/gris(ver demo)
