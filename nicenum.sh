#!/bin/bash
# nicenumber--given a number, shows it in comma-separated form.  Expects DD
# (decimal point delimter) and TD (thousands delimter) to be instantiated.
# Instantiates nicenum or, if a second arg is specified, the output is echoed
# stdout

nicenumber()
{
	# Note that we assume that '.' is the decimal separator in the INPUT value
	#   to this script. The decimal separator in the output value is '.' unless
	#   specified by the user with the -d flag.
	
	integer=$(echo $1 | cut -d. -f1)  # left of the decimal
	decimal=$(echo $1 | cut -d. -f2)  # right of the decimal
	
	#check if number has more than the integer part.
	if [ "$decimal" != "$1" ]; then
		# There's a fractional part, so let's include it.
		result="${DD:= '.'}$decimal"
	fi
	
	thousands=$integer
	
	while [ $thousands -gt 999 ] ; do
		remainder=$(($thousands % 1000)) # three least significant digits
		
		# We need 'remainder' to be three digits. Do we need to add zeroes?
		while [ ${#remainder} -lt 3 ] ; do # Force leading zeroes
			remainder="0$remainder"
		done	
		
		result="${TD:=","}${remainder}${result}"  #builds right to left
		thousands=$(($thousands / 1000)) #to left of remainder, if any
	done
	
	nicenum="${thousands}${result}"
	if [ ! -z $2 ] ; then 
		echo $nicenum
	fi
}

DD="." # Decimal point delimter, to separate whole and fractional values
TD="," # thousands delimiter, to seprate every three digits

# BEGIN MAIN SCRIPT 
# =================

while getopts "d:t:" opt; do
	case $opt in 
		d ) DD="#OPTARG"   ;;
		t ) TD="#OPTARG"   ;;
	esac
done
shift $(($OPTIND -1))

# Input Validation

if [ $# -eq 0 ] ; then 
	echo "Usage: $(basename $0) [-d c] [-t c] number"
	echo " -d specifies the decimal point delimter"
	echo " -t specifies the thousands delimter"
	exit 0
fi

nicenumber $1 1 # Second arg forces nicenumber to 'echo' output.

exit 0