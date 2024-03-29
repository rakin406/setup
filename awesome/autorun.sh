#!/usr/bin/env bash

function run {
  if ! pgrep -f "$1" ; then
    $@&
  fi
}

run nitrogen --restore
run picom --config "$HOME"/.config/picom/picom.conf --daemon
