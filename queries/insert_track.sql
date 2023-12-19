INSERT INTO staza (naziv, datum_otvorenja, podloga, duljina_km, broj_zavoja, url, kapacitet_gledatelja, rekord_id, oznaka_drzave)
VALUES
(%(staza.naziv)s, %(staza.datum_otvorenja)s, %(staza.podloga)s, %(staza.duljina_km)s, %(staza.broj_zavoja)s, %(staza.url)s, %(staza.kapacitet_gledatelja)s, %(staza.rekord_id)s, %(staza.oznaka_drzave)s);