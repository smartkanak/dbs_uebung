-- Erstellen der Tabellen
CREATE TABLE kunde (
    kid INT PRIMARY KEY,
    name VARCHAR(255),
    vorname VARCHAR(255),
    adresse VARCHAR(255),
    plz VARCHAR(5),
    ort VARCHAR(255)
);

CREATE TABLE land (
    lid INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE umsatz (
    kid INT,
    jahr INT,
    betrag DECIMAL(10,2),
    FOREIGN KEY (kid) REFERENCES kunde(kid)
);

CREATE TABLE ziel (
    zid INT PRIMARY KEY,
    lid INT,
    ort VARCHAR(255),
    FOREIGN KEY (lid) REFERENCES land(lid)
);

CREATE TABLE hotel (
    zid INT,
    hnr INT,
    hname VARCHAR(255),
    kat INT,
    katname VARCHAR(255),
    ezz DECIMAL(10,2),
    dzz DECIMAL(10,2),
    pez DECIMAL(10,2),
    pdz DECIMAL(10,2),
    PRIMARY KEY (zid, hnr),
    FOREIGN KEY (zid) REFERENCES ziel(zid)
);

CREATE TABLE buchung (
    kid INT,
    zid INT,
    hnr INT,
    aez INT,
    adz INT,
    anreise DATE,
    abreise DATE,
    FOREIGN KEY (kid) REFERENCES kunde(kid),
    FOREIGN KEY (zid, hnr) REFERENCES hotel(zid, hnr)
);

-- Beispieldaten einfügen
INSERT INTO kunde VALUES 
(1, 'Müller', 'Hans', 'Hauptstr. 1', '10115', 'Berlin'),
(2, 'Schmidt', 'Anna', 'Nebenweg 5', '20099', 'Hamburg'),
(3, 'Fischer', 'Peter', 'Am Markt 2', '50667', 'Köln');

INSERT INTO land VALUES 
(1, 'Deutschland'),
(2, 'Frankreich'),
(3, 'Schweiz'),
(4, 'Österreich');

INSERT INTO umsatz VALUES 
(1, 2023, 800.00),
(2, 2023, 450.00),
(3, 2023, 550.00);

INSERT INTO ziel VALUES 
(1, 1, 'Berlin'),
(2, 2, 'Paris'),
(3, 3, 'Zuerich'),
(4, 4, 'Wien');

INSERT INTO hotel VALUES 
(1, 1, 'Hotel Berlin', 4, 'Vier Sterne', 70.00, 100.00, 60.00, 90.00),
(2, 1, 'Paris Resort', 3, 'Drei Sterne', 80.00, 120.00, 70.00, 110.00),
(3, 1, 'Zuerich View', 3, 'Drei Sterne', 75.00, 95.00, 65.00, 85.00);


INSERT INTO buchung VALUES 
(1, 1, 1, 1, 0, '2023-08-15', '2023-08-20'),
(1, 2, 1, 0, 1, '2023-07-10', '2023-07-15'),
(2, 3, 1, 0, 1, '2023-06-05', '2023-06-10'),
(2, 2, 1, 1, 0, '2023-09-01', '2023-09-05'),
(3, 1, 1, 2, 0, '2023-05-20', '2023-05-25'),
(3, 2, 1, 1, 1, '2023-04-10', '2023-04-15'),
(3, 3, 1, 0, 2, '2023-03-15', '2023-03-20');
