#!/bin/bash
# inpath.sh--Verifies that a specified program is either valid as is
#  or can be found in the PATH directory list

in_path()
{
  # Given a command and the PATH, tries to find the command. Returns 0 if
  #   found and executable: 1 if not. note that this temporarily modiefes 
  #   the IFS (internal field separator) but restores it upon completion.

 cmd=$1       ourpath=$2    result=1
 oldIFS=$IFS  IFS=":"
# echo paths = $ourpath
 for directory in $ourpath #removed "$ourpath" quotes for test worked when removed
 do
#	 echo "in directory loop"
#	 echo $directory
   if [ -x "$directory/$cmd" ] ; then
#	   echo "$directory/$cmd"
     result=0        #if we're here, we found the command.
#	 echo result = $result
   fi
 done
 IFS=$oldIFS
 return $result
}

checkForCmdInPath()
{
  var=$1
 # echo "In checkForCmdInPath"
 # echo var = $var
  if [ "$var" != "" ] ; then
    if [ "${var:0:1}" = "/" ] ; then
 #		echo "in slice"
      if [ ! -x $var ] ; then
 #		  echo "in after slice"
        return 1
      fi
    elif ! in_path $var "$PATH" ; then
 #		echo "in elif"
      return 2
    fi
  fi
}

if [ $# -ne 1 ] ; then
  echo "Usage: $0 command" >&2 
  exit 1
fi

#checkForCmdInPath "$1"
#case $? in
#  0 ) echo "$1 found in PATH"                    ;;
#  1 ) echo "$1 not found or not executable"      ;;
#  2 ) echo "$1 not found in PATH"                ;;
#esac

#exit 0
