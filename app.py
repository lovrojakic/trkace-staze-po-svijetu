from flask import *
from modules.dbhandler import DBHandler
import os
import psycopg2

HOST = "localhost"
DATABASE = "trkacestaze"
USERNAME = os.environ["DB_USERNAME"]
PASSWORD = os.environ["DB_PASSWORD"]
CATEGORIES = ["staza.id", "staza.naziv", "staza.oznaka_drzave", "staza.datum_otvorenja", "staza.podloga", "staza.duljina_km", "staza.broj_zavoja", "staza.url", "staza.kapacitet_gledatelja",
              "rekord.vrijeme", "rekord.vozilo", "vozac.ime", "vozac.prezime", "vozac.datum_rodenja", "vozac.oznaka_drzave", "natjecanje.naziv", "natjecanje.godina"]

app = Flask(__name__)
db_handler = DBHandler(HOST, DATABASE, USERNAME, PASSWORD)


def get_app():
    return app


def get_query_parameters(category, text):
    text = text.lower()
    if category == "wildcard":
        parameters = dict.fromkeys(CATEGORIES, f"%{text}%")
        parameters["staza.id"] = 0
    elif category == "staza.id":
        parameters = dict.fromkeys(CATEGORIES, "%%")
        try:
            parameters["staza.id"] = int(text)
        except ValueError:
            parameters["staza.id"] = -1
    else:
        parameters = dict.fromkeys(CATEGORIES, "%%")
        parameters[category] = f"%{text}%"
    return parameters

def get_track_insert_parameters(req_json):
    parameters = {"staza.naziv": req_json["naziv"], "staza.oznaka_drzave": req_json["oznaka_drzave"], "staza.datum_otvorenja": req_json["datum_otvorenja"], "staza.podloga": req_json["podloga"], "staza.duljina_km": req_json["duljina_km"], "staza.broj_zavoja": req_json["broj_zavoja"], "staza.url": req_json["url"], "staza.kapacitet_gledatelja": req_json["kapacitet_gledatelja"], "staza.rekord_id": req_json["rekord_id"]}
    return parameters

def get_track_update_parameters(id, req_json):
    parameters = {"staza.id": id, "staza.naziv": req_json["naziv"], "staza.oznaka_drzave": req_json["oznaka_drzave"], "staza.datum_otvorenja": req_json["datum_otvorenja"], "staza.podloga": req_json["podloga"], "staza.duljina_km": req_json["duljina_km"], "staza.broj_zavoja": req_json["broj_zavoja"], "staza.url": req_json["url"], "staza.kapacitet_gledatelja": req_json["kapacitet_gledatelja"], "staza.rekord_id": req_json["rekord_id"]}
    return parameters

def get_track_delete_parameters(id):
    parameters = {"staza.id": id}
    return parameters


@app.errorhandler(404)
@app.errorhandler(405)
def page_not_found(e):
    return jsonify({"status": "Not Implemented",
                    "message": "Method not implemented for requested resource",
                    "reponse": None}), 501

@app.errorhandler(psycopg2.errors.UniqueViolation)
def unique_violations(e):
    return jsonify({"status": "Bad Request",
                    "message": "Unique constraint violation",
                    "reponse": None}), 400

@app.route("/")
def index():
    return render_template("index.html")


@app.route("/download_csv")
def get_full_csv():
    return send_from_directory("data", "trkace_staze_po_svijetu.csv", as_attachment=True)


@app.route("/download_json")
def get_full_json():
    return send_from_directory("data", "trkace_staze_po_svijetu.json", as_attachment=True)


@app.route("/datatable")
def datatable():
    return render_template("datatable.html")


@app.route("/datatable/search_json")
def datatable_get_json():
    category = request.args.get("category_filter")
    text = request.args.get("text_filter")
    parameters = get_query_parameters(category, text)
    if category == "wildcard":
        data = db_handler.execute(
            "queries/search_wildcard.sql", parameters, "json")
    else:
        data = db_handler.execute("queries/search.sql", parameters, "json")
    return data


@app.route("/datatable/search_csv")
def datatable_get_csv():
    category = request.args.get("category_filter")
    text = request.args.get("text_filter")
    parameters = get_query_parameters(category, text)
    if category == "wildcard":
        data = db_handler.execute(
            "queries/search_wildcard.sql", parameters, "csv")
    else:
        data = db_handler.execute("queries/search.sql", parameters, "csv")
    return data


@app.route('/api/v1/tracks/all', methods=['GET'])
def tracks_get_all():
    parameters = get_query_parameters("wildcard", "")
    return db_handler.api_execute("queries/search_wildcard.sql", parameters)


@app.route('/api/v1/tracks/<id>', methods=['GET'])
def tracks_get_by_id(id):
    parameters = get_query_parameters("staza.id", id)
    return db_handler.api_execute("queries/search.sql", parameters)


@app.route('/api/v1/drivers/all', methods=['GET'])
def drivers_get_all():
    return db_handler.all_drivers_api_execute("queries/drivers.sql")


@app.route('/api/v1/countries/all', methods=['GET'])
def countries_get_all():
    return db_handler.all_countries_api_execute("queries/countries.sql")


@app.route('/api/v1/competitions/all', methods=['GET'])
def competitions_get_all():
    return db_handler.all_competitions_api_execute("queries/competitions.sql")


@app.route('/api/v1/tracks/new', methods=['POST'])
def insert_new_track():
    parameters = get_track_insert_parameters(request.json)
    return db_handler.insert_new_track("queries/insert_track.sql", parameters)

@app.route('/api/v1/tracks/<id>', methods=['PUT'])
def update_track(id):
    parameters = get_track_update_parameters(id, request.json)
    return db_handler.update_track("queries/update_track.sql", parameters)

@app.route('/api/v1/tracks/<id>', methods=['DELETE'])
def delete_track(id):
    parameters = get_track_delete_parameters(id)
    return db_handler.delete_track("queries/delete_track.sql", parameters)

@app.route('/api/v1/openapi.json', methods=['GET'])
def get_openapi_json():
    return send_from_directory(".", "openapi.json")