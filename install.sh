#!/bin/bash

set -e

readonly VERSION=$(cat .version)

readonly INSTALL_DIR=/usr/local/bin
readonly LOGGER=color-logger.bash

install_logger() {
  echo "Installing $LOGGER to $INSTALL_DIR"

  chmod 0755 "$LOGGER"
  cp "$LOGGER" "$INSTALL_DIR/$LOGGER"
}

if [[ ! -e "$INSTALL_DIR/$LOGGER" ]]; then
  install_logger
elif [[ ! "$VERSION" == $("$LOGGER" -v) ]]; then
  install_logger
else
  echo "Nothing to install, you have version $VERSION"
fi
