#Tomas de Camino Beck
# Gemma IO demo - humidity sensor to dotstar

from analogio import AnalogIn
import busio
import board
import time

dotstar = busio.SPI(board.APA102_SCK, board.APA102_MOSI)

r = g = b = 0

#funcion para cambiar el DotStar
def setPixel(red, green, blue):
    if not dotstar.try_lock():
        return

    data = bytearray([0x00, 0x00, 0x00, 0x00,
                      0xff, blue, green, red,
                      0xff, 0xff, 0xff, 0xff])
    dotstar.write(data)
    dotstar.unlock()
    time.sleep(0.01)


while True:
