#!/bin/bash

DIR=/root/symfony

# Globally cd to correct directory
cd $DIR || exit

# Nuke existing files and directories
rm ${DIR:?}/* -r -d

# Nuke existing hidden files
rm $DIR/.*

# Create symfony project
symfony new conjure --webapp --dir=$DIR

# Recreate .gitkeep file
touch $DIR/.gitkeep

# Remove initialized git dir
rm $DIR/.git -r -d
