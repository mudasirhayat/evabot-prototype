#!/bin/bash
set -e

# Check if required tools are installed
command -v python3.11 >/dev/null 2>&1 || { echo "python3.11 is required but not installed. Aborting." >&2; exit 1; }
command -v npm >/dev/null 2>&1 || { echo "npm is required but not installed. Aborting." >&2; exit 1; }

echo "Creating Python virtual environment..."
if [ -d "python-backend/venv" ]; then
    echo "Virtual environment already exists, removing it..."
    rm -rf python-backend/venv
fi

python3.11 -m venv python-backend/venv

echo "Activating virtual environment and installing Python dependencies..."
source python-backend/venv/bin/activate
if [ ! -f "python-backend/requirements.txt" ]; then
    echo "Error: python-backend/requirements.txt not found" >&2
    exit 1
fi
pip install -r python-backend/requirements.txt

# Install PyTorch based on OS
echo "Installing PyTorch based on operating system..."
if [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
    echo "Windows detected - installing CUDA PyTorch..."
    pip install torch --index-url https://download.pytorch.org/whl/cu121
else
    echo "Non-Windows OS detected - installing regular PyTorch..."
    pip install torch
fi

echo "Installing Node.js dependencies..."
cd electron-app
if [ ! -f "package.json" ]; then
    echo "Error: electron-app/package.json not found" >&2
    exit 1
fi
npm install

# Check for vulnerabilities and fix if any are found
if npm audit | grep -q "found [1-9]"; then
    echo "Vulnerabilities found. Running npm audit fix --force..."
    npm audit fix --force
else
    echo "No vulnerabilities found in npm packages." 
fi

echo "Setup completed successfully!"
