from flask import *
from modules.dbhandler import DBHandler
import os


HOST = "localhost"
DATABASE = "trkacestaze"
USERNAME = os.environ["DB_USERNAME"]
PASSWORD = os.environ["DB_PASSWORD"]
CATEGORIES = ["staza.naziv", "staza.oznaka_drzave", "staza.datum_otvorenja", "staza.podloga", "staza.duljina_km", "staza.broj_zavoja", "staza.url", "staza.kapacitet_gledatelja",
              "rekord.vrijeme", "rekord.vozilo", "vozac.ime", "vozac.prezime", "vozac.datum_rodenja", "vozac.oznaka_drzave", "natjecanje.naziv", "natjecanje.godina"]

app = Flask(__name__)
db_handler = DBHandler(HOST, DATABASE, USERNAME, PASSWORD)


def get_app():
    return app


def get_query_parameters(category, text):
    text = text.lower()
    if category == "wildcard":
        parameters = dict.fromkeys(CATEGORIES, f"%{text}%")
    else:
        parameters = dict.fromkeys(CATEGORIES, "%%")
        parameters[category] = f"%{text}%"
    return parameters


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
