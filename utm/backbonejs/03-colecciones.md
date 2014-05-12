3 Colecciones
=====================================================

# 3.0 Colecciones de Backbone

Las colecciones son un conjunto ordenado de modelos.

	Archivo: /js/collection/platicas.js

## Creando un colector:

	!javascript
	var PlaticasCollection = Backbone.Collection.extend({
		model : Libro
	});

	var platicas = new PlaticasCollection();

---------------------------------------------------------

# 3.1 Agregando & Quitando Modelos

## Agregando Modelos a la colección


	!javascript
	var a = new Platica({nombre: 'taller de Backbone'}),
		b = new Platica({nombre: 'otro taller'}),
		c = new Platica({nombre: 'alguna otra platica'});
	
	// Creamos la colección enviandole
	// un conjunto de modelos(2)
	var platicas = new PlaticasCollection([a,b]);
	console.log(platicas.toJSON());

	//Agregando la platica c
	platicas.add(c);
	console.log(platicas.toJSON());

## Quitando Modelos a la colección

	!javascript
	//Borrando la platica a
	platicas.remove(a);
	console.log(platicas.toJSON());

	//Borrando un conjunto de objetos
	platicas.remove([b,c]);
	console.log(platicas.toJSON());

------------------------------------------

# 3.2 Vaciando la colección

### Reseteando colección

	!javascript
	//Cambiando el contenido de la coleccion
	platicas.reset([
		{nombre: 'taller backbone'}
	]);

	//si no le pasamos nada, es una forma de vaciar
	// una coleccion
	platicas.reset();


--------------------------------------

# 3.3 Colección y Persistencia de datos

## Obteniendo objetos de la colección

Esto se realiza mediante la función `get` de la colección, esta función puede recibir cualquiera de estos valores:

 - **id** : Identificador del Modelo.
 - **idAtribute**: Este por defecto es `id`.
 - **cid** : Identificador interno en Backbone.

<br/>

	!javascript
	var Platica1 = platicas.get(1);

-----------------------------------------------------	

# 3.4 Eventos & Colecciones

Como las colecciones representan conjuntos de objetos podemos escuchar los eventos de agregar,quitar o al modificar modelos en dicho conjunto.

	
## on add

	!javascript
	var platicas = new PlaticasCollection();
	// Le agregamos el evento al modificar
	platicas.on('add', function(){
		console.log('Se agrego una nueva platica');
	});

	//agregamos platicas a la colección(disparando el evento)
	platicas.add([
		{nombre: 'platica 1'},
		{nombre: 'platica 2'}
	]);

## onChange

	!javascript
	// Le agregamos el evento al modificar
	platicas.on('change', function(){
		console.log('Se agrego una nueva platica');
	});
