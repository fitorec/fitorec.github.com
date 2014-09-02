var equipoIndex = 0;
var actual = 0;

$(function() {
	// Handler for .ready() called.
	$('#agregarUsuario').submit(
	function (event){
		event.preventDefault();
		setTimeout(actulizarFicha(0), 500);
	}
	);
});

function actulizarFicha(actual) {
	equipoIndex = getRandomInt(0, 3);
	numElementosMaximos = 0;
	indexMax = -1;
	$('.equipo').each(function(key, value) {
		numElementos = $(this).find('h4').length;
		if(numElementosMaximos < numElementos) {
			numElementosMaximos = numElementos;
			indexMax = key;
		}
	});
	$('#tablero div').removeClass('active');
	$('#equipo-'+equipoIndex).addClass('active');
	if(indexMax == equipoIndex){
		setTimeout(actulizarFicha(actual + 1), 5000);
		return;
	}
	var nombreUsuario = $('#nombreUsuario').val();
	var html = $('#equipo-'+equipoIndex).html();
	$('#equipo-'+equipoIndex).html(html + "<h4>" + nombreUsuario+ "</h4>");
}

function getRandomInt(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}