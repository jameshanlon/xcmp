XCC         := xcc
COMPILE_XCC := $(XCC) -Wall -O2 -c
LINK_FLAGS  := -O2  XS1-G4B-FB512.xn -nostartfiles -Xmapper --nochaninit

all: a.xe 

globals_S.o: globals.S
	$(COMPILE_XCC) $< -o $@

startup_S.o: startup.S
	$(COMPILE_XCC) $< -o $@

startup_xc.o: startup.xc
	$(COMPILE_XCC) $< -o $@

controller_S.o: controller.S
	$(COMPILE_XCC) $< -o $@

container.xe: container.xc
	@echo 'Generating container executable...'
	xcc $(COMPILE_FLAGS) XS1-G4B-FB512.xn $< -o $@
            
controller.xe: startup_S.o startup_xc.o controller_S.o globals_S.o
	@echo 'Generating controller executable...'
	xcc $^ -o $@ $(LINK_FLAGS)

a.xe: controller.xe container.xe
	xobjdump --split controller.xe
	xobjdump -r 0,1,image_n0c0.elf container.xe
	mv container.xe a.xe
	rm controller.xe image_n* config.xml platform_def.xn program_info.txt

clean:
	@rm *.o $(PROGRAM)

