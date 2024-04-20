#!/bin/sh
set -e
set -u

RCol='\033[0m'
Gre='\033[0;32m'
Red='\033[0;31m'
Yel='\033[0;33m'

## printing functions ##
function green_ {
  echo "${Gre}[message] $1${RCol}"
}

function yellow_ {
  echo "${Yel}[warning] $1${RCol}"
}

function wecho {
  # red, but don't exit 1
  echo "${Red}[error] $1${RCol}"
}


function recho {
  echo "${Red}[error] $1${RCol}"
  exit 1
}

## install functions ##

# check for pre-req, fail if not found
function check_preq {
  (command -v $1 > /dev/null  && green_ "$1 found...") || 
    recho "$1 not found, install before proceeding."
}

function check_package {
    (brew ls --versions $1 > /dev/null && green_ "$1 found...") ||
        recho "$1 not found, install before proceeding."
}

# look for command line tool, if not install via homebrew
function install_brew {
  (command -v $1 > /dev/null  && green_ "$1 found...") || 
    (yellow_ "$1 not found, installing via homebrew..." && brew install $1)
}

# function for linking dotfiles
function linkdotfile {
  file="$1"
  if [ ! -e ~/$file -a ! -L ~/$file ]; then
      yellow_ "$file not found, linking..." >&2
      ln -s ~/dotfiles/$file ~/$file
  else
      green_ "$file found, ignoring..." >&2
  fi
}

echo $(pwd)
# are we in right directory?
[[ $(basename $(pwd)) == "dotfiles" ]] || 
  recho "doesn't look like you're in dotfiles/"

# check_package nvim

echo "BANG!!" >&1
