# Clases abstractas:

> Algo abstracto no puede materializarse.

Una clase abstracta puede contener métodos no-abstractos pero **al menos uno de los métodos debe ser abstracto**.

**Para declarar una clase o un método abstracto, se utiliza** la palabra reservada **abstract**.

**Los métodos abstractos** se declaran pero no se implementan, es decir **no tienen bloque código**(encerrado entre {}).


## Ejemplo clase abstracta:

El siguiente ejemplo nos muestra una clase abstracta con nombre `GeoBase` de la cual heredan las clases: `Cuadrado`, `Rectangulo`, `Circunferencia` las cuales implementan los métodos abstractos: `info`, `area`.

> ### [Geometria.java](Geometria.java)


### Trabajo con [Geometria.java](Geometria.java)

 - Agregar el método abstracto `perimetro`, en la clase `GeoBase`.
 - Implementar el método `perimetro` que calcule el perímetro de la figura geométrica en cuestión.
 - Enviar el ejercicio a <a href="mailto:chanerec@gmail.com?subject='Programacion II - parcial 3, tarea Clase abstracta GeoBase'">chanerec@gmail.com</a>