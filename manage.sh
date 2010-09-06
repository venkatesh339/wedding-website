#!/bin/bash

function print_usage()
{
  echo "usage: $0 MODE"
  echo ""
  echo "MODE is one of the following:"
  echo "  server    : start the development server"
  echo "  push      : push changes to repository"
  echo "  pull      : pull changes from repository"
  echo "  rebase    : rebase changes onto origin"
  echo ""
}

if [ $# -lt 1 ]; then
  print_usage
  exit 1
fi

mode=$1
shift

case $mode in
  "server" )
    google_appengine/dev_appserver.py website
    ;;
  "push" )
    git push origin master
    ;;
  "pull" )
    git pull origin
    ;;
  "rebase" )
    git fetch
    git rebase origin/master
    ;;
  * )
    echo "Unknown mode: $mode"
    print_usage
    exit 1
esac
