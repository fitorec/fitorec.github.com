2 Vistas
==================================================

--------------------------------------------------

# 2.0 Vistas de Backbone.js

Una vista es la parte que contiene la lógica del renderizado, apoyándose de los **`templates`** para mostrar el contenido **html** en la aplicación.

	Archivo: /js/views/platica_1.js

## Creando una vista básica:

	!javascript
	var Platica1Vista = Backbone.View.extend();

## El elemento `this.el`

En **Backbone**  toda vista contiene el atributo `el`, el cual es una instancia en el DOM.

## Veamos esto:

	!javascript
	var platica1V = new Platica1Vista();
	console.log( platica1V.el );
	/* Resultado
	 *   <div></div>
     */

---------------------------------------------

# 2.1 - Más sobre `el`

## Personalizando `this.el`

	!javascript
	var Platica1Vista = Backbone.View.extend({
		tagName   : 'section',
		className : 'platica',
		id        : 'platica-1' 
	});

	// Valor el por defecto de Platica1Vista: 
	// <section class='platica' id='platica1'>
	// </section>

`this.el` puede definirse como un selector que apunte a un elemento o conjunto de elementos existentes en el **DOM**, por ejemplo:

	!javascript
	var Platica1Vista = Backbone.View.extend({
		el   : '#platica-1' 
	});

## `this.el` y jQuery

	!javascript
	Se cumple que:
	this.$el = $(this.el);

-------------------------------------------------

# 2.2 Render y plantillas

## Método Render:

	!javascript
	var Platica1Vista = Backbone.View.extend({
		initialize : function() {
			this.render();
		},
		render   : function() {
			this.$el.html('metodo render');
		} 
	});

-------------------------------------------------

# 2.3 Vistas & eventos

## Manejo de eventos

Los eventos son definidos en el objeto `events`, la sintaxis es la siguiente:

	!javascript
	events : { 
		'<evento1> <selector1>' : '<callback1>',
		'<evento2> <selector2>' : '<callback2>',
		...
		'<eventon> <selectorn>' : '<callbackn>',
	}

Veamos un ejemplo:

	!javascript
	var Platica1Vista = Backbone.View.extend({
		events: {
			'click .efecto' : 'efectoCallBack'
		},
		efectoCallBack : function() {
			this.$el.fadeOut().fadeIn();
		}
	});