$(function() {
	var numRandom = $.cookie("numRandom");
	if(numRandom>0) {
		mostrarImg(numRandom);
	}
	// Handler for .ready() called.
	$("#mostrarImg").click(function() {
		//acción
		mostrarImg(getRandomInt(1, 20));
	});
});
function getRandomInt(min, max) {
  return Math.floor(Math.random() * (max - min)) + min;
}

function pausecomp(millis){
  var date = new Date();
  var curDate = null;
  do { curDate = new Date(); }
  while(curDate-date < millis);
}

function mostrarImg(numRandom){
	var $examen = $('#examen');
	$("#mostrarImg").fadeOut();
	$examen.fadeIn();
	var $par = $examen.find('p.par');
	var $impar = $examen.find('p.impar');
	if(numRandom%2) {
		$impar.fadeIn();
		$par.fadeOut();
	} else {
		$par.fadeIn();
		$impar.fadeOut();
	}
	$.cookie("numRandom", numRandom, { expires : 10 });
}
