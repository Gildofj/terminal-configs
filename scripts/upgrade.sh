#!/bin/bash

upgrade() {
  sudo apt update &
  wait
  sudo apt-fast upgrade -y && sudo apt-fast dist-upgrade -y
}

upgrade
