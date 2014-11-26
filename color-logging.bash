#!/bin/bash
# Some credit to https://github.com/maxtsepkov/bash_colors/blob/master/bash_colors.sh
#
# Constants and functions for terminal colors. Not using tput :x
# Author: Steve Wyckoff  
# Version: 0.5.0

COLOR_ESC="\x1B["

COLOR_RESET=0             # reset all attributes to their defaults
COLOR_RESET_UNDERLINE=24  # underline off
COLOR_RESET_REVERSE=27    # reverse off
COLOR_DEFAULT=39          # set underscore off, set default foreground color
COLOR_DEFAULTB=49         # set default background color

COLOR_BOLD=1              # set bold
COLOR_BRIGHT=2            # set half-bright (simulated with color on a color display)
COLOR_UNDERSCORE=4        # set underscore (simulated with color on a color display)
COLOR_REVERSE=7           # set reverse video

COLOR_BLACK=30            # set black foreground
COLOR_RED=31              # set red foreground
COLOR_GREEN=32            # set green foreground
COLOR_BROWN=33            # set brown foreground
COLOR_BLUE=34             # set blue foreground
COLOR_MAGENTA=35          # set magenta foreground
COLOR_CYAN=36             # set cyan foreground
COLOR_WHITE=37            # set white foreground

COLOR_BLACK_BG=40           # set black background
COLOR_RED_BG=41             # set red background
COLOR_GREEN_BG=42           # set green background
COLOR_BROWN_BG=43           # set brown background
COLOR_BLUE_BG=44            # set blue background
COLOR_MAGENTA_BG=45         # set magenta background
COLOR_CYAN_BG=46            # set cyan background
COLOR_WHITE_BG=47           # set white background

COLOR_INFO=$COLOR_MAGENTA
COLOR_HIGHLIGHT=$COLOR_CYAN
COLOR_WARN=$COLOR_BROWN
COLOR_ERROR=$COLOR_RED

# General function to wrap string with escape seqence(s).
# Ex: console_escape foobar $CLR_RED $CLR_BOLD
escape() {
  local result="$1"
  until [ -z "$2" ]; do
    if ! [ $2 -ge 0 -a $2 -le 47 ] 2>/dev/null; then
      echo "escape: argument \"$2\" is out of range" >&2 && return 1
    fi
    result="${COLOR_ESC}${2}m${result}${COLOR_ESC}${COLOR_RESET}m"
    shift || break
  done
  echo -ne "$result"
}

declare mode

info(){
  mode=$COLOR_INFO
  escape "$1" $COLOR_INFO
  echo
}

warn(){
  mode=$COLOR_WARN
  escape "$1" $COLOR_WARN
  echo
}

error(){
  mode=$COLOR_ERROR
  escape "$1" $COLOR_ERROR
  echo
}

highlight(){
  escape "$1" $COLOR_HIGHLIGHT 
  printf "${COLOR_ESC}${mode}m"
}

list_colors(){
  local T='gYw'

  echo -e "\n                 40m     41m     42m     43m     44m     45m     46m     47m";

  for FGs in '   0m' '   1m' '  30m' '1;30m' '  31m' '1;31m' \
    '  32m' '1;32m' '  33m' '1;33m' '  34m' '1;34m' \
    '  35m' '1;35m' '  36m' '1;36m' '  37m' '1;37m';
do
  FG=${FGs// /}
  echo -en " $FGs \033[$FG  $T  "
  for BG in 40m 41m 42m 43m 44m 45m 46m 47m; do
    echo -en " \033[$FG\033[$BG  $T  \033[0m";
  done
  echo;
done

}

show_help() {
  cat << EOF
  Usage: [-hl]
  Helpful logging for bash scripts. 

  -h          display this help and exit
  -c          show colors
EOF
}

OPTIND=1
while getopts "hl" opt; do
  case "$opt" in
    h)
      show_help
      exit 0
      ;;
    l)
      list_colors
      exit 0
      ;;
    '?')
      show_help >&2
      exit 1
      ;;
  esac
done

shift "$((OPTIND-1))" # Shift off the options and optional --.
