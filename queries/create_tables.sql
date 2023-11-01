CREATE TABLE natjecanje
(
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
  naziv VARCHAR(50) NOT NULL,
  godina INT NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE drzava
(
  oznaka CHAR(3) NOT NULL,
  naziv VARCHAR(30) NOT NULL,
  PRIMARY KEY (oznaka)
);

CREATE TABLE vozac
(
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
  ime VARCHAR(25) NOT NULL,
  prezime VARCHAR(25) NOT NULL,
  datum_rodenja DATE,
  oznaka_drzave CHAR(3) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (oznaka_drzave) REFERENCES drzava(oznaka)
);

CREATE TABLE rekord
(
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
  vrijeme TIME NOT NULL,
  vozilo VARCHAR(45) NOT NULL,
  vozac_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (vozac_id) REFERENCES vozac(id)
);

CREATE TABLE staza
(
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
  naziv VARCHAR(50) NOT NULL,
  oznaka_drzave CHAR(3) NOT NULL,
  datum_otvorenja DATE NOT NULL,
  podloga VARCHAR(20) NOT NULL,
  duljina_km NUMERIC(5,3) NOT NULL,
  broj_zavoja INT NOT NULL,
  url VARCHAR(100),
  kapacitet_gledatelja INT,
  rekord_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (rekord_id) REFERENCES rekord(id),
  FOREIGN KEY (oznaka_drzave) REFERENCES drzava(oznaka),
  UNIQUE (url)
);

CREATE TABLE odrzavaSe
(
  staza_id INT NOT NULL,
  natjecanje_id INT NOT NULL,
  PRIMARY KEY (staza_id, natjecanje_id),
  FOREIGN KEY (staza_id) REFERENCES staza(id),
  FOREIGN KEY (natjecanje_id) REFERENCES natjecanje(id)
);
