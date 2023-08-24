#!/bin/sh
if [ -z "${OPENCONNECT_URL}" ]; then
  printf "\e[31m\$OPENCONNECT is not set\n\e[0m"
  exit 1
fi
printf "\e[33mURL:\e[0m %s \n" "${OPENCONNECT_URL}"

if [ -z "${OPENCONNECT_USER}" ]; then
  printf "\e[31m\$OPENCONNECT_USER is not set\e[0m\n"
  exit 2
fi
printf "\e[33mUsername:\e[0m %s\n" "${OPENCONNECT_USER}"

if [ -z "${OPENCONNECT_PASSWD}" ]; then
  printf "\e[31m\$OPENCONNECT_PASSWD is not set\e[0m\n"
  exit 3
fi

OPENCONNECT_ARGS="${OPENCONNECT_OPT} --background --user=${OPENCONNECT_USER} --passwd-on-stdin ${OPENCONNECT_URL}"
echo "${OPENCONNECT_PASSWD}"  | openconnect ${OPENCONNECT_ARGS}
3proxy /etc/3proxy/3proxy.cfg
