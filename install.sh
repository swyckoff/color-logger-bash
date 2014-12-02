#!/bin/bash

set -e

readonly VERSION=$(cat .version)

readonly INSTALL_DIR=/usr/local/bin
readonly LOGGER=color-logger.bash

readonly LOGGER_VERSION=$("$LOGGER" -v)

if [[ ! -e "$INSTALL_DIR/$LOGGER"  || ! "$VERSION" == "$LOGGER_VERSION" ]]; then
  echo "Installing $LOGGER to $INSTALL_DIR"

  chmod 0755 "$LOGGER"
  cp "$LOGGER" "$INSTALL_DIR/$LOGGER"
else
  echo "Nothing to install, you have version $VERSION"
fi
