# React-Python Base Template

This repository provides a base template for creating web applications using React for the frontend and Python (Flask) for the backend. It includes a simple setup for Ollama integration, making it easy to get started with AI-powered web applications.

## Prerequisites

Before you begin, ensure you have the following installed on your system:
- [Node.js](https://nodejs.org/) (v14 or later)
- [Python](https://www.python.org/) (v3.7 or later)
- [Miniconda](https://docs.conda.io/en/latest/miniconda.html) or [Anaconda](https://www.anaconda.com/products/distribution)
- [Windows Terminal](https://github.com/microsoft/terminal) (for Windows users)
- [Ollama](https://ollama.ai/) (for AI model serving)

## Installation

1. Clone the repository:
   ```
   git clone https://github.com/leoleojames1/react_python_app.git
   cd react_python_app
   ```

2. Set up the Python environment:
   ```
   conda create -n react_python_app python=3.9
   conda activate react_python_app
   pip install flask flask-cors
   ```

3. Set up the React app:
   ```
   cd react-base
   npm install
   ```

## Configuration

1. Open `launch_app.cmd` and adjust the paths if necessary to match your system configuration.

2. If you're not using Windows or prefer to start components individually, you can use the following commands:
   - For the Python backend: `python python_backend.py`
   - For the React app: `cd react-base && npm start`
   - For Ollama: `ollama serve`

## Usage

1. To start all components (Ollama, Python backend, and React app) at once, run:
   ```
   launch_app.cmd
   ```

2. Open your web browser and navigate to `http://localhost:3000` to view the React app.

3. The Python backend will be running on `http://localhost:6969`.

4. Ollama will be serving AI models as configured.

## Project Structure

- `/react-base`: Contains the React frontend application
- `python_backend.py`: The Flask backend server
- `launch_app.cmd`: Command script to start all components

## Customization

Here are some simple examples of how you can customize the template:

1. Modify `App.js` in the React app to change the frontend:

   ```jsx
   import React, { useState } from 'react';
   import axios from 'axios';

   function App() {
     const [result, setResult] = useState('');

     const runCommand = async () => {
       try {
         const response = await axios.post('http://localhost:6969/api/run-command');
         setResult(response.data.result);
       } catch (error) {
         console.error('Error:', error);
       }
     };

     return (
       <div className="App">
         <header className="App-header">
           <h1>My Custom React-Python App</h1>
           <button onClick={runCommand}>Run Command</button>
           <p>Result: {result}</p>
         </header>
       </div>
     );
   }

   export default App;
   ```

2. Edit `python_backend.py` to add new API endpoints or change backend functionality:

   ```python
   from flask import Flask, jsonify
   from flask_cors import CORS

   app = Flask(__name__)
   CORS(app)

   @app.route('/api/run-command', methods=['POST'])
   def run_command():
       result = "Command executed successfully"
       return jsonify({"result": result})

   @app.route('/api/get-data', methods=['GET'])
   def get_data():
       data = {"message": "This is some data from the backend"}
       return jsonify(data)

   if __name__ == '__main__':
       app.run(debug=True, port=6969)
   ```

3. Adjust Ollama settings in `launch_app.cmd`:

   ```batch
   @echo off

   set OLLAMA_NUM_PARALLEL=4
   set OLLAMA_MAX_LOADED_MODELS=3
   set OLLAMA_FLASH_ATTENTION=1
   :: Activate Conda environment
   call C:\Users\%USERNAME%\miniconda3\Scripts\activate.bat C:\Users\%USERNAME%\miniconda3\envs\raglocal

   wt --maximized -p "React Base" ollama serve; split-pane -d "." python python_backend.py ; split-pane -d "./react-base" "npm.cmd" start
   ```

These examples show how to add a custom header to the React app, create a new API endpoint in the Flask backend, and modify Ollama settings in the launch script.

## Troubleshooting

- If you encounter OpenSSL related errors with the React app, try setting the `NODE_OPTIONS` environment variable:
  ```
  set NODE_OPTIONS=--openssl-legacy-provider
  ```

- Ensure all paths in `launch_app.cmd` are correct for your system.

- If components fail to start, try starting them individually to isolate the issue.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is open source and available under the [MIT License](LICENSE).