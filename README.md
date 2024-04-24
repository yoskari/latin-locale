# Latin Language Locale for glibc
Due to glibc missing a Latin locale I decided to create one myself.
I'm trying to make the locale as neutral as possible and avoid using formats
associated with a particular era of Latin.
I stuck mostly with the i18n defaults, because most things specified in the 
locale configuration are arbitrary for Latin. I used the [Unicode locale data 
summary for Latin](https://www.unicode.org/cldr/charts/45/summary/la.html) 
as a base for my locale, but had to take some creative liberties.

## Install
Compile and install the locale after possible edits to your liking.
```
sudo ./install.sh
```

If for some reason you want to use your Linux distribution in Latin,
Linux Mint Cinnamon seems to have a lot of translation done and works out of the box
when you install the locale and set it as your language

## LC_TIME
This is the part of the locale I wrestled with the most. The problem is that Latin
lacks a universal standard for describing dates and many different formats have
been used accross history. I ended up using universal modern formats and
taking inspiration from the formats of existing locales, like using 
abbreviated names of weekdays and months for *datetime*.
```
locale: en_US.UTF-8
        date: 04/24/2024
        time: 01:52:27 PM
        datetime: Wed 24 Apr 2024 01:52:27 PM

locale: es_ES.UTF-8
        date: 24/04/24
        time: 13:52:27
        datetime: mié 24 abr 2024 13:52:27

locale: fr_FR.UTF-8
        date: 24/04/2024
        time: 13:52:27
        datetime: mer. 24 avril 2024 13:52:27

locale: it_IT.UTF-8
        date: 24/04/2024
        time: 13:52:27
        datetime: mer 24 apr 2024, 13:52:27

locale: la
        date: 2024-04-24
        time: 13:52:27
        datetime: Mer 24 Apr 2024 13:52:27
```

While Roman numerals could perhaps be cool and perhaps more appropriate for date
and time, strftime only allows specifying 100 alternative numerals, 
which excludes a 4-digit year representation. This would also again raise the
question of date formats aswell normal digital time representation not working
in Roman numerals. I did however add the numbers 0-99 as alternative digits
although they are not used by default in any formatting. But if you want to
you can do things like this.
```
$ LC_TIME=la date +"hodie est die %Od mensis %B MM%Oy"
die XXIV mensis Aprilis MMXXIV
```
