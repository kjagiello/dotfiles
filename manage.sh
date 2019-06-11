#!/usr/bin/env bash

set -e

usage() {
  echo "Usage: $0 [OPTIONS] COMMAND"
  echo ""
  echo "Options"
  echo "  -h  Display this message and quit."
  echo ""
  echo "Commands:"
  echo "  install [module]"
  exit
}

dot__install() {
  [ -z $1 ] && echo "Usage: install [module]" && exit
  [ ! -d "./${1}" ] && echo "ERROR: Module \"${1}\" not found" && exit
  [ -f "./${1}/.init.sh" ] && "./${1}/.init.sh"
  stow --ignore '\.init\.sh' $1
  echo "Module \"${1}\" has been successfully installed."
}

dot() {
  if type "dot__$1" >/dev/null 2>&1; then
    "dot__$1" "${@:2}"
  else
    echo "ERROR: Command \"$1\" not found."
    echo ""
    usage
  fi
}

while getopts "hvf:" optchar
do
  case "${optchar}" in
    h)
      usage
      ;;
    *)
      usage
      ;;
  esac
done

[ -z $1 ] && usage
dot $@
