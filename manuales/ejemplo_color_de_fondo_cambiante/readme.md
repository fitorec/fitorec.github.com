<a id='fitorec' href='http://fitorec.github.com' title='Visitar mi espacio'></a>

#Ejemplo animación jQuery

Este ejemplo lo pongo como recordatorio.**Nota** requiere **jQuery** y **jQuery-UI**:

	$(document).ready(function(){
		$('.get-code').hover(function(){
			kidsSound.play(); 
		});
		colors = ['#FFB30C', '#58EC00', '#0087EC', '#EEEEEE', '#FF5A00' ]
		var i = 0;
		animate_loop = function() {
				$('body').animate({backgroundColor:colors[(i++)%colors.length]
				}, 500, function(){
							animate_loop();
				});
		}
		animate_loop();
	});


<a href='http://fitorec.github.com/manuales/color_de_fondo_cambiante/codigo.tar.gz' class='get-code'>Descarga código fuente</a>
