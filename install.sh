#!/bin/bash
set -e

EXTENSION_NAME=BingWallpaper@ineffable-gmail.com
ZIP_NAME=BingWallpaper@ineffable-gmail.com.zip

./buildzip.sh

# `gnome-extensions install` is the official CLI: it unzips into the
# right path, compiles GSettings schemas, registers locales, and
# handles the install/upgrade lifecycle. Replaces the previous
# manual `mkdir -p` / `unzip -o` / `glib-compile-schemas` chain.
gnome-extensions install --force "$ZIP_NAME"

gnome-extensions enable "$EXTENSION_NAME"
