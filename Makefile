DIRSRC=src
DIRTST=tst
DIRBUILD=build
TU=tec.TestJauge tec.TestPosition
TR=tec.TestAutobus tec.TestPassagerStandard

SRCCLASS=$(DIRSRC)/Autobus.java $(DIRSRC)/Passager.java\
$(DIRSRC)/Jauge.java $(DIRSRC)/PassagerStandard.java\
$(DIRSRC)/Position.java $(DIRSRC)/Vehicule.java

SRCTEST=$(DIRTST)/FauxPassager.java $(DIRTST)/FauxVehicule.java\
$(DIRTST)/TestAutobus.java $(DIRTST)/TestJauge.java\
$(DIRTST)/TestPassagerStandard.java $(DIRTST)/TestPosition.java

all: test

alltest: source test recette utest

source: $(SRCCLASS)
	javac -d $(DIRBUILD) $^

test: source $(SRCTEST)
	javac -d build/ -cp build/ $(SRCTEST)

recette: test $(DIRBUILD)
	for tstr in $(TR); do java -ea -cp build/ $$tstr; done

utest: test $(DIRBUILD)
	for tstu in $(TU); do java -ea -cp build/ $$tstu; done

clean:
	rm -r build/*