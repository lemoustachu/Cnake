CC = gcc
CFLAGS = -Wall -O -lmingw32 -lSDL2main -lSDL2 -lSDL2_image -Wimplicit-function-declaration
LDFLAGS = -lmingw32 -lSDL2main -lSDL2 -lSDL2_image -Wimplicit-function-declaration
TARGET = game

SRC  = $(wildcard src/**/*.c) $(wildcard src/*.c) $(wildcard src/**/**/*.c) $(wildcard src/**/**/**/*.c)
OBJ  = $(SRC:.c=.o)
OUTPUT_FOLDER = bin


all: dirs $(TARGET) 

$(TARGET): $(OBJ)
	$(CC) -o $(OUTPUT_FOLDER)/$(TARGET) $^ $(LDFLAGS)

%.o: %.c
	$(CC) -o $@ -c $< $(CFLAGS)

#`pkg-config --cflags --libs sdl2`

dirs:
	mkdir -p $(OUTPUT_FOLDER)

clean:
	rm -rf $(OBJ)
	rm -f $(OUTPUT_FOLDER)/$(TARGET)

mrproper: clean
	rm -rf $(OUTPUT_FOLDER)