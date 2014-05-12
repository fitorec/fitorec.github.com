4 Plantillas
====================================================

------------------------------------------------------------

# 4.0 Plantillas y Backbone

Nos ayudan a definir código **genérico** HTML, que serán renderizado con el contenido de nuestros modelos.

## Utilizando las plantillas de underscore

	!javascript
	var planticaPlantilla = _.template('#platicaTemplate');
	//
	$('boddy').append(planticaPlantilla);

## template en el html

	!html
	<script type='text/template' id='platicaTemplate'>
		<h2><%= nombre %></h2>
		<p><%= ponente %></p>
		<small><%= hora %></small>
	</script>

------------------------------------------

# 4.1 - templates y vistas

	!javascript
	var Platica1Vista = Backbone.View.extend({
		el        : '#platicas'
		initialize: function () {
			app.platicas.on('add',
				this.mostrarPlatica
			);
			app.platicas.fetch();
		},
		mostrarPlatica: function(platicaModel) {
			var vista = new mostrarPlaticaView({model:platicaModel});
			$('.platicas').append(vista.render().$el);
		}
	});
	//Definiendo mostrarPlaticaView
	var mostrarPlaticaView = Backbone.View.extend({
		template : _.template( $('#platicas').html()),
		render : function (){
			this.$el.html (this.template(this.model.toJSON()));
			return this;
		}
	});

------------------------------------------

# 4.2 Otros sistemas de plantillas

 - Mustache
 - Handlebars
 - jQuery templates

