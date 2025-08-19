New-Item -ItemType Directory -Path "eva"
Set-Location -Path "eva"
New-Item -ItemType Directory -Path "electron-app", "python-backend"
Set-Location -Path "electron-app"
npm init -y
npm install electron electron-builder axios node-notifier