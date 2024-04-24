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
	sed '308 i la UTF-8 \\' $i18n/SUPPORTED > SUPPORTED
	if [ $(wc -l SUPPORTED | sed 's/ .*//g') -gt 400 ]; then
		mv SUPPORTED $i18n/SUPPORTED
	else
		echo "bug in sed"
	fi
fi

if [ -z "$(grep 'la UTF-8' /etc/locale.gen)" ]; then
	sed '314 i la UTF-8' /etc/locale.gen > locale.gen
	if [ $(wc -l locale.gen | sed 's/ .*//g') -gt 400 ]; then
		mv locale.gen /etc/locale.gen
	else
		echo "bug in sed"
	fi
fi
locale-gen
