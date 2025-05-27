@echo off
echo === Setting up GGUF Converter Environment ===

:: Optional: create virtual environment
echo Creating virtual environment in ".venv"...
python -m venv .venv

:: Activate the virtual environment (Windows)
call .venv\Scripts\activate.bat

:: Upgrade pip
echo Upgrading pip...
python -m pip install --upgrade pip

:: Install dependencies
echo Installing Python dependencies from requirements.txt...
pip install -r requirements.txt

echo.
echo ✅ All dependencies installed.
echo To activate this environment later, run:
echo     call .venv\Scripts\activate.bat
echo.
pause
