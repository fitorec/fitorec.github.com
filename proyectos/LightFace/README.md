<script src="https://ajax.googleapis.com/ajax/libs/mootools/1.3.0/mootools.js"></script>
<script src="mootools-more-drag.js"></script>
<script src="https://github.com/fitorec/LightFace/raw/master/Source/LightFace.js"></script>
<link rel="stylesheet" href="./dark/darkBox.css" />

<script>
function formFunction() {
		return new LightFace({
		title: $('demotitle').value,
		content: $('democontent').value,
		baseClass: 'darkface',
		draggable: true
	}).open();
}
</script>
<style>
#demotitle,#democontent{
	font-size:1.5em;
	background:#eee;
	color:#222;
}
#democontent{
	font-size:1.2em;
}
</style>

<a href='http://fitorec.github.com' id='fitorec'></a>

LightFace
=============================================

Plugin para `mootools` que nos proporciona un cojunto de objetos para construir ventanas flotantes facilmente controlables.

Es es un proyecto original de [darkwing](https://github.com/darkwing) el cual he estado haciendo mis propias modificaciones, este proyecto es muy interesante sus principales caracteristicas son:

 - **Soporte arrastrable**: puedes arrastrar las ventanas si incorporas el objeto `drug` del nucleo de **mootools**.
 - **Soporte de galeria**: Puedes crear una galeria del tipo `lightBox` con este plugin.
 - **Soporte de frames**: Soporte de embedido de ventanas p.e. usted puede abrir google.
 - **Soporte Ajax**: El objeto `LightBoxRequest` probe de metodos que facilitan las solicitudes asictronas.
 - **Soporte de eventos**: puedes ligar muy facilmente estas ventanas con eventos en tu sitio.
 - **Soporte de plantillas**: Estos cambios son nuevos y los estoy implementando.
 

###Ejemplo simple con plantilla.

<input type="text" id="demotitle" value="Titulo ventana de Ejemplo" onFocus='this.value=""' onblur='this.value=(this.value)? this.value : "Titulo ventana de Ejemplo"'/><br>
<textarea id="democontent" cols='60'>Esto es el contenido que aparecera en la ventana</textarea><br>
<input type="button" value="Mostrar" onclick="javascript: formFunction();" />
<br /><br />

<a href='https://github.com/fitorec/LightFace' class='get-code'>Acceder al repositorio</a>
