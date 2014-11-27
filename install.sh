#!/bin/bash

readonly LOGGER=color-logging.bash

echo "Installing..."

if [[ ! -e $LOGGER ]]; then
  echo "Installing color logger"

  wget "https://raw.githubusercontent.com/swyckoff/bash-color-logging/master/$LOGGER"
  chmod 0755 $LOGGER
fi
