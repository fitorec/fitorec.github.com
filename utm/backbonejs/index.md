#Curso Backbone.js

Temario:

Modelos
------------------------------------------
Los modelos representan los datos de la aplicación y la lógica alrededor de estos datos.

Creamos un archivo llamado platica en `/js/models/platica.js`, con el siguiente contenido:

	var Platica = Backbone.Model.extend({
		initialize: function () {
			//Aquí agregamos los callbacks del modelo
			this.on('change', function (){
				console.log(this);
			});
		},
		urlRoot : '/platicas'
		defaults: {
			nombre: '',
			ponente: '',
			hora   : 'Por Confirmar'
		}
	});


### Usando el Modelo

	var platica = new Platica({
		nombre  : 'Taller de backbone',
		ponente : 'Fitorec'
	});

	platica.toJSON();

### Leyendo datos
	var platica1 = new Platica({
		id  : 1
	});

	// GET: /platicas/1
	platica1.fetch();
	platica1.toJSON();

### Guardando datos
	var nuevaPlatica = new Platica({
		nombre  : 'Platica sobre nodejs',
		ponente : 'Alguien'
	});

	// POST: /platicas/
	//Si tuviera definido el 'id'
	// PUT: /platicas/id
	nuevaPlatica.save();
	nuevaPlatica.toJSON();

### Borrando un registro.

	// DELETE: /platicas/1
	platica1.destroy();

### Agregando validación
	var Platica = Backbone.Model.extend({
		validate: function (atributos) {
			if(!atributos.nombre) {
				return "el campo nombre es obligatorio";
			}
		}
	});
	
	var platica = new Platica();
	platica.save();


