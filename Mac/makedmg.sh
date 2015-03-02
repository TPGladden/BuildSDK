#!/bin/sh
#
# Script to create a dmg from a source dir
#
# usage:
#    mkdmg <volname> <vers> <srcdir>
#
# The output will be a file called <outputFile>.dmg
# with the mounted volume name of <volname>

if [ $# != 3 ]; then
 echo "usage: mkdmg.sh volname srcdir outputFile"
 exit 0
fi

VOL="$1"
FILES="$2"
OUTPUT="$3"

# set up a temp dmg name for creation
DMG="${OUTPUT}-temp.dmg"

# create the dmg from a source dir
hdiutil create "$DMG" -srcfolder "$FILES" -ov -volname "$VOL"

# convert to compressed image
hdiutil convert "$DMG" -format UDZO -o "${OUTPUT}.dmg"

# delete the temp dmg
rm -f "$DMG"


#Creating an ISO with hdiutil
#The most reliable method is uses hdiutil, here is the syntax:

# hdiutil makehybrid -iso -joliet -o image.iso /path/to/source

#Here’s an example, creating an iso from a Windows 7 installer disc, with the end result showing up on the desktop:

# hdiutil makehybrid -iso -joliet -o ~/Desktop/Windows7.iso /Volumes/Windows\ 7\ Install