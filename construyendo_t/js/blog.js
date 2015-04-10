var escribirLetras = function(selector) {
     $h1 = $(selector);
	var txt = $h1.text();
	var msg = $h1.data('msg');
	if(txt.length < msg.length) {
		$h1.text(msg.substr(0, txt.length +1 ));
		setTimeout(function(){ escribirLetras(selector); }, 200);
	}
};

var agregarLink = function(link) {
	console.log(link);
	  var html = '<h1 id="'+link.id+'" data-msg="'+link.titulo+'"></h1>';
	  $pizarron.append( html );
	  escribirLetras('#' + link.id);
}

$(function() {
	// Handler for .ready() called.
	var links = [
		{
			titulo: 'Misión',
			id: 'mision',
		},
		{
			titulo: 'Visión, Objetivo, Valores',
			id: 'vision',
		},
	];
	$pizarron = $('#pizarron');
	console.log($pizarron);
	$.each(links, function(key, link) {
		setTimeout(function(){ agregarLink(link); }, 2000 * key);
	});
});
