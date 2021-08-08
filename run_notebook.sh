#!/bin/bash

# arguments to the bash script
#  $1 is the name of the notebook to run in batch
#  $2, $3, ... are the run-time arguments for the batch run

# retrieve notebook to run as batch process
notebook=${1}

# remove notebook name argument to get access to rest of the arguments
# to pass to the batch process
shift 1

# use nbconvert command to convert from notebook format to native Python code
# pass the Pyhon code via stdout to the Python interpreter's stdin
# and run the program with any specified command line arguments
jupyter nbconvert --to script --stdout ${notebook} | python - ${@}
