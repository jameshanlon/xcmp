XCC         := xcc
COMPILE_XCC := $(XCC) -Wall -O2 -c
LINK_FLAGS  := -O2 -nostartfiles -Xmapper --nochaninit

all: a.xe 

globals_S.o: globals.S
	$(COMPILE_XCC) $< -o $@

startup_S.o: startup.S
	$(COMPILE_XCC) $< -o $@

startup_xc.o: startup.xc
	$(COMPILE_XCC) $< -o $@

controller_xc.o: controller.xc
	$(COMPILE_XCC) $< -o $@

controller_S.o: controller.S
	$(COMPILE_XCC) $< -o $@

leaf_S.o: leaf.S
	$(COMPILE_XCC) $< -o $@

container.xe: container.xc
	@echo 'Generating container executable...'
	xcc $(COMPILE_FLAGS) 4core.xn $< -o $@
            
controller.xe: startup_S.o startup_xc.o \
    controller_S.o controller_xc.o globals_S.o
	@echo 'Generating controller executable...'
	xcc $^ -o $@ 1core.xn $(LINK_FLAGS)

leaf.xe: leaf_S.o
	@echo 'Generating leaf executable...'
	xcc $^ -o $@ 1core.xn $(LINK_FLAGS)

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
	@rm *.o $(PROGRAM)

