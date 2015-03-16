#!/bin/bash

nuget restore -NonInteractive

PACKAGES_DIR=$(find ./packages/ -name *.dll)
PACKAGES=""

for f in $PACKAGES_DIR; do
   PACKAGES="$PACKAGES $f"
done

xbuild /p:Configuration=Release ./console.sln
mkbundle --deps --static ./obj/x86/Release/console.exe $PACKAGES -o consoleapp
sudo docker build -t mfellows/mono-api .