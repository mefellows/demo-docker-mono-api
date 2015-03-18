#!/bin/bash

# This is used from the CI image to compile and build the app into a static binary.
nuget restore -NonInteractive

PACKAGES_DIR=$(find /usr/src/app/source/packages/ -name *.dll)
PACKAGES=""

for f in $PACKAGES_DIR; do
   PACKAGES="$PACKAGES $f"
done

echo "Found packages: ${PACKAGES}"
xbuild /p:Configuration=Release /property:OutDir=/usr/src/app/build/ ./console.sln
mkbundle --deps --static ./obj/x86/Release/console.exe $PACKAGES -o consoleapp