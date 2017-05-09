/**
 * 
 **/
var fechaActual = new Date();
var meses = ["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic"];

$(function() {
  // Handler for .ready() called.
  var $temario = $( "#temario" );
  if( $temario.length == 1) {
	  revisar_fechas($temario);
  }
});

function revisar_fechas($temario) {
	$("#fecha_actual").text(
		fechaActual.getDate() + " de " + meses[fechaActual.getMonth()]
	);
	$temario.find("tbody tr").each(function() {
		$tr = $(this);
		$fechas = $tr.find('.fechas');
		if($fechas.length == 1) {
			inicio = obtenerFecha($fechas.find('.inicio'));
			final = obtenerFecha($fechas.find('.final'));
			if (inicio<=fechaActual && final>fechaActual) {
				console.log(final);
				$tr.addClass("actual");
			}
		}
	});
}

function obtenerFecha($fecha) {
	var fechaParts = $fecha.text().split("-");
	var dia = $.trim(fechaParts[0]);
	var mesInt = parseInt($.trim(fechaParts[1])) - 1;
	// Nuevo str
	$fecha.text(dia + " - " + meses[mesInt]);
	// Fecha contenida
	var d = new Date(fechaActual.getFullYear(),mesInt, parseInt(dia));
	//console.log(d);
	return d;
}
