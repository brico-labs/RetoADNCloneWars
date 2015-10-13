# Generador de ADN CloneWars

## Configuración

Crear el fichero adn-cl.list con los nombres de las impresoras que irán en el
ADN. Un nombre por línea, no más de XXX caracteres por línea. Ejemplo:

  1 Ociorum
  2 BricoTaz
  3 FoldaMoco


## Ejecución para todas las bases del ADN

Desde la línea de comando:

  ./adn-cw.sh < adn-cw.list


## Ejecución para una base de ADN

  echo '2 BricoTaz' | ./adn-cw.sh > 2.stl


