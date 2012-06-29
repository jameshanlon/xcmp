SHELL          := /bin/bash
XCC            := xcc
LINK_FLAGS     := -O2 -nostartfiles -Xmapper --nochaninit
NUM_CORES      := 64
CORES_PER_NODE := 64
SYSTEM         := XS1_L
DEFINES        := \
  -DNUM_CORES=$(NUM_CORES) \
  -DCORES_PER_NODE=$(CORES_PER_NODE) \
  -D$(SYSTEM)
COMPILE_XCC    := $(XCC) -Wall -O2 -c $(DEFINES)
SC_TARGET      := ../configs/1core.xn #-target=XS1-L1A-LQ64
CONFIGS        := ../configs
CONFIG         := XS1-L$(NUM_CORES)A.xn
#CONFIG         := XMP-$(NUM_CORES).xn

all: a.xe 

startup_S.o: startup.S
	$(COMPILE_XCC) $< -o $@

startup_xc.o: startup.xc
	$(COMPILE_XCC) $< -o $@

controller.o: controller.S
	$(COMPILE_XCC) $< -o $@

leaf.o: leaf.S
	$(COMPILE_XCC) $< -o $@

container.xe: container.xc
	@echo 'Generating container executable...'
	export XCC_DEVICE_PATH=$(CONFIGS)
	xcc $(COMPILE_FLAGS) $(CONFIGS)/$(CONFIG) $< -o $@
            
controller.xe: startup_S.o startup_xc.o controller.o defs.h 
	@echo 'Generating controller executable...'
	xcc $^ -o $@ -DNUM_CORES=$(NUM_CORES) $(SC_TARGET) $(LINK_FLAGS)

leaf.xe: startup_S.o startup_xc.o leaf.o defs.h
	@echo 'Generating leaf executable...'
	xcc $^ -o $@ -DNUM_CORES=$(NUM_CORES) $(SC_TARGET) $(LINK_FLAGS)

a.xe: controller.xe leaf.xe container.xe
	xobjdump --split controller.xe
	xobjdump -r 0,1,image_n0c0.elf container.xe
	rm controller.xe image_n0c0.elf config.xml platform_def.xn program_info.txt
	xobjdump --split leaf.xe
	n=2 ; while [[ $$n -lt $(NUM_CORES) ]]; do \
    x=$$(($$n/$(CORES_PER_NODE))); \
    y=$$(($$n%$(CORES_PER_NODE))); \
    echo "Replacing node $$x and core $$y with leaf image"; \
    xobjdump -r $$x,$$y,image_n0c0.elf container.xe; \
    ((n = n + 1)); \
  done
	rm leaf.xe image_n0c0.elf config.xml platform_def.xn program_info.txt
	mv container.xe a.xe

clean:
	@rm *.o *.xe
 
