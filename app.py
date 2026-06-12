from flask import Flask, jsonify, render_template, request
from database import get_db_connection

# Flask application initialization
app = Flask(__name__)


# Main route definition
@app.route("/")
def index():
    return render_template("index.html")


@app.route("/play")
def play():
    return render_template("play.html")


# API route to retrieve characters from the database
@app.route("/api/characters")
def get_characters():
    selected_group = request.args.get("group")

    connection = get_db_connection()
    rows = []

    # Filtrado por Macro-Grupos
    if selected_group == "basics":
        # Trae todas las familias básicas juntas
        query = """SELECT id, kana, romaji, group_name FROM characters 
                   WHERE group_name IN ('vowels', 'ka', 'sa', 'ta', 'na', 'ha', 'ma', 'ya', 'ra', 'wa', 'n')"""
        rows = connection.execute(query).fetchall()

    elif selected_group == "modified":
        # Trae todos los nigoris juntos (Dakuten y Handakuten)
        query = "SELECT id, kana, romaji, group_name FROM characters WHERE group_name IN ('ga', 'za', 'da', 'ba', 'pa')"
        rows = connection.execute(query).fetchall()

    elif selected_group == "yoon":
        # Trae los diptongos
        query = "SELECT id, kana, romaji, group_name FROM characters WHERE group_name = 'yoon'"
        rows = connection.execute(query).fetchall()

    else:
        # 'all' o cualquier otra cosa trae todo el universo de caracteres
        query = "SELECT id, kana, romaji, group_name FROM characters"
        rows = connection.execute(query).fetchall()

    connection.close()

    characters_list = []
    for row in rows:
        characters_list.append(
            {
                "id": row["id"],
                "kana": row["kana"],
                "romaji": row["romaji"],
                "group_name": row["group_name"],
            }
        )

    return jsonify(characters_list)


# Execute the development server
if __name__ == "__main__":
    # We use debug=True so that the server automatically restarts when changes are made
    app.run(debug=True)
