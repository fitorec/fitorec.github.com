var equipoIndex = 0;
var actual = 0;

$(function() {
	// Handler for .ready() called.
	console.log('cargando script');
	$('#agregarUsuario').submit(
	function (event){
		event.preventDefault();
		var randomInt = getRandomInt(5, 10);
		console.log("Inicia recursion con: " + randomInt);
		setTimeout(actulizarFicha(0), 500);
		//setInterval(function(){alert("Hello")},3000);
	}
	);
});

function actulizarFicha(actual) {
	equipoIndex = getRandomInt(0, 3);
	console.log("Actual: " + actual + "Equipo index " + equipoIndex);
	$('#tablero div').removeClass('active');
	$('#equipo-'+equipoIndex).addClass('active');
	if (actual == 10) {
		var nombreUsuario = $('#nombreUsuario').val();
		var html = $('#equipo-'+equipoIndex).html();
		$('#equipo-'+equipoIndex).html(html + "<h4>" + nombreUsuario+ "</h4>");
	} else {
		setTimeout(actulizarFicha(actual + 1), 5000);
	}
}

function getRandomInt(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}