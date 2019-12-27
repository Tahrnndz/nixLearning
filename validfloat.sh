#!/bin/bash

# validfloat--Tests wheter a number is a valid floating-point value.
#   Note THat this script cannot accept scientific (1.304e5) notation.

# To test whether an entered value is a valid floating-point number, 
#   We need to split the value into two parts: the interportion
#   and the fractional portion.  WE test the first part to see whether
#   it's a valid integer, and then we test whether the second part is a 
#   valid >=0 integer.  So -30.5 evaluates as valid, but -30.-8 doesn't

# To inclue another shell script as part of this one, use the "." source
#  notation.  Easy enough.

. validint.sh

validfloat()
{
	fvalue="$1"
	
	# check wheter the input number has a decimal point.
	if [ ! -z $(echo $fvalue | sed 's/[^.]//g') ] ; then
		
		# Extract the part before the decimal point.
		decimalPart="$(echo $fvalue | cut -d. -f1)"
		
		# Extract the dgigits after the decimal point.
		fractionalPart="${fvalue#*\.}"
		
		# Start by testing the decimal part, which is everything
		#   to the left of the decimal point.
		
		if [ ! -z $decimalPart ] ;then
			# "!" reverses test logic, so the following 
			#   if NOT a valid integer"
			if ! validint.sh "$decimalPart" "" "" ; then
				return 1
			fi
		fi
		
		# Now let's test the fractional value.
		
		# to Start, you can't have a negative sign after the decimal point
		#   like 33.-11, so let's test for the '-' sign in the decimal.
		if [ "${fractionPart%${fractionalPart#?}}" = "-" ] ; then
			echo "Invalid floating-point number: '-' not allowed \
				after decimal point." >&2
			return 1
		fi
		if [ "$fractionalPart" != "" ] ; then
			# if the fractional part is not a valid integer...
			if ! validint.sh "$fractionalPart" "0" "" ; then
				return 1
			fi
		fi
	else
		# If the entire value is just "-", that's not good either.
		if [ "$fvalue" = "-" ] ; then
			echo "Invalid floating-point format." >&2
			return 1
		fi
		
		# Finally check that the remaining digits are actually
		#   valid as integers.
		if ! validint.sh "$fvalue" "" "" ; then
			return 1
		fi 
	fi
	
	return 0
}

#if validfloat $1 ; then
#	echo "$1 is a valid floating-point value."
#fi
#exit 0