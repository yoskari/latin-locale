# Latin Language Locale for glibc
Due to glibc missing a Latin locale I decided to create one myself.
I'm trying to make the locale as neutral as possible and stick to the 
specifications in https://www.unicode.org/cldr/charts/45/summary/la.html
when necessary. Mostly I stuck with the i18n defaults since most things 
specified in the locale configuration are arbitrary for Latin because of the
usages varying widely throughout history.

## Install
Compile and install the locale after possible edits to your liking:
```
sudo ./install.sh
```

try it out:
```
LC_TIME=la date
python test.py
```

If for some reason you want to use your Linux distribution in Latin,
Linux Mint Cinnamon seems to have a lot of translation done and works out of the box
when you install the locale and set it as your language
