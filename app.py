from flask import Flask

# 1. Inicializar la aplicación Flask
app = Flask(__name__)


# 2. Definir la ruta principal (la raíz de la web)
@app.route("/")
def hello_world():
    return "Hello, World!"


# 3. Ejecutar el servidor de desarrollo
if __name__ == "__main__":
    # Usamos debug=True para que el servidor se reinicie automáticamente al hacer cambios
    app.run(debug=True)
