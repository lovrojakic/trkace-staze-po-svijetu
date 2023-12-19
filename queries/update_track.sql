UPDATE staza
SET naziv = %(staza.naziv)s,
    datum_otvorenja = %(staza.datum_otvorenja)s,
    podloga = %(staza.podloga)s,
    duljina_km = %(staza.duljina_km)s,
    broj_zavoja = %(staza.broj_zavoja)s,
    url = %(staza.url)s,
    kapacitet_gledatelja = %(staza.kapacitet_gledatelja)s,
    rekord_id = %(staza.rekord_id)s,
    oznaka_drzave = %(staza.oznaka_drzave)s
WHERE staza.id = %(staza.id)s;