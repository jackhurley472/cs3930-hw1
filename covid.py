import json
import requests
import time
import board
import neopixel

response = requests.get("https://api.covidtracking.com/v1/us/current.json")
myDict = response.json();

cases = myDict[0]['positiveIncrease']

pixels = neopixel.NeoPixel(board.D18, 8, brightness=0.1, auto_write=False, pixel_order=neopixel.RGB)

while True:
    if cases > 0:
        pixels[0] = (255, 0, 0)
        pixels.show()
        time.sleep(1)
    if cases > 50000:
        pixels[1] = (190, 65, 0)
        pixels.show()
        time.sleep(1)
    if cases > 100000:
        pixels[2] = (140, 115, 0)
        pixels.show()
        time.sleep(1)
    if cases > 150000:
        pixels[3] = (100, 155, 0)
        pixels.show()
        time.sleep(1)
    if cases > 200000:
        pixels[4] = (70, 185, 0)
        pixels.show()
        time.sleep(1)
    if cases > 250000:
        pixels[5] = (40, 215, 0)
        pixels.show()
        time.sleep(1)
    if cases > 300000:
        pixels[6] = (20, 235, 0)
        pixels.show()
        time.sleep(1)
    if cases > 350000:
        pixels[7] = (0, 255, 0)
        pixels.show()
        time.sleep(1)

    time.sleep(2)
    pixels.fill((0, 0, 0))





