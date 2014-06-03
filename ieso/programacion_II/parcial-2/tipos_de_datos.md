# tipos de datos en java

Un dato siempre lleva asociado un tipo de dato, que determina el conjunto de valores que puede tomar.

En Java toda la información que maneja un programa está representada por dos tipos principales de datos:

 - a)     Datos de tipo básico o primitivo.
 - b)     Referencias a objetos.

Los tipos de datos básicos o primitivos no son objetos y se pueden utilizar directamente en un programa sin necesidad de crear objetos de este tipo. La biblioteca Java proporciona clases asociadas a estos tipos que proporcionan métodos que facilitan su manejo. 

## DATOS NUMÉRICOS ENTEROS

En Java los representan los tipos:
> byte, short, int, long.

El tipo de dato numérico entero es un subconjunto finito de los números enteros del mundo real. Pueden ser positivos o negativos.

Ejemplo de declaración de variables enteras:

     int a;
     byte n1, n2;
     short x;

## DATOS NUMÉRICOS REALES

En Java los representan los tipos: float, double.

El tipo de dato numérico real es un subconjunto finito de los números reales. 
Siempre llevan un punto decimal y también pueden ser positivos o negativos. **Los números reales tienen una parte entera y una parte decimal**.
Por ejemplo: 0.08   -54.0001


Ejemplo de declaración de variables reales:

     float peso;
     double longitud;
     float altura = 2.5F;
     double area = 1.7E4; // equivale a 1.7 * 104
     double z = .123; //si la parte entera es 0 se puede omitir
     
## DATOS DE TIPO CARÁCTER

En Java se representa con el tipo `char`.
Un dato de tipo carácter se utiliza para representar un carácter dentro del rango `\u0000` a `\uFFFF` (números desde 0 hasta 65535) en `Unicode`.
En realidad un dato de tipo `char` contiene un número entero dentro del rango anterior que representa un carácter.

En Java se utiliza el código `Unicode` para la representación de caracteres. Este código actualmente representa los caracteres de la mayoría de idiomas escritos en todo el mundo.

Los 127 primeros caracteres de `Unicode` corresponden al código `ASCII`.

La descripción completa del estándar y las tablas de caracteres están disponibles en la página web oficial de `Unicode` <http://www.unicode.org/>.

Ejemplo de declaración de variables de tipo carácter:

     char car;
     char letra1 = 'z';
     char letra = '\u0061'; //código unicode del carácter ‘a’
     
## DATOS DE TIPO LÓGICO.

Se representan con el tipo `boolean`.
Los datos de este tipo sólo pueden contener dos valores: `true` (verdadero) ó `false` (falso).

Ejemplo de declaración de variables lógicas:

     boolean primero;
     boolean par = false;

Los tipos de datos lógicos son también conocidos como `booleanos` en honor del matemático inglés **George Bool**, que desarrolló la teoría conocida como álgebra de `bool` que fue la base para la representación de los circuitos lógicos.

