from PIL import Image, ImageDraw

# Create a 16x16 transparent image
img = Image.new('RGBA', (16, 16), (0, 0, 0, 0))
draw = ImageDraw.Draw(img)
try:
    draw.rectangle([6, 4, 10, 12], fill=(255, 0, 0, 255))
    draw.ellipse([5, 2, 11, 6], fill=(255,

# Create the assets directory if it doesn't exist
import os
os.makedirs('../electron-app/assets', exist_ok=True)

# Save the icon
img.save('../electron-app/assets/tray-icon.png') 