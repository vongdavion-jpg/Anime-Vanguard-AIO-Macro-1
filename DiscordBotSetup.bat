@echo off
setlocal enabledelayedexpansion

:: Set your Python script name
set SCRIPT_NAME=main.py

echo Checking for Python...
where python >nul 2>nul
if %errorlevel% neq 0 (
    echo Python not found. Downloading and installing...

    :: Download Python 3.13.3 (latest as of July 2025)
    powershell -Command "Invoke-WebRequest -Uri https://www.python.org/ftp/python/3.13.3/python-3.13.3-amd64.exe -OutFile python-installer.exe"

    if not exist python-installer.exe (
        echo Failed to download Python installer.
        pause
        exit /b
    )

    :: Install Python silently and add to PATH
    start /wait python-installer.exe /quiet InstallAllUsers=1 PrependPath=1 Include_test=0

    :: Clean up
    del python-installer.exe
)

:: Verify Python is now in PATH
where python >nul 2>nul
if %errorlevel% neq 0 (
    echo Python installation failed or PATH not set.
    pause
    exit /b
)

:: Upgrade pip and install discord.py
echo Installing required Python packages...
python -m pip install --upgrade pip
python -m pip install -q discord


pause
