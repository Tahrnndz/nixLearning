
#!/bin/bash
if [ "$1" = "1" ]
then
   echo "The first choice is nice"
elif [ "$1" = "2" ]
then
   echo "The second choice is just as nice"
elif [ "$1" = "3" ]
then
   echo "The third choice is excellent"
else
   echo "I see you were wise enough not to choose"
   echo "You win"
fi