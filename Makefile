# BUILD is initially undefined
ifndef BUILD

# max equals 256 x's
sixteen := x x x x x x x x x x x x x x x x
MAX := $(foreach x,$(sixteen),$(sixteen))

# T estimates how many targets we are building by replacing BUILD with a special string
T := $(shell $(MAKE) -nrRf $(firstword $(MAKEFILE_LIST)) $(MAKECMDGOALS) \
            BUILD="COUNTTHIS" | grep -c "COUNTTHIS")

# N is the number of pending targets in base 1, well in fact, base x :-)
N := $(wordlist 1,$T,$(MAX))

# auto-decrementing counter that returns the number of pending targets in base 10
counter = $(words $N)$(eval N := $(wordlist 2,$(words $N),$N))

# BUILD is now defined to show the progress, this also avoids redefining T in loop
BUILD = @echo $(counter) of $(T)
endif

# dummy phony targets

.PHONY: all clean

all: target
	@echo done

clean:
	@rm -f target *.c

# dummy build rules

target: a.c b.c c.c d.c e.c f.c g.c
	@touch $@
	$(BUILD)

%.c:
	@touch $@
	$(BUILD)