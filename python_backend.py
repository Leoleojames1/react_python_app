from flask import Flask, jsonify
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

@app.route('/')
def home():
    return "Hello world! Flask backend is running!"

@app.route('/api/run-command', methods=['POST'])
def run_command():
    # Your command-line logic here
    result = "Command executed successfully"
    return jsonify({"result": result})

if __name__ == '__main__':
    app.run(debug=True, port=6969)