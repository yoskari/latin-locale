#!/bin/bash
set -e
if [ $EUID != 0 ]; then 
	echo "Please run as root"
	exit
fi
set -x
localedef -i la -f UTF-8 la.UTF-8 -c

i18n=/usr/share/i18n
cp la $i18n/locales/la
if [ -z "$(grep 'la UTF-8' $i18n/SUPPORTED)" ]; then
	sed '308 i la UTF-8' $i18n/SUPPORTED > $i18n/SUPPORTED
fi
locale-gen
