#!/bin/bash
#validint--Validates inteer input, allowing negative integers too

validint()
{
	#  Validate first field and test that value against min value $2 and/or
	#    max value $3 if they are supplied. If the value isn't within range
	#    or it's not composed of just digits, fail.
	
	number="$1";    min="$2"    max="$3"
	
	if [ -z $number ] ; then
		echo "You didn't enter anything. Please enter a number. " >&2
		return 1
	fi
	
	# Is the first character a '-' sign?
	if [ "${number%${number#?}}" = "-" ] ; then
		testvalue="${number#?}" # grab all but the first character to test
	else
		testvalue="$number"
	fi
	
	#  Create a version of the number that has no digits for testing.
	nodigits="$(echo $testvalue | sed 's/[[:digit:]]//g')"
	
	#  Check for nondigit characters.
	if [ ! -z $nodigits ] ; then
		echo "Invalid number format ! ONly Digits, no commas, spaces, etc." >&2
		return 1
	fi
	
	if [ ! -z $min ] ; then
		# Is the input les than the minimum value?
		if [ "$number" -lt "$min" ] ; then
			echo "Your value is too small: smallest acceptable value is $min. " >&2
			return 1
		fi
	fi
	if [ ! -z $max ] ; then
		# is the input greater than th emaximu value?
		if [ "$number" -gt "$max" ] ; then
			echo "Your value is too big: largest acceptable value is $ max." >&2
			return 1
		fi
	fi
	return 0
}

#input validation
if validint "$1" "$2" "$3" ; then
	echo "Input is valid integer within your constraints."
fi