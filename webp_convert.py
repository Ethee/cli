import os
from PIL import Image


def convert_to_webp(directory):
    for filename in os.listdir(directory):
        if filename.endswith(".jpg") or filename.endswith(".png"):
            img = Image.open(os.path.join(directory, filename))
            webp_filename = os.path.splitext(filename)[0] + ".webp"
            img.save(os.path.join(directory, webp_filename), "webp")


convert_to_webp("/home/jmattern/Downloads/webp")
