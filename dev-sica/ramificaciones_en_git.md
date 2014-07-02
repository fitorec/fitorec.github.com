# Ramificaciones en Git

Cualquier sistema de control de versiones moderno tiene algún mecanismo para soportar distintos ramales. Cuando hablamos de ramificaciones, significa que tu has tomado la rama principal de desarrollo (master) y a partir de ahí has continuado trabajando sin seguir la rama principal de desarrollo. En muchas sistemas de control de versiones este proceso es costoso, pues a menudo requiere crear una nueva copia del código, lo cual puede tomar mucho tiempo cuando se trata de proyectos grandes.

Algunas personas resaltan que uno de los puntos mas fuertes de Git es su sistema de ramificaciones y lo cierto es que esto le hace resaltar sobre los otros sistemas de control de versiones. ¿Porqué esto es tan importante? La forma en la que Git maneja las ramificaciones es increíblemente rápida, haciendo así de las operaciones de ramificación algo casi instantáneo, al igual que el avance o el retroceso entre distintas ramas, lo cual también es tremendamente rápido. A diferencia de otros sistemas de control de versiones, Git promueve un ciclo de desarrollo donde las ramas se crean y se unen ramas entre sí, incluso varias veces en el mismo día. Entender y manejar esta opción te proporciona una poderosa y exclusiva herramienta que puede, literalmente, cambiar la forma en la que desarrollas.

> **Fuente:** <http://git-scm.com/book/es/Ramificaciones-en-Git>

## creando una rama:

> Revisar documentacion completa: **<http://git-scm.com/book/es/Ramificaciones-en-Git>**


	git checkout -b pruebas


Trabajamos con ella por ejemplo modificamos el archivo README.md, y luego lo agregamos:

	git add README.md

Realizamos nuestra confirmación:

	git commit -m 'Editando archivo README'

## Agregando ramas remotas en los otros hosts

 git branch -r
 git branch pruebas origin/pruebas



## Fuentes:

http://stackoverflow.com/questions/11266478/git-add-remote-branch