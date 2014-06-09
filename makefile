CC      = gcc
LDFLAGS = -lm -lpng -ljpeg
CFLAGS  = -Wall -Wextra -std=c99 -pedantic \
	-march=native -Os -pipe -s

HDR = lib/stb_image.h lib/libnsgif.h lib/libnsbmp.h
SRC = lib/libnsgif.c lib/libnsbmp.c
DST = idump

all:  $(DST)

idump: idump.c $(HDR) $(SRC)
	$(CC) $(CFLAGS) $(LDFLAGS) $(SRC) $< -o $@

idump_no_extra_lib: idump_no_extra_lib.c $(HDR) lib/lodepng.h
	$(CC) $(CFLAGS) -lm $(SRC) lib/lodepng.c $< -o $@

clean:
	rm -f $(DST) *.o
