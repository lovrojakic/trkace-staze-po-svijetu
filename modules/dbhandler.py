import psycopg2
from flask import jsonify

CSV_HEADER_ELEMENTS = ["id", "naziv", "oznaka_drzave", "datum_otvorenja", "podloga", "duljina_km", "broj_zavoja", "url", "kapacitet_gledatelja", "rekord_vrijeme",
                       "rekord_vozilo", "rekord_vozac_ime", "rekord_vozac_prezime", "rekord_vozac_datum_rodenja", "rekord_vozac_oznaka_drzave", "natjecanja_naziv", "natjecanja_godina"]


class DBHandler:
    def __init__(self, host, database, username, password):
        self.host = host
        self.database = database
        self.username = username
        self.password = password

    def execute(self, query_file_path, parameters, type):
        conn = psycopg2.connect(
            host=self.host, database=self.database, user=self.username, password=self.password)
        cur = conn.cursor()
        with open(query_file_path) as query_file:
            cur.execute(query_file.read(), parameters)
        data = cur.fetchall()
        conn.commit()
        cur.close()
        conn.close()

        if type == "json":
            tracks = dict()
            for row in data:
                if row[0] not in tracks:
                    tracks[row[0]] = {"id": row[0], "naziv": row[1], "oznaka_drzave": row[2], "datum_otvorenja": str(row[3]), "podloga": row[4], "duljina_km": float(row[5]), "broj_zavoja": row[6], "url": row[7], "kapacitet_gledatelja": row[8], "rekord": {
                        "vrijeme": str(row[9]), "vozilo": row[10], "vozac": {"ime": row[11], "prezime": row[12], "datum_rodenja": str(row[13]), "oznaka_drzave": row[14]}}, "natjecanja": [{"naziv": row[15], "godina": row[16]}]}
                else:
                    tracks[row[0]]["natjecanja"].append({"naziv": row[15], "godina": row[16]})
            data = jsonify(list(tracks.values()))
        elif type == "csv":
            data = ",".join(CSV_HEADER_ELEMENTS) + \
                "\n".join([",".join([str(col) for col in row])
                          for row in data])
        else:
            raise NotImplementedError
        return data
