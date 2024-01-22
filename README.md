# Datenbanksysteme Online Test Übung

## Gegebene Test Daten

Folgendes Relationsschema ist gegeben:

| Table   | Columns                                           |
|---------|---------------------------------------------------|
| kunde   | kid, name, vorname, adresse, plz, ort             |
| land    | lid, name                                         |
| umsatz  | kid, jahr, betrag                                 |
| ziel    | zid, lid, ort                                     |
| hotel   | zid, hnr, hname, kat, katname, ezz, dzz, pez, pdz |
| buchung | kid, zid, hnr, aez, adz, anreise, abreise         |

Führe das skript init\_hotel.sql aus um die initialen Daten zu erstellen. Es handelt sich hierbei nicht um die originalen Daten vom Online-Test, sondern wurde zu Test-Zwecken von ChatGPT erstellt, sollte aber für die Lernzwecke reichen.

## Setup zu Hause
### Falls `psql` mit `homebrew` installiert wurde

Falls nicht, einfach überspringen.

Falls `psql` mit `homebrew` über den Befehl `brew install postgresql@14` installiert worden ist, kannst du folgendermaßen vorgehen (ansonsten überspringen)

```bash
brew services start postgres@14
```

Datenbank erstellen:
```bash
createdb hotel_db
```

In Datenbank einsteigen
```bash
psql hotel_db
```

SQL skript ausführen (man kann auch vorher in den Ordner wo sql liegt, dann kein 'path' nötig)
```sql
\i path/to/init_hotel.sql
```

### Setup in der Uni

Unbekannt, Infos folgen.

## Aufgaben

a) Geben Sie alle Kunden aus.
b) Geben Sie Namen und Kategorie aller Hotels aus.
c) Finden Sie alle Umsa ̈tze gro ̈ßer 500,00 Euro.
d) Finden Sie Name und Kategoriename aller Hotels mit mindestens 3 Sternen, die Einzel- oder Doppelzimmer mit einem Preis unter 80,00 Euro haben.
e) Geben Sie die Namen aller Hotels in Zuerich aus.
f) Finden Sie den Preis des billigsten Einzelzimmers.
g) Geben Sie die Anzahl der Buchungen pro Kundennummer aus.
h) Geben Sie die Namen der Kunden, die mehr als zwei Buchungen gemacht haben, aus.
i) Geben Sie die Hotelnamen aller Buchungen fu ̈r Ziele in Frankreich aus. Verwenden Sie zur Selektion nur den Landesnamen (Attribut name in der Tabelle land).
j) Geben Sie Vorname, Name, Adresse, Postleitzahl und Ort aller Kunden aus, die nach dem 01.09.2015 ein Einzelzimmer unter 50,00 Euro gebucht haben.
k) Geben Sie von allen Hotels den Hotelnamen und den Namen des Landes in dem es steht aus. La ̈nder ohne Hotels sollen ebenfalls mit aufgelistet werden. Sortieren Sie die Liste nach La ̈ndernamen.

## Lösungen

Siehe `loesungen.sql`
