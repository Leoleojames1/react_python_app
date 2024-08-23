@echo off

set OLLAMA_NUM_PARALLEL=2
set OLLAMA_MAX_LOADED_MODELS=2
set OLLAMA_FLASH_ATTENTION=1
:: Activate Conda environment
call C:\Users\%USERNAME%\miniconda3\Scripts\activate.bat C:\Users\%USERNAME%\miniconda3\envs\raglocal

wt --maximized -p "React Base" ollama serve; split-pane -d "." python python_backend.py ; split-pane -d "./react-base" "npm.cmd" start