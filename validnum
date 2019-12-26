#1/bin/bash
#validAlphaNum--ensures that input consists of only alphabetical and numeric characters

validAlphaNum()
{
  # Validate arg: returns 0 if all upper+lower+digits; 1 otherwise
  # Remove all unacceptable chars. 
  validchars="$(echo $1 | sed -e 's/[^[:alnum:]]//g')"

  if [ "$validchars" = "$1" ] ; then
	  return 0
  else 
	  return 1
  fi
}

# BEGIN MAIN SCRIPT--delete or comment everything below this line 
# if you want to include this in other scripts.
# =================
#/bin/echo -n "Enter input: "
#read input

#input validation
#if ! validAlphaNum "$input" ; then
#	echo "Please enter only letters and numbers." >&2
#	exit 1
#else
#	echo "input is valid."
#fi

#exit 0