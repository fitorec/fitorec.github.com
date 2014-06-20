/**
 * Generador de partidos, obtenidos de la pagina:
 * 	http://as.com/especiales/futbol/mundial/2014/calendario.html
 *
 * Este código es en jQuery y se puede ejecutar desde el mismo debug.
 *
 */

var resultDumpSQL = '';
$('.mod-calendario-table').find('td.con-partido div.mod-cal-grp').each(function() {
	if($(this).hasClass('mod-cal-ronda')) {
		return 1;
	}
	// Obteniendo la informacion del estadio/hora del partido
	var estadio = $.trim($(this).find('h4').text());
	var fecha = $.trim($(this)
		.find('div time[itemprop=startDate]')
		.attr('content').replace('T', ' '));

	//Obteniendo los equipos implicados
	var $equipos = $(this).find('ul.s-right li');

	//Equipo 1
	var $equipo1 = $($equipos[0]).find('a');
	var pais1 = $.trim($($equipo1[0]).text());
	var goles_pais1 = $.trim($($equipo1[1]).text());
	var goles_pais1 = (goles_pais1 == "-")? '0' : goles_pais1;

	//Equipo 1
	var $equipo2 = $($equipos[1]).find('a');
	var pais2 = $.trim($($equipo2[0]).text());
	var goles_pais2 = $.trim($($equipo2[1]).text());
	var goles_pais2 = (goles_pais2 == "-")? '0' : goles_pais2;

	//Generamos la consulta Insert mySQL con subquery
	resultDumpSQL +=
	"\nINSERT INTO `partidos` " +
  "\n(`pais_id1` , `pais_id2` , `goles_pais_id1`, `goles_pais_id2`, `fecha_hora`, `estadio`)" +
  "\n\tSELECT " +
	"\n\t\t`id` AS `pais_id1`," +
	"\n\t\t(SELECT `id` FROM  `paises` WHERE  `acronimo` =  '"+pais2.toLowerCase()+"') AS `pais_id2`, " +
	"\n\t\t'"+goles_pais1+"' AS `goles_pais_id1`," +
	"\n\t\t'"+goles_pais2+"' AS `goles_pais_id2`," +
	"\n\t\t'"+fecha+"' AS `fecha_hora`," +
	"\n\t\t'"+estadio+"' AS `estadio`," +
	"\n\t\tFROM  `paises`" +
	"\n\t\tWHERE  `acronimo` =  '"+pais1.toLowerCase()+"';\n";
});

console.log(resultDumpSQL);