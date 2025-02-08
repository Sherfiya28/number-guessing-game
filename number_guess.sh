#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess --no-align --tuples-only -c"
echo -e "\n ~~~~~Number Guessing Game~~~~~\n"

SECRET_NUMBER=$(( $RANDOM % 1000 + 1 ))

echo "Enter your username: "
read USERNAME

RETURNING_USER=$($PSQL "SELECT username FROM users WHERE username='$USERNAME'")

if [[ -z $RETURNING_USER ]]
then
  INSERTED_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  echo "Welcome, $USERNAME! It looks like this is your first time here."

else
  GAMES_PLAYED=$($PSQL "SELECT count(*) FROM games INNER JOIN users USING(user_id) WHERE username = '$USERNAME'")
  BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games INNER JOIN users USING(user_id) WHERE username = '$USERNAME'")
  echo GAMES_PLAYED
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."

fi

# Grab user_id
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
echo $USER_ID

 echo "Guess the secret number between 1 and 1000:"
 read GUESS
 NUMBER_OF_GUESSES=1
 while [[ ! $GUESS -eq $SECRET_NUMBER ]]
 do 

  NUMBER_OF_GUESSES=$(expr $NUMBER_OF_GUESSES + 1 )

   if [[ ! $GUESS =~ ^[0-9]+$ ]]
    then
      echo "That is not an integer, guess again:"
      read GUESS

  else
    if [[ $GUESS -lt $SECRET_NUMBER ]]
      then
        echo "It's higher than that, guess again:"
        read GUESS

    elif [[ $GUESS -gt $SECRET_NUMBER ]]
      then
        echo "It's lower than that, guess again:"
        read GUESS

    fi

  fi
  
done

# insert data from game
INSERTED_GAME=$($PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID, $NUMBER_OF_GUESSES)")
echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
