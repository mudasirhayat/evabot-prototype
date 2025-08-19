# Create and activate virtual environment
Set-Location -Path "python-backend"

# Remove existing venv if it exists
if (Test-Path "venv") {
    Remove-Item -Recurse -Force "venv"
}

python -m venv venv
.\venv\Scripts\Activate.ps1

# Upgrade pip to latest version
python -m pip install --upgrade pip

# Install required packages
Write-Host "Installing Python dependencies..."

# Install packages one by one to better handle errors
foreach($line in Get-Content "requirements.txt") {
    if ($line.Trim()) {
        Write-Host "Installing $line..."
        pip install $line
        if ($LASTEXITCODE -ne 0) {
            Write-Error "Failed to install $line"
            exit 1
        }
    }
}

# Verify installation
if ($LASTEXITCODE -ne 0) {
    Write-Error "Failed to install Python dependencies"
    exit 1
}

# Return to root directory
Set-Location -Path ".." 