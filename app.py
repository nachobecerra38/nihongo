from flask import Flask

# 1. Flask application initialization
app = Flask(__name__)


# 2. Main route definition
@app.route("/")
def hello_world():
    return "Hello, World!"


# 3. Execute the development server
if __name__ == "__main__":
    # We use debug=True so that the server automatically restarts when changes are made
    app.run(debug=True)
