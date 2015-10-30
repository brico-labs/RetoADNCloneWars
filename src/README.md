
# Generador de ADN CloneWars

El _script bash adn-cw.sh_ se encarga de generar los ficheros STL a partir de
la lista de clones y el modelo OpenSCAD del fichero _adn-cw.scad_.

Los STL se generan en el [directorio stl][STL01].

## Configuración

Crear el fichero adn-cl.list con los nombres de las impresoras que irán en el
ADN. Un nombre por línea, no más de XXX caracteres por línea. Ejemplo:

  1 R2D2
  2 Death Star
  3 Maese Artorius


## Ejecución para todas las bases del ADN

Desde la línea de comando:

  ./adn-cw.sh < adn-cw.list


## Ejecución para una base de ADN

  echo '479 Moco' | ./adn-cw.sh > ../stl/479.stl



# Secuenciador virtual

El secuenciador virtual genera una imagen de como se ve el ADN CloneWars a
partir de las pruseótidos impresos por los miembros de CloneWars y enviados a
la Oshwdem 2015 para el reto #ADNCloneWars.

## Funcionamiento

El _script Bash sequence-update.sh_ descarga la lista de pruseótidos impresos, 
genera un nuevo fichero OpenSCAD con la secuencia ADN y una imagen de la vista
3D.

Desde la _Google Calc_ se define el color de cada pruseótido (columna 'OpenSCAD 
Color'). Sólo se toman los que tienen la columna _Impreso_ a valor _SI_.



[STL01]: https://github.com/brico-labs/RetoADNCloneWars/tree/master/stl
