#!/bin/bash

# Get the directory of the main script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Call the sister script in the same directory
${DIR}/symfony-prepare.bash
${DIR}/symfony-database.bash
