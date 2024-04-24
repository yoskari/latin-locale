import locale
from datetime import datetime

locales = ["la", "fi_FI.UTF-8", "it_IT.UTF-8", "C"]
for l in locales:
    print(l)
    locale.setlocale(locale.LC_TIME, l)
    now = datetime.now()
    print(now.strftime("""
        date: %x
        time: %X
        datetime: %c
    """))
