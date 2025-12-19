#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Pedir username al empezar
echo "Enter your username:"
read USERNAME

# Obtener datos del usuario si existe
USER_DATA=$($PSQL "SELECT games_played, best_game FROM users WHERE username='$USERNAME'")

if [[ -z $USER_DATA ]]; then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  # Insertar usuario nuevo sin mostrar salida
  $PSQL "INSERT INTO users(username) VALUES('$USERNAME')" >/dev/null
else
  GAMES_PLAYED=$(echo $USER_DATA | cut -d'|' -f1)
  BEST_GAME=$(echo $USER_DATA | cut -d'|' -f2)
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Número secreto aleatorio entre 1 y 1000
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
NUMBER_OF_GUESSES=0

echo "Guess the secret number between 1 and 1000:"

while true; do
  read GUESS
  ((NUMBER_OF_GUESSES++))

  # Validar que sea un entero
  if ! [[ $GUESS =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi

  if (( GUESS < SECRET_NUMBER )); then
    echo "It's higher than that, guess again:"
  elif (( GUESS > SECRET_NUMBER )); then
    echo "It's lower than that, guess again:"
  else
    echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
    break
  fi
done

# Obtener datos actuales otra vez por si es primer juego
USER_DATA=$($PSQL "SELECT games_played, best_game FROM users WHERE username='$USERNAME'")
GAMES_PLAYED=$(echo $USER_DATA | cut -d'|' -f1)
BEST_GAME=$(echo $USER_DATA | cut -d'|' -f2)

((GAMES_PLAYED++))

# Actualizar best_game si es el mejor
if [[ -z $BEST_GAME ]] || (( NUMBER_OF_GUESSES < BEST_GAME )); then
  BEST_GAME=$NUMBER_OF_GUESSES
fi

# Actualizar DB sin mostrar salida
$PSQL "UPDATE users SET games_played=$GAMES_PLAYED, best_game=$BEST_GAME WHERE username='$USERNAME'" >/dev/null