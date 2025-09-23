from PIL import Image, ImageDraw

img = Image.new('RGBA', (16, 16), (0, 0, 0, 0))
try:
    draw = ImageDraw.Draw(img)
    draw.rectangle([6, 4, 10, 12], fill=(255, 0, 0, 255))
except Exception as e:
    print(f"An error occurred
try:
    draw.ellipse([5, 2, 11, 6], fill=(255))
except Exception as e:
    print("An error occurred:", e)
print(f"An error occurred while drawing ellipse: {e}")
os.makedirs('../electron-app/assets')