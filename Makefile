SRC = $(shell pwd)/src
OUT = $(shell pwd)/out

SOURCES = $(shell find $(SRC)/*.asm)
OBJECTS = $(patsubst $(SRC)/%.asm, $(OUT)/%.o, $(SOURCES))
HEADERS = $(shell find $(SRC)/*.inc)

all: $(OUT) lib.o libs.o lib.inc

libs.o: lib.o
	strip $^ --discard-all -o $@

lib.o: $(OBJECTS)
	ld -i $^ -o $@

$(OUT)/%.o: $(SRC)/%.asm
	nasm -i $(SRC) -felf64 $^ -o $@

lib.inc: $(OUT)/main.inc
	nasm -e $^ > $@

$(OUT)/main.inc: $(HEADERS)
	printf "%%include \"%s\"\n" $(HEADERS) > $@

$(OUT):
	mkdir -p $(OUT)

clean:
	rm -f lib.o
	rm -f libs.o
	rm -f lib.inc
	rm -rf $(OUT)

.PHONY: clean all