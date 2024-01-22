-- a) Geben Sie alle Kunden aus.
SELECT * FROM kunde;
--  kid |  name   | vorname |   adresse   |  plz  |   ort
-- -----+---------+---------+-------------+-------+---------
--    1 | Müller  | Hans    | Hauptstr. 1 | 10115 | Berlin
--    2 | Schmidt | Anna    | Nebenweg 5  | 20099 | Hamburg
--    3 | Fischer | Peter   | Am Markt 2  | 50667 | Köln


-- b) Geben Sie Namen und Kategorie aller Hotels aus.
SELECT hname, katname FROM hotel;
--     hname     |   katname
-- --------------+-------------
--  Hotel Berlin | Vier Sterne
--  Paris Resort | Drei Sterne
--  Zuerich View | Drei Sterne


-- c) Finden Sie alle Umsatze größer 500,00 Euro.
SELECT * FROM umsatz WHERE betrag > 500;
--  kid | jahr | betrag
-- -----+------+--------
--    1 | 2023 | 800.00
--    3 | 2023 | 550.00


-- d) Finden Sie Name und Kategoriename aller Hotels mit mindestens 3 Sternen, die Einzel- oder Doppelzimmer mit einem Preis unter 80,00 Euro haben.
SELECT hname, katname FROM hotel WHERE (kat >= 3) AND (ezz < 80 OR dzz < 80);
--     hname     |   katname
-- --------------+-------------
--  Hotel Berlin | Vier Sterne
--  Zuerich View | Drei Sterne


-- e) Geben Sie die Namen aller Hotels in Zuerich aus.
SELECT hname FROM hotel JOIN ziel ON ziel.zid = hotel.zid WHERE ziel.ort = 'Zuerich';
--     hname
-- --------------
--  Zuerich View


--f) Finden Sie den Preis des billigsten Einzelzimmers.
SELECT MIN(ezz) FROM hotel;
-- oder
SELECT ezz FROM hotel ORDER BY ezz ASC LIMIT 1;
--   ezz
-- -------
--  70.00


-- g) Geben Sie die Anzahl der Buchungen pro Kundennummer aus.
SELECT kid, COUNT(*) AS anzahl_buchungen FROM buchung GROUP BY kid;
--  kid | anzahl_buchungen
-- -----+------------------
--    3 |                3
--    2 |                2
--    1 |                2


-- h) Geben Sie die Namen der Kunden, die mehr als zwei Buchungen gemacht haben, aus.
SELECT k.name, k.vorname FROM kunde k JOIN buchung b ON k.kid = b.kid GROUP BY k.kid HAVING COUNT(b.kid) > 2;
--   name   | vorname
-- ---------+---------
--  Fischer | Peter


-- i) Geben Sie die Hotelnamen aller Buchungen für Ziele in Frankreich aus. Verwenden Sie zur Selektion nur den Landesnamen (Attribut name in der Tabelle land).
SELECT h.hname AS ziele_in_frankreich FROM hotel h JOIN buchung b ON h.hnr = b.hnr JOIN ziel z ON z.zid = h.zid JOIN land l ON l.lid = z.lid WHERE l.name = 'Frankreich' GROUP BY h.hname;
--  ziele_in_frankreich
-- ---------------------
--  Paris Resort


-- j) Geben Sie Vorname, Name, Adresse, Postleitzahl und Ort aller Kunden aus, die nach dem 01.09.2015 ein Einzelzimmer unter 50,00 Euro gebucht haben.
SELECT k.vorname, k.name, k.adresse, k.plz, k.ort FROM kunde k JOIN buchung b ON k.kid = b.kid JOIN hotel h ON b.hnr = h.hnr WHERE b.anreise > '2015-09-01' AND (b.aez > 0 AND h.ezz < 50) GROUP BY k.kid;
--  vorname | name | adresse | plz | ort
-- ---------+------+---------+-----+-----
--
-- Leere Ausgabe, da niedrigster Preis 70.00 ist und alle für nach dem 01.09.2015 gebucht sind.
-- Zum testen kann stattdessen `2023-07-01` und `h.ezz < 71` verwendet werden:
SELECT k.vorname, k.name, k.adresse, k.plz, k.ort FROM kunde k JOIN buchung b ON k.kid = b.kid JOIN hotel h ON b.hnr = h.hnr WHERE b.anreise > '2023-07-01' AND (b.aez > 0 AND h.ezz < 71) GROUP BY k.kid;
--  vorname |  name   |   adresse   |  plz  |   ort
-- ---------+---------+-------------+-------+---------
--  Hans    | Müller  | Hauptstr. 1 | 10115 | Berlin
--  Anna    | Schmidt | Nebenweg 5  | 20099 | Hamburg


-- k) Geben Sie von allen Hotels den Hotelnamen und den Namen des Landes in dem es steht aus. Länder ohne Hotels sollen ebenfalls mit aufgelistet werden. Sortieren Sie die Liste nach Ländernamen.
SELECT h.hname, l.name FROM hotel h RIGHT JOIN ziel z ON h.zid = z.zid RIGHT JOIN land l ON z.lid = l.lid;
--     hname     |    name
-- --------------+-------------
--  Hotel Berlin | Deutschland
--  Paris Resort | Frankreich
--  Zuerich View | Schweiz
--               | Österreich
