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

    # Get the selected group from the query parameters
    selected_group = request.args.get("group")

    # Default to "hiragana" if no type is specified
    kana_type = request.args.get("type", "hiragana")

    connection = get_db_connection()
    rows = []

    # Define the character groups for basics and modified characters
    basics_groups = (
        "vowels",
        "ka",
        "sa",
        "ta",
        "na",
        "ha",
        "ma",
        "ya",
        "ra",
        "wa",
        "n",
    )
    modified_groups = ("ga", "za", "da", "ba", "pa")

    # Build the SQL query based on the selected group
    if selected_group == "basics":
        query = f"SELECT id, kana, romaji, group_name, kana_type FROM characters WHERE kana_type = ? AND group_name IN {basics_groups}"
        rows = connection.execute(query, (kana_type,)).fetchall()

    elif selected_group == "modified":
        query = f"SELECT id, kana, romaji, group_name, kana_type FROM characters WHERE kana_type = ? AND group_name IN {modified_groups}"
        rows = connection.execute(query, (kana_type,)).fetchall()

    elif selected_group == "yoon":
        query = "SELECT id, kana, romaji, group_name, kana_type FROM characters WHERE kana_type = ? AND group_name = 'yoon'"
        rows = connection.execute(query, (kana_type,)).fetchall()

    else:
        # If no specific group is selected, return all characters of the specified type
        query = "SELECT id, kana, romaji, group_name, kana_type FROM characters WHERE kana_type = ?"
        rows = connection.execute(query, (kana_type,)).fetchall()

    connection.close()

    characters_list = []
    for row in rows:
        characters_list.append({
            "id": row["id"],
            "kana": row["kana"],
            "romaji": row["romaji"],
            "group_name": row["group_name"],
            "kana_type": row["kana_type"],
        })

    return jsonify(characters_list)


# Execute the development server
if __name__ == "__main__":
    # We use debug=True so that the server automatically restarts when changes are made
    app.run(debug=True)
