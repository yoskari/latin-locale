# Latin Language Locale for GNU/Linux
Due to glibc missing a Latin locale I decided to create one myself.
I made the locale as neutral as possible, aiming to create a regionless locale
similar to the Esperanto locale (eo).
I stuck mostly with the i18n defaults, because most things specified in the 
locale configuration are arbitrary for Latin. I used the [Unicode locale data 
summary for Latin](https://www.unicode.org/cldr/charts/45/summary/la.html) 
as a base for the locale. I took some inspiration from the Esperanto locale,
as it is presently the only other locale lacking a country code. The default
date formats mirror either the default C locale or the Esperanto locale. I did
however include the Roman numerals 0-99 as alternative digits, should someone
want to represent dates in a more classical way using strftime's %O format modifier.

## Install
If you want to install the locale, you can use the following commands:
```bash
localedef -i la -f UTF-8 la.UTF-8
# add the line "la UTF-8" to /usr/share/i18n/SUPPORTED and /etc/locale.gen
locale-gen
```
