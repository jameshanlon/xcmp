XCC         := xcc
LINK_FLAGS  := -O2 -nostartfiles -Xmapper --nochaninit
NUM_CORES   := 4
DEFINES     := -DNUM_CORES=$(NUM_CORES)  
COMPILE_XCC := $(XCC) -Wall -O2 -c $(DEFINES)

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
	xcc $(COMPILE_FLAGS) 4core.xn $< -o $@
            
controller.xe: startup_S.o startup_xc.o controller.o 
	@echo 'Generating controller executable...'
	xcc $^ -o $@ 1core.xn $(LINK_FLAGS)

leaf.xe: startup_S.o startup_xc.o leaf.o
	@echo 'Generating leaf executable...'
	xcc $^ -o $@ -DNUM_CORES=$(NUM_CORES) 1core.xn $(LINK_FLAGS)

a.xe: controller.xe leaf.xe container.xe
	xobjdump --split controller.xe
	xobjdump -r 0,1,image_n0c0.elf container.xe
	rm controller.xe image_n0c0.elf config.xml platform_def.xn program_info.txt
	xobjdump --split leaf.xe
	xobjdump -r 0,2,image_n0c0.elf container.xe
	xobjdump -r 0,3,image_n0c0.elf container.xe
	rm leaf.xe image_n0c0.elf config.xml platform_def.xn program_info.txt
	mv container.xe a.xe

clean:
	@rm *.o a.xe

