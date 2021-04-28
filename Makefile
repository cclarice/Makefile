SRC := $(wildcard src/*.c)
OBJ := $(patsubst src/%.c, obj/%.o, $(SRC))
CNT := $(words $(SRC))
BJC := $(wildcard obj/*.o)
DIR := obj
STR := ==============================================================================================================================================

all: $(OBJ)

obj/%.o: src/%.c
	@printf "[%-*.*s]" $(CNT) 0 $(STR)
	@touch $@
	COUNTER = 0