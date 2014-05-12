5 Rutas
=============================================================

5.0 - Rutas ejemplo completo 1
-----------------------------------------------------------

	!javascript
	var myRouter = Backbone.Router.extend({
		routes : {
			''      : 'mostrarEnlace1',
			enlace1 : 'mostrarEnlace1',
			ancle2  : 'mostrarEnlace2',
		},
		mostrarEnlace1: function () {
			new VistaDisparada1();
		},
		mostrarEnlace2: function () {
			new VistaDisparada2();
		}
	});

	var myrouter = new myRouter();
	Backbone.history.start();