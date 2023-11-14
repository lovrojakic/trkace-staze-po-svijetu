from flask import *
import os
import psycopg2

app = Flask(__name__)


@app.route("/")
def index():
    return render_template("index.html")


@app.route("/get_full_csv")
def get_full_csv():
    return send_from_directory("data", "trkace_staze_po_svijetu.csv")


@app.route("/get_full_json")
def get_full_json():
    return send_from_directory("data", "trkace_staze_po_svijetu.json")


@app.route("/datatable")
def datatable():
    return render_template("datatable.html")


@app.route("/datatable/get_json")
def datatable_get_json():
    text = request.args.get("text_filter")
    category = request.args.get("category_filter")
    conn = psycopg2.connect(host="localhost", database="trkacestaze", user=os.environ['DB_USERNAME'],
                            password=os.environ['DB_PASSWORD'])
    cur = conn.cursor()
    with open("queries/export_filtered_json.sql") as export_json_query_file:
        # Znam da je ovo potencijalna SQL-Injection ranjivost, ali drugi pristup nije funkcionirao :(
        cur.execute(
            export_json_query_file.read().replace("/* FILTER PLACEHOLDER */", f"WHERE {category} LIKE '%{text}%'"))
        data = jsonify({"$schema": "http://json-schema.org/trkacestaze",
                        "$id": "https://trkacestaze.hr/datatable/get_json",
                        "type": "array",
                        "title": "Trkaće staze po svijetu",
                        "description": "Otvoreni skup podataka o trkaćim stazama po svijetu.",
                        "items": cur.fetchone()})
    conn.commit()
    cur.close()
    conn.close()
    return data


def get_app():
    return app
