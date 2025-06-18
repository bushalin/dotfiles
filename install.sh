#!/bin/bash

RCol='\033[0m'
Green='\033[0;32m'
Red='\033[0;31m'
Yellow='\033[0;33m'

function g_echo() {
  echo -e "${Green}[message] $1${RCol}"
}
function r_echo() {
  echo -e "${Red}[error] $1${RCol}"
}
function y_echo() {
  echo -e "${Yellow}[warning] $1${RCol}"
}

function check_package() {
  command -v $1 > /dev/null 2>&1
  if [[ $? -eq 0 ]]; then
    echo 1
  else
    echo 0
  fi
}

# Minimal installation:
# install fzf
# install silver searcher
# install nvim

(check_package hasib &> /dev/null) && echo "package found" || r_echo "package not found... installing..."
