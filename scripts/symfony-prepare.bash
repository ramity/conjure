#!/bin/bash

SYMFONY_SOURCE_DIR="/root/symfony"
SYMFONY_BACKUP_DIR="/root/symfony-backup"

# Ensure source files are deleted
if [ "$(ls -A $SYMFONY_SOURCE_DIR)" ]; then
    # Clear source
    rm $SYMFONY_SOURCE_DIR/* -r -d
    rm $SYMFONY_SOURCE_DIR/.*
fi

# Check if backup exists
if [ -d "$SYMFONY_BACKUP_DIR" ]; then
    # Copy from backup
    cp -r $SYMFONY_BACKUP_DIR/* $SYMFONY_SOURCE_DIR
    cp -r $SYMFONY_BACKUP_DIR/.* $SYMFONY_SOURCE_DIR
    echo "Restored base symfony application from backup."
    exit 0
fi

# Ensure SYMFONY_SOURCE_DIR is owned by root to avoid dubious ownership error
chown -R root:root $SYMFONY_SOURCE_DIR

# Create symfony project
symfony new conjure --webapp --dir=$SYMFONY_SOURCE_DIR

# Cleanup post generation
touch $SYMFONY_SOURCE_DIR/.gitkeep
rm $SYMFONY_SOURCE_DIR/.git -r -d

# Revert to default ownership
chown -R 1000:1000 $SYMFONY_SOURCE_DIR

# Enter source directory and add composer packages
cd $SYMFONY_SOURCE_DIR

# Add conjure commands repo
composer config repositories.ramity/conjure-commands path /root/conjure-commands
composer require --dev ramity/conjure-commands:dev-main@dev

# Replace remote with local maker-bundle repo
composer config repositories.symfony/maker-bundle path /root/maker-bundle
composer require --dev symfony/maker-bundle:dev-main@dev

# Update deps
composer update
echo "Generated base symfony application."

# TODO - UPDATE .ENV VAR PRIOR TO COPYING TO BACKUP
# TODO - USE DOCKER ENV_FILE TO SET ABOVE .ENV VARS

# Backup source directory
echo "Backing up base symfony application for future executions..."
mkdir $SYMFONY_BACKUP_DIR
cp -r $SYMFONY_SOURCE_DIR/* $SYMFONY_BACKUP_DIR
cp -r $SYMFONY_SOURCE_DIR/.* $SYMFONY_BACKUP_DIR
echo "Completed."
