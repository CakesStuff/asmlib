SRC = $(shell pwd)/src
OUT = $(shell pwd)/out
DBG = $(shell pwd)/dbg

SOURCES = $(shell find $(SRC)/*.asm)
OBJECTS = $(patsubst $(SRC)/%.asm, $(OUT)/%.o, $(SOURCES))
DBG_OBJS = $(patsubst $(SRC)/%.asm, $(DBG)/%.o, $(SOURCES))
HEADERS = $(shell find $(SRC)/*.inc)

VERSION = v0.06

all: $(OUT) $(DBG) lib.o libs.o libg.o lib.inc

libs.o: lib.o
	strip $^ --discard-all -o $@

lib.o: $(OBJECTS)
	ld -i $^ -o $@

libg.o: $(DBG_OBJS)
	ld -i $^ -o $@

$(OUT)/%.o: $(SRC)/%.asm
	nasm -i $(SRC) -felf64 $^ -o $@

$(DBG)/%.o: $(SRC)/%.asm
	nasm -g -i $(SRC) -felf64 $^ -o $@

lib.inc: $(OUT)/main.inc
	nasm -e $^ > $@

$(OUT)/main.inc: $(HEADERS)
	printf "%%include \"%s\"\n" $(HEADERS) > $@

$(OUT):
	mkdir -p $(OUT)

$(DBG):
	mkdir -p $(DBG)

update-stats: lib.o
	size $^ | tail -n +2 | xargs -i printf "{}\t | $(VERSION)\n" >> stats.txt

clean:
	rm -f lib.o
	rm -f libs.o
	rm -f libg.o
	rm -f lib.inc
	rm -rf $(OUT)
	rm -rf $(DBG)

.PHONY: clean all update-stats