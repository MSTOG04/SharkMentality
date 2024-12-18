#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "\nWelcome to My Salon, how can I help you?\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  # get available services
  AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  
  # if no services available
  if [[ -z $AVAILABLE_SERVICES ]]
  then
    echo "Sorry, we don't have any service right now"
    
  # display available services
  else
    echo -e "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR SERVICE
    do
      ID_SERVICE=$(echo "$SERVICE_ID" | sed 's/ //g')
      NAME=$(echo "$SERVICE" | sed 's/_/ /g')
      echo "$ID_SERVICE) $NAME"

    done
  fi

  read SERVICE_ID_SELECTED

  # Check valid option
  case $SERVICE_ID_SELECTED in
    [1-5]) CONTINUOS ;;
    *) MAIN_MENU "Sorry, I could not find that service. What would you like today?" ;;
  esac
  
}

CONTINUOS() {

  # Customer Telephone number
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  # Customer Service
  GET_SERVICE=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  SERVICE=$(echo $GET_SERVICE| sed 's/_/ /g')

  #Check if the phone number is registered
  if [[ -z $CUSTOMER ]]
  then

    # Customer Name
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
  
    # Insert New Customer
    NEW_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    
  fi

  # Set Customer
  CUSTOMER=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  # TIME
  echo -e "\nWhat time would you like your $SERVICE,$CUSTOMER?"
  read SERVICE_TIME

  # Get ID Customer
  ID_CUSTOMER=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
 
  # Insert APPOINTMENT
  NEW_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ($ID_CUSTOMER, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

  # Confirmation Appointment

  if [[ $NEW_APPOINTMENT == "INSERT 0 1" ]]
  then 

    echo -e "\nI have put you down for a $SERVICE at $SERVICE_TIME,$CUSTOMER."

  fi
}


MAIN_MENU