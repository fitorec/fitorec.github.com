Transacciones (motor de la base de datos)
========================================================================

Una transacción es una secuencia de operaciones realizadas como una 
sola unidad lógica de trabajo(atomicidad).

Una unidad lógica de trabajo para ser calificada como transacción 

debe exhibir cuatro propiedades _ACID_ (acrónimo en inglés).


Propiedades **ACID**
------------------------------------------------------------------------


### Atomicidad
> Una transacción debe ser una unidad atómica de trabajo, tanto si se realizan todas sus modificaciones en los datos, como si no se realiza ninguna de ellas.

### Coherencia
>Cuando finaliza, una transacción debe dejar todos los datos en un estado coherente. En una base de datos relacional, se deben aplicar todas las reglas a las modificaciones de la transacción para mantener la integridad de todos los datos. Todas las estructuras internas de datos, como índices de árbol b o listas doblemente vinculadas, deben estar correctas al final de la transacción.
    
### Aislamiento
> Las modificaciones realizadas por transacciones simultáneas se deben aislar de las modificaciones llevadas a cabo por otras transacciones simultáneas. Una transacción reconoce los datos en el estado en que estaban antes de que otra transacción simultánea los modificara o después de que la segunda transacción haya concluido, pero no reconoce un estado intermedio. Esto se conoce como seriabilidad, ya que deriva en la capacidad de volver a cargar los datos iniciales y reproducir una serie de transacciones para finalizar con los datos en el mismo estado en que estaban después de realizar las transacciones originales.

### Durabilidad
>Una vez concluida una transacción, sus efectos son permanentes en el sistema. Las modificaciones persisten aún en el caso de producirse un error del sistema.


Sistema transaccional
------------------------------------------------------------------------
Un **SGBD** se dice _transaccional_, si es capaz de mantener la 
integridad de los datos, haciendo que estas transacciones no puedan finalizar en un estado intermedio.


Especificar y exigir transacciones
------------------------------------------------------------------------
Los programadores de SQL son los responsables de iniciar y finalizar las transacciones en puntos que exijan la coherencia lógica de los datos. El programador debe definir la secuencia de modificaciones de datos que los dejan en un estado coherente en relación con las reglas de negocios de la organización. El programador incluye estas instrucciones de modificación en una sola transacción de forma que SQL Server Database Engine (Motor de base de datos de SQL Server) puede hacer cumplir la integridad física de la misma.

Es responsabilidad de un sistema de base de datos corporativo, como una instancia de Motor de base de datos, proporcionar los mecanismos que aseguren la integridad física de cada transacción. Motor de base de datos proporciona:

 - Servicios de bloqueo que preservan el aislamiento de la transacción.
 
 - Servicios de registro que aseguran la durabilidad de la transacción. Aunque se produzca un error en el hardware del servidor, el sistema operativo o la instancia de Motor de base de datos, la instancia utiliza registros de transacciones, al reiniciar, para revertir automáticamente las transacciones incompletas al punto en que se produjo el error del sistema.

 - Características de administración de transacciones que exigen la atomicidad y coherencia de la transacción. Una vez iiciada una transacción, debe concluirse correctamente; en caso contrario, la instancia de Motor de base de datos deshará todas las modificaciones de datos realizadas desde que se inició la transacción.


Transacciones y SQL
------------------------------------------------------------------------

El lenguaje de consulta de datos SQL (_Structured Query Language_), provee los mecanismos para especificar que un conjunto de acciones deben constituir una transacción:

 - **BEGIN TRAN**: Especifica que va a empezar una transacción.
 - **COMMIT TRAN**: Le indica al motor que puede considerar la transacción completada con éxito.
 - **ROLLBACK TRAN**: Indica que se ha alcanzado un fallo y que debe restablecer la base al punto de integridad.



[Ir a la sesión 2](./dia_02_transacciones_y_operaciones_atomicas)