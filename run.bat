@echo off
echo === Launching Nooman's GGUF Converter App ===

if exist ".venv\Scripts\activate.bat" (
    call .venv\Scripts\activate.bat
)

python app.py
