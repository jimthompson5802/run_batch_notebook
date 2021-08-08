#!/bin/bash

# retrieve notebook to run as batch process
notebook=${1}

# remove notebook name so to be able to pass rest of the arguments
# to the batch process
shift 1

jupyter nbconvert --to script --stdout ${notebook} | python - ${@}