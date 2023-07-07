#!/usr/bin/env bash

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     echo $(stat --printf=%g /var/run/docker.sock) > .devcontainer/.docker.group ;;
    Darwin*)    echo 999 > .devcontainer/.docker.group ;;
    CYGWIN*)    echo $(stat --printf=%g /var/run/docker.sock) > .devcontainer/.docker.group ;;
    MINGW*)     echo $(stat --printf=%g /var/run/docker.sock) > .devcontainer/.docker.group ;;
    *)          echo 1 > .devcontainer/.docker.group
esac
