from flask import Flask, jsonify, render_template
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

    # Open a connection to the database
    connection = get_db_connection()

    # Execute a SQL query to retrieve all characters from the database
    query = "SELECT id, kana, romaji, group_name, kana_type FROM characters"
    rows = connection.execute(query).fetchall()

    # Close the database connection after fetching the data
    connection.close()

    # Convert the retrieved rows into a list of dictionaries
    characters_list = []
    for row in rows:
        characters_list.append(
            {
                "id": row["id"],
                "kana": row["kana"],
                "romaji": row["romaji"],
                "group_name": row["group_name"],
                "kana_type": row["kana_type"],
            }
        )

    # Return the list of characters as a JSON response
    return jsonify(characters_list)


# Execute the development server
if __name__ == "__main__":
    # We use debug=True so that the server automatically restarts when changes are made
    app.run(debug=True)
