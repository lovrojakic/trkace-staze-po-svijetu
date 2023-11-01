SELECT json_agg(row_to_json(staza_json))
FROM (
	SELECT naziv, oznaka_drzave, datum_otvorenja, podloga, duljina_km, broj_zavoja, url, kapacitet_gledatelja,
		(
			SELECT row_to_json(rekord_json)
			FROM (
				SELECT vrijeme, vozilo,
				(
					SELECT row_to_json(vozac_json)
					FROM (
						SELECT ime, prezime, datum_rodenja, oznaka_drzave
						FROM vozac
						WHERE rekord.vozac_id = vozac.id
					) vozac_json
				) AS vozac
				FROM rekord
				WHERE staza.rekord_id = rekord.id
			) rekord_json
		) AS rekord,
		(
			SELECT json_agg(row_to_json(natjecanja_json))
			FROM (
				SELECT naziv, godina
				FROM natjecanje FULL JOIN odrzavaSe
				ON natjecanje.id = odrzavaSe.natjecanje_id
				WHERE odrzavaSe.staza_id = staza.id
			) natjecanja_json
		) AS natjecanja
	FROM staza
) staza_json;
