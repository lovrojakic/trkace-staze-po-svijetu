SELECT staza.id,
       staza.naziv,
       staza.oznaka_drzave,
       staza.datum_otvorenja,
       staza.podloga,
       staza.duljina_km,
       staza.broj_zavoja,
       staza.url,
       staza.kapacitet_gledatelja,
       rekord.vrijeme,
       rekord.vozilo,
       vozac.ime,
       vozac.prezime,
       vozac.datum_rodenja,
       vozac.oznaka_drzave,
       natjecanje.naziv,
       natjecanje.godina
FROM staza
    FULL JOIN rekord ON staza.rekord_id = rekord.id
    FULL JOIN vozac ON vozac_id = vozac.id
    FULL JOIN odrzavaSe ON staza.id = odrzavaSe.staza_id
    FULL JOIN natjecanje ON odrzavaSe.natjecanje_id = natjecanje.id
WHERE lower(staza.naziv) LIKE %(staza.naziv)s
    AND lower(staza.oznaka_drzave) LIKE %(staza.oznaka_drzave)s
    AND lower(cast(staza.datum_otvorenja AS VARCHAR)) LIKE %(staza.datum_otvorenja)s
    AND lower(staza.podloga) LIKE %(staza.podloga)s
    AND lower(cast(staza.duljina_km AS VARCHAR)) LIKE %(staza.duljina_km)s
    AND lower(cast(staza.broj_zavoja AS VARCHAR)) LIKE %(staza.broj_zavoja)s
    AND lower(staza.url) LIKE %(staza.url)s
    AND lower(cast(staza.kapacitet_gledatelja AS VARCHAR)) LIKE %(staza.kapacitet_gledatelja)s
    AND lower(cast(rekord.vrijeme AS VARCHAR)) LIKE %(rekord.vrijeme)s
    AND lower(rekord.vozilo) LIKE %(rekord.vozilo)s
    AND lower(vozac.ime) LIKE %(vozac.ime)s
    AND lower(vozac.prezime) LIKE %(vozac.prezime)s
    AND (vozac.datum_rodenja IS NULL OR lower(cast(vozac.datum_rodenja AS VARCHAR)) LIKE %(vozac.datum_rodenja)s)
    AND lower(vozac.oznaka_drzave) LIKE %(vozac.oznaka_drzave)s
    AND lower(natjecanje.naziv) LIKE %(natjecanje.naziv)s
    AND lower(cast(natjecanje.godina AS VARCHAR)) LIKE %(natjecanje.godina)s