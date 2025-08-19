# EVA - Voice-powered Desktop Assistant

EVA is a voice-controlled desktop assistant built with Electron and Python. 

Start the app, and it hides away in your system tray.

When ready to use, hit Ctrl+Space (Windows) or Option+Space (Mac) to start recording.

Speak your prompt, and when done, hit the same key combination again to stop recording.

Based on your configured settings, EVA will process your words and execute the corresponding actions.
## Installation

1. Clone the repository:
   ```
   git clone https://github.com/h0n3yb/evabot-prototype.git
   cd eva
   ```

2. Run the setup script to prepare your environment:
   ```
   # Run the setup script
   ./setup.sh    # On macOS/Linux
   .\setup.ps1   # On Windows
   ```

3. Activate the virtual environment:
   ```
   # On macOS/Linux
   source python-backend/venv/bin/activate
   
   # On Windows
   .\python-backend\venv\Scripts\Activate.ps1
   ```

4. Build or run the application:
   ```
   cd electron-app
   
   # For development mode
   npm run dev
   
   # For production build
   npm run build:win   # On Windows
   npm run build:mac   # On macOS
   ```

### macOS Code Signing

The application uses entitlements for proper functionality on macOS. The entitlements file is located at `electron-app/build/entitlements.mac.plist` and includes permissions for:

- Audio recording
- Network access (client/server)
- File system access
- AppleScript automation
- JIT compilation

For development builds, the app will run unsigned. For distribution:

1. Obtain an Apple Developer ID certificate
2. Set up your signing identity:
   ```bash
   # List available signing identities
   security find-identity -v -p codesigning
   
   # Use your identity in electron-builder config
   # Edit package.json 'build' section:
   # "mac": {
   #   "identity": "Developer ID Application: Your Name (TEAMID)"
   # }
   ```

## Usage

1. Click the tray icon or press the shortcut key to start recording:
   - **Windows**: Ctrl+Space
   - **macOS**: Option+Space

2. Speak your command (e.g., "Search for recent articles on AI assistants" or "Open terminal and list all files")

3. Press the same shortcut key again to stop recording

4. The app will process your command and execute the corresponding actions

## Configuration

Eva provides several configuration options that determine the app's behavior:

1. Open the Settings panel from the tray icon menu
2. Adjust voice sensitivity, response verbosity, and preferred applications
3. Customize keyboard shortcuts and activation methods
4. Configure API connections and authentication settings

Your settings will be saved automatically and applied to future sessions.

## Project Structure

```
eva/
├── electron-app/           # Electron frontend
│   ├── assets/            # Icons and images
│   ├── main.js            # Main process
│   ├── index.html         # Status window
│   └── renderer.js        # Renderer process
├── python-backend/        # Python backend
│   ├── server.py          # WebSocket server
│   └── voice_capture.py   # Audio recording module
├── scripts/               # Utility scripts
├── docs/                  # Documentation
└── setup-python.ps1       # Python environment setup
```

## Future Considerations

- Mobile companion application
- Cross-device synchronization
- Plugin ecosystem for application-specific integrations
- Advanced customization options