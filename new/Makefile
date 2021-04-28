# Name of Files
NFILES = Alina Artur Kolya Danil

# First files prefix
FFILES = $(addprefix First_, $(NFILES))

# Secnd files prefix
SFILES = $(patsubst First_%,Secnd_%, $(FFILES))

# COUNT OF ALL FILES
CFILES = $(words $(NFILES) $(FFILES) $(SFILES))

CPROG  = 0

all: start $(SFILES) end
	@echo -e "Count = $(CFILES)"
	@echo -e "Names = $(NFILES)"
	@echo -e "First = $(FFILES)"
	@echo -e "Secnd = $(SFILES)"

$(NFILES):
	touch $@
	@FPROGRESS="expr $FPROGRESS + 1"
	@echo $(FPROGRESS)

$(FFILES): $(NFILES)
	cp $< $@
	@FPROGRESS="$(expr $FPROGRESS + 1)"
	@echo $(FPROGRESS)

$(SFILES): $(FFILES)
	cp $< $@
	@FPROGRESS="expr $FPROGRESS + 1"
	@echo $(FPROGRESS)

start:
	@echo start
	make CPROG=2
	echo "$(CPROG)"

end:
	echo end

clean:
	@rm -rf $(NFILES) $(FFILES) $(SFILES)