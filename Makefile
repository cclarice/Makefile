# BUILD is initially undefined
ifndef BUILD

# max equals 256 x's
sixteen := x x x x x x x x x x x x x x x x
MAX := $(foreach x,$(sixteen),$(sixteen))

# T estimates how many targets we are building by replacing BUILD with a special string
T := $(shell $(MAKE) -nrRf $(firstword $(MAKEFILE_LIST)) $(MAKECMDGOALS) BUILD="COUNTTHIS" | grep -c "COUNTTHIS")

# N is the number of pending targets in base 1, well in fact, base x :-)
N := $(wordlist 1,$T,$(MAX))

# auto-decrementing counter that returns the number of pending targets in base 10
counter = $(words $N) $(eval N := $(wordlist 2,$(words $N),$N))

need = $(words $N)

done = $(shell expr $T - $(counter) + 1)

bar := "=================================================="

# BUILD is now defined to show the progress, this also avoids redefining T in loop
#BUILD = @echo "\033[31m$(counter) $(T) $(N) $(MAKECMDGOALS)"
BUILD = @printf "\033[A\033[32m[%-*.*s] [%2d/%2d]\n" $(T) $(done) $(bar) $(need) $T
endif

# dummy phony targets

ITEM = a.c b.c c.c f.c g.c d.c e.c v.c x.c y.c z.x i.c p.c l.c k.c

.PHONY: all clean

all: start $(ITEM)
	@echo done

start:
	@echo

clean:
	@rm -f target *.c

# dummy build rules

$(ITEM):
	@touch $@
	@sleep 0.20
	$(BUILD)

%.c:
	@touch $@
	$(BUILD)