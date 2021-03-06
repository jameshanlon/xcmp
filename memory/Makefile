SHELL          := /bin/bash
XCC            := xcc
LINK_FLAGS     := -O2 -nostartfiles -Xmapper --nochaninit
NUM_CORES      := 16
SYSTEM         := XS1_L
DEFINES        := \
  -DNUM_CORES=$(NUM_CORES) \
  -DCORES_PER_NODE=$(CORES_PER_NODE) \
  -D$(SYSTEM)
COMPILE_XCC    := $(XCC) -Wall -O2 -c $(DEFINES)
CONFIG         := ../configs/1core.xn  # single core device

all: controller.xe leaf.xe core1.elf core2.elf

startup_S.o: startup.S
	$(COMPILE_XCC) $< -o $@

startup_xc.o: startup.xc
	$(COMPILE_XCC) $< -o $@

controller.o: controller.S
	$(COMPILE_XCC) $< -o $@

leaf.o: leaf.S
	$(COMPILE_XCC) $< -o $@
            
controller.xe: startup_S.o startup_xc.o controller.o defs.h 
	@echo 'Generating controller executable...'
	xcc $^ -o $@ -DNUM_CORES=$(NUM_CORES) $(CONFIG) $(LINK_FLAGS)

leaf.xe: startup_S.o startup_xc.o leaf.o defs.h
	@echo 'Generating leaf executable...'
	xcc $^ -o $@ -DNUM_CORES=$(NUM_CORES) $(CONFIG) $(LINK_FLAGS)

core1.elf: controller.xe
	xobjdump --split controller.xe
	mv image_n0c0.elf core1.elf
	rm -f config.xml platform_def.xn program_info.txt

core2.elf: leaf.xe
	xobjdump --split leaf.xe
	mv image_n0c0.elf core2.elf
	rm -f config.xml platform_def.xn program_info.txt

clean:
	@rm -f *.o *.xe
 
