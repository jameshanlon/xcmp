SHELL       := /bin/bash
XCC         := xcc
LINK_FLAGS  := -O2 -nostartfiles -Xmapper --nochaninit
NUM_CORES   := 16
DEFINES     := -DNUM_CORES=$(NUM_CORES)  
COMPILE_XCC := $(XCC) -Wall -O2 -c $(DEFINES)
SC_TARGET   := ../configs/1core.xn #-target=XS1-L1A-LQ64
CONFIGS     := ../configs
CONFIG      := XS1-L$(NUM_CORES)A.xn

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
            
controller.xe: startup_S.o startup_xc.o controller.o 
	@echo 'Generating controller executable...'
	xcc $^ -o $@ $(SC_TARGET) $(LINK_FLAGS)

leaf.xe: startup_S.o startup_xc.o leaf.o
	@echo 'Generating leaf executable...'
	xcc $^ -o $@ -DNUM_CORES=$(NUM_CORES) $(SC_TARGET) $(LINK_FLAGS)

a.xe: controller.xe leaf.xe container.xe
	xobjdump --split controller.xe
	xobjdump -r 0,1,image_n0c0.elf container.xe
	rm controller.xe image_n0c0.elf config.xml platform_def.xn program_info.txt
	xobjdump --split leaf.xe
	n=2 ; while [[ $$n -lt $(NUM_CORES) ]]; do \
    echo "Replacing core $$n with leaf image"; \
    xobjdump -r 0,$$n,image_n0c0.elf container.xe; \
    ((n = n + 1)); \
  done
	rm leaf.xe image_n0c0.elf config.xml platform_def.xn program_info.txt
	mv container.xe a.xe

clean:
	@rm *.o *.xe
 
