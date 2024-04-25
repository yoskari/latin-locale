#!/bin/bash
set -e
if [ $EUID != 0 ]; then 
	echo "Please run as root"
	exit
fi
set -x

locale=la
if [ $1 ]; then
	locale=$1
fi

localedef -i $locale -f UTF-8 $locale.UTF-8 -c

i18n=/usr/share/i18n
cp $locale $i18n/locales/$locale
if [ -z "$(grep "$locale UTF-8" $i18n/SUPPORTED)" ]; then
	sed "308 i $locale UTF-8 \\" $i18n/SUPPORTED > SUPPORTED
	if [ $(wc -l SUPPORTED | sed 's/ .*//g') -gt 400 ]; then
		mv SUPPORTED $i18n/SUPPORTED
	else
		echo "bug in sed"
	fi
fi

if [ -z "$(grep "$locale UTF-8" /etc/locale.gen)" ]; then
	sed "314 i $locale UTF-8" /etc/locale.gen > locale.gen
	if [ $(wc -l locale.gen | sed 's/ .*//g') -gt 400 ]; then
		mv locale.gen /etc/locale.gen
	else
		echo "bug in sed"
	fi
fi
locale-gen
