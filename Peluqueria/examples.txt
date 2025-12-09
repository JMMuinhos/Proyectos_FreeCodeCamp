#! /bin/bash

echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo "Welcome to My Salon, how can I help you?"

# Función para mostrar servicios en formato EXACTO #) service
SHOW_SERVICES() {
  psql -U freecodecamp -d salon -A -F "|" -t -c "SELECT service_id, name FROM services ORDER BY service_id" \
  | while IFS="|" read SERVICE_ID SERVICE_NAME
    do
      echo "$SERVICE_ID) $SERVICE_NAME"
    done
}

# Mostrar servicios por primera vez
SHOW_SERVICES

# Pedir y validar servicio
while true
do
  read SERVICE_ID_SELECTED

  SERVICE_NAME=$(psql -U freecodecamp -d salon -A -t -c \
  "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")

  if [[ -n $SERVICE_NAME ]]
  then
    break
  else
    echo -e "\nI could not find that service. What would you like today?"
    SHOW_SERVICES
  fi
done

# Pedir teléfono
echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE

# Buscar cliente
CUSTOMER_NAME=$(psql -U freecodecamp -d salon -A -t -c \
"SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

# Si no existe, pedir nombre
if [[ -z $CUSTOMER_NAME ]]
then
  echo "I don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME
  psql -U freecodecamp -d salon -c \
  "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')" >/dev/null
fi

# Pedir hora
echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
read SERVICE_TIME

# Obtener customer_id
CUSTOMER_ID=$(psql -U freecodecamp -d salon -A -t -c \
"SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

# Insertar cita
psql -U freecodecamp -d salon -c \
"INSERT INTO appointments(customer_id, service_id, time)
 VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')" >/dev/null

# Mensaje final EXACTO
echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."

