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
                    tracks[row[0]]["natjecanja"].append(
                        {"naziv": row[15], "godina": row[16]})
            data = jsonify(list(tracks.values()))
        elif type == "csv":
            data = ",".join(CSV_HEADER_ELEMENTS) + \
                "\n".join([",".join([str(col) for col in row])
                          for row in data])
        else:
            raise NotImplementedError
        return data

    def api_execute(self, query_file_path, parameters):
        conn = psycopg2.connect(
            host=self.host, database=self.database, user=self.username, password=self.password)
        cur = conn.cursor()
        with open(query_file_path) as query_file:
            cur.execute(query_file.read(), parameters)
        data = cur.fetchall()
        conn.commit()
        cur.close()
        conn.close()

        tracks = dict()
        for row in data:
            if row[0] not in tracks:
                tracks[row[0]] = {"id": row[0], "naziv": row[1], "oznaka_drzave": row[2], "datum_otvorenja": str(row[3]), "podloga": row[4], "duljina_km": float(row[5]), "broj_zavoja": row[6], "url": row[7], "kapacitet_gledatelja": row[8], "rekord": {
                    "vrijeme": str(row[9]), "vozilo": row[10], "vozac": {"ime": row[11], "prezime": row[12], "datum_rodenja": str(row[13]), "oznaka_drzave": row[14]}}, "natjecanja": [{"naziv": row[15], "godina": row[16]}]}
            else:
                tracks[row[0]]["natjecanja"].append(
                    {"naziv": row[15], "godina": row[16]})

        if len(tracks.values()) == 0:
            return jsonify({"status": "Not Found",
                            "message": "Track with the provided ID doesn't exist",
                            "reponse": None}), 404
        return jsonify({"status": "OK",
                        "message": "Fetched track object",
                        "reponse": list(tracks.values())})

    def all_drivers_api_execute(self, query_file_path):
        conn = psycopg2.connect(
            host=self.host, database=self.database, user=self.username, password=self.password)
        cur = conn.cursor()
        with open(query_file_path) as query_file:
            cur.execute(query_file.read())
        data = cur.fetchall()
        conn.commit()
        cur.close()
        conn.close()

        drivers = dict()
        for row in data:
            drivers[row[0]] = {"id": row[0], "ime": row[1], "prezime": row[2],
                               "datum_rodenja": str(row[3]), "oznaka_drzave": row[4]}

        if len(drivers.values()) == 0:
            return jsonify({"status": "Not Found",
                            "message": "There are no drivers in database",
                            "reponse": None}), 404
        return jsonify({"status": "OK",
                        "message": "Fetched driver object",
                        "reponse": list(drivers.values())})

    def all_countries_api_execute(self, query_file_path):
        conn = psycopg2.connect(
            host=self.host, database=self.database, user=self.username, password=self.password)
        cur = conn.cursor()
        with open(query_file_path) as query_file:
            cur.execute(query_file.read())
        data = cur.fetchall()
        conn.commit()
        cur.close()
        conn.close()

        countries = dict()
        for row in data:
            countries[row[0]] = {
                "oznaka_drzave": row[0], "naziv_drzave": row[1]}

        if len(countries.values()) == 0:
            return jsonify({"status": "Not Found",
                            "message": "There are no countries in database",
                            "reponse": None}), 404
        return jsonify({"status": "OK",
                        "message": "Fetched driver object",
                        "reponse": list(countries.values())})

    def all_competitions_api_execute(self, query_file_path):
        conn = psycopg2.connect(
            host=self.host, database=self.database, user=self.username, password=self.password)
        cur = conn.cursor()
        with open(query_file_path) as query_file:
            cur.execute(query_file.read())
        data = cur.fetchall()
        conn.commit()
        cur.close()
        conn.close()

        competitions = dict()
        for row in data:
            competitions[row[0]] = {"id": row[0],
                                    "naziv": row[1], "godina": row[2]}

        if len(competitions.values()) == 0:
            return jsonify({"status": "Not Found",
                            "message": "There are no competitions in database",
                            "reponse": None}), 404
        return jsonify({"status": "OK",
                        "message": "Fetched driver object",
                        "reponse": list(competitions.values())})

    def insert_new_track(self, query_file_path, parameters):
        conn = psycopg2.connect(
            host=self.host, database=self.database, user=self.username, password=self.password)
        cur = conn.cursor()
        with open(query_file_path) as query_file:
            cur.execute(query_file.read(), parameters)
        conn.commit()
        cur.close()
        conn.close()
        return jsonify({"status": "OK",
                        "message": "Track insert successful",
                        "reponse": None})

    def update_track(self, query_file_path, parameters):
        conn = psycopg2.connect(
            host=self.host, database=self.database, user=self.username, password=self.password)
        cur = conn.cursor()
        with open(query_file_path) as query_file:
            cur.execute(query_file.read(), parameters)
        conn.commit()
        cur.close()
        conn.close()
        return jsonify({"status": "OK",
                        "message": "Track update successful",
                        "reponse": None})

    def delete_track(self, query_file_path, parameters):
        conn = psycopg2.connect(
            host=self.host, database=self.database, user=self.username, password=self.password)
        cur = conn.cursor()
        with open(query_file_path) as query_file:
            cur.execute(query_file.read(), parameters)
        conn.commit()
        cur.close()
        conn.close()
        return jsonify({"status": "OK",
                        "message": "Track delete successful",
                        "reponse": None})
