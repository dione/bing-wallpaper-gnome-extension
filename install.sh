#!/bin/bash

EXTENSION_NAME=BingWallpaper@ineffable-gmail.com
INSTALL_PATH=~/.local/share/gnome-shell/extensions
mkdir -p $INSTALL_PATH
ZIP_NAME=BingWallpaper@ineffable-gmail.com.zip

./buildzip.sh

mkdir -p $INSTALL_PATH/$EXTENSION_NAME

unzip -o $ZIP_NAME -d $INSTALL_PATH/$EXTENSION_NAME/

# buildzip.sh strips schemas/gschemas.compiled from the archive; recompile
# in place so first-run prefs/extension don't trip
# `GLib.FileError: ... gschemas.compiled ... No such file or directory`.
glib-compile-schemas $INSTALL_PATH/$EXTENSION_NAME/schemas/

gnome-extensions enable $EXTENSION_NAME
