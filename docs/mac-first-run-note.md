# macOS First Run Notes

## Initial Findings and Platform-Specific Issues

### Window Management
- Changed global shortcut from `CommandOrControl+Space` to `Option+Space` to avoid conflicts with macOS Spotlight
- Implemented macOS-specific window settings:
  - Added vibrancy and visual effects for native look and feel
  - Customized title bar style
  - Removed traffic lights (close, minimize, maximize buttons) for cleaner interface
- Window sizing behavior optimized:
  - Window maintains consistent 400px width in normal mode
  - Default height of 200px unless content requires more space
  - Dynamic height adjustment only triggers when content exceeds default dimensions
  - Eliminated unnecessary resize events during transcription
  - Smooth content updates without window flickering

### Focus and Visibility
- Improved window focus handling with explicit focus calls
- Adjusted timing for window operations to better match macOS expectations
- Enhanced always-on-top behavior to align with macOS window management
- Window visibility state checks implemented for better reliability

### Recording Workflow
- Optimized recording indicator animations for macOS
- Improved transcription display:
  - Content appears in main window (not title bar)
  - Smooth text streaming without unnecessary window resizes
  - Copy button properly positioned and functional

## Platform Differences (Windows vs macOS)

### Shortcut Keys
- Windows: Can use `CommandOrControl+Space`
- macOS: Uses `Option+Space` to avoid Spotlight conflict

### Window Behavior
- Windows: More flexible with window management
- macOS: Stricter window management rules, requiring specific handling for:
  - Focus management
  - Window level/layer
  - Visual effects
  - Size constraints

### Native Features
- Windows: Uses native paste module
- macOS: Clipboard handling through web APIs
- Different vibrancy and visual effect support

## Future Improvements

### Permissions
- Review and document macOS-specific permissions requirements
- Consider adding permission request dialogs where needed

### Testing Notes
- Test window behavior across different macOS versions
- Verify shortcut functionality with various keyboard layouts
- Monitor memory usage and performance on macOS

## Known Issues

### Paste Module
- No native paste module for macOS yet (using clipboard API instead)
- May need to develop macOS-specific paste functionality

### Window Management
- Window resizing optimized but may need further refinement
- Some users may expect traffic lights functionality

## Next Steps
1. Develop native paste module for macOS
2. Further optimize window management
3. Add macOS-specific installation instructions
4. Consider adding macOS-specific preferences
5. Test with various macOS security settings

## Recent Improvements

### Window Sizing Logic
- Implemented smarter window sizing:
  - Fixed initial window size (400x200)
  - Dynamic height adjustment only when content exceeds default height
  - Maintained consistent width throughout operation
  - Eliminated unnecessary resize calls during and after transcription
  - Improved performance by reducing resize events
  - Better handling of content overflow

### UI Responsiveness
- Smoother text streaming animation
- More efficient content updates
- Reduced window flickering
- Better scroll behavior during transcription

### Code Organization
- Consolidated window management code
- Improved error handling for macOS-specific features
- Better logging for debugging window behavior
- Cleaner separation of minimal mode and normal mode logic 