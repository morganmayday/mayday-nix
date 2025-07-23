#!/usr/bin/env bash

homeDir=${0%/*}
echo -n "Desired username (eg, mayday): "
read -n username
echo -n "Desired hostname (eg, medea): "
read -n hostname
