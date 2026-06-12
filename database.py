import os
import sqlite3

DATABASE_PATH = os.path.join("instance", "game.db")


def get_db_connection():
    """Creates and returns a connection to the SQLite database."""
    connection = sqlite3.connect(DATABASE_PATH)
    connection.row_factory = sqlite3.Row
    return connection


def init_db():
    """Initializes the database using the schema.sql file."""
    os.makedirs("instance", exist_ok=True)

    with open("schema.sql", "r", encoding="utf-8") as schema_file:
        schema_sql = schema_file.read()

    connection = get_db_connection()
    try:
        connection.executescript(schema_sql)
        connection.commit()
        print("Database initialized successfully at 'instance/game.db'!")
    except sqlite3.Error as error:
        print(f"An error occurred: {error}")
    finally:
        connection.close()


if __name__ == "__main__":
    init_db()
