#!/bin/bash

# Conexión a la base de datos
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# Si no hay argumento, mostrar mensaje y salir
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  exit
fi

INPUT=$1

# Determinar si el input es un número o texto
if [[ $INPUT =~ ^[0-9]+$ ]]
then
  CONDITION="e.atomic_number = $INPUT"
else
  CONDITION="e.symbol ILIKE '$INPUT' OR e.name ILIKE '$INPUT'"
fi

# Consultar la base de datos
ELEMENT=$($PSQL "SELECT e.atomic_number, e.name, e.symbol, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius
FROM elements e
JOIN properties p USING(atomic_number)
JOIN types t USING(type_id)
WHERE $CONDITION;")

# Si no existe el elemento
if [[ -z $ELEMENT ]]
then
  echo "I could not find that element in the database."
  exit
fi

# Separar campos y mostrar la información
echo $ELEMENT | while IFS='|' read ATOMIC_NUMBER NAME SYMBOL TYPE MASS MELTING BOILING
do
  echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
done