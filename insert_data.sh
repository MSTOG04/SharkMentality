#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Script to insert data from insert_dat.csv into worldcup database
PSQL="psql -X --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"
echo $($PSQL "TRUNCATE games, teams RESTART IDENTITY")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do

  if [[ $ROUND != 'round' ]]
  then

    # get game_id
    GAME_ID=$($PSQL "SELECT game_id FROM games WHERE year = '$YEAR' AND winner = '$WINNER' AND opponent = '$OPPONENT' ")
    
    # if not found
    if [[ -z $GAME_ID ]]
    then

      # insert game
      INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner, opponent, winner_goals, opponent_goals) VALUES('$YEAR', '$ROUND', '$WINNER', '$OPPONENT', '$WINNER_GOALS', '$OPPONENT_GOALS')")
      

      if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
      then

        echo "Inserted into games, $YEAR $ROUND $WINNER $OPPONENT $WINNER_GOALS $OPPONENT_GOALS"
      fi

    fi

    # get new game_id
    GAME_ID=$($PSQL "SELECT game_id FROM games WHERE year = '$YEAR' AND winner = '$WINNER' AND opponent = '$OPPONENT'")
  
    # get team_id
    TEAM_ID1=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    TEAM_ID2=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
    

    # if not found
    if [[ -z $TEAM_ID1 ]]
    then
      # insert teams
      INSERT_TEAMS_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      
    fi

    # if not found
    if [[ -z $TEAM_ID2 ]]
    then
      # insert teams
      INSERT_TEAMS_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      
    fi

  fi

done