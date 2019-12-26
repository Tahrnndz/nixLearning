#!/bin/bash
count=$1                                   # Initialise count to first parameter 
while [ $count -gt 0 ]                     # while count is greater than 10 do
do
   echo $count seconds till supper time!
   count=$(($count -1))                 # decrement count by 1
   sleep 1                                 # sleep for a second using the Unix sleep command
done
echo Supper time!!, YEAH!!                 # were finished