# Nuke existing files and directories
rm ./* -r -d

# Nuke existing hidden files
rm ./.*

# Create symfony project
symfony new conjure --webapp --dir=.

# Remove initialized git dir
rm .git -r -d
