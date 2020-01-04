for f in /Users/Trey/nixLearning/*.sh.sh ; do
	cutfile=`echo $f | cut -d. -f1`
	# echo $f
	# echo $f
	mv "$f" ${cutfile}.sh
	# echo ${cutfile}.sh
done