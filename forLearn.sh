
#!/bin/bash
fruitlist="Apple Pear Tomato Peach Grape Kiwi"
for fruit in $fruitlist
do
   if [ "$fruit" = "Tomato" ] || [ "$fruit" = "Peach" ]
   then
      echo "I like ${fruit}es"
   else 
      echo "I like ${fruit}s"
   fi
done