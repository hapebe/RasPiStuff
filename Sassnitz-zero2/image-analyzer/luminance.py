#!/usr/bin/env python3

# this requires:
# pip install pillow
from PIL import Image
import sys

def average_brightness(image_path):
    img = Image.open(image_path)
    grayscale = img.convert("L") # Convert to grayscale ("L" mode = luminance)
    pixels = list(grayscale.get_flattened_data())
    avg_brightness = sum(pixels) / len(pixels)
    return avg_brightness

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: luminance.py <image.jpg>")
        sys.exit(1)

    image_path = sys.argv[1]
    brightness = average_brightness(image_path)

    # print(f"Average brightness: {brightness:.2f} (0=black, 255=white)")
    print(f"{int(brightness+0.5):d}")
