import re
import locale
from datetime import datetime

# get enabled locales
locales = ["C"]
with open("/etc/locale.gen", "r") as f:
    for line in f:
        if line.startswith("#"):
            continue
        parts = line.split()
        if len(parts) == 2:
            locales.append(parts[0])

for l in locales:
    try:
        locale.setlocale(locale.LC_TIME, l)
    except:
        continue
    print(f"locale: {l}")
    now = datetime.now()
    print(now.strftime("""
        date: %x
        time: %X
        datetime: %c
    """))
