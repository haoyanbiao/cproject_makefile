CC := gcc
SRC_FILE += ./src/main.c
SRC_FILE += ./src/app/book.c
SRC_FILE += ./src/util/people.c

INCLUDE += -I./inc/
LADD += -L./lib

CFLAGS += -g 
main_OBJ_DIRS := obj

all:$(main_OBJ_DIRS)/main_bin
	@echo "all target";

main_OBJ :=$(addprefix $(main_OBJ_DIRS)/, $(addsuffix .o, $(basename $(notdir $(SRC_FILE)))))
main_SRC_DIRS := $(dir $(SRC_FILE))
vpath %.c $(main_SRC_DIRS)

$(main_OBJ_DIRS)/%.o:%.c
	@echo "mkdir";
	mkdir -p $(main_OBJ_DIRS)
	$(CC) $(CFLAGS) $(INCLUDE) -c -o $@ $<

$(main_OBJ_DIRS)/main_bin: $(main_OBJ)
	@echo "main_bin";
	$(CC) $(CFLAGS) $(INCLUDE) $(main_OBJ) -o $@ $(LADD)

clean:
	rm -rf *.map main_bin
	rm -f $(main_OBJ_DIRS)/*
